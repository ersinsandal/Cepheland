const fs = require('fs');
const xml = fs.readFileSync('infrastructure/maps/mahmutlar_raw.osm', 'utf8');

const wayMatches = xml.match(/<way id=[\s\S]*?<\/way>/g) || [];
console.log('Total ways in OSM:', wayMatches.length);

const tagCounts = {};
let buildingWays = 0;
let landuseWays = 0;
let highwayWays = 0;

wayMatches.forEach(way => {
  const tags = way.match(/<tag k="([^"]+)" v="([^"]+)"/g) || [];
  tags.forEach(t => {
    const m = t.match(/<tag k="([^"]+)" v="([^"]+)"/);
    if (m) {
      const [, k, v] = m;
      tagCounts[k] = (tagCounts[k] || 0) + 1;
      if (k === 'building') buildingWays++;
      if (k === 'landuse') landuseWays++;
      if (k === 'highway') highwayWays++;
    }
  });
});

console.log('Highway ways:', highwayWays);
console.log('Building ways:', buildingWays);
console.log('Landuse ways:', landuseWays);
console.log('Top tag keys:', Object.entries(tagCounts).sort((a,b) => b[1] - a[1]).slice(0, 15));
