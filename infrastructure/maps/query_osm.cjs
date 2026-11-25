const https = require('https');
const fs = require('fs');

const query = `
[out:json][timeout:30];
(
  way["highway"](36.481,32.091,36.492,32.105);
);
out geom;
`;

const url = 'https://overpass-api.de/api/interpreter?data=' + encodeURIComponent(query);

https.get(url, { headers: { 'User-Agent': 'Cepheland/1.0 (test@cepheland.example)' } }, res => {
  let data = '';
  res.on('data', c => data += c);
  res.on('end', () => {
    try {
      const json = JSON.parse(data);
      console.log('OSM elements found:', json.elements.length);
      const named = json.elements.filter(e => e.tags && e.tags.name);
      console.log('Named streets count:', named.length);
      named.forEach(e => {
        const first = e.geometry[0];
        const last = e.geometry[e.geometry.length - 1];
        console.log(`Street: ${e.tags.name} (${e.tags.highway}) - start: [${first.lat.toFixed(5)}, ${first.lon.toFixed(5)}] end: [${last.lat.toFixed(5)}, ${last.lon.toFixed(5)}] pts: ${e.geometry.length}`);
      });
      fs.writeFileSync('infrastructure/maps/mahmutlar_osm.json', JSON.stringify(json, null, 2));
      console.log('Saved to infrastructure/maps/mahmutlar_osm.json');
    } catch (err) {
      console.error('Parse error:', err.message);
    }
  });
}).on('error', err => console.error('Request error:', err.message));
