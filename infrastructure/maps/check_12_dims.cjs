const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/final_12_osm_blocks.json', 'utf8'));

blocks.forEach((b, i) => {
  const ring = b.geometry;
  let minX = Infinity, maxX = -Infinity, minY = Infinity, maxY = -Infinity;
  ring.forEach(([x, y]) => {
    if (x < minX) minX = x;
    if (x > maxX) maxX = x;
    if (y < minY) minY = y;
    if (y > maxY) maxY = y;
  });
  const widthM = Math.round((maxX - minX) * 89000);
  const heightM = Math.round((maxY - minY) * 111000);
  const aspect = (Math.max(widthM, heightM) / (Math.min(widthM, heightM) || 1)).toFixed(2);
  console.log(`${i+1}. [${b.code}] ${b.name} -> Dim: ${widthM}x${heightM}m, Aspect: ${aspect}, pts: ${ring.length}`);
});
