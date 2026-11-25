const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/final_12_osm_blocks.json', 'utf8'));

const frontConfig = {
  'ALN-MHM-SAH-001': { id: 'f0000000-0000-0000-0000-000000000011', num: '01', owner: 'null', status: 'neutral', weight: 1.0 },
  'ALN-MHM-KUM-003': { id: 'f0000000-0000-0000-0000-000000000003', num: '03', owner: 'gsId', status: 'contested', weight: 1.2 },
  'ALN-MHM-BAR-001': { id: 'f0000000-0000-0000-0000-000000000005', num: '05', owner: 'fbId', status: 'owned', weight: 5.0 },
  'ALN-MHM-BAR-003': { id: 'f0000000-0000-0000-0000-000000000007', num: '07', owner: 'gsId', status: 'owned', weight: 1.2 },
  'ALN-MHM-KUM-001': { id: 'f0000000-0000-0000-0000-000000000001', num: '02', owner: 'gsId', status: 'owned', weight: 1.2 },
  'ALN-MHM-KUM-002': { id: 'f0000000-0000-0000-0000-000000000002', num: '04', owner: 'gsId', status: 'owned', weight: 1.2 },
  'ALN-MHM-BAR-002': { id: 'f0000000-0000-0000-0000-000000000006', num: '06', owner: 'fbId', status: 'owned', weight: 5.0 },
  'ALN-MHM-BAR-004': { id: 'f0000000-0000-0000-0000-000000000008', num: '08', owner: 'gsId', status: 'owned', weight: 1.2 },
  'ALN-MHM-KUM-004': { id: 'f0000000-0000-0000-0000-000000000004', num: '09', owner: 'gsId', status: 'owned', weight: 1.2 },
  'ALN-MHM-ATA-001': { id: 'f0000000-0000-0000-0000-000000000009', num: '10', owner: 'gsId', status: 'owned', weight: 1.2 },
  'ALN-MHM-ATA-002': { id: 'f0000000-0000-0000-0000-000000000010', num: '11', owner: 'gsId', status: 'protected', weight: 1.2 },
  'ALN-MHM-VAT-001': { id: 'f0000000-0000-0000-0000-000000000012', num: '12', owner: 'null', status: 'neutral', weight: 1.0 },
};

const defs = blocks.map(b => {
  const cfg = frontConfig[b.code];
  const coordsStr = JSON.stringify(b.geometry);
  const cleanName = `Bölge #${cfg.num}`;

  return `      {
        id: '${cfg.id}',
        code: '${b.code}',
        name: '${cleanName}',
        street: '${cleanName}',
        lat: ${b.center.latitude.toFixed(6)},
        lng: ${b.center.longitude.toFixed(6)},
        areaM2: ${b.areaM2},
        polygon: ${coordsStr} as [number, number][],
        weight: ${cfg.weight.toFixed(1)},
        owner: ${cfg.owner},
        status: '${cfg.status}' as const,
      }`;
});

const tsCode = `    // 7. 12 Fronts in Alanya Mahmutlar (100% Real OpenStreetMap Street-Bounded City Blocks / Yapı Adaları)
    // Every single polygon is generated directly by polygonizing the official OSM road network.
    // Boundaries are the actual street ways: Sahil Caddesi (D400), Barbaros Caddesi, Atatürk Caddesi,
    // Kumru Sokak, 117. Sokak, 119. Sokak, 128. Sokak, 130. Sokak, 132. Sokak, 135. Sokak, 136. Sokak.
    // Names are simplified cleanly to Bölge #01 .. Bölge #12 without confusing text strings.
    const frontDefs = [
${defs.join(',\n')}
    ];`;

fs.writeFileSync('infrastructure/maps/frontDefs_replacement.ts', tsCode);
console.log('Regenerated frontDefs_replacement.ts with clean Region numbers');
