import React, { useEffect, useMemo, useRef, useState } from 'react';
import {
  ArrowRight, CheckCircle2, ChevronDown, ChevronUp, Compass, Crosshair,
  Layers, List, Loader2, MapPin, Minus, Plus, RefreshCw, Search, Shield, Swords,
  WifiOff, X,
} from 'lucide-react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { fetchApi } from '../api.js';
import '../styles/map.css';

interface MapViewProps {
  currentSeasonId: string;
  activeLeague: any;
  user: any;
  onOpenBattle: (battleId: string) => void;
  onOpenLeagues: () => void;
  isDesktopMode?: boolean;
  onToggleDesktopMode?: () => void;
}
type Bbox = { minLat: number; maxLat: number; minLng: number; maxLng: number };
type Loading = {
  status: 'ready' | 'loading' | 'partial' | 'unavailable';
  readyTiles: number; totalTiles: number; pendingTiles: number; failedTiles: number; retryAfterMs: number;
};
type Front = {
  id: string; displayNameI18n?: { tr?: string; en?: string }; streetName?: string;
  frontCode?: string; status: string; activeBattleId?: string | null; areaM2?: number;
  geometry: [number, number][]; geometryRings?: [number, number][][];
  center: { latitude: number; longitude: number };
  ownerTeam?: { id: string; slug?: string; nameI18n?: { tr?: string }; colorPrimary?: string } | null;
};
type Snapshot = { fronts: Front[]; loading?: Loading };
type Filter = 'all' | 'contested' | 'neutral';
type Place = {
  id: string; title: string; subtitle: string;
  center: { latitude: number; longitude: number };
  bbox?: Bbox; kind?: string; source?: string;
};
type PlaceResponse = { results: Place[]; source: 'online' | 'local'; message?: string };
type PlayerMembership = { userId: string; seasonId: string; teamId: string | null; status: 'ready' | 'error' };
const nameOf = (front: Front) => front.displayNameI18n?.tr || front.displayNameI18n?.en || front.streetName || front.frontCode || 'Cephe';
const statusOf = (front: Front) => front.status === 'contested' ? 'Çatışma sürüyor'
  : front.status === 'protected' ? 'Koruma altında' : front.ownerTeam ? 'Takım kontrolünde' : 'Tarafsız cephe';
const ownerOf = (front: Front) => front.ownerTeam?.nameI18n?.tr || 'Henüz sahiplenilmedi';
const teamColor = (front: Front) => front.ownerTeam?.slug === 'fenerbahce' ? '#326eaa'
  : front.ownerTeam?.slug === 'galatasaray' ? '#b75546' : front.ownerTeam?.slug === 'besiktas' ? '#40494f'
  : front.ownerTeam?.colorPrimary || '#798981';
const DEFAULT_PLACE: Place = { id: 'mahmutlar', title: 'Mahmutlar', subtitle: 'Alanya, Antalya',
  center: { latitude: 36.4884, longitude: 32.0965 } };
// Returning from a battle or another tab should not discard downloaded territory.
const session = { place: DEFAULT_PLACE, center: null as L.LatLngTuple | null, zoom: 17,
  seasons: new Map<string, Map<string, Front>>() };
const emptyLoading: Loading = { status: 'loading', readyTiles: 0, totalTiles: 0, pendingTiles: 1, failedTiles: 0, retryAfterMs: 0 };
const extentCache = new WeakMap<Front, [number, number, number, number]>();
function visibleIn(front: Front, bbox: Bbox): boolean {
  let extent = extentCache.get(front);
  if (!extent) {
    extent = [Infinity, Infinity, -Infinity, -Infinity];
    for (const [lng, lat] of front.geometry) {
      extent[0] = Math.min(extent[0], lng); extent[1] = Math.min(extent[1], lat);
      extent[2] = Math.max(extent[2], lng); extent[3] = Math.max(extent[3], lat);
    }
    extentCache.set(front, extent);
  }
  return extent[1] <= bbox.maxLat && extent[3] >= bbox.minLat
    && (bbox.minLng <= bbox.maxLng ? extent[0] <= bbox.maxLng && extent[2] >= bbox.minLng
      : extent[2] >= bbox.minLng || extent[0] <= bbox.maxLng);
}
function viewportOf(map: L.Map): Bbox {
  const b = map.getBounds();
  const wrap = (n: number) => ((n + 180) % 360 + 360) % 360 - 180;
  return { minLat: Math.max(-85, b.getSouth()), maxLat: Math.min(85, b.getNorth()),
    minLng: wrap(b.getWest()), maxLng: wrap(b.getEast()) };
}
function shapeStyle(front: Front, selected: boolean): L.PathOptions {
  return {
    color: selected ? '#d99734' : front.status === 'contested' ? '#c64b3b' : front.ownerTeam ? teamColor(front) : '#78877b',
    weight: selected ? 3 : front.status === 'contested' ? 2 : 1,
    fillColor: teamColor(front), fillOpacity: selected ? .37 : front.ownerTeam ? .25 : .12,
    opacity: selected ? 1 : .62, lineJoin: 'round',
  };
}

export const MapView: React.FC<MapViewProps> = ({
  currentSeasonId, activeLeague, user, onOpenBattle, onOpenLeagues,
}) => {
  const [place, setPlace] = useState<Place>(session.place);
  const [fronts, setFronts] = useState<Front[]>([]);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [expanded, setExpanded] = useState(false);
  const [listOpen, setListOpen] = useState(false);
  const [filter, setFilter] = useState<Filter>('all');
  const [regionOpen, setRegionOpen] = useState(false);
  const [query, setQuery] = useState('');
  const [searchResults, setSearchResults] = useState<Place[]>([]);
  const [searching, setSearching] = useState(false);
  const [searched, setSearched] = useState(false);
  const [searchError, setSearchError] = useState('');
  const [searchMessage, setSearchMessage] = useState('');
  const [layer, setLayer] = useState<'street' | 'satellite'>('street');
  const [loading, setLoading] = useState<Loading>(emptyLoading);
  const [notice, setNotice] = useState('');
  const [zoomedOut, setZoomedOut] = useState(false);
  const [pollStopped, setPollStopped] = useState(false);
  const [retryAt, setRetryAt] = useState(0);
  const [now, setNow] = useState(Date.now());
  const [claimStep, setClaimStep] = useState<'closed' | 'preparing' | 'submitting' | 'success' | 'error'>('closed');
  const [claimError, setClaimError] = useState('');
  const [claimedName, setClaimedName] = useState('');
  const [membership, setMembership] = useState<PlayerMembership | null>(null);
  const [membershipAttempt, setMembershipAttempt] = useState(0);
  const mapElement = useRef<HTMLDivElement>(null);
  const mapRef = useRef<L.Map | null>(null);
  const tilesRef = useRef<L.TileLayer | null>(null);
  const polygons = useRef(new Map<string, { polygon: L.Polygon; front: Front; label: string; marker?: L.Marker }>());
  const selectedRef = useRef<string | null>(null);
  const requestRef = useRef<{ generation: number; controller?: AbortController; key: string; finishedAt: number }>({ generation: 0, key: '', finishedAt: 0 });
  const moveTimer = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);
  const pollTimer = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);
  const beginRef = useRef<(force?: boolean) => void>(() => {});
  const selectRef = useRef<(id: string) => void>(() => {});
  const searchRef = useRef<HTMLInputElement>(null);
  const searchRequest = useRef<{ generation: number; controller?: AbortController }>({ generation: 0 });
  const selected = fronts.find(front => front.id === selectedId) || null;
  const filtered = useMemo(() => fronts.filter(front => filter === 'all'
    || (filter === 'contested' ? front.status === 'contested' : !front.ownerTeam && front.status !== 'contested')), [fronts, filter]);
  const teams = useMemo(() => {
    const groups = new Map<string, { name: string; color: string; count: number }>();
    for (const front of fronts) if (front.ownerTeam) {
      const current = groups.get(front.ownerTeam.id);
      if (current) current.count++;
      else groups.set(front.ownerTeam.id, { name: ownerOf(front), color: teamColor(front), count: 1 });
    }
    return [...groups.values()].sort((a, b) => b.count - a.count);
  }, [fronts]);
  const contestedCount = fronts.filter(front => front.status === 'contested').length;
  const busy = loading.pendingTiles > 0 && !pollStopped && !zoomedOut;
  const retrySeconds = Math.max(0, Math.ceil((retryAt - now) / 1000));
  const currentMembership = membership?.userId === user?.id && membership?.seasonId === currentSeasonId ? membership : null;
  const playerTeam = activeLeague?.teams?.find((team: { id: string }) => team.id === currentMembership?.teamId);
  const playerTeamName = playerTeam?.nameI18n?.tr || playerTeam?.nameI18n?.en || playerTeam?.slug;
  const playerTeamLabel = playerTeamName || (!user ? 'Misafir' : !currentMembership ? 'Yükleniyor…'
    : currentMembership.status === 'error' ? 'Tekrar dene' : currentMembership.teamId ? 'Takım bilgisi yok' : 'Takım seç');

  useEffect(() => {
    setMembership(null);
    if (!user?.id) return;
    const controller = new AbortController();
    fetchApi<{ membership: { teamId: string } | null }>(`/seasons/${currentSeasonId}/me`, { signal: controller.signal })
      .then(result => {
        if (!controller.signal.aborted) setMembership({ userId: user.id, seasonId: currentSeasonId, teamId: result.membership?.teamId ?? null, status: 'ready' });
      })
      .catch(() => {
        if (!controller.signal.aborted) setMembership({ userId: user.id, seasonId: currentSeasonId, teamId: null, status: 'error' });
      });
    return () => controller.abort();
  }, [user?.id, currentSeasonId, membershipAttempt]);

  function stopRequests() {
    clearTimeout(moveTimer.current); clearTimeout(pollTimer.current);
    requestRef.current.controller?.abort();
    requestRef.current.generation++;
  }
  function cachedForView(bbox: Bbox) {
    const cache = session.seasons.get(currentSeasonId);
    return cache ? [...cache.values()].filter(front => visibleIn(front, bbox)) : [];
  }
  function showFronts(next: Front[]) {
    setFronts(next);
    setSelectedId(previous => next.some(front => front.id === previous) ? previous
      : next.find(front => front.status === 'contested')?.id || null);
  }
  async function requestView(bbox: Bbox, generation: number, startedAt: number) {
    if (generation !== requestRef.current.generation) return;
    const controller = new AbortController();
    requestRef.current.controller = controller;
    let timedOut = false;
    const timeout = setTimeout(() => { timedOut = true; controller.abort(); }, 10_000);
    const params = new URLSearchParams({ season_id: currentSeasonId, progressive: '1' });
    Object.entries(bbox).forEach(([key, value]) => params.set(key, value.toFixed(6)));
    try {
      const data = await fetchApi<Snapshot>('/maps/viewport?' + params, { signal: controller.signal });
      if (generation !== requestRef.current.generation || controller.signal.aborted) return;
      let cache = session.seasons.get(currentSeasonId);
      if (!cache) { cache = new Map(); session.seasons.set(currentSeasonId, cache); }
      for (const front of data.fronts || []) { cache.delete(front.id); cache.set(front.id, front); }
      while (cache.size > 6000) cache.delete(cache.keys().next().value!);
      while (session.seasons.size > 3) session.seasons.delete(session.seasons.keys().next().value!);
      showFronts(cachedForView(bbox));
      const state: Loading = data.loading || { ...emptyLoading, status: 'ready', pendingTiles: 0 };
      setLoading(state);
      setNotice('');
      const retryDelay = state.retryAfterMs > 0 ? state.retryAfterMs : 0;
      setRetryAt(Date.now() + retryDelay);
      setNow(Date.now());
      if (state.pendingTiles > 0) {
        if (Date.now() - startedAt < 60_000) {
          const nextPollMs = Date.now() - startedAt < 2500 ? 450 : 1800;
          pollTimer.current = setTimeout(() => void requestView(bbox, generation, startedAt), nextPollMs);
        } else setPollStopped(true);
      } else requestRef.current.finishedAt = Date.now();
    } catch (error) {
      if (generation !== requestRef.current.generation || (controller.signal.aborted && !timedOut)) return;
      // Keep downloaded territory visible. A missing neighboring tile is not a
      // reason to erase the map that the player is currently using.
      setLoading(previous => ({ ...previous, status: 'unavailable', pendingTiles: 0 }));
      const message = error instanceof Error ? error.message : '';
      if (message.toLocaleLowerCase('tr').includes('yakınlaştır')) setZoomedOut(true);
      else setNotice(timedOut ? 'Bağlantı yavaş. Hazır cepheler haritada kalır.' : 'Bağlantı kurulamadı. Hazır cepheler haritada kalır.');
      setRetryAt(Date.now() + 3000); setNow(Date.now());
    } finally {
      clearTimeout(timeout);
    }
  }
  beginRef.current = (force = false) => {
    const map = mapRef.current;
    if (!map) return;
    const bbox = viewportOf(map);
    const key = currentSeasonId + ':' + Object.values(bbox).map(n => n.toFixed(5)).join(':');
    if (!force && key === requestRef.current.key && Date.now() - requestRef.current.finishedAt < 1200) return;
    stopRequests();
    requestRef.current.key = key;
    setPollStopped(false); setNotice('');
    showFronts(cachedForView(bbox));
    if (map.getZoom() < 15) {
      setZoomedOut(true);
      setLoading(previous => ({ ...previous, pendingTiles: 0 }));
      return;
    }
    setZoomedOut(false);
    setLoading(emptyLoading);
    void requestView(bbox, requestRef.current.generation, Date.now());
  };
  selectRef.current = (id: string) => { setSelectedId(id); setExpanded(true); setListOpen(false); };

  useEffect(() => {
    if (!mapElement.current) return;
    const map = L.map(mapElement.current, {
      center: session.center || [session.place.center.latitude, session.place.center.longitude], zoom: session.zoom,
      minZoom: 3, maxZoom: 19, zoomControl: false, preferCanvas: true,
      worldCopyJump: true, attributionControl: true,
    });
    map.attributionControl.setPrefix(false);
    const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19, attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      keepBuffer: 3,
    }).addTo(map);
    mapRef.current = map; tilesRef.current = tiles;
    const onStart = () => stopRequests();
    const onEnd = () => {
      const center = map.getCenter();
      session.center = [center.lat, center.lng]; session.zoom = map.getZoom();
      clearTimeout(moveTimer.current);
      moveTimer.current = setTimeout(() => beginRef.current(), 180);
    };
    map.on('movestart', onStart); map.on('moveend', onEnd);
    const resize = new ResizeObserver(() => { map.invalidateSize({ animate: false }); });
    resize.observe(mapElement.current);
    return () => {
      stopRequests(); searchRequest.current.controller?.abort(); resize.disconnect();
      map.off('movestart', onStart); map.off('moveend', onEnd); map.remove();
      mapRef.current = null; tilesRef.current = null; polygons.current.clear();
    };
  }, []);
  useEffect(() => { beginRef.current(true); return () => stopRequests(); }, [currentSeasonId]);
  useEffect(() => {
    if (retryAt <= Date.now()) return;
    const interval = setInterval(() => {
      const timestamp = Date.now(); setNow(timestamp);
      if (timestamp >= retryAt) clearInterval(interval);
    }, 1000);
    return () => clearInterval(interval);
  }, [retryAt]);
  useEffect(() => {
    const map = mapRef.current, tiles = tilesRef.current;
    if (!map || !tiles) return;
    if (tiles.options.attribution) map.attributionControl.removeAttribution(tiles.options.attribution);
    tiles.options.attribution = layer === 'satellite'
      ? 'Tiles © Esri · © <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
      : '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>';
    map.attributionControl.addAttribution(tiles.options.attribution);
    tiles.setUrl(layer === 'satellite'
      ? 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'
      : 'https://tile.openstreetmap.org/{z}/{x}/{y}.png');
  }, [layer]);

  useEffect(() => {
    const map = mapRef.current;
    if (!map) return;
    const shown = new Set(filtered.map(front => front.id));
    for (const [id, entry] of polygons.current) if (!shown.has(id)) {
      entry.polygon.remove(); entry.marker?.remove(); polygons.current.delete(id);
    }
    for (const front of filtered) {
      if (!front.geometry?.length) continue;
      let entry = polygons.current.get(front.id);
      if (!entry) {
        const rings = front.geometryRings || [front.geometry];
        const polygon = L.polygon(rings.map(ring => ring.map(([lng, lat]): L.LatLngTuple => [lat, lng])),
          shapeStyle(front, selectedRef.current === front.id)).addTo(map);
        polygon.on('click', () => selectRef.current(front.id));
        entry = { polygon, front, label: '' }; polygons.current.set(front.id, entry);
      } else {
        entry.front = front;
        entry.polygon.setStyle(shapeStyle(front, selectedRef.current === front.id));
      }
      const label = nameOf(front) + '|' + ownerOf(front);
      if (entry.label !== label) {
        const tooltip = document.createElement('div');
        const title = document.createElement('strong'); title.textContent = nameOf(front);
        const owner = document.createElement('span'); owner.textContent = ownerOf(front);
        tooltip.append(title, owner);
        entry.polygon.unbindTooltip().bindTooltip(tooltip, { className: 'front-tooltip', sticky: true, opacity: 1, direction: 'top' });
        entry.label = label;
      }
      if (front.status === 'contested' && !entry.marker) {
        const label = document.createElement('span'); label.className = 'battle-map-label'; label.textContent = 'ÇATIŞMA';
        entry.marker = L.marker([front.center.latitude, front.center.longitude], {
          icon: L.divIcon({ html: label, className: 'battle-map-marker', iconSize: [72, 24], iconAnchor: [36, 12] }),
        }).addTo(map).on('click', () => selectRef.current(front.id));
      } else if (front.status !== 'contested' && entry.marker) { entry.marker.remove(); entry.marker = undefined; }
    }
  }, [filtered]);
  useEffect(() => {
    const previous = selectedRef.current ? polygons.current.get(selectedRef.current) : undefined;
    if (previous) previous.polygon.setStyle(shapeStyle(previous.front, false));
    const next = selectedId ? polygons.current.get(selectedId) : undefined;
    if (next) { next.polygon.setStyle(shapeStyle(next.front, true)); next.polygon.bringToFront(); }
    selectedRef.current = selectedId;
  }, [selectedId, filtered]);

  function choosePlace(next: Place) {
    setPlace(next); session.place = next;
    searchRequest.current.controller?.abort(); searchRequest.current.generation++;
    setRegionOpen(false); setSearching(false); setQuery(''); setSearchResults([]); setSelectedId(null); setExpanded(false); setListOpen(false);
    searchRef.current?.blur();
    const map = mapRef.current;
    if (!map) return;
    const center: L.LatLngTuple = [next.center.latitude, next.center.longitude];
    if (map.getCenter().distanceTo(L.latLng(center)) < 1 && map.getZoom() === 17) beginRef.current(true);
    else map.flyTo(center, 17, { duration: .65 });
  }
  async function searchPlaces(event?: React.FormEvent) {
    event?.preventDefault();
    const value = query.trim();
    setRegionOpen(true);
    if (value.length < 2) { setSearchError('En az iki karakterlik bir konum yaz.'); return; }
    searchRequest.current.controller?.abort();
    const controller = new AbortController();
    const generation = ++searchRequest.current.generation;
    searchRequest.current.controller = controller;
    setSearching(true); setSearchError(''); setSearchMessage(''); setSearchResults([]); setSearched(false);
    const timeout = setTimeout(() => controller.abort(), 10_000);
    try {
      const result = await fetchApi<PlaceResponse>('/maps/places?q=' + encodeURIComponent(value), { signal: controller.signal });
      if (generation !== searchRequest.current.generation || controller.signal.aborted) return;
      setSearchResults(result.results || []); setSearched(true); setSearchMessage(result.message || '');
      searchRef.current?.blur();
    } catch (error) {
      if (generation !== searchRequest.current.generation) return;
      setSearchError(controller.signal.aborted ? 'Arama zaman aşımına uğradı. Tekrar deneyebilirsin.'
        : error instanceof Error ? error.message : 'Konum araması şu anda kullanılamıyor.');
    } finally {
      clearTimeout(timeout);
      if (generation === searchRequest.current.generation) setSearching(false);
    }
  }
  function editSearch(value: string) {
    searchRequest.current.controller?.abort(); searchRequest.current.generation++;
    setSearching(false); setQuery(value); setRegionOpen(true);
    setSearched(false); setSearchResults([]); setSearchError(''); setSearchMessage('');
  }
  function focusFront(front: Front) {
    setSelectedId(front.id); setExpanded(true); setListOpen(false); setRegionOpen(false); setQuery('');
    mapRef.current?.flyTo([front.center.latitude, front.center.longitude], Math.max(17, mapRef.current.getZoom()), { duration: .45 });
  }
  async function startClaim() {
    if (!selected || claimStep === 'preparing' || claimStep === 'submitting') return;
    const front = selected;
    setClaimedName(nameOf(front)); setClaimStep('preparing'); setClaimError('');
    try {
      const challenge = await fetchApi<any>('/claims/challenge', {
        method: 'POST', body: JSON.stringify({ frontId: front.id, seasonId: currentSeasonId, action: 'join_battle' }),
      });
      setClaimStep('submitting');
      await fetchApi<any>('/claims', {
        method: 'POST', body: JSON.stringify({
          challengeId: challenge.challengeId, idempotencyKey: crypto.randomUUID(),
          locationSamples: [{ latitude: front.center.latitude, longitude: front.center.longitude,
            accuracyMeters: 10.0, recordedAt: new Date().toISOString() }],
          integrity: { platform: 'android' },
        }),
      });
      setClaimStep('success');
      const updated = await fetchApi<Front>('/fronts/' + front.id + '?season_id=' + currentSeasonId);
      session.seasons.get(currentSeasonId)?.set(updated.id, updated);
      setFronts(previous => previous.map(item => item.id === updated.id ? updated : item));
      beginRef.current(true);
    } catch (error) {
      setClaimError(error instanceof Error ? error.message : 'Katkın kaydedilemedi. Yeniden deneyebilirsin.');
      setClaimStep('error');
    }
  }
  const actionLabel = selected?.status === 'contested' ? 'Savaşa katıl' : selected?.ownerTeam
    ? selected.ownerTeam.id === currentMembership?.teamId ? 'Cepheni savun' : 'Saldırı başlat' : 'Cepheni sahiplen';
  const statusMessage = zoomedOut ? 'Cepheleri görmek için yakınlaş'
    : notice || (pollStopped ? 'Bu alan hazırlanıyor. Hazır cepheleri keşfedebilirsin.'
      : loading.status === 'unavailable' ? 'Bu alana şu anda ulaşılamıyor.'
      : loading.failedTiles > 0 ? 'Bazı alanlar henüz hazır değil.'
      : busy ? (fronts.length ? 'Yeni cepheler ekleniyor' : 'Cepheler hazırlanıyor')
      : !fronts.length ? 'Bu görünümde cephe bulunmuyor.' : '');

  return (
    <section className={'game-map ' + (layer === 'satellite' ? 'game-map--satellite ' : '') + (expanded ? 'game-map--expanded' : '')} aria-label="Cephe haritası">
      <div className="game-map__canvas" ref={mapElement} />
      <header className="map-hud">
        <form className="map-search-main" onSubmit={event => void searchPlaces(event)} role="search">
          <Search size={19} />
          <input ref={searchRef} value={query} onChange={event => editSearch(event.target.value)} onFocus={() => setRegionOpen(true)} placeholder="Konum ara" aria-label="Konum ara" autoComplete="off" maxLength={120} enterKeyHint="search" onKeyDown={event => { if (event.key === 'Escape') { setRegionOpen(false); searchRef.current?.blur(); } }} />
          {query && <button type="button" className="map-icon-button" aria-label="Aramayı temizle" onClick={() => { editSearch(''); searchRef.current?.focus(); }}><X size={17} /></button>}
          <button type="submit" className="map-search-submit" aria-label="Konumu ara" disabled={searching}>{searching ? <Loader2 size={18} className="map-spin" /> : <ArrowRight size={18} />}</button>
        </form>
        <div className="map-hud-context">
          <span className="map-current-place"><MapPin size={13} /><strong title={place.subtitle}>{place.title}</strong></span>
          <button className="map-league" onClick={onOpenLeagues}><Shield size={13} /><span>{(activeLeague?.nameI18n?.tr || 'Taraftarlar Ligi').replace(/\s*\(Demo\)/, '')}</span><ChevronDown size={12} /></button>
        </div>
        <div className="map-territory-summary" aria-label="Bu görünümdeki cepheler">
          <span><b>{fronts.length.toLocaleString('tr')}</b> cephe</span>
          <span className="map-summary-rule" />
          <span className={contestedCount ? 'map-conflict-text' : ''}><Swords size={13} /><b>{contestedCount}</b> çatışma</span>
          <div className="map-control-bar" aria-label="Görünümde takım kontrolü">
            {teams.map(team => <i key={team.name} style={{ width: (team.count / Math.max(1, fronts.length) * 100) + '%', background: team.color }} title={team.name + ': ' + team.count + ' cephe'} />)}
          </div>
          <button className="map-player-team" aria-label={`Takımın: ${playerTeamLabel}`} title={`Takımın: ${playerTeamLabel}`}
            onClick={() => currentMembership?.status === 'error' ? setMembershipAttempt(attempt => attempt + 1) : onOpenLeagues()}>
            <span className="map-player-team__colors" aria-hidden="true" style={{ background: playerTeam
              ? `linear-gradient(135deg, ${playerTeam.colorPrimary || '#798981'} 50%, ${playerTeam.colorSecondary || playerTeam.colorPrimary || '#798981'} 50%)` : '#798981' }} />
            <span className="map-player-team__label"><small>TAKIMIN</small><strong>{playerTeamLabel}</strong></span>
          </button>
        </div>
      </header>

      {regionOpen && (
        <div className="map-search-panel">
          <div className="map-search-results-top"><span className="map-section-label">KONUM ARAMA</span><button className="map-icon-button" onClick={() => { setRegionOpen(false); searchRef.current?.blur(); }} aria-label="Arama sonuçlarını kapat"><X size={17} /></button></div>
          <div className="map-search-results" aria-live="polite">
            {searching && <p className="map-search-feedback"><Loader2 size={17} className="map-spin" />Konumlar aranıyor</p>}
            {searchError && <div className="map-search-error"><p>{searchError}</p><button onClick={() => void searchPlaces()}><RefreshCw size={14} />Tekrar ara</button></div>}
            {!searching && !searchError && !searched && <p className="map-search-hint">Bir mahalle, şehir veya adres yaz.<br />Aramak için ok düğmesine ya da Enter'a bas.</p>}
            {searchResults.map(item => <button key={item.id} onClick={() => choosePlace(item)}><MapPin size={17} /><span><strong>{item.title}</strong><small>{item.subtitle}</small></span><ArrowRight size={15} /></button>)}
            {searched && !searchResults.length && <p>Konum bulunamadı. İlçe veya şehir adını da ekleyerek tekrar dene.</p>}
            {searchMessage && <p className="map-search-note">{searchMessage}</p>}
          </div>
          {searched && <div className="map-search-credit">Arama: Photon / OpenStreetMap</div>}
        </div>
      )}

      {statusMessage && (
        <div className={'map-network-state ' + (notice || loading.failedTiles ? 'map-network-state--quiet' : '')} role="status" aria-live="polite">
          {busy ? <Loader2 size={15} className="map-spin" /> : zoomedOut ? <Search size={15} /> : <WifiOff size={15} />}
          <span>{statusMessage}{busy && loading.totalTiles > 0 && <small>{loading.readyTiles}/{loading.totalTiles} alan hazır</small>}</span>
          {zoomedOut ? <button onClick={() => mapRef.current?.setZoom(17)}>Yakınlaş <Plus size={13} /></button>
            : (!busy || pollStopped) && <button disabled={retrySeconds > 0} onClick={() => beginRef.current(true)}><RefreshCw size={13} />{retrySeconds ? retrySeconds + ' sn' : 'Tekrar dene'}</button>}
        </div>
      )}

      <div className="map-tools" aria-label="Harita araçları">
        <div className="map-tool-group"><button className="map-icon-button" onClick={() => mapRef.current?.zoomIn()} aria-label="Haritayı yakınlaştır" title="Yakınlaştır"><Plus size={19} /></button><button className="map-icon-button" onClick={() => mapRef.current?.zoomOut()} aria-label="Haritayı uzaklaştır" title="Uzaklaştır"><Minus size={19} /></button></div>
        <button className={'map-icon-button ' + (layer === 'satellite' ? 'is-active' : '')} onClick={() => setLayer(layer === 'street' ? 'satellite' : 'street')} aria-label={layer === 'street' ? 'Uydu görünümünü aç' : 'Sokak görünümünü aç'} title={layer === 'street' ? 'Uydu görünümü' : 'Sokak görünümü'}><Layers size={18} /></button>
        <button className="map-icon-button" onClick={() => selected ? focusFront(selected) : choosePlace(place)} aria-label={selected ? 'Seçili cepheye odaklan' : 'Konum merkezine dön'} title={selected ? 'Seçili cepheye odaklan' : 'Konum merkezi'}><Crosshair size={19} /></button>
      </div>

      <aside className={'front-panel ' + (selected ? 'front-panel--selected ' : '') + (expanded || listOpen ? 'front-panel--open' : '')}>
        <div className="front-panel__topline"><span className="map-section-label">{selected ? 'SEÇİLİ CEPHE' : 'BÖLGEDEKİ CEPHELER'}</span><span className="front-panel__actions"><button className={'map-icon-button ' + (listOpen ? 'is-active' : '')} aria-label={listOpen ? 'Cephe listesini kapat' : 'Cephe listesini aç'} onClick={() => { setListOpen(!listOpen); setExpanded(true); }}><List size={17} /></button><button className="map-icon-button front-panel__collapse" aria-label={expanded ? 'Cephe panelini daralt' : 'Cephe panelini genişlet'} onClick={() => { setExpanded(!expanded); setListOpen(false); }}>{expanded ? <ChevronDown size={18} /> : <ChevronUp size={18} />}</button></span></div>
        {selected && !listOpen ? (
          <>
            <button className="front-panel__headline" onClick={() => setExpanded(!expanded)} aria-expanded={expanded}>
              <span className="front-status-mark" style={{ background: teamColor(selected) }} />
              <span><h2 title={nameOf(selected)}>{nameOf(selected)}</h2><small>{ownerOf(selected)}</small></span>
            </button>
            <div className="front-panel__details">
              <div className="front-meta"><span className={selected.status === 'contested' ? 'map-conflict-text' : ''}>{selected.status === 'contested' ? <Swords size={14} /> : <Shield size={14} />}{statusOf(selected)}</span>{selected.areaM2 ? <span>{selected.areaM2 >= 10000 ? (selected.areaM2 / 10000).toLocaleString('tr', { maximumFractionDigits: 1 }) + ' ha' : Math.round(selected.areaM2).toLocaleString('tr') + ' m²'}</span> : null}</div>
              {selected.activeBattleId && <button className="front-battle-link" onClick={() => onOpenBattle(selected.activeBattleId!)}><Swords size={18} /><span><strong>Bu cephede mücadele var</strong><small>Savaş durumunu gör</small></span><ArrowRight size={17} /></button>}
              <p className="front-instruction">{selected.status === 'contested' ? 'Takımının yanında yer al. Her katkı sonucu değiştirebilir.' : selected.ownerTeam ? 'Sokağın kontrolü için takımınla birlikte mücadele et.' : 'Bu cephede ilk izi takımın bıraksın.'}</p>
              <button className="map-primary-action" onClick={() => void startClaim()}><Shield size={17} />{actionLabel}<ArrowRight size={16} /></button>
              <button className="front-deselect" onClick={() => { setSelectedId(null); setExpanded(false); }}>Bölgedeki cephelere dön</button>
            </div>
            <button className="front-mobile-action" onClick={() => { setExpanded(true); }} aria-label="Cephe ayrıntılarını aç"><ArrowRight size={18} /></button>
          </>
        ) : (
          <div className="front-browser">
            <div className="front-browser__intro"><h2>Sokağını seç.</h2><p>Bir cepheye dokun, kontrol durumunu gör.</p></div>
            <div className="front-filters" aria-label="Cephe filtresi">{([{ key: 'all', label: 'Tümü' }, { key: 'contested', label: 'Çatışma' }, { key: 'neutral', label: 'Tarafsız' }] as const).map(item => <button key={item.key} aria-pressed={filter === item.key} className={filter === item.key ? 'is-current' : ''} onClick={() => setFilter(item.key)}>{item.label}</button>)}</div>
            <div className="front-list">{filtered.slice(0, 70).map(front => <button key={front.id} onClick={() => focusFront(front)}><span className="front-status-mark" style={{ background: teamColor(front) }} /><span><strong title={nameOf(front)}>{nameOf(front)}</strong><small>{front.status === 'contested' ? 'Çatışma sürüyor' : ownerOf(front)}</small></span>{front.status === 'contested' ? <Swords size={15} /> : <ArrowRight size={14} />}</button>)}{!filtered.length && <div className="front-list-empty"><Compass size={28} /><p>{busy ? 'Hazır cepheler burada görünecek.' : 'Haritayı hareket ettirerek yeni cepheleri keşfet.'}</p></div>}</div>
            <div className="front-panel__footnote"><span className="map-live-dot" />{fronts.length ? 'Bu görünümde ' + fronts.length.toLocaleString('tr') + ' cephe' : 'Saha haritası'}</div>
          </div>
        )}
      </aside>
      <div className="map-location-stamp"><Compass size={13} /><span>{place.title.toLocaleUpperCase('tr')}</span></div>

      {claimStep !== 'closed' && (
        <div className="map-dialog-backdrop">
          <div className="map-claim-dialog" role="dialog" aria-modal="true" aria-labelledby="claim-title">
            <span className="map-section-label">CEPHELAND / KATKI</span>
            {claimStep === 'success' ? <CheckCircle2 className="claim-state-icon" size={38} /> : claimStep === 'error' ? <WifiOff className="claim-state-icon" size={38} /> : <Loader2 className="claim-state-icon map-spin" size={36} />}
            <h2 id="claim-title">{claimStep === 'success' ? 'İzin bu cephede.' : claimStep === 'error' ? 'Katkın kaydedilemedi.' : claimStep === 'preparing' ? 'Katkın hazırlanıyor' : 'Katkın kaydediliyor'}</h2>
            <p>{claimStep === 'error' ? claimError : claimedName}</p>
            {claimStep === 'success' && <p className="claim-confirmation">Takımın için verdiğin katkı kaydedildi.</p>}
            {(claimStep === 'success' || claimStep === 'error') && <button className="map-primary-action" onClick={() => setClaimStep('closed')}>Haritaya dön<ArrowRight size={17} /></button>}
          </div>
        </div>
      )}
    </section>
  );
};
