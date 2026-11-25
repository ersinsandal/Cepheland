import React, { useState, useEffect, useRef } from 'react';
import { MapPin, ShieldAlert, CheckCircle, AlertTriangle, Layers, Info, Globe, Crosshair } from 'lucide-react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { fetchApi } from '../api.js';

const frontName = (front: any): string => front?.displayNameI18n?.tr
  || front?.displayNameI18n?.en || front?.streetName || front?.frontCode || 'Cephe';

const ADMIN_WORLD_REGIONS = [
  { id: 'aln-mhm', name: 'Alanya / Mahmutlar (Pilot)', bbox: { minLat: 36.480, maxLat: 36.490, minLng: 32.090, maxLng: 32.105 } },
  { id: 'aln-sry', name: 'Alanya / Saray & Kleopatra', bbox: { minLat: 36.540, maxLat: 36.550, minLng: 31.990, maxLng: 32.005 } },
  { id: 'kad-mod', name: 'İstanbul / Moda & Caferağa (Kadıköy)', bbox: { minLat: 40.978, maxLat: 40.988, minLng: 29.025, maxLng: 29.035 } },
  { id: 'bes-crs', name: 'İstanbul / Çarşı & Sinanpaşa (Beşiktaş)', bbox: { minLat: 41.038, maxLat: 41.048, minLng: 29.001, maxLng: 29.012 } },
  { id: 'bey-ist', name: 'İstanbul / İstiklal & Cihangir (Beyoğlu)', bbox: { minLat: 41.029, maxLat: 41.039, minLng: 28.977, maxLng: 28.987 } },
  { id: 'cnk-tun', name: 'Ankara / Tunalı Hilmi & Kızılay (Çankaya)', bbox: { minLat: 39.907, maxLat: 39.917, minLng: 32.850, maxLng: 32.860 } },
  { id: 'man-mid', name: 'New York / Midtown & Times Sq (Manhattan)', bbox: { minLat: 40.750, maxLat: 40.760, minLng: -73.990, maxLng: -73.980 } },
  { id: 'wes-soh', name: 'Londra / Soho & West End (Westminster)', bbox: { minLat: 51.508, maxLat: 51.518, minLng: -0.138, maxLng: -0.128 } },
  { id: 'par-lou', name: 'Paris / Louvre & Rue de Rivoli (1er Arr.)', bbox: { minLat: 48.856, maxLat: 48.866, minLng: 2.330, maxLng: 2.342 } },
  { id: 'shi-crx', name: 'Tokyo / Shibuya Crossing & Center-gai', bbox: { minLat: 35.654, maxLat: 35.664, minLng: 139.696, maxLng: 139.706 } },
];

export const MapEditorView: React.FC = () => {
  const [selectedRegionIndex, setSelectedRegionIndex] = useState(0);
  const [fronts, setFronts] = useState<any[]>([]);
  const [selectedFront, setSelectedFront] = useState<any | null>(null);
  const [loading, setLoading] = useState(false);
  const [mapLoading, setMapLoading] = useState(true);
  const [mapError, setMapError] = useState('');
  const [mapProgress, setMapProgress] = useState('');

  // Map refs
  const mapContainerRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<L.Map | null>(null);
  const layerGroupRef = useRef<L.LayerGroup | null>(null);
  const mapRequestRef = useRef<{ id: number; controller?: AbortController }>({ id: 0 });
  const moveTimerRef = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);
  const loadFrontsRef = useRef<() => Promise<void>>(async () => {});
  const pollTimerRef = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);

  const cancelMapRequest = () => {
    clearTimeout(moveTimerRef.current);
    clearTimeout(pollTimerRef.current);
    mapRequestRef.current.controller?.abort();
    mapRequestRef.current.id += 1;
  };

  const loadFronts = async () => {
    cancelMapRequest();
    const controller = new AbortController();
    const requestId = mapRequestRef.current.id;
    mapRequestRef.current.controller = controller;
    if ((mapInstanceRef.current?.getZoom() ?? 17) < 15) {
      setMapLoading(false);
      setMapError('Cepheleri görmek için haritayı yakınlaştırın.');
      return;
    }
    const bounds = mapInstanceRef.current?.getBounds();
    const bbox = bounds ? {
      minLat: bounds.getSouth(), maxLat: bounds.getNorth(),
      minLng: bounds.getWest(), maxLng: bounds.getEast(),
    } : ADMIN_WORLD_REGIONS[selectedRegionIndex].bbox;
    const params = new URLSearchParams({ progressive: '1' });
    Object.entries(bbox).forEach(([key, value]) => params.set(key, String(value)));
    setMapLoading(true);
    setMapError('');
    const started = Date.now();
    const poll = async () => { try {
      const data = await fetchApi<any>(`/maps/viewport?${params}`, { signal: AbortSignal.any([controller.signal, AbortSignal.timeout(10_000)]) });
      if (requestId !== mapRequestRef.current.id || controller.signal.aborted) return;
      const nextFronts = data.fronts || [];
      setFronts(nextFronts);
      setSelectedFront((previous: any) => nextFronts.find((front: any) => front.id === previous?.id) || nextFronts[0] || null);
      const state = data.loading;
      const pending = state?.pendingTiles > 0;
      setMapProgress(pending ? `Hazır alanlar: ${state.readyTiles} / ${state.totalTiles}` : '');
      if (pending && Date.now() - started < 60_000) {
        setMapLoading(true);
        pollTimerRef.current = setTimeout(() => void poll(), 1500);
      } else {
        setMapLoading(false);
        setMapError(state?.failedTiles || pending ? 'Hazır cepheler gösteriliyor. Diğer alanlar henüz hazır değil.' : '');
      }
    } catch (err) {
      if (requestId !== mapRequestRef.current.id || controller.signal.aborted) return;
      // A temporary source failure must not erase the working inspection map.
      setMapLoading(false);
      setMapError(err instanceof Error ? err.message : 'Harita parselleri yüklenemedi.');
    } };
    await poll();
  };
  loadFrontsRef.current = loadFronts;

  // Initialize Admin Leaflet Map
  useEffect(() => {
    if (!mapContainerRef.current) return;
    if (mapInstanceRef.current) return;

    const initialRegion = ADMIN_WORLD_REGIONS[selectedRegionIndex];
    const initialCenter: [number, number] = [
      (initialRegion.bbox.minLat + initialRegion.bbox.maxLat) / 2,
      (initialRegion.bbox.minLng + initialRegion.bbox.maxLng) / 2,
    ];

    const map = L.map(mapContainerRef.current, {
      center: initialCenter,
      zoom: 17,
      preferCanvas: true,
      attributionControl: true,
    });
    map.attributionControl.setPrefix(false);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    }).addTo(map);

    const layerGroup = L.layerGroup().addTo(map);
    layerGroupRef.current = layerGroup;
    mapInstanceRef.current = map;

    const onMoveStart = () => cancelMapRequest();
    const onMoveEnd = () => {
      clearTimeout(moveTimerRef.current);
      moveTimerRef.current = setTimeout(() => void loadFrontsRef.current(), 250);
    };
    map.on('movestart', onMoveStart);
    map.on('moveend', onMoveEnd);
    onMoveEnd();

    return () => {
      cancelMapRequest();
      map.off('movestart', onMoveStart);
      map.off('moveend', onMoveEnd);
      map.remove();
      mapInstanceRef.current = null;
      layerGroupRef.current = null;
    };
  }, []);

  // Fly to region on region change
  useEffect(() => {
    const map = mapInstanceRef.current;
    if (!map) return;
    const reg = ADMIN_WORLD_REGIONS[selectedRegionIndex];
    const center: [number, number] = [
      (reg.bbox.minLat + reg.bbox.maxLat) / 2,
      (reg.bbox.minLng + reg.bbox.maxLng) / 2,
    ];
    map.flyTo(center, 17, { animate: true, duration: 0.6 });
  }, [selectedRegionIndex]);

  // Paint admin territory polygons
  useEffect(() => {
    const map = mapInstanceRef.current;
    const group = layerGroupRef.current;
    if (!map || !group) return;

    group.clearLayers();

    fronts.forEach((f) => {
      if (!f.geometry || !f.geometry.length) return;
      const rings: [number, number][][] = f.geometryRings || [f.geometry];
      const latlngs = rings.map((ring) => ring.map(([lng, lat]): [number, number] => [lat, lng]));

      const isGS = f.ownerTeam?.slug === 'galatasaray';
      const isFB = f.ownerTeam?.slug === 'fenerbahce';
      const isSuspended = f.status === 'suspended';
      const isContested = f.status === 'contested';
      const isSelected = selectedFront?.id === f.id;

      let fillColor = '#94A3B8';
      let strokeColor = '#64748B';

      if (isSuspended) {
        fillColor = '#EF4444';
        strokeColor = '#B91C1C';
      } else if (isGS) {
        fillColor = '#A90432';
        strokeColor = '#FDB913';
      } else if (isFB) {
        fillColor = '#002D72';
        strokeColor = '#FFED02';
      }

      const polygon = L.polygon(latlngs, {
        color: isSelected ? '#0F766E' : strokeColor,
        weight: isSelected ? 4 : 2,
        fillColor,
        fillOpacity: isSuspended ? 0.75 : isSelected ? 0.7 : 0.5,
        dashArray: isSuspended ? '6, 6' : f.status === 'neutral' ? '4, 4' : undefined,
      }).addTo(group);

      // Render external OSM names with textContent, not HTML interpolation.
      const tooltip = document.createElement('div');
      Object.assign(tooltip.style, { maxWidth: '280px', whiteSpace: 'normal', overflowWrap: 'anywhere' });
      const nameLabel = document.createElement('strong');
      nameLabel.textContent = frontName(f);
      nameLabel.title = frontName(f);
      nameLabel.style.display = 'block';
      const codeLabel = document.createElement('div');
      codeLabel.textContent = f.frontCode;
      Object.assign(codeLabel.style, { fontSize: '11px', color: '#64748B', marginTop: '4px' });
      tooltip.append(nameLabel, codeLabel);
      polygon.bindTooltip(tooltip, { sticky: true });

      polygon.on('click', () => {
        setSelectedFront(f);
        map.panTo([f.center.latitude, f.center.longitude], { animate: true });
      });

      if (isSuspended) {
        const lockIcon = L.divIcon({
          className: 'suspend-badge',
          html: `<div style="background:#B91C1C;color:#FFF;padding:2px 6px;border-radius:4px;font-size:9px;font-weight:800;border:1px solid #FFF;">⛔ ASKIYA ALINDI</div>`,
          iconSize: [80, 20],
          iconAnchor: [40, 10],
        });
        L.marker([f.center.latitude, f.center.longitude], { icon: lockIcon }).addTo(group);
      }
    });
  }, [fronts, selectedFront]);

  const handleToggleSuspend = async (frontId: string, isSuspended: boolean) => {
    setLoading(true);
    try {
      if (isSuspended) {
        await fetchApi(`/admin/fronts/${frontId}/restore`, { method: 'POST' });
      } else {
        await fetchApi(`/admin/fronts/${frontId}/suspend`, {
          method: 'POST',
          body: JSON.stringify({ reason: 'Güvenlik / yol çalışması nedeniyle geçici karantina' }),
        });
      }
      await loadFronts();
      const updated = await fetchApi<any>(`/fronts/${frontId}`);
      setSelectedFront(updated);
    } catch (err: any) {
      alert(`İşlem hatası: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Harita &amp; Küresel Cephe Güvenlik Editörü (A06)</h2>
          <p style={{ fontSize: 13, color: '#586271' }}>Tüm dünya haritasındaki ada ve 4-5 sokak kümelerinden oluşan deterministik cephelerin gerçek sokak haritası, ağırlıkları ve güvenlik durumları.</p>
        </div>

        {/* Region selector dropdown */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
          <Globe size={18} color="#0F766E" />
          <select
            value={selectedRegionIndex}
            onChange={(e) => setSelectedRegionIndex(Number(e.target.value))}
            style={{
              padding: '8px 14px',
              borderRadius: 8,
              border: '1px solid #D9DEE6',
              background: '#FFFFFF',
              fontSize: 13,
              fontWeight: 600,
              color: '#111827',
              cursor: 'pointer',
            }}
          >
            {ADMIN_WORLD_REGIONS.map((r, i) => (
              <option key={r.id} value={i}>
                {r.name}
              </option>
            ))}
          </select>
        </div>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 360px', gap: 20 }}>
        {/* Real Leaflet Map Container */}
        <div style={{
          background: '#FFFFFF',
          borderRadius: 16,
          border: '1px solid #D9DEE6',
          padding: 20,
          display: 'flex',
          flexDirection: 'column',
          gap: 16,
          boxShadow: '0 4px 12px rgba(0,0,0,0.05)',
        }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8, fontSize: 13, fontWeight: 600 }}>
              <Layers size={16} color="#0F766E" />
              Canlı Coğrafi Harita Katmanı: {ADMIN_WORLD_REGIONS[selectedRegionIndex].name}
            </div>
            <div style={{ fontSize: 12, color: '#8E98A8' }}>
              Toplam: {fronts.length} Belirlenmiş Cephe
            </div>
          </div>

          {(mapLoading || mapError || fronts.length === 0) && (
            <div role={mapError ? 'alert' : 'status'} aria-live="polite" style={{
              fontSize: 14, padding: '10px 12px', borderRadius: 8,
              background: mapError ? '#FEF2F2' : '#F1F5F9', color: mapError ? '#B91C1C' : '#475569',
              display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 12,
            }}>
              <span>{mapLoading ? mapProgress || 'Harita hazırlanıyor…' : mapError || 'Bu görünümde kara parseli bulunmuyor.'}</span>
              {mapError && <button onClick={() => void loadFronts()} style={{
                background: '#0F766E', color: '#FFFFFF', border: 'none', borderRadius: 8,
                padding: '7px 10px', cursor: 'pointer', whiteSpace: 'nowrap',
              }}>Yeniden dene</button>}
            </div>
          )}

          {/* Interactive Leaflet Map Div */}
          <div
            ref={mapContainerRef}
            style={{
              width: '100%',
              height: 520,
              borderRadius: 12,
              overflow: 'hidden',
              border: '1px solid #E2E8F0',
            }}
          />
        </div>

        {/* Selected Front Inspection & Actions Panel (Right Sidebar) */}
        <div style={{
          background: '#FFFFFF',
          borderRadius: 16,
          border: '1px solid #D9DEE6',
          padding: 24,
          display: 'flex',
          flexDirection: 'column',
          gap: 18,
          boxShadow: '0 4px 12px rgba(0,0,0,0.05)',
        }}>
          <div style={{ borderBottom: '1px solid #E2E8F0', paddingBottom: 14 }}>
            <h3 title={selectedFront ? frontName(selectedFront) : undefined} style={{ fontSize: 18, fontWeight: 700, color: '#111827', marginTop: 2, overflowWrap: 'anywhere', lineHeight: 1.4 }}>
              {selectedFront ? frontName(selectedFront) : 'Bir cepheye tıklayın'}
            </h3>
            <div style={{ fontSize: 11, color: '#64748B', overflowWrap: 'anywhere', marginTop: 4 }}>
              {selectedFront ? selectedFront.frontCode : 'Seçim yapılmadı'}
            </div>
          </div>

          {selectedFront ? (
            <>
              <div style={{ display: 'flex', flexDirection: 'column', gap: 12, fontSize: 13 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', gap: 12 }}>
                  <span style={{ color: '#64748B', flexShrink: 0 }}>Cadde / Sokak:</span>
                  <span title={selectedFront.streetName || undefined} style={{ fontWeight: 600, textAlign: 'right', overflowWrap: 'anywhere', minWidth: 0 }}>{selectedFront.streetName || '—'}</span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ color: '#64748B' }}>Puan Ağırlığı:</span>
                  <span style={{ fontWeight: 700, color: selectedFront.weight >= 4 ? '#D97706' : '#0F766E' }}>
                    {selectedFront.weight}x {selectedFront.weight >= 4 ? '(Ana Arter)' : selectedFront.weight >= 2 ? '(Toplayıcı)' : '(Sokak)'}
                  </span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ color: '#64748B' }}>Alan:</span>
                  <span style={{ fontWeight: 600 }}>~{selectedFront.areaM2} m²</span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ color: '#64748B' }}>Merkez Koordinat:</span>
                  <span style={{ fontFamily: 'monospace', fontSize: 11 }}>
                    {selectedFront.center?.latitude?.toFixed(4)}, {selectedFront.center?.longitude?.toFixed(4)}
                  </span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ color: '#64748B' }}>Mevcut Sahip:</span>
                  <span style={{
                    fontWeight: 700,
                    color: selectedFront.ownerTeam?.colorPrimary || '#64748B',
                  }}>
                    {selectedFront.ownerTeam?.nameI18n?.tr || 'Sahipsiz / Nötr'}
                  </span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <span style={{ color: '#64748B' }}>Güvenlik Durumu:</span>
                  <span style={{
                    padding: '3px 8px',
                    borderRadius: 6,
                    fontSize: 11,
                    fontWeight: 700,
                    background: selectedFront.status === 'suspended' ? '#FEF3F2' : '#ECFDF5',
                    color: selectedFront.status === 'suspended' ? '#B42318' : '#027A48',
                  }}>
                    {selectedFront.status === 'suspended' ? 'Askıya Alındı' : 'Güvenli / Aktif'}
                  </span>
                </div>
              </div>

              {/* Admin Actions */}
              <div style={{ display: 'flex', flexDirection: 'column', gap: 10, marginTop: 'auto', paddingTop: 16 }}>
                <button
                  disabled={loading}
                  onClick={() => handleToggleSuspend(selectedFront.id, selectedFront.status === 'suspended')}
                  style={{
                    width: '100%',
                    padding: '12px',
                    borderRadius: 8,
                    border: 'none',
                    background: selectedFront.status === 'suspended' ? '#0F766E' : '#B42318',
                    color: '#FFFFFF',
                    fontWeight: 700,
                    fontSize: 13,
                    cursor: loading ? 'not-allowed' : 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    gap: 8,
                  }}
                >
                  {selectedFront.status === 'suspended' ? (
                    <>
                      <CheckCircle size={16} />
                      Yeniden Aktifleştir
                    </>
                  ) : (
                    <>
                      <ShieldAlert size={16} />
                      Güvenlik Nedeniyle Karantinaya Al (Askıya Al)
                    </>
                  )}
                </button>
              </div>
            </>
          ) : (
            <div style={{ color: '#9CA3AF', fontSize: 13, textAlign: 'center', padding: '40px 0' }}>
              Sol harita üzerindeki herhangi bir bölgeye (ada/sokak) tıklayarak detaylarını inceleyin.
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
