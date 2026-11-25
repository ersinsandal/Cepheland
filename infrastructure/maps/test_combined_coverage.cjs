const fs = require('fs');
const coreBlocks = JSON.parse(fs.readFileSync('infrastructure/maps/final_12_osm_blocks.json', 'utf8'));

const bbox = { minLat: 36.480, maxLat: 36.495, minLng: 32.088, maxLng: 32.106 };
const LAT_STEP = 0.0014;
const midLat = (bbox.minLat + bbox.maxLat) / 2;
const lngStep = LAT_STEP / Math.cos((midLat * Math.PI) / 180);

function vertexOffset(latI, lngI) {
  const h = Math.sin(latI * 12.9898 + lngI * 78.233) * 43758.5453;
  const rand1 = (h - Math.floor(h));
  const rand2 = ((h * 1.5) - Math.floor(h * 1.5));
  const dLat = (rand1 - 0.5) * 0.35 * LAT_STEP;
  const dLng = (rand2 - 0.5) * 0.35 * lngStep;
  return [dLng, dLat];
}

function getVertex(latI, lngI) {
  const [dLng, dLat] = vertexOffset(latI, lngI);
  return [lngI * lngStep + dLng, latI * LAT_STEP + dLat];
}

function isLandInMahmutlar(lng, lat) {
  return (lat + 0.69 * lng) >= 58.628;
}

// Distance between points in meters approx
function distMeters(p1, p2) {
  return Math.hypot((p1[0] - p2[0]) * 89000, (p1[1] - p2[1]) * 111000);
}

const coreCenters = coreBlocks.map(b => [b.center.longitude, b.center.latitude]);

const minLatI = Math.floor(bbox.minLat / LAT_STEP);
const maxLatI = Math.ceil(bbox.maxLat / LAT_STEP);
const minLngI = Math.floor(bbox.minLng / lngStep);
const maxLngI = Math.ceil(bbox.maxLng / lngStep);

const organicParcels = [];
let nextIndex = 13;

for (let latI = minLatI; latI < maxLatI; latI++) {
  for (let lngI = minLngI; lngI < maxLngI; lngI++) {
    const centerLng = (lngI + 0.5) * lngStep;
    const centerLat = (latI + 0.5) * LAT_STEP;

    if (!isLandInMahmutlar(centerLng, centerLat)) continue;

    // Check if cell is too close to any core street block center
    const isOverlappingCore = coreCenters.some(cc => distMeters([centerLng, centerLat], cc) < 140);
    if (isOverlappingCore) continue;

    const p00 = getVertex(latI, lngI);
    const p10 = getVertex(latI, lngI + 1);
    const p11 = getVertex(latI + 1, lngI + 1);
    const p01 = getVertex(latI + 1, lngI);

    const ring = [p00, p10, p11, p01, p00];
    const code = `ALN-MHM-${String(nextIndex).padStart(3, '0')}`;
    const name = `Bölge #${String(nextIndex).padStart(2, '0')}`;

    organicParcels.push({
      code,
      name,
      center: { latitude: centerLat, longitude: centerLng },
      geometry: ring,
      areaM2: 18500,
      weight: 1.0,
      team: null,
      status: 'neutral'
    });

    nextIndex++;
  }
}

console.log('Core street blocks:', coreBlocks.length);
console.log('Organic land parcels:', organicParcels.length);
console.log('Total combined fronts covering entire map:', coreBlocks.length + organicParcels.length);
