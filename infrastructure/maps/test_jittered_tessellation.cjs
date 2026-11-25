const fs = require('fs');

// Test jittered planetary tessellation
const LAT_STEP = 0.0014;
function getLngStep(lat) {
  const rad = (lat * Math.PI) / 180;
  return LAT_STEP / Math.max(0.12, Math.cos(rad));
}

// Pseudo-random deterministic hash for vertex offset
function vertexOffset(latI, lngI, latStep, lngStep) {
  const h = Math.sin(latI * 12.9898 + lngI * 78.233) * 43758.5453;
  const rand1 = (h - Math.floor(h));
  const rand2 = ((h * 1.5) - Math.floor(h * 1.5));
  // Jitter by up to 28% of step so edges never self-intersect
  const dLat = (rand1 - 0.5) * 0.45 * latStep;
  const dLng = (rand2 - 0.5) * 0.45 * lngStep;
  return [dLng, dLat];
}

function getJitteredVertex(latI, lngI, midLat) {
  const latStep = LAT_STEP;
  const lngStep = getLngStep(midLat);
  const baseLat = latI * latStep;
  const baseLng = lngI * lngStep;
  const [dLng, dLat] = vertexOffset(latI, lngI, latStep, lngStep);
  return [baseLng + dLng, baseLat + dLat];
}

const midLat = 36.488;
const minLatI = 26060;
const minLngI = 18440;

const cells = [];
for (let i = 0; i < 4; i++) {
  for (let j = 0; j < 4; j++) {
    const p00 = getJitteredVertex(minLatI + i, minLngI + j, midLat);
    const p10 = getJitteredVertex(minLatI + i, minLngI + j + 1, midLat);
    const p11 = getJitteredVertex(minLatI + i + 1, minLngI + j + 1, midLat);
    const p01 = getJitteredVertex(minLatI + i + 1, minLngI + j, midLat);

    const ring = [p00, p10, p11, p01, p00];
    cells.push({ i, j, ring });
  }
}

console.log('Generated cells:', cells.length);
cells.slice(0, 3).forEach(c => {
  console.log(`Cell (${c.i}, ${c.j}):`, c.ring.map(p => `[${p[0].toFixed(5)}, ${p[1].toFixed(5)}]`).join(', '));
});
