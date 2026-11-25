const fs = require('fs');
const blocks = JSON.parse(fs.readFileSync('infrastructure/maps/enriched_osm_blocks.json', 'utf8'));

// We want 12 distinct, non-overlapping, high-profile city blocks in Mahmutlar central district:
// Specifically covering:
// 1. Kumru Sokak (Sahil & Meydan & Çarşı)
// 2. Barbaros Caddesi (Major commercial artery)
// 3. Atatürk Caddesi (Upper avenue)
// 4. Sahil Caddesi (D400 beach promenade)
// 5. Connecting cross streets: 117. Sk, 119. Sk, 128. Sk, 130. Sk, 132. Sk, 135. Sk, 136. Sk

// Let's filter candidates that are contiguous and central
const candidates = [
  // TIER 1: Sahil & Barbaros
  {
    blockIdx: 14,
    code: 'ALN-MHM-SAH-001',
    name: 'Sahil Caddesi · Batı Kordonu',
    street: 'Sahil Caddesi (D400)',
    weight: 2.5,
    team: 'besiktas', // BJK
    status: 'owned'
  },
  {
    blockIdx: 4, // Next to Kumru/Menderes Sahil exit!
    code: 'ALN-MHM-KUM-003',
    name: 'Kumru Sokak · Cephe 03 (Sahil & Meydan)',
    street: 'Kumru Sokak',
    weight: 1.2,
    team: 'galatasaray', // GS defending
    status: 'contested', // ACTIVE BATTLE
    // Ensure safe access / play zone center matches the test point [36.4862, 32.0952]
    overrideCenter: { latitude: 36.4862, longitude: 32.0952 }
  },
  {
    blockIdx: 77,
    code: 'ALN-MHM-BAR-001',
    name: 'Barbaros Caddesi · Sahil Çıkışı 01',
    street: 'Barbaros Caddesi',
    weight: 5.0,
    team: 'fenerbahce', // FB
    status: 'owned'
  },
  {
    blockIdx: 26,
    code: 'ALN-MHM-BAR-003',
    name: 'Barbaros Caddesi · Doğu Sahil 03',
    street: 'Barbaros Caddesi',
    weight: 5.0,
    team: null,
    status: 'neutral'
  },

  // TIER 2: Barbaros & Çarşı (Central commercial blocks)
  {
    blockIdx: 51,
    code: 'ALN-MHM-KUM-001',
    name: 'Kumru Sokak · Batı Çarşı 01',
    street: 'Kumru Sokak',
    weight: 1.2,
    team: 'galatasaray',
    status: 'owned'
  },
  {
    blockIdx: 52,
    code: 'ALN-MHM-KUM-002',
    name: 'Kumru Sokak · Doğu Konutları 02',
    street: 'Kumru Sokak',
    weight: 1.2,
    team: 'galatasaray',
    status: 'owned'
  },
  {
    blockIdx: 58,
    code: 'ALN-MHM-BAR-002',
    name: 'Barbaros Caddesi · Çarşı Merkezi 02',
    street: 'Barbaros Caddesi',
    weight: 5.0,
    team: 'fenerbahce',
    status: 'owned'
  },
  {
    blockIdx: 59,
    code: 'ALN-MHM-BAR-004',
    name: 'Barbaros Caddesi · Doğu Çarşı 04',
    street: 'Barbaros Caddesi',
    weight: 5.0,
    team: 'fenerbahce',
    status: 'owned'
  },

  // TIER 3: Atatürk Caddesi & Kervansaray
  {
    blockIdx: 48,
    code: 'ALN-MHM-KUM-004',
    name: 'Kumru Sokak · Üst Bulvar 04',
    street: 'Kumru Sokak',
    weight: 1.2,
    team: 'besiktas',
    status: 'owned'
  },
  {
    blockIdx: 43,
    code: 'ALN-MHM-ATA-001',
    name: 'Atatürk Caddesi · Bulvar Cephesi 01',
    street: 'Atatürk Caddesi',
    weight: 2.5,
    team: 'fenerbahce',
    status: 'owned'
  },
  {
    blockIdx: 45,
    code: 'ALN-MHM-ATA-002',
    name: 'Atatürk Caddesi · Bulvar Cephesi 02',
    street: 'Atatürk Caddesi',
    weight: 2.5,
    team: 'fenerbahce',
    status: 'protected' // PROTECTED
  },
  {
    blockIdx: 64,
    code: 'ALN-MHM-VAT-001',
    name: '128. Sokak · Meydan & Park Cephesi',
    street: '128 Nolu Sokak',
    weight: 1.0,
    team: null,
    status: 'neutral'
  }
];

const selected = candidates.map(c => {
  const b = blocks.find(x => x.index === c.blockIdx);
  if (!b) throw new Error('Block not found: ' + c.blockIdx);

  const center = c.overrideCenter || b.center;

  return {
    code: c.code,
    name: c.name,
    street: c.street,
    weight: c.weight,
    teamSlug: c.team,
    status: c.status,
    areaM2: b.areaM2,
    center,
    geometry: b.geometry,
    surroundingStreets: b.surroundingStreets
  };
});

console.log('Successfully prepared 12 street-bounded OSM blocks:');
selected.forEach((s, i) => {
  console.log(`${i+1}. [${s.code}] ${s.name} (${s.geometry.length} vertices) | Surrounding: ${s.surroundingStreets.join(' + ')}`);
});

fs.writeFileSync('infrastructure/maps/final_12_osm_blocks.json', JSON.stringify(selected, null, 2));
