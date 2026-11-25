const http = require('http');

http.get('http://localhost:3001/maps/viewport?minLat=36.480&maxLat=36.495&minLng=32.088&maxLng=32.106', (res) => {
  let body = '';
  res.on('data', d => body += d);
  res.on('end', () => {
    const data = JSON.parse(body);
    console.log('Total fronts in viewport:', data.fronts.length);
    const neutralCount = data.fronts.filter(f => f.status === 'neutral').length;
    const gsCount = data.fronts.filter(f => f.ownerTeam?.slug === 'galatasaray').length;
    const fbCount = data.fronts.filter(f => f.ownerTeam?.slug === 'fenerbahce').length;
    console.log('Breakdown:', { neutralCount, gsCount, fbCount });
    console.log('First 5 fronts:', data.fronts.slice(0, 5).map(f => `${f.displayNameI18n.tr} (${f.frontCode}, ${f.status})`));
    console.log('Last 5 fronts:', data.fronts.slice(-5).map(f => `${f.displayNameI18n.tr} (${f.frontCode}, ${f.status})`));
  });
});
