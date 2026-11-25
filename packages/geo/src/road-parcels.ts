import {
  area, bbox as featureBbox, bboxClip, bboxPolygon, booleanPointInPolygon, buffer, centerOfMass,
  difference, feature, featureCollection, intersect, lineString, point, polygon,
  polygonize, toMercator, toWgs84, union, voronoi,
} from '@turf/turf';
import type { Feature, Polygon, MultiPolygon, Position } from 'geojson';
import type { BoundingBox, LatLng } from './index.js';
import { generateDeterministicUuid, isLandCoordinate } from './planetary-grid.js';

export type RoadCoordinate = [number, number];
type Surface = Feature<Polygon | MultiPolygon>;
export interface RoadWay {
  id: string | number;
  coordinates: RoadCoordinate[];
  tags?: Record<string, string>;
}
export interface RoadTileInput {
  key: string;
  bbox: BoundingBox;
  roads: RoadWay[];
  water?: (Polygon | MultiPolygon)[];
  coastlines?: RoadCoordinate[][];
  reserved?: (Polygon | MultiPolygon)[];
}
export interface RoadParcel {
  id: string;
  frontCode: string;
  displayNameI18n: { tr: string; en: string };
  center: LatLng;
  geometry: RoadCoordinate[];
  geometryRings: RoadCoordinate[][];
  areaM2: number;
  weight: number;
  source: 'osm_block' | 'open_land';
}

// Fetch the same halo on every request. Ordinary closed street blocks remain whole
// across tile boundaries; only the unbounded countryside is cut at tile boundaries.
export const ROAD_TILE_HALO = 0.005;
const OPEN_LAND_SPACING_METERS = 220;
const EPS = 1e-10;

function extent(b: BoundingBox, padding = 0): [number, number, number, number] {
  return [b.minLng - padding, b.minLat - padding, b.maxLng + padding, b.maxLat + padding];
}
function combine(shapes: Surface[]): Surface | null {
  return shapes.length === 0 ? null : shapes.length === 1 ? shapes[0] : union(featureCollection(shapes));
}
function subtract(subject: Surface | null, mask: Surface | null): Surface | null {
  return subject && mask ? difference(featureCollection([subject, mask])) : subject;
}
function overlap(a: Surface | null, b: Surface | null): Surface | null {
  return a && b ? intersect(featureCollection([a, b])) : null;
}
function pieces(shape: Surface | null): Feature<Polygon>[] {
  if (!shape) return [];
  return shape.geometry.type === 'Polygon' ? [shape as Feature<Polygon>] : shape.geometry.coordinates.map(rings => polygon(rings));
}

/** Query only nearby geometry during overlays. Intersecting every small block
 * with the entire city's road union made dense real OSM tiles take minutes. */
function surfaceIndex(shapes: Surface[]) {
  const size = 0.002;
  const bins = new Map<string, Set<Surface>>();
  const visit = (shape: Surface, callback: (key: string) => void) => {
    const b = featureBbox(shape);
    for (let x = Math.floor(b[0] / size); x <= Math.floor(b[2] / size); x++) {
      for (let y = Math.floor(b[1] / size); y <= Math.floor(b[3] / size); y++) callback(`${x}:${y}`);
    }
  };
  for (const shape of shapes) visit(shape, key => {
    if (!bins.has(key)) bins.set(key, new Set());
    bins.get(key)!.add(shape);
  });
  return (shape: Surface): Surface[] => {
    const candidates = new Set<Surface>();
    visit(shape, key => bins.get(key)?.forEach(candidate => candidates.add(candidate)));
    const b = featureBbox(shape);
    return [...candidates].filter(candidate => {
      const c = featureBbox(candidate);
      return c[0] <= b[2] && c[2] >= b[0] && c[1] <= b[3] && c[3] >= b[1];
    });
  };
}

function boundaryIndex(surface: Surface) {
  // Only faces touching a land/water boundary need expensive polygon clipping.
  const segments = pieces(surface).flatMap(piece => piece.geometry.coordinates.flatMap(ring =>
    ring.slice(1).map((p, i) => [ring[i], p]),
  ));
  return (face: Surface) => {
    const b = featureBbox(face);
    return segments.some(([a, c]) => Math.min(a[0], c[0]) <= b[2] && Math.max(a[0], c[0]) >= b[0]
      && Math.min(a[1], c[1]) <= b[3] && Math.max(a[1], c[1]) >= b[1]);
  };
}
const coordinateKey = (p: Position) => `${Math.round(p[0] * 1e9)},${Math.round(p[1] * 1e9)}`;
const cross = (a: Position, b: Position) => a[0] * b[1] - a[1] * b[0];
type Segment = { a: RoadCoordinate; b: RoadCoordinate; cuts: number[] };

/** Split every intersection, including T junctions and collinear overlaps. Turf's
 * polygonizer requires a planar graph, not whole OSM ways with shared inner nodes. */
function nodedLines(lines: RoadCoordinate[][]): Feature<GeoJSON.LineString>[] {
  const segments: Segment[] = [];
  for (const line of lines) {
    for (let i = 1; i < line.length; i++) {
      if (coordinateKey(line[i - 1]) !== coordinateKey(line[i])) segments.push({ a: line[i - 1], b: line[i], cuts: [0, 1] });
    }
  }
  // Spatial bins avoid comparing every street segment to every other segment.
  const buckets = new Map<string, number[]>();
  const bucketSize = 0.001;
  for (let i = 0; i < segments.length; i++) {
    const s = segments[i];
    const candidates = new Set<number>();
    const minX = Math.floor(Math.min(s.a[0], s.b[0]) / bucketSize);
    const maxX = Math.floor(Math.max(s.a[0], s.b[0]) / bucketSize);
    const minY = Math.floor(Math.min(s.a[1], s.b[1]) / bucketSize);
    const maxY = Math.floor(Math.max(s.a[1], s.b[1]) / bucketSize);
    for (let x = minX; x <= maxX; x++) for (let y = minY; y <= maxY; y++) {
      const k = `${x}:${y}`;
      const bucket = buckets.get(k) ?? [];
      bucket.forEach(index => candidates.add(index));
      bucket.push(i);
      buckets.set(k, bucket);
    }
    const r = [s.b[0] - s.a[0], s.b[1] - s.a[1]];
    for (const j of candidates) {
      const t = segments[j];
      const v = [t.b[0] - t.a[0], t.b[1] - t.a[1]];
      const q = [t.a[0] - s.a[0], t.a[1] - s.a[1]];
      const determinant = cross(r, v);
      if (Math.abs(determinant) > 1e-18) {
        const u = cross(q, v) / determinant;
        const w = cross(q, r) / determinant;
        if (u >= -EPS && u <= 1 + EPS && w >= -EPS && w <= 1 + EPS) {
          s.cuts.push(Math.max(0, Math.min(1, u)));
          t.cuts.push(Math.max(0, Math.min(1, w)));
        }
      } else if (Math.abs(cross(q, r)) < 1e-16) {
        const axis = Math.abs(r[0]) > Math.abs(r[1]) ? 0 : 1;
        for (const p of [t.a, t.b]) {
          const u = (p[axis] - s.a[axis]) / r[axis];
          if (u > EPS && u < 1 - EPS) s.cuts.push(u);
        }
        const otherAxis = Math.abs(v[0]) > Math.abs(v[1]) ? 0 : 1;
        for (const p of [s.a, s.b]) {
          const u = (p[otherAxis] - t.a[otherAxis]) / v[otherAxis];
          if (u > EPS && u < 1 - EPS) t.cuts.push(u);
        }
      }
    }
  }
  const edges = new Map<string, Feature<GeoJSON.LineString>>();
  for (const s of segments) {
    const cuts = [...new Set(s.cuts)].sort((a, b) => a - b);
    const at = (t: number): RoadCoordinate => [
      Math.round((s.a[0] + (s.b[0] - s.a[0]) * t) * 1e9) / 1e9,
      Math.round((s.a[1] + (s.b[1] - s.a[1]) * t) * 1e9) / 1e9,
    ];
    for (let i = 1; i < cuts.length; i++) {
      const a = at(cuts[i - 1]), b = at(cuts[i]);
      const ka = coordinateKey(a), kb = coordinateKey(b);
      if (ka !== kb) edges.set([ka, kb].sort().join('|'), lineString([a, b]));
    }
  }
  return [...edges.values()];
}

/** Clip segments without inventing links between disjoint parts of an OSM way. */
function clipLines(lines: RoadCoordinate[][], bounds: number[]): RoadCoordinate[][] {
  const output: RoadCoordinate[][] = [];
  for (const line of lines) for (let i = 1; i < line.length; i++) {
    const a = line[i - 1], b = line[i];
    const dx = b[0] - a[0], dy = b[1] - a[1];
    let lo = 0, hi = 1, valid = true;
    const p = [-dx, dx, -dy, dy], q = [a[0] - bounds[0], bounds[2] - a[0], a[1] - bounds[1], bounds[3] - a[1]];
    for (let edge = 0; edge < 4; edge++) {
      if (Math.abs(p[edge]) < 1e-20) { if (q[edge] < 0) valid = false; }
      else if (p[edge] < 0) lo = Math.max(lo, q[edge] / p[edge]);
      else hi = Math.min(hi, q[edge] / p[edge]);
    }
    if (valid && lo < hi) output.push([[a[0] + lo * dx, a[1] + lo * dy], [a[0] + hi * dx, a[1] + hi * dy]]);
  }
  return output;
}

/** An actual interior point, including for concave parcels and polygons with lakes. */
function interior(shape: Feature<Polygon>): Position {
  const center = centerOfMass(shape).geometry.coordinates;
  if (booleanPointInPolygon(center, shape, { ignoreBoundary: true })) return center;
  // A scanline through each gap between vertex y coordinates is guaranteed to
  // find the interior of every non-degenerate polygon, including narrow pieces.
  const rings = shape.geometry.coordinates;
  const ys = [...new Set(rings.flat().map(p => p[1]))].sort((a, b) => a - b);
  for (let k = 1; k < ys.length; k++) {
    const y = (ys[k - 1] + ys[k]) / 2;
    const xs: number[] = [];
    for (const ring of rings) for (let i = 1; i < ring.length; i++) {
      const a = ring[i - 1], b = ring[i];
      if ((a[1] > y) !== (b[1] > y)) xs.push(a[0] + (y - a[1]) * (b[0] - a[0]) / (b[1] - a[1]));
    }
    xs.sort((a, b) => a - b);
    for (let i = 1; i < xs.length; i += 2) {
      const candidate = [(xs[i - 1] + xs[i]) / 2, y];
      if (booleanPointInPolygon(candidate, shape, { ignoreBoundary: true })) return candidate;
    }
  }
  return rings[0][0];
}

/** OSM coastlines are directed with land on the left. Split the halo into faces
 * before classification so a peninsula is cut along its coast, never its center. */
function landSurface(input: RoadTileInput, halo: Surface): Surface | null {
  const bounds = extent(input.bbox, ROAD_TILE_HALO);
  const coast = clipLines(input.coastlines ?? [], bounds);
  if (!coast.length) {
    const lat = (input.bbox.minLat + input.bbox.maxLat) / 2;
    const lng = (input.bbox.minLng + input.bbox.maxLng) / 2;
    return isLandCoordinate(lat, lng) ? halo : null;
  }
  const outline = (halo.geometry as Polygon).coordinates[0] as RoadCoordinate[];
  const faces = polygonize(featureCollection(nodedLines([...coast, outline])));
  const land: Surface[] = [];
  for (const face of faces.features) {
    const p = interior(face);
    let closest = Infinity, left = false;
    for (const [a, b] of coast) {
      const dx = b[0] - a[0], dy = b[1] - a[1];
      const t = Math.max(0, Math.min(1, ((p[0] - a[0]) * dx + (p[1] - a[1]) * dy) / (dx * dx + dy * dy)));
      const d = (p[0] - a[0] - t * dx) ** 2 + (p[1] - a[1] - t * dy) ** 2;
      if (d < closest) { closest = d; left = dx * (p[1] - a[1]) - dy * (p[0] - a[0]) > 0; }
    }
    if (left) land.push(face);
  }
  return combine(land);
}

function roadWidth(road: RoadWay): number {
  const tags = road.tags ?? {};
  const width = Number.parseFloat(tags.width ?? '');
  if (Number.isFinite(width) && width > 0) return Math.min(60, Math.max(2, width));
  const lanes = Number.parseFloat(tags.lanes ?? '');
  if (Number.isFinite(lanes) && lanes > 0) return Math.min(45, lanes * 3.2 + 1);
  return ({ motorway: 16, trunk: 14, primary: 12, secondary: 10, tertiary: 8,
    residential: 7, unclassified: 6, service: 4, pedestrian: 5, living_street: 5,
    footway: 2, cycleway: 2.5, path: 2, track: 3 } as Record<string, number>)[tags.highway ?? 'residential'] ?? 6;
}
function groundRoad(road: RoadWay): boolean {
  const t = road.tags ?? {};
  return road.coordinates.length > 1 && t.area !== 'yes' &&
    (!t.bridge || t.bridge === 'no') && (!t.tunnel || t.tunnel === 'no') &&
    !['proposed', 'construction', 'abandoned'].includes(t.highway ?? '');
}

function canonicalRing(ring: Position[]): string {
  const points = ring.slice(0, -1).map(p => `${Math.round(p[0] * 1e7)},${Math.round(p[1] * 1e7)}`);
  const variants = [points, [...points].reverse()].map(sequence => {
    let start = 0;
    for (let i = 1; i < sequence.length; i++) if (sequence[i] < sequence[start]) start = i;
    return [...sequence.slice(start), ...sequence.slice(0, start)].join(';');
  });
  return variants.sort()[0];
}
function asParcel(shape: Feature<Polygon>, source: RoadParcel['source']): RoadParcel | null {
  const size = area(shape);
  if (size < 0.25) return null; // Numerical overlay slivers, not legitimate small blocks.
  const rings = shape.geometry.coordinates;
  const identity = [canonicalRing(rings[0]), ...rings.slice(1).map(canonicalRing).sort()].join('/');
  const id = generateDeterministicUuid(`road-parcel-v1:${source}:${identity}`);
  const code = `RP-${id.replaceAll('-', '').slice(0, 16).toUpperCase()}`;
  const number = Number.parseInt(id.slice(0, 8), 16) % 1_000_000;
  const p = interior(shape);
  return { id, frontCode: code, displayNameI18n: { tr: `Bölge #${number}`, en: `Sector #${number}` },
    center: { longitude: p[0], latitude: p[1] }, geometry: rings[0] as RoadCoordinate[],
    geometryRings: rings as RoadCoordinate[][], areaM2: Math.round(size), weight: 1, source };
}

function random01(x: number, y: number, salt: number): number {
  let h = Math.imul(x ^ salt, 374761393) ^ Math.imul(y, 668265263);
  h = Math.imul(h ^ (h >>> 13), 1274126177);
  return ((h ^ (h >>> 16)) >>> 0) / 4294967296;
}

function ruralCells(input: RoadTileInput): Feature<Polygon>[] {
  const projected = toMercator(bboxPolygon(extent(input.bbox)));
  const bounds = featureBbox(projected, { recompute: true });
  // Scale Mercator spacing to ground distance, frozen per geographic tile row.
  const latitudeBand = Math.floor(input.bbox.minLat / 0.02 + 1e-7) * 0.02;
  const spacing = OPEN_LAND_SPACING_METERS / Math.max(0.15, Math.cos(latitudeBand * Math.PI / 180));
  const minX = Math.floor(bounds[0] / spacing) - 2, maxX = Math.ceil(bounds[2] / spacing) + 2;
  const minY = Math.floor(bounds[1] / spacing) - 2, maxY = Math.ceil(bounds[3] / spacing) + 2;
  const seeds: Feature<GeoJSON.Point>[] = [];
  for (let x = minX; x <= maxX; x++) for (let y = minY; y <= maxY; y++) {
    seeds.push(point([(x + 0.15 + 0.7 * random01(x, y, 17)) * spacing, (y + 0.15 + 0.7 * random01(x, y, 53)) * spacing]));
  }
  const cells = voronoi(featureCollection(seeds), { bbox: [bounds[0], bounds[1], bounds[2], bounds[3]] });
  return cells.features.filter(Boolean).map(cell => toWgs84(cell));
}

/** Generate real road-bounded blocks and fill remaining land with reproducibly
 * random cells. Roads, water, reserved polygons and parcel holes stay excluded. */
export function partitionRoadTile(input: RoadTileInput): RoadParcel[] {
  const halo = bboxPolygon(extent(input.bbox, ROAD_TILE_HALO));
  const tile = bboxPolygon(extent(input.bbox));
  const exclusions = combine([...(input.water ?? []), ...(input.reserved ?? [])].map(geometry => feature(geometry)));
  const land = subtract(landSurface(input, halo), exclusions);
  if (!land) return [];
  const touchesLandBoundary = boundaryIndex(land);
  const roads = input.roads.filter(groundRoad);
  const roadLines = clipLines(roads.map(r => r.coordinates), extent(input.bbox, ROAD_TILE_HALO));
  const roadBuffers: Surface[] = [];
  for (const road of roads) {
    const clipped = clipLines([road.coordinates], extent(input.bbox, ROAD_TILE_HALO));
    if (!clipped.length) continue;
    // Buffer the full OSM way so adjacent tiles use an identical projection and
    // identical road edges, then trim only the irrelevant far-away geometry.
    const buffered = buffer(lineString(road.coordinates), roadWidth(road) / 2, { units: 'meters', steps: 3 });
    if (buffered) roadBuffers.push(bboxClip(buffered, extent(input.bbox, ROAD_TILE_HALO)) as Surface);
  }
  const roadMask = combine(roadBuffers);
  const nearbyRoads = surfaceIndex(roadBuffers);
  const available = subtract(land, roadMask);
  if (!available) return [];
  const blocks: Surface[] = [];
  const result: RoadParcel[] = [];
  const faces = roadLines.length ? polygonize(featureCollection(nodedLines(roadLines))).features : [];
  for (const face of faces) {
    if (!overlap(face, tile)) continue;
    // OSM ways outside a particular block cannot affect its geometry.
    const faceLand = touchesLandBoundary(face) ? overlap(face, land)
      : booleanPointInPolygon(interior(face), land) ? face : null;
    const localBuffers = nearbyRoads(face).map(road => bboxClip(road, featureBbox(face)) as Surface)
      .filter(road => road.geometry.coordinates.length > 0 && area(road) > 0);
    const clipped = subtract(faceLand, combine(localBuffers));
    for (const block of pieces(clipped)) {
      blocks.push(block);
      if (!overlap(block, tile)) continue;
      const parcel = asParcel(block, 'osm_block');
      if (parcel) result.push(parcel);
    }
  }
  const residual = subtract(overlap(available, tile), combine(blocks));
  if (residual) {
    const nearbyResidual = surfaceIndex(pieces(residual));
    for (const cell of ruralCells(input)) for (const remainder of nearbyResidual(cell)) {
      for (const piece of pieces(overlap(cell, remainder))) {
        const parcel = asParcel(piece, 'open_land');
        if (parcel) result.push(parcel);
      }
    }
  }
  return [...new Map(result.map(parcel => [parcel.id, parcel])).values()].sort((a, b) => a.id.localeCompare(b.id));
}
