const https = require('https');
const fs = require('fs');

const url = 'https://api.openstreetmap.org/api/0.6/map?bbox=32.091,36.483,32.102,36.492';

https.get(url, { headers: { 'User-Agent': 'Cepheland/1.0 (dev@cepheland.example)' } }, res => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    // 1. Parse nodes: id -> [lon, lat]
    const nodes = new Map();
    const nodeRegex = /<node\s+[^>]*?id="(\d+)"[^>]*?lat="([^"]+)"[^>]*?lon="([^"]+)"/g;
    let m;
    while ((m = nodeRegex.exec(data)) !== null) {
      nodes.set(m[1], [parseFloat(m[3]), parseFloat(m[2])]);
    }
    console.log('Nodes count:', nodes.size);

    // 2. Parse ways
    const wayRegex = /<way\s+id="(\d+)"[\s\S]*?<\/way>/g;
    let wMatch;
    const highways = [];
    const namedHighways = new Map();

    while ((wMatch = wayRegex.exec(data)) !== null) {
      const wayXml = wMatch[0];
      const wayId = wMatch[1];
      const ndRegex = /<nd\s+ref="(\d+)"/g;
      const ndRefs = [];
      let ndMatch;
      while ((ndMatch = ndRegex.exec(wayXml)) !== null) {
        const pt = nodes.get(ndMatch[1]);
        if (pt) ndRefs.push(pt);
      }

      const nameMatch = /<tag\s+k="name"\s+v="([^"]+)"/i.exec(wayXml);
      const hwMatch = /<tag\s+k="highway"\s+v="([^"]+)"/i.exec(wayXml);

      if (hwMatch && ndRefs.length >= 2) {
        const name = nameMatch ? nameMatch[1] : null;
        highways.push({ id: wayId, name, type: hwMatch[1], coords: ndRefs });
        if (name) {
          if (!namedHighways.has(name)) namedHighways.set(name, []);
          namedHighways.get(name).push(...ndRefs);
        }
      }
    }

    console.log('Total highways found:', highways.length);
    console.log('Named highways count:', namedHighways.size);
    for (const [name, pts] of namedHighways.entries()) {
      console.log(`Street: "${name}" - ${pts.length} points`);
    }

    fs.writeFileSync('infrastructure/maps/parsed_highways.json', JSON.stringify({ highways, namedHighways: Array.from(namedHighways.entries()) }, null, 2));
    console.log('Saved to infrastructure/maps/parsed_highways.json');
  });
}).on('error', e => console.error(e));
