const https = require('https');
const { polygonize } = require('@turf/polygonize');
const { featureCollection, lineString } = require('@turf/helpers');

// Konya city center / Alaeddin Tepesi bbox
const url = 'https://api.openstreetmap.org/api/0.6/map?bbox=32.485,37.865,32.500,37.878';
https.get(url, { headers: { 'User-Agent': 'Cepheland/1.0' } }, (res) => {
  let xml = '';
  res.on('data', chunk => xml += chunk);
  res.on('end', () => {
    console.log('Konya XML size:', xml.length);
    const startParse = Date.now();

    const nodeRegex = /<node id="(\d+)"[^>]*?lat="([^"]+)"[^>]*?lon="([^"]+)"/g;
    const nodes = new Map();
    let m;
    while ((m = nodeRegex.exec(xml)) !== null) {
      nodes.set(m[1], [parseFloat(m[3]), parseFloat(m[2])]);
    }

    const wayRegex = /<way id="(\d+)"[\s\S]*?<\/way>/g;
    const lines = [];
    while ((m = wayRegex.exec(xml)) !== null) {
      const wayXml = m[0];
      const wayId = m[1];
      if (!wayXml.includes('k="highway"')) continue;
      const hwMatch = wayXml.match(/<tag k="highway" v="([^"]+)"/);
      const hwType = hwMatch ? hwMatch[1] : 'road';
      if (['footway', 'steps', 'path', 'pedestrian', 'corridor', 'cycleway'].includes(hwType)) continue;

      const ndMatches = [...wayXml.matchAll(/<nd ref="(\d+)"/g)].map(x => x[1]);
      const coords = ndMatches.map(id => nodes.get(id)).filter(Boolean);
      if (coords.length >= 2) {
        lines.push(lineString(coords, { id: wayId }));
      }
    }

    console.log('Konya Lines found:', lines.length);
    const fc = featureCollection(lines);
    const polys = polygonize(fc);
    console.log('Polygons generated for Konya:', polys.features.length, 'in', Date.now() - startParse, 'ms');
  });
});
