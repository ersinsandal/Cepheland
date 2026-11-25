const fs = require('fs');
const https = require('https');
const { polygonize } = require('@turf/polygonize');
const { featureCollection, lineString } = require('@turf/helpers');

function fetchOsmXml(bbox) {
  return new Promise((resolve, reject) => {
    const url = `https://api.openstreetmap.org/api/0.6/map?bbox=${bbox[0]},${bbox[1]},${bbox[2]},${bbox[3]}`;
    https.get(url, { headers: { 'User-Agent': 'Cepheland/1.0' } }, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(data));
    }).on('error', reject);
  });
}

function processOsmXmlToBlocks(xml, regionCode, prefix) {
  // 1. Parse nodes
  const nodeRegex = /<node id="(\d+)"[^>]*?lat="([^"]+)"[^>]*?lon="([^"]+)"/g;
  const nodes = new Map();
  let m;
  while ((m = nodeRegex.exec(xml)) !== null) {
    nodes.set(m[1], [parseFloat(m[3]), parseFloat(m[2])]); // [lng, lat]
  }

  // 2. Parse highway ways
  const wayRegex = /<way id="(\d+)"[\s\S]*?<\/way>/g;
  const lines = [];
  while ((m = wayRegex.exec(xml)) !== null) {
    const wayXml = m[0];
    const wayId = m[1];
    if (!wayXml.includes('k="highway"')) continue;
    const hwMatch = wayXml.match(/<tag k="highway" v="([^"]+)"/);
    const hwType = hwMatch ? hwMatch[1] : 'road';
    if (['footway', 'steps', 'path', 'pedestrian', 'corridor', 'cycleway', 'track', 'service'].includes(hwType)) continue;

    const ndMatches = [...wayXml.matchAll(/<nd ref="(\d+)"/g)].map(x => x[1]);
    const coords = ndMatches.map(id => nodes.get(id)).filter(Boolean);
    if (coords.length >= 2) {
      lines.push(lineString(coords, { id: wayId }));
    }
  }

  // 3. Polygonize lines into planar faces (city blocks)
  const fc = featureCollection(lines);
  const polys = polygonize(fc);

  // 4. Filter and normalize to average-sized regions (~2,500m2 - 50,000m2, aspect ratio <= 3.0)
  const blocks = [];
  let blockNum = 1;

  polys.features.forEach(feat => {
    const ring = feat.geometry.coordinates[0];
    if (!ring || ring.length < 4) return;

    // Shoelace area
    let area = 0;
    let minX = Infinity, maxX = -Infinity, minY = Infinity, maxY = -Infinity;
    let sumLng = 0, sumLat = 0;

    for (let i = 0; i < ring.length - 1; i++) {
      const p = ring[i];
      const pNext = ring[i+1];
      area += (p[0] * pNext[1] - pNext[0] * p[1]);
      sumLng += p[0];
      sumLat += p[1];
      if (p[0] < minX) minX = p[0];
      if (p[0] > maxX) maxX = p[0];
      if (p[1] < minY) minY = p[1];
      if (p[1] > maxY) maxY = p[1];
    }
    area = Math.abs(area) / 2;
    const count = ring.length - 1;
    const centerLng = sumLng / count;
    const centerLat = sumLat / count;

    const widthM = (maxX - minX) * 89000;
    const heightM = (maxY - minY) * 111000;
    const aspect = Math.max(widthM, heightM) / (Math.min(widthM, heightM) || 1);
    const areaM2 = Math.round(widthM * heightM * 0.7); // approximate polygon fill area

    // Keep natural average block sizes, discard skinny strips / corridors
    if (areaM2 >= 2000 && areaM2 <= 65000 && aspect <= 2.8 && widthM >= 30 && heightM >= 30) {
      const numStr = String(blockNum).padStart(2, '0');
      blocks.push({
        frontCode: `${prefix}-${numStr}`,
        displayNameI18n: { tr: `Bölge #${numStr}`, en: `Sector #${numStr}` },
        center: { latitude: centerLat, longitude: centerLng },
        geometry: ring,
        areaM2,
        weight: areaM2 > 25000 ? 2.5 : 1.2,
      });
      blockNum++;
    }
  });

  return blocks;
}

module.exports = { fetchOsmXml, processOsmXmlToBlocks };
