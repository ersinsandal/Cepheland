const fs = require('fs');
const data = JSON.parse(fs.readFileSync('infrastructure/maps/parsed_highways.json', 'utf8'));

function getCoords(nameSubstr) {
  for (const [name, pts] of data.namedHighways) {
    if (name.toLowerCase().includes(nameSubstr.toLowerCase())) {
      return pts;
    }
  }
  return [];
}

const bar = getCoords('Barbaros');
const ata = getCoords('Atatürk');
const kum = getCoords('Kumru');
const sk117 = getCoords('117');
const sk119 = getCoords('119');
const sk130 = getCoords('130');
const sk136 = getCoords('136');
const sahil = getCoords('Sahil');
const kervan = getCoords('Kervansaray');

function distSq(p1, p2) {
  const dx = p1[0] - p2[0];
  const dy = p1[1] - p2[1];
  return dx * dx + dy * dy;
}

function closestIndex(line, pt) {
  let minD = Infinity;
  let bestIdx = 0;
  line.forEach((p, idx) => {
    const d = distSq(p, pt);
    if (d < minD) { minD = d; bestIdx = idx; }
  });
  return bestIdx;
}

function sliceLine(line, pStart, pEnd) {
  const idx1 = closestIndex(line, pStart);
  const idx2 = closestIndex(line, pEnd);
  if (idx1 <= idx2) {
    return line.slice(idx1, idx2 + 1);
  } else {
    return line.slice(idx2, idx1 + 1).reverse();
  }
}

// Ensure polygon is closed [[lon, lat], ...]
function makeClosed(pts) {
  const clean = [];
  pts.forEach(p => {
    if (!p) return;
    const rounded = [Math.round(p[0] * 1000000) / 1000000, Math.round(p[1] * 1000000) / 1000000];
    if (clean.length === 0 || distSq(clean[clean.length - 1], rounded) > 0.000000001) {
      clean.push(rounded);
    }
  });
  if (clean.length > 0 && distSq(clean[0], clean[clean.length - 1]) > 0.000000001) {
    clean.push([...clean[0]]);
  }
  return clean;
}

// Compute center of polygon
function getCenter(poly) {
  let sX = 0, sY = 0;
  poly.slice(0, -1).forEach(p => { sX += p[0]; sY += p[1]; });
  const n = poly.length - 1;
  return {
    latitude: Math.round((sY / n) * 1000000) / 1000000,
    longitude: Math.round((sX / n) * 1000000) / 1000000,
  };
}

// Point in polygon
function inside(point, vs) {
  const x = point[0], y = point[1];
  let inside = false;
  for (let i = 0, j = vs.length - 1; i < vs.length; j = i++) {
    const xi = vs[i][0], yi = vs[i][1];
    const xj = vs[j][0], yj = vs[j][1];
    const intersect = ((yi > y) !== (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
    if (intersect) inside = !inside;
  }
  return inside;
}

// Intersections along Barbaros Caddesi
const b_117 = closestPointOn(bar, sk117);
const b_kum = closestPointOn(bar, kum);
const b_119 = closestPointOn(bar, sk119);
const b_130 = closestPointOn(bar, sk130);
const b_136 = closestPointOn(bar, sk136);

// Intersections along Atatürk Caddesi
const a_117 = closestPointOn(ata, sk117);
const a_kum = closestPointOn(ata, kum);
const a_119 = closestPointOn(ata, sk119);
const a_130 = closestPointOn(ata, sk130);
const a_136 = closestPointOn(ata, sk136);

// Intersections along Sahil Caddesi
const s_117 = closestPointOn(sahil, b_117);
const s_kum = closestPointOn(sahil, b_kum);
const s_119 = closestPointOn(sahil, b_119);
const s_130 = closestPointOn(sahil, b_130);
const s_136 = closestPointOn(sahil, b_136);

// Intersections along Kervansaray Caddesi
const k_117 = closestPointOn(kervan, a_117);
const k_kum = closestPointOn(kervan, a_kum);
const k_119 = closestPointOn(kervan, a_119);
const k_130 = closestPointOn(kervan, a_130);
const k_136 = closestPointOn(kervan, a_136);

function closestPointOn(line, target) {
  const ref = Array.isArray(target) && Array.isArray(target[0]) ? target[0] : target;
  let minD = Infinity, best = line[0];
  for (const p of line) {
    const d = distSq(p, ref);
    if (d < minD) { minD = d; best = p; }
  }
  return best;
}

// Build the 12 street-bounded blocks:
// Tier 1: Sahil - Barbaros
const block_S1 = makeClosed([...sliceLine(sahil, s_117, s_kum), ...sliceLine(kum, s_kum, b_kum), ...sliceLine(bar, b_kum, b_117).reverse(), ...sliceLine(sk117, b_117, s_117).reverse()]);
const block_S2 = makeClosed([...sliceLine(sahil, s_kum, s_119), ...sliceLine(sk119, s_119, b_119), ...sliceLine(bar, b_119, b_kum).reverse(), ...sliceLine(kum, b_kum, s_kum).reverse()]);
const block_S3 = makeClosed([...sliceLine(sahil, s_119, s_130), ...sliceLine(sk130, s_130, b_130), ...sliceLine(bar, b_130, b_119).reverse(), ...sliceLine(sk119, b_119, s_119).reverse()]);
const block_S4 = makeClosed([...sliceLine(sahil, s_130, s_136), ...sliceLine(sk136, s_136, b_136), ...sliceLine(bar, b_136, b_130).reverse(), ...sliceLine(sk130, b_130, s_130).reverse()]);

// Tier 2: Barbaros - Atatürk
const block_B1 = makeClosed([...sliceLine(bar, b_117, b_kum), ...sliceLine(kum, b_kum, a_kum), ...sliceLine(ata, a_kum, a_117).reverse(), ...sliceLine(sk117, a_117, b_117).reverse()]);
const block_B2 = makeClosed([...sliceLine(bar, b_kum, b_119), ...sliceLine(sk119, b_119, a_119), ...sliceLine(ata, a_119, a_kum).reverse(), ...sliceLine(kum, a_kum, b_kum).reverse()]);
const block_B3 = makeClosed([...sliceLine(bar, b_119, b_130), ...sliceLine(sk130, b_130, a_130), ...sliceLine(ata, a_130, a_119).reverse(), ...sliceLine(sk119, a_119, b_119).reverse()]);
const block_B4 = makeClosed([...sliceLine(bar, b_130, b_136), ...sliceLine(sk136, b_136, a_136), ...sliceLine(ata, a_136, a_130).reverse(), ...sliceLine(sk130, a_130, b_130).reverse()]);

// Tier 3: Atatürk - Kervansaray
const block_A1 = makeClosed([...sliceLine(ata, a_117, a_kum), ...sliceLine(kum, a_kum, k_kum), ...sliceLine(kervan, k_kum, k_117).reverse(), ...sliceLine(sk117, k_117, a_117).reverse()]);
const block_A2 = makeClosed([...sliceLine(ata, a_kum, a_119), ...sliceLine(sk119, a_119, k_119), ...sliceLine(kervan, k_119, k_kum).reverse(), ...sliceLine(kum, k_kum, a_kum).reverse()]);
const block_A3 = makeClosed([...sliceLine(ata, a_119, a_130), ...sliceLine(sk130, a_130, k_130), ...sliceLine(kervan, k_130, k_119).reverse(), ...sliceLine(sk119, k_119, a_119).reverse()]);
const block_A4 = makeClosed([...sliceLine(ata, a_130, a_136), ...sliceLine(sk136, a_136, k_136), ...sliceLine(kervan, k_136, k_130).reverse(), ...sliceLine(sk130, k_130, a_130).reverse()]);

const allBlocks = [
  { code: 'ALN-MHM-SAH-001', name: 'Sahil Yolu · 117-Kumru Sahil Kordonu', poly: block_S1 },
  { code: 'ALN-MHM-KUM-003', name: 'Kumru Sokak · Meydan & Sahil Adası', poly: block_S2 },
  { code: 'ALN-MHM-BAR-001', name: 'Barbaros Caddesi · 119-130 Sahil Çıkışı', poly: block_S3 },
  { code: 'ALN-MHM-BAR-003', name: 'Barbaros Caddesi · 130-136 Sahil Adası', poly: block_S4 },
  { code: 'ALN-MHM-KUM-001', name: 'Kumru Sokak · 117-Kumru Batı Çarşı', poly: block_B1 },
  { code: 'ALN-MHM-KUM-002', name: 'Kumru Sokak · Kumru-119 Doğu Konutları', poly: block_B2 },
  { code: 'ALN-MHM-BAR-002', name: 'Barbaros Caddesi · 119-130 Çarşı Merkezi', poly: block_B3 },
  { code: 'ALN-MHM-BAR-004', name: 'Barbaros Caddesi · 130-136 Doğu Çarşı', poly: block_B4 },
  { code: 'ALN-MHM-KUM-004', name: 'Kumru Sokak · 117-Kumru Üst Bulvar', poly: block_A1 },
  { code: 'ALN-MHM-ATA-001', name: 'Atatürk Caddesi · Kumru-119 Bulvar Cephesi', poly: block_A2 },
  { code: 'ALN-MHM-ATA-002', name: 'Atatürk Caddesi · 119-130 Bulvar Cephesi', poly: block_A3 },
  { code: 'ALN-MHM-VAT-001', name: 'Vatan Caddesi · 130-136 Park Alanı', poly: block_A4 },
];

allBlocks.forEach(b => {
  const c = getCenter(b.poly);
  console.log(`${b.code}: pts=${b.poly.length}, center=[${c.latitude}, ${c.longitude}]`);
});

console.log('Kumru 03 contains [32.0952, 36.4862]?', inside([32.0952, 36.4862], block_S2));

fs.writeFileSync('infrastructure/maps/osm_street_blocks.json', JSON.stringify(allBlocks, null, 2));
console.log('Saved to infrastructure/maps/osm_street_blocks.json');
