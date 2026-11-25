const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/enriched_osm_blocks.json', 'utf8'));

const testPt = [32.0952, 36.4862]; // [lng, lat]

function isInside(point, vs) {
  const x = point[0], y = point[1];
  let inside = false;
  for (let i = 0, j = vs.length - 1; i < vs.length; j = i++) {
    const xi = vs[i][0], yi = vs[i][1];
    const xj = vs[j][0], yj = vs[j][1];
    const intersect = ((yi > y) !== (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
    if (intersect) inside = !inside;
  }
  return inside;
}

function distToRing(pt, ring) {
  let minD = Infinity;
  ring.forEach(p => {
    const d = Math.hypot(p[0] - pt[0], p[1] - pt[1]);
    if (d < minD) minD = d;
  });
  return minD * 111000; // meters approx
}

blocks.forEach(b => {
  if (isInside(testPt, b.geometry)) {
    console.log(`Test point IS INSIDE Block ${b.index}! Area: ${b.areaM2} m2, Streets: ${b.surroundingStreets.join(' + ')}`);
  }
});

const closest = [...blocks].sort((a, b) => distToRing(testPt, a.geometry) - distToRing(testPt, b.geometry)).slice(0, 5);
console.log('Closest blocks to test point:');
closest.forEach(b => {
  console.log(`Block ${b.index} [Dist: ${distToRing(testPt, b.geometry).toFixed(1)}m] Primary: ${b.primaryStreet} | Streets: ${b.surroundingStreets.join(' + ')}`);
});
