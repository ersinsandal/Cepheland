const http = require('http');

function fetchViewport(url) {
  return new Promise((resolve, reject) => {
    http.get(url, (res) => {
      let body = '';
      res.on('data', d => body += d);
      res.on('end', () => resolve(JSON.parse(body)));
    }).on('error', reject);
  });
}

async function main() {
  console.log('--- Testing Alanya Mahmutlar Viewport ---');
  const alanya = await fetchViewport('http://localhost:3001/maps/viewport?minLat=36.480&maxLat=36.495&minLng=32.088&maxLng=32.106');
  console.log('Alanya Fronts:', alanya.fronts.length, 'Sample:', alanya.fronts[0].displayNameI18n.tr, alanya.fronts[0].frontCode);

  console.log('--- Testing Konya Meram Viewport ---');
  const konya = await fetchViewport('http://localhost:3001/maps/viewport?minLat=37.865&maxLat=37.880&minLng=32.485&maxLng=32.502');
  console.log('Konya Fronts:', konya.fronts.length, 'Sample:', konya.fronts[0].displayNameI18n.tr, konya.fronts[0].frontCode);

  console.log('--- Testing Istanbul Moda Viewport ---');
  const istanbul = await fetchViewport('http://localhost:3001/maps/viewport?minLat=40.978&maxLat=40.990&minLng=29.023&maxLng=29.037');
  console.log('Istanbul Fronts:', istanbul.fronts.length, 'Sample:', istanbul.fronts[0].displayNameI18n.tr, istanbul.fronts[0].frontCode);

  console.log('--- Testing Ankara Cankaya Viewport ---');
  const ankara = await fetchViewport('http://localhost:3001/maps/viewport?minLat=39.912&maxLat=39.925&minLng=32.848&maxLng=32.864');
  console.log('Ankara Fronts:', ankara.fronts.length, 'Sample:', ankara.fronts[0].displayNameI18n.tr, ankara.fronts[0].frontCode);

  console.log('--- Testing Default No-BBox (Test compatibility) ---');
  const def = await fetchViewport('http://localhost:3001/maps/viewport');
  console.log('Default Fronts Count:', def.fronts.length);
}

main().catch(console.error);
