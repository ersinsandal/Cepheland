const fs = require('fs');
const { fetchOsmXml, processOsmXmlToBlocks } = require('./osm_block_engine.cjs');

async function main() {
  const cities = {};

  // 1. Alanya / Mahmutlar
  console.log('Processing Alanya Mahmutlar...');
  const mahmutlarXml = fs.readFileSync('infrastructure/maps/mahmutlar_raw.osm', 'utf8');
  let mahmutlarBlocks = processOsmXmlToBlocks(mahmutlarXml, 'TR-ANT-ALN-MHM', 'ALN');
  // Filter out any sea cells in Mahmutlar
  mahmutlarBlocks = mahmutlarBlocks.filter(b => (b.center.latitude + 0.69 * b.center.longitude) >= 58.628);
  cities['aln-mhm'] = {
    name: 'Alanya / Mahmutlar',
    center: [36.4884, 32.0965],
    bbox: { minLat: 36.480, maxLat: 36.495, minLng: 32.088, maxLng: 32.106 },
    blocks: mahmutlarBlocks
  };
  console.log('Alanya Mahmutlar blocks:', mahmutlarBlocks.length);

  // 2. Istanbul Kadikoy / Moda
  console.log('Fetching & Processing Istanbul Kadikoy...');
  const istanbulBbox = [29.023, 40.978, 29.037, 40.990];
  const istanbulXml = await fetchOsmXml(istanbulBbox);
  const istanbulBlocks = processOsmXmlToBlocks(istanbulXml, 'TR-IST-KAD-MOD', 'KAD');
  cities['kad-mod'] = {
    name: 'İstanbul / Moda',
    center: [40.9830, 29.0280],
    bbox: { minLat: 40.978, maxLat: 40.990, minLng: 29.023, maxLng: 29.037 },
    blocks: istanbulBlocks
  };
  console.log('Istanbul Kadikoy blocks:', istanbulBlocks.length);

  // 3. Konya / Meram & Selcuklu
  console.log('Fetching & Processing Konya...');
  const konyaBbox = [32.485, 37.865, 32.502, 37.880];
  const konyaXml = await fetchOsmXml(konyaBbox);
  const konyaBlocks = processOsmXmlToBlocks(konyaXml, 'TR-KNY-MRM-SLK', 'KNY');
  cities['kny-cty'] = {
    name: 'Konya / Meram & Selçuklu',
    center: [37.8720, 32.4930],
    bbox: { minLat: 37.865, maxLat: 37.880, minLng: 32.485, maxLng: 32.502 },
    blocks: konyaBlocks
  };
  console.log('Konya blocks:', konyaBlocks.length);

  // 4. Ankara / Çankaya
  console.log('Fetching & Processing Ankara...');
  const ankaraBbox = [32.848, 39.912, 32.864, 39.925];
  const ankaraXml = await fetchOsmXml(ankaraBbox);
  const ankaraBlocks = processOsmXmlToBlocks(ankaraXml, 'TR-ANK-CNK-KIZ', 'ANK');
  cities['ank-cnk'] = {
    name: 'Ankara / Çankaya & Kızılay',
    center: [39.9180, 32.8560],
    bbox: { minLat: 39.912, maxLat: 39.925, minLng: 32.848, maxLng: 32.864 },
    blocks: ankaraBlocks
  };
  console.log('Ankara blocks:', ankaraBlocks.length);

  fs.writeFileSync('infrastructure/maps/prebuilt_cities.json', JSON.stringify(cities, null, 2));
  console.log('All cities successfully built and saved to infrastructure/maps/prebuilt_cities.json!');
}

main().catch(console.error);
