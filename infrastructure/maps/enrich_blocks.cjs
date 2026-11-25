const fs = require('fs');
const polygons = JSON.parse(fs.readFileSync('infrastructure/maps/turf_blocks.json', 'utf8'));

// Load lines with names
const xml = fs.readFileSync('infrastructure/maps/mahmutlar_raw.osm', 'utf8');
const nodeRegex = /<node id="(\d+)"[^>]*?lat="([^"]+)"[^>]*?lon="([^"]+)"/g;
const nodeCoords = new Map();
let m;
while ((m = nodeRegex.exec(xml)) !== null) {
  nodeCoords.set(m[1], [parseFloat(m[3]), parseFloat(m[2])]); // [lng, lat]
}

const wayRegex = /<way id="(\d+)"[\s\S]*?<\/way>/g;
const namedWays = [];
while ((m = wayRegex.exec(xml)) !== null) {
  const wayXml = m[0];
  const nameMatch = wayXml.match(/<tag k="name" v="([^"]+)"/);
  if (!nameMatch) continue;
  const ndMatches = [...wayXml.matchAll(/<nd ref="(\d+)"/g)].map(x => x[1]);
  const coords = ndMatches.map(id => nodeCoords.get(id)).filter(Boolean);
  if (coords.length >= 2) {
    namedWays.push({ name: nameMatch[1], coords });
  }
}

function distSq(p1, p2) {
  return (p1[0] - p2[0])**2 + (p1[1] - p2[1])**2;
}

function pointToLineDistSq(p, a, b) {
  const l2 = distSq(a, b);
  if (l2 === 0) return distSq(p, a);
  let t = ((p[0] - a[0]) * (b[0] - a[0]) + (p[1] - a[1]) * (b[1] - a[1])) / l2;
  t = Math.max(0, Math.min(1, t));
  return distSq(p, [a[0] + t * (b[0] - a[0]), a[1] + t * (b[1] - a[1])]);
}

const enrichedBlocks = [];

polygons.features.forEach((feat, idx) => {
  const ring = feat.geometry.coordinates[0];
  if (!ring || ring.length < 4) return;

  // Calculate polygon area (shoelace)
  let area = 0;
  let sumLng = 0, sumLat = 0;
  for (let i = 0; i < ring.length - 1; i++) {
    area += (ring[i][0] * ring[i+1][1] - ring[i+1][0] * ring[i][1]);
    sumLng += ring[i][0];
    sumLat += ring[i][1];
  }
  area = Math.abs(area) / 2;
  const areaM2 = Math.round(area * 111000 * 89000);
  const center = [sumLng / (ring.length - 1), sumLat / (ring.length - 1)];

  // Find bordering streets: any named way that has a segment within ~15 meters of the block boundary
  const thresholdDistSq = (0.00015) ** 2; // ~15 meters
  const borderingStreets = new Set();

  ring.forEach(pt => {
    namedWays.forEach(way => {
      for (let s = 0; s < way.coords.length - 1; s++) {
        const d2 = pointToLineDistSq(pt, way.coords[s], way.coords[s+1]);
        if (d2 < thresholdDistSq) {
          borderingStreets.add(way.name);
          break;
        }
      }
    });
  });

  const streetList = [...borderingStreets];
  const primaryStreet = streetList[0] || 'Mahmutlar Yapı Adası';

  enrichedBlocks.push({
    index: idx + 1,
    center: { latitude: center[1], longitude: center[0] },
    areaM2,
    vertices: ring.length,
    primaryStreet,
    surroundingStreets: streetList,
    geometry: ring
  });
});

console.log('Enriched blocks:', enrichedBlocks.length);
// Sort by area
enrichedBlocks.sort((a, b) => b.areaM2 - a.areaM2);
enrichedBlocks.slice(0, 15).forEach(b => {
  console.log(`[${b.index}] Area: ${b.areaM2} m² | Primary: ${b.primaryStreet} | Streets: ${b.surroundingStreets.join(', ')}`);
});

fs.writeFileSync('infrastructure/maps/enriched_osm_blocks.json', JSON.stringify(enrichedBlocks, null, 2));
