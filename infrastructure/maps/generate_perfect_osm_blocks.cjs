const fs = require('fs');
const data = JSON.parse(fs.readFileSync('infrastructure/maps/parsed_highways.json', 'utf8'));

// Helper to get coords by street name pattern
function getStreet(pattern) {
  for (const [name, pts] of data.namedHighways) {
    if (new RegExp(pattern, 'i').test(name)) return pts;
  }
  return [];
}

const bar = getStreet('barbaros');
const ata = getStreet('atatürk');
const sahil = getStreet('sahil');
const kervan = getStreet('kervan');
const kumru = getStreet('kumru');
const sk117 = getStreet('117');
const sk119 = getStreet('119');
const sk130 = getStreet('130');
const sk136 = getStreet('136');

function distSq(p1, p2) {
  return (p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2;
}

function findClosestIndex(line, pt) {
  let minD = Infinity, best = 0;
  line.forEach((p, i) => {
    const d = distSq(p, pt);
    if (d < minD) { minD = d; best = i; }
  });
  return best;
}

function subPath(line, pA, pB) {
  const iA = findClosestIndex(line, pA);
  const iB = findClosestIndex(line, pB);
  if (iA <= iB) {
    return line.slice(iA, iB + 1);
  } else {
    return line.slice(iB, iA + 1).reverse();
  }
}

// Key intersection points derived directly from where cross-streets meet avenues:
// 1. Kumru Sokak intersections
const kum_sahil = kumru[kumru.length - 1]; // meets Sahil/Barbaros area
const kum_bar = kumru[Math.floor(kumru.length / 2)];
const kum_ata = kumru[0]; // meets Atatürk Cd

// 2. 117 Sokak intersections
const sk117_sahil = sk117[sk117.length - 1];
const sk117_bar = sk117[Math.floor(sk117.length / 2)];
const sk117_ata = sk117[0];

// 3. 119 Sokak intersections
const sk119_sahil = sk119[sk119.length - 1];
const sk119_bar = sk119[Math.floor(sk119.length / 2)];
const sk119_ata = sk119[0];

// 4. 130 Sokak intersections
const sk130_sahil = sk130[sk130.length - 1];
const sk130_bar = sk130[Math.floor(sk130.length / 2)];
const sk130_ata = sk130[0];

// 5. 136 Sokak intersections
const sk136_sahil = sk136[sk136.length - 1];
const sk136_bar = sk136[Math.floor(sk136.length / 2)];
const sk136_ata = sk136[0];

console.log('Kumru intersections:', { kum_sahil, kum_bar, kum_ata });
console.log('119 intersections:', { sk119_sahil, sk119_bar, sk119_ata });
