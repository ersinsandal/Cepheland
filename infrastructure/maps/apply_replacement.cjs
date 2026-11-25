const fs = require('fs');

const storePath = 'apps/api/src/db/store.ts';
let content = fs.readFileSync(storePath, 'utf8');

const replacement = fs.readFileSync('infrastructure/maps/frontDefs_replacement.ts', 'utf8');

const startMarker = '    // 7. 12 Fronts in Alanya Mahmutlar';
const endMarker = '    ];\n\n    for (const f of frontDefs) {';

const startIndex = content.indexOf(startMarker);
const endIndex = content.indexOf(endMarker);

if (startIndex === -1 || endIndex === -1) {
  console.error('Markers not found!', { startIndex, endIndex });
  process.exit(1);
}

const newContent = content.slice(0, startIndex) + replacement + '\n\n    for (const f of frontDefs) {' + content.slice(endIndex + endMarker.length);

fs.writeFileSync(storePath, newContent, 'utf8');
console.log('Successfully updated apps/api/src/db/store.ts with 100% real OSM polygons!');
