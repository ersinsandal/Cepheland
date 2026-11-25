const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/enriched_osm_blocks.json', 'utf8'));
const kumruBlocks = blocks.filter(b => b.surroundingStreets.some(s => /kumru/i.test(s)));
console.log('Kumru blocks found:', kumruBlocks.length);
kumruBlocks.forEach(b => {
  console.log(`Block ${b.index} | Area: ${b.areaM2} m² | Center: [${b.center.latitude.toFixed(5)}, ${b.center.longitude.toFixed(5)}] | Streets: ${b.surroundingStreets.join(' + ')}`);
});
