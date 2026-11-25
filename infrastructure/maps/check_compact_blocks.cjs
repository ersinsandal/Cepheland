const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/enriched_osm_blocks.json', 'utf8'));

// Calculate bbox and aspect ratio of each block
blocks.forEach(b => {
  const ring = b.geometry;
  let minX = Infinity, maxX = -Infinity, minY = Infinity, maxY = -Infinity;
  ring.forEach(([x, y]) => {
    if (x < minX) minX = x;
    if (x > maxX) maxX = x;
    if (y < minY) minY = y;
    if (y > maxY) maxY = y;
  });
  const widthM = (maxX - minX) * 89000;
  const heightM = (maxY - minY) * 111000;
  const aspect = Math.max(widthM, heightM) / (Math.min(widthM, heightM) || 1);
  b.widthM = Math.round(widthM);
  b.heightM = Math.round(heightM);
  b.aspect = parseFloat(aspect.toFixed(2));
});

console.log('Total blocks:', blocks.length);
// Filter out narrow corridors (aspect > 2.8 or width < 35m or height < 35m)
const compactBlocks = blocks.filter(b => b.areaM2 >= 1800 && b.aspect <= 2.8 && b.widthM >= 35 && b.heightM >= 35);
console.log('Compact non-corridor blocks:', compactBlocks.length);
compactBlocks.slice(0, 20).forEach(b => {
  console.log(`Block ${b.index}: ${b.areaM2} m² | Dim: ${b.widthM}x${b.heightM}m | Aspect: ${b.aspect} | Streets: ${b.surroundingStreets.join(' + ')}`);
});
