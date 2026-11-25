const fs = require('fs');
const cities = JSON.parse(fs.readFileSync('infrastructure/maps/prebuilt_cities.json', 'utf8'));

const tsContent = `// Auto-generated real OpenStreetMap city blocks for major metropolises
// Produced by polygonizing official OSM vehicular highway networks via @turf/polygonize.

export interface PrebuiltCityBlock {
  frontCode: string;
  displayNameI18n: { tr: string; en: string };
  center: { latitude: number; longitude: number };
  geometry: [number, number][];
  areaM2: number;
  weight: number;
}

export interface PrebuiltCity {
  name: string;
  center: [number, number];
  bbox: { minLat: number; maxLat: number; minLng: number; maxLng: number };
  blocks: PrebuiltCityBlock[];
}

export const PREBUILT_CITIES: Record<string, PrebuiltCity> = ${JSON.stringify(cities, null, 2)};
`;

fs.writeFileSync('packages/geo/src/prebuilt-cities.ts', tsContent);
console.log('Successfully wrote packages/geo/src/prebuilt-cities.ts, size:', tsContent.length);
