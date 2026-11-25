import { area, booleanPointInPolygon, feature, featureCollection, intersect, polygon } from '@turf/turf';
import type { Point, Polygon, MultiPolygon, Position } from 'geojson';
import type { RoadWay } from './road-parcels.js';

export interface NameableFront {
  id: string;
  geometry: [number, number][];
  geometryRings?: [number, number][][];
  center: { latitude: number; longitude: number };
}

export interface NamedMapPlace {
  id: string;
  geometry: Point | Polygon | MultiPolygon;
  tags: Record<string, string>;
}

export interface FrontNameData { roads: RoadWay[]; places?: NamedMapPlace[] }
export interface FrontNameCandidates {
  candidates: string[];
  baseName: string;
  streetName: string | null;
  source: 'poi' | 'street' | 'locality' | 'coordinate';
  osmIds: string[];
  locality?: string;
}

type Bounds = [number, number, number, number];
type Indexed<T> = { item: T; bounds: Bounds };
type RoadSegment = { id: string; name: string; a: Position; b: Position; tolerance: number };
type PreparedPlace = { place: NamedMapPlace; name: string; center: Position; rank: number };
const DEG_METERS = 111_195;
const lexical = (a: string, b: string) => a < b ? -1 : a > b ? 1 : 0;

export function normalizePlaceName(value: string | undefined): string {
  return (value ?? '').normalize('NFC').replace(/[\u0000-\u001f\u007f\u202a-\u202e\u2066-\u2069]/g, ' ').replace(/\s+/gu, ' ').trim();
}
const realName = (tags: Record<string, string>) =>
  [tags['name:tr'], tags.name, tags.official_name, tags['name:en']].map(normalizePlaceName).find(Boolean) ?? '';
const nameKey = (name: string) => name.normalize('NFC').toLocaleLowerCase('tr');

function boundsFor(points: Position[]): Bounds {
  const result: Bounds = [Infinity, Infinity, -Infinity, -Infinity];
  for (const p of points) {
    result[0] = Math.min(result[0], p[0]); result[1] = Math.min(result[1], p[1]);
    result[2] = Math.max(result[2], p[0]); result[3] = Math.max(result[3], p[1]);
  }
  return result;
}
const intersectsBounds = (a: Bounds, b: Bounds) => a[0] <= b[2] && a[2] >= b[0] && a[1] <= b[3] && a[3] >= b[1];

/** Roads are indexed as segments: a long avenue should not make every block
 * inspect the whole city's road network. Exceptionally large polygons stay out
 * of the grid to avoid allocating millions of bins for regional place areas. */
function index<T>(entries: Indexed<T>[]) {
  const cell = 0.002;
  const bins = new Map<string, Indexed<T>[]>();
  const large: Indexed<T>[] = [];
  const keys = (b: Bounds) => {
    const result: string[] = [];
    const [x0, y0, x1, y1] = b.map(n => Math.floor(n / cell));
    if ((x1 - x0 + 1) * (y1 - y0 + 1) > 2500) return result;
    for (let x = x0; x <= x1; x++) for (let y = y0; y <= y1; y++) result.push(`${x}:${y}`);
    return result;
  };
  for (const entry of entries) {
    const occupied = keys(entry.bounds);
    if (!occupied.length) { large.push(entry); continue; }
    for (const key of occupied) {
      if (!bins.has(key)) bins.set(key, []);
      bins.get(key)!.push(entry);
    }
  }
  return (bounds: Bounds): T[] => {
    const occupied = keys(bounds);
    const matches = occupied.length ? new Set<Indexed<T>>(large) : new Set(entries);
    for (const key of occupied) for (const entry of bins.get(key) ?? []) matches.add(entry);
    return [...matches].filter(entry => intersectsBounds(entry.bounds, bounds)).map(entry => entry.item);
  };
}

function distance(a: Position, b: Position, cosLat: number): number {
  return Math.hypot((a[0] - b[0]) * cosLat, a[1] - b[1]) * DEG_METERS;
}
function segmentDistance(p: Position, a: Position, b: Position, cosLat: number): number {
  const dx = (b[0] - a[0]) * cosLat, dy = b[1] - a[1];
  const px = (p[0] - a[0]) * cosLat, py = p[1] - a[1];
  const t = Math.max(0, Math.min(1, (px * dx + py * dy) / (dx * dx + dy * dy || 1)));
  return Math.hypot(px - dx * t, py - dy * t) * DEG_METERS;
}

function preparePlaces(places: NamedMapPlace[]) {
  const entries: Indexed<PreparedPlace>[] = [];
  for (const place of places) {
    const name = realName(place.tags);
    if (!name || place.tags.disused === 'yes' || place.tags.abandoned === 'yes' || place.tags.shop === 'vacant') continue;
    if (!['amenity', 'shop', 'tourism', 'leisure', 'historic', 'place'].some(key => place.tags[key])) continue;
    const points = place.geometry.type === 'Point' ? [place.geometry.coordinates]
      : place.geometry.type === 'Polygon' ? place.geometry.coordinates.flat() : place.geometry.coordinates.flat(2);
    if (!points.length || points.some(p => !Number.isFinite(p[0]) || !Number.isFinite(p[1]))) continue;
    const bounds = boundsFor(points);
    // Used for deterministic ordering only; polygon membership is tested by
    // actual area intersection below, never by this bounding-box midpoint.
    const center = place.geometry.type === 'Point' ? place.geometry.coordinates
      : [(bounds[0] + bounds[2]) / 2, (bounds[1] + bounds[3]) / 2];
    const rank = (place.tags.wikidata || place.tags.wikipedia ? 100 : 0)
      + (place.tags.historic || place.tags.tourism === 'attraction' || place.tags.tourism === 'museum' ? 50 : 0)
      + (['school', 'university', 'library', 'theatre', 'place_of_worship', 'hospital'].includes(place.tags.amenity) ? 30 : 0);
    entries.push({ bounds, item: { place, name, center, rank } });
  }
  return entries;
}

/** Builds candidates only. A persistent registry must allocate the final unique
 * display name, so changing viewports cannot rename previously seen fronts. */
export function createFrontNameResolver(data: FrontNameData): (front: NameableFront) => FrontNameCandidates {
  const segments: Indexed<RoadSegment>[] = [];
  for (const road of data.roads) {
    const tags = road.tags ?? {}, name = realName(tags);
    if (!name || (tags.bridge && tags.bridge !== 'no') || (tags.tunnel && tags.tunnel !== 'no')
      || ['proposed', 'construction', 'abandoned'].includes(tags.highway)) continue;
    const width = Number.parseFloat(tags.width ?? '');
    const tolerance = Number.isFinite(width) ? Math.max(12, Math.min(40, width / 2 + 10)) : 18;
    for (let i = 1; i < road.coordinates.length; i++) {
      const a = road.coordinates[i - 1], b = road.coordinates[i];
      if (![...a, ...b].every(Number.isFinite)) continue;
      segments.push({ bounds: boundsFor([a, b]), item: { id: String(road.id), name, a, b, tolerance } });
    }
  }
  const nearbyRoads = index(segments);
  const preparedPlaces = preparePlaces(data.places ?? []);
  const nearbyPlaces = index(preparedPlaces.filter(entry => !entry.item.place.tags.place));
  const localities = preparedPlaces.filter(entry => entry.item.place.tags.place).map(entry => entry.item);

  return front => {
    const shape = polygon(front.geometryRings ?? [front.geometry]);
    const bounds = boundsFor(front.geometry);
    const cosLat = Math.max(.01, Math.cos(front.center.latitude * Math.PI / 180));
    const center = [front.center.longitude, front.center.latitude];
    const paddingLat = 40 / DEG_METERS, paddingLng = paddingLat / cosLat;
    const nearby = nearbyRoads([bounds[0] - paddingLng, bounds[1] - paddingLat, bounds[2] + paddingLng, bounds[3] + paddingLat]);
    const roadGroups = new Map<string, { name: string; ids: Set<string>; segments: RoadSegment[]; frontage: number; nearest: number }>();
    for (const segment of nearby) {
      const key = nameKey(segment.name);
      if (!roadGroups.has(key)) roadGroups.set(key, { name: segment.name, ids: new Set(), segments: [], frontage: 0, nearest: Infinity });
      const group = roadGroups.get(key)!;
      if (lexical(segment.name, group.name) < 0) group.name = segment.name;
      group.ids.add(segment.id); group.segments.push(segment);
    }
    let perimeter = 0;
    for (let i = 1; i < front.geometry.length; i++) {
      const a = front.geometry[i - 1], b = front.geometry[i], length = distance(a, b, cosLat);
      perimeter += length;
      // Sample long polygon edges too, so a street touching just a corner does
      // not outrank the avenue which actually borders most of the parcel.
      const count = Math.max(3, Math.min(64, Math.ceil(length / 15)));
      for (const group of roadGroups.values()) for (let j = 0; j < count; j++) {
        const t = (j + .5) / count, sample = [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t];
        let gap = Infinity, within = false;
        for (const segment of group.segments) {
          const d = segmentDistance(sample, segment.a, segment.b, cosLat);
          gap = Math.min(gap, d); within ||= d <= segment.tolerance;
        }
        group.nearest = Math.min(group.nearest, gap);
        if (within) group.frontage += length / count;
      }
    }
    const streets = [...roadGroups.values()].filter(group => group.frontage >= Math.max(8, Math.min(25, perimeter * .03)))
      .sort((a, b) => b.frontage - a.frontage || a.nearest - b.nearest || lexical(nameKey(a.name), nameKey(b.name))).slice(0, 4);

    const locality = localities.map(place => {
      const kind = place.place.tags.place;
      const radius = ['city', 'town'].includes(kind) ? 15_000 : ['village', 'hamlet'].includes(kind) ? 5_000 : 2_500;
      const inside = place.place.geometry.type !== 'Point' && booleanPointInPolygon(center, feature(place.place.geometry));
      const meters = distance(center, place.center, cosLat);
      const specific = ['neighbourhood', 'quarter', 'suburb', 'square'].includes(kind) ? 0 : 1;
      return { ...place, meters, valid: inside || meters <= radius, specific, inside };
    }).filter(place => place.valid).sort((a, b) => Number(b.inside) - Number(a.inside)
      || a.specific - b.specific || a.meters - b.meters || lexical(a.place.id, b.place.id))[0];

    const pois = nearbyPlaces(bounds).filter(candidate => {
      const geometry = candidate.place.geometry;
      if (geometry.type === 'Point') return booleanPointInPolygon(geometry.coordinates, shape, { ignoreBoundary: true });
      const footprint = feature(geometry), size = area(footprint);
      if (size <= 0) return false;
      try {
        const shared = intersect(featureCollection([shape, footprint]));
        return !!shared && area(shared) / size >= .5;
      } catch { return false; } // Invalid optional POI must not invalidate an otherwise usable map.
    }).sort((a, b) => b.rank - a.rank || distance(center, a.center, cosLat) - distance(center, b.center, cosLat)
      || lexical(nameKey(a.name), nameKey(b.name)) || lexical(a.place.id, b.place.id));

    const streetName = streets[0]?.name ?? null;
    const poi = pois[0];
    // A road can locate open land without bordering it. Keep this explicitly
    // qualified as "çevresi" and never populate streetName with a distant road.
    const surroundingsRadius = 250;
    const surroundingsLat = surroundingsRadius / DEG_METERS;
    const surroundingRoad = !poi && !streetName && !locality
      ? nearbyRoads([center[0] - surroundingsLat / cosLat, center[1] - surroundingsLat,
        center[0] + surroundingsLat / cosLat, center[1] + surroundingsLat])
        .map(segment => ({ segment, meters: segmentDistance(center, segment.a, segment.b, cosLat) }))
        .filter(candidate => candidate.meters <= surroundingsRadius)
        .sort((a, b) => a.meters - b.meters || lexical(nameKey(a.segment.name), nameKey(b.segment.name))
          || lexical(a.segment.id, b.segment.id))[0]?.segment
      : undefined;
    const source = poi ? 'poi' : streetName ? 'street' : locality || surroundingRoad ? 'locality' : 'coordinate';
    const primary = poi ? [poi.name, streetName].filter(Boolean).join(' · ')
      : streetName ? streets.slice(0, 2).map(street => street.name).join(' / ')
      : locality ? `${locality.name} çevresi`
      : surroundingRoad ? `${surroundingRoad.name} çevresi`
      : `Adsız arazi · ${front.center.latitude.toFixed(5)}, ${front.center.longitude.toFixed(5)}`;
    const candidates = [primary];
    if (locality && !primary.includes(locality.name)) candidates.push(`${primary} · ${locality.name}`);
    if (poi && streets.length > 1) candidates.push(`${primary} / ${streets[1].name}`);
    if (streets.length > 2) candidates.push(`${primary} / ${streets[2].name}`);
    // Include another actual landmark only as a collision alternative, not an
    // unsupported invented popularity claim or an unrelated nearby business.
    if (pois[1] && nameKey(pois[1].name) !== nameKey(poi!.name)) candidates.push(`${primary} · ${pois[1].name}`);
    return {
      candidates: [...new Set(candidates)], baseName: primary, streetName, source,
      osmIds: [...new Set([...(poi ? [poi.place.id] : []),
        ...(pois[1] && nameKey(pois[1].name) !== nameKey(poi!.name) ? [pois[1].place.id] : []),
        ...streets.flatMap(street => [...street.ids]), ...(locality ? [locality.place.id] : []),
        ...(surroundingRoad ? [surroundingRoad.id] : [])])].sort(lexical),
      ...(locality ? { locality: locality.name } : {}),
    };
  };
}

export function getFrontNameCandidates(front: NameableFront, data: FrontNameData): FrontNameCandidates {
  return createFrontNameResolver(data)(front);
}
