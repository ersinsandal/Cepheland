const http = require('http');

http.get('http://localhost:3001/maps/viewport', (res) => {
  let body = '';
  res.on('data', d => body += d);
  res.on('end', () => {
    const data = JSON.parse(body);
    console.log('Fronts count:', data.fronts.length);
    data.fronts.forEach(f => {
      console.log(`[${f.frontCode}] ${f.displayNameI18n.tr} (${f.geometry.length} pts, owner: ${f.ownerTeam ? f.ownerTeam.slug : 'neutral'}, status: ${f.status})`);
    });
  });
});
