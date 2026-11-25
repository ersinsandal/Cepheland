const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/enriched_osm_blocks.json', 'utf8'));

// We want 12 contiguous, non-overlapping street-bounded blocks in Mahmutlar:
// Tier 1: Sahil - Barbaros (between D400 Sahil and Barbaros Caddesi)
// Tier 2: Barbaros - Atatürk (the main commercial district)
// Tier 3: Atatürk - Kervansaray / Kılınçaslan

// Let's filter blocks by their bbox / center to focus on the vibrant central strip:
// lng between 32.092 and 32.103, lat between 36.484 and 36.494
const centralBlocks = blocks.filter(b => {
  const lat = b.center.latitude;
  const lng = b.center.longitude;
  return lat >= 36.482 && lat <= 36.495 && lng >= 32.091 && lng <= 32.105 && b.areaM2 >= 2000;
});

console.log('Central blocks available:', centralBlocks.length);

centralBlocks.sort((a, b) => b.areaM2 - a.areaM2);
centralBlocks.forEach((b, i) => {
  console.log(`[#${b.index}] ${b.areaM2} m² | Lat: ${b.center.latitude.toFixed(5)}, Lng: ${b.center.longitude.toFixed(5)} | Primary: ${b.primaryStreet} | Streets: ${b.surroundingStreets.join(' + ')}`);
});
