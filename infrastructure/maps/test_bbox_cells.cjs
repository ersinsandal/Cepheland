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

const minLatI = Math.floor(bbox.minLat / LAT_STEP);
const maxLatI = Math.ceil(bbox.maxLat / LAT_STEP);
const minLngI = Math.floor(bbox.minLng / lngStep);
const maxLngI = Math.ceil(bbox.maxLng / lngStep);

console.log('Grid bounds:', { minLatI, maxLatI, minLngI, maxLngI, rows: maxLatI - minLatI, cols: maxLngI - minLngI });
const total = (maxLatI - minLatI) * (maxLngI - minLngI);
console.log('Total cells in bbox:', total);
