const fs = require('fs');

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

// In Mahmutlar, D400 Sahil Yolu runs from approx (32.090, 36.490) to (32.103, 36.481)
// The sea is to the south-west of the coast line.
// Coast line: lat - 36.490 ~= -0.7 * (lng - 32.090) => lat + 0.7 * lng >= 36.490 + 0.7 * 32.090 = 58.953
function isLandInMahmutlar(lng, lat) {
  return (lat + 0.69 * lng) >= 58.628; // gives land line along beach
}

const minLatI = Math.floor(bbox.minLat / LAT_STEP);
const maxLatI = Math.ceil(bbox.maxLat / LAT_STEP);
const minLngI = Math.floor(bbox.minLng / lngStep);
const maxLngI = Math.ceil(bbox.maxLng / lngStep);

const landCells = [];
for (let latI = minLatI; latI < maxLatI; latI++) {
  for (let lngI = minLngI; lngI < maxLngI; lngI++) {
    const centerLng = (lngI + 0.5) * lngStep;
    const centerLat = (latI + 0.5) * LAT_STEP;
    if (isLandInMahmutlar(centerLng, centerLat)) {
      landCells.push({ latI, lngI, centerLng, centerLat });
    }
  }
}

console.log('Land cells on Mahmutlar side:', landCells.length);
