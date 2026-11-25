const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/enriched_osm_blocks.json', 'utf8'));

console.log('Total blocks:', blocks.length);
const bigEnough = blocks.filter(b => b.areaM2 >= 1500);
console.log('Blocks >= 1500 m2:', bigEnough.length);

bigEnough.forEach((b, i) => {
  console.log(`${i+1}. [${b.areaM2} m²] ${b.primaryStreet} (Edges: ${b.surroundingStreets.join(' + ')})`);
});
