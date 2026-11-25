/**
 * Cepheland Global World Administrative & Geospatial Hierarchy
 * Standard: ISO 3166-1 (Country), ISO 3166-2 (Province/State), UN M.49 (Continents)
 * Real-world boundaries, bounding boxes, and street nomenclatures for planetary coverage.
 */

export interface WorldCountry {
  code: string; // ISO 2-letter: TR, US, GB, DE, FR, JP, etc.
  name: { tr: string; en: string };
  continent: string;
  bbox: [number, number, number, number]; // [minLat, maxLat, minLng, maxLng]
  center: { latitude: number; longitude: number };
}

export interface WorldProvince {
  code: string; // TR-34, US-NY, GB-ENG, etc.
  countryCode: string;
  name: { tr: string; en: string };
  bbox: [number, number, number, number];
  center: { latitude: number; longitude: number };
}

export interface WorldDistrict {
  code: string; // KAD, ALN, MAN, WES, etc.
  provinceCode: string;
  countryCode: string;
  name: { tr: string; en: string };
  bbox: [number, number, number, number];
  center: { latitude: number; longitude: number };
}

export interface WorldNeighborhood {
  code: string; // MHM, MOD, SOH, etc.
  districtCode: string;
  provinceCode: string;
  countryCode: string;
  name: { tr: string; en: string };
  bbox: [number, number, number, number];
  center: { latitude: number; longitude: number };
  majorArterials: string[]; // Avenue / Boulevard names (weight 5.0)
  collectorStreets: string[]; // Collector road names (weight 2.5)
  residentialStreets: string[]; // Street names (weight 1.0-1.2)
}

export interface ResolvedHierarchy {
  countryCode: string;
  countryName: { tr: string; en: string };
  provinceCode: string;
  provinceName: { tr: string; en: string };
  districtCode: string;
  districtName: { tr: string; en: string };
  neighborhoodCode: string;
  neighborhoodName: { tr: string; en: string };
  streetClusterName: { tr: string; en: string };
  frontCode: string;
  weight: number;
}

// ---------------- GLOBAL COUNTRIES CATALOG ----------------
export const WORLD_COUNTRIES: Record<string, WorldCountry> = {
  TR: {
    code: 'TR',
    name: { tr: 'Türkiye', en: 'Turkey' },
    continent: 'AS/EU',
    bbox: [35.8, 42.1, 25.6, 44.8],
    center: { latitude: 39.0, longitude: 35.0 },
  },
  US: {
    code: 'US',
    name: { tr: 'Amerika Birleşik Devletleri', en: 'United States' },
    continent: 'NA',
    bbox: [24.5, 49.4, -125.0, -66.9],
    center: { latitude: 37.09, longitude: -95.71 },
  },
  GB: {
    code: 'GB',
    name: { tr: 'Birleşik Krallık', en: 'United Kingdom' },
    continent: 'EU',
    bbox: [49.9, 60.9, -8.6, 1.8],
    center: { latitude: 55.37, longitude: -3.43 },
  },
  DE: {
    code: 'DE',
    name: { tr: 'Almanya', en: 'Germany' },
    continent: 'EU',
    bbox: [47.2, 55.1, 5.8, 15.0],
    center: { latitude: 51.16, longitude: 10.45 },
  },
  FR: {
    code: 'FR',
    name: { tr: 'Fransa', en: 'France' },
    continent: 'EU',
    bbox: [41.3, 51.1, -5.1, 9.6],
    center: { latitude: 46.22, longitude: 2.21 },
  },
  JP: {
    code: 'JP',
    name: { tr: 'Japonya', en: 'Japan' },
    continent: 'AS',
    bbox: [24.0, 45.6, 122.9, 153.9],
    center: { latitude: 36.2, longitude: 138.25 },
  },
  IT: {
    code: 'IT',
    name: { tr: 'İtalya', en: 'Italy' },
    continent: 'EU',
    bbox: [36.6, 47.1, 6.6, 18.5],
    center: { latitude: 41.87, longitude: 12.56 },
  },
  ES: {
    code: 'ES',
    name: { tr: 'İspanya', en: 'Spain' },
    continent: 'EU',
    bbox: [36.0, 43.8, -9.3, 3.3],
    center: { latitude: 40.46, longitude: -3.74 },
  },
  NL: {
    code: 'NL',
    name: { tr: 'Hollanda', en: 'Netherlands' },
    continent: 'EU',
    bbox: [50.7, 53.6, 3.3, 7.2],
    center: { latitude: 52.13, longitude: 5.29 },
  },
  AE: {
    code: 'AE',
    name: { tr: 'Birleşik Arap Emirlikleri', en: 'United Arab Emirates' },
    continent: 'AS',
    bbox: [22.6, 26.1, 51.5, 56.4],
    center: { latitude: 23.42, longitude: 53.84 },
  },
  AU: {
    code: 'AU',
    name: { tr: 'Avustralya', en: 'Australia' },
    continent: 'OC',
    bbox: [-43.7, -10.0, 113.3, 153.6],
    center: { latitude: -25.27, longitude: 133.77 },
  },
  BR: {
    code: 'BR',
    name: { tr: 'Brezilya', en: 'Brazil' },
    continent: 'SA',
    bbox: [-33.7, 5.3, -73.9, -34.7],
    center: { latitude: -14.23, longitude: -51.92 },
  },
};

// ---------------- WORLD PROVINCES CATALOG ----------------
export const WORLD_PROVINCES: Record<string, WorldProvince> = {
  // Türkiye
  'TR-07': {
    code: 'TR-07',
    countryCode: 'TR',
    name: { tr: 'Antalya', en: 'Antalya' },
    bbox: [36.1, 37.5, 29.2, 32.6],
    center: { latitude: 36.89, longitude: 30.71 },
  },
  'TR-34': {
    code: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'İstanbul', en: 'Istanbul' },
    bbox: [40.8, 41.5, 28.0, 29.9],
    center: { latitude: 41.01, longitude: 28.97 },
  },
  'TR-06': {
    code: 'TR-06',
    countryCode: 'TR',
    name: { tr: 'Ankara', en: 'Ankara' },
    bbox: [39.1, 40.5, 31.3, 33.5],
    center: { latitude: 39.93, longitude: 32.85 },
  },
  'TR-35': {
    code: 'TR-35',
    countryCode: 'TR',
    name: { tr: 'İzmir', en: 'Izmir' },
    bbox: [37.8, 39.3, 26.2, 28.4],
    center: { latitude: 38.42, longitude: 27.14 },
  },
  // USA
  'US-NY': {
    code: 'US-NY',
    countryCode: 'US',
    name: { tr: 'New York', en: 'New York' },
    bbox: [40.4, 45.0, -79.8, -71.8],
    center: { latitude: 40.71, longitude: -74.0 },
  },
  'US-CA': {
    code: 'US-CA',
    countryCode: 'US',
    name: { tr: 'Kaliforniya', en: 'California' },
    bbox: [32.5, 42.0, -124.4, -114.1],
    center: { latitude: 36.77, longitude: -119.41 },
  },
  // UK
  'GB-LON': {
    code: 'GB-LON',
    countryCode: 'GB',
    name: { tr: 'Büyük Londra', en: 'Greater London' },
    bbox: [51.28, 51.69, -0.51, 0.33],
    center: { latitude: 51.5, longitude: -0.12 },
  },
  // France
  'FR-IDF': {
    code: 'FR-IDF',
    countryCode: 'FR',
    name: { tr: 'Île-de-France (Paris)', en: 'Ile-de-France' },
    bbox: [48.1, 49.2, 1.4, 3.5],
    center: { latitude: 48.85, longitude: 2.35 },
  },
  // Germany
  'DE-BE': {
    code: 'DE-BE',
    countryCode: 'DE',
    name: { tr: 'Berlin', en: 'Berlin' },
    bbox: [52.3, 52.7, 13.0, 13.8],
    center: { latitude: 52.52, longitude: 13.4 },
  },
  // Japan
  'JP-13': {
    code: 'JP-13',
    countryCode: 'JP',
    name: { tr: 'Tokyo Metropolü', en: 'Tokyo' },
    bbox: [35.5, 35.9, 139.5, 140.0],
    center: { latitude: 35.68, longitude: 139.76 },
  },
};

// ---------------- WORLD DISTRICTS CATALOG ----------------
export const WORLD_DISTRICTS: Record<string, WorldDistrict> = {
  // Antalya
  ALN: {
    code: 'ALN',
    provinceCode: 'TR-07',
    countryCode: 'TR',
    name: { tr: 'Alanya', en: 'Alanya' },
    bbox: [36.45, 36.65, 31.9, 32.25],
    center: { latitude: 36.54, longitude: 32.0 },
  },
  MRZ_ANT: {
    code: 'MRZ',
    provinceCode: 'TR-07',
    countryCode: 'TR',
    name: { tr: 'Muratpaşa (Antalya Merkez)', en: 'Muratpasa' },
    bbox: [36.85, 36.95, 30.65, 30.8],
    center: { latitude: 36.88, longitude: 30.7 },
  },
  // Istanbul
  KAD: {
    code: 'KAD',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'Kadıköy', en: 'Kadikoy' },
    bbox: [40.95, 41.01, 29.01, 29.1],
    center: { latitude: 40.98, longitude: 29.03 },
  },
  BES: {
    code: 'BES',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'Beşiktaş', en: 'Besiktas' },
    bbox: [41.03, 41.09, 29.0, 29.05],
    center: { latitude: 41.04, longitude: 29.01 },
  },
  SIS: {
    code: 'SIS',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'Şişli', en: 'Sisli' },
    bbox: [41.04, 41.09, 28.97, 29.01],
    center: { latitude: 41.06, longitude: 28.99 },
  },
  BEY: {
    code: 'BEY',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'Beyoğlu', en: 'Beyoglu' },
    bbox: [41.02, 41.05, 28.96, 29.0],
    center: { latitude: 41.03, longitude: 28.98 },
  },
  // Ankara
  CNK: {
    code: 'CNK',
    provinceCode: 'TR-06',
    countryCode: 'TR',
    name: { tr: 'Çankaya', en: 'Cankaya' },
    bbox: [39.85, 39.95, 32.8, 32.9],
    center: { latitude: 39.9, longitude: 32.85 },
  },
  // New York
  MAN: {
    code: 'MAN',
    provinceCode: 'US-NY',
    countryCode: 'US',
    name: { tr: 'Manhattan', en: 'Manhattan' },
    bbox: [40.7, 40.88, -74.02, -73.91],
    center: { latitude: 40.78, longitude: -73.97 },
  },
  // London
  WES: {
    code: 'WES',
    provinceCode: 'GB-LON',
    countryCode: 'GB',
    name: { tr: 'Westminster', en: 'City of Westminster' },
    bbox: [51.48, 51.54, -0.21, -0.11],
    center: { latitude: 51.5, longitude: -0.13 },
  },
  // Paris
  PAR_CEN: {
    code: 'PAR',
    provinceCode: 'FR-IDF',
    countryCode: 'FR',
    name: { tr: 'Paris Merkez', en: 'Central Paris' },
    bbox: [48.83, 48.88, 2.3, 2.4],
    center: { latitude: 48.856, longitude: 2.352 },
  },
  // Berlin
  BER_MIT: {
    code: 'MIT',
    provinceCode: 'DE-BE',
    countryCode: 'DE',
    name: { tr: 'Berlin Mitte', en: 'Berlin Mitte' },
    bbox: [52.5, 52.55, 13.35, 13.43],
    center: { latitude: 52.52, longitude: 13.38 },
  },
  // Tokyo
  SHI: {
    code: 'SHI',
    provinceCode: 'JP-13',
    countryCode: 'JP',
    name: { tr: 'Shibuya', en: 'Shibuya' },
    bbox: [35.63, 35.68, 139.68, 139.72],
    center: { latitude: 35.66, longitude: 139.7 },
  },
};

// ---------------- WORLD NEIGHBORHOODS & STREET INVENTORIES ----------------
export const WORLD_NEIGHBORHOODS: Record<string, WorldNeighborhood> = {
  // Alanya - Mahmutlar
  'ALN-MHM': {
    code: 'MHM',
    districtCode: 'ALN',
    provinceCode: 'TR-07',
    countryCode: 'TR',
    name: { tr: 'Mahmutlar', en: 'Mahmutlar' },
    bbox: [36.475, 36.495, 32.085, 32.115],
    center: { latitude: 36.485, longitude: 32.095 },
    majorArterials: ['Barbaros Caddesi', 'Atatürk Caddesi', 'Sahil Yolu'],
    collectorStreets: ['Vatan Caddesi', 'Yangılı Caddesi', 'Mehmet Çakır Caddesi'],
    residentialStreets: ['Kumru Sokak', 'Sarıhasanlı Caddesi', '142. Sokak', '135. Sokak', '120. Sokak', 'Karasüleymanlar Sokak'],
  },
  // Alanya - Merkez / Saray
  'ALN-SRY': {
    code: 'SRY',
    districtCode: 'ALN',
    provinceCode: 'TR-07',
    countryCode: 'TR',
    name: { tr: 'Saray Mahallesi & Kleopatra', en: 'Saray & Cleopatra' },
    bbox: [36.535, 36.555, 31.98, 32.01],
    center: { latitude: 36.545, longitude: 31.995 },
    majorArterials: ['Atatürk Bulvarı', 'Ahmet Tokuş Bulvarı', 'Dinek Yolu'],
    collectorStreets: ['İsmet Hilmi Balcı Caddesi', 'Hacı Kadiroğlu Caddesi'],
    residentialStreets: ['Damlatas Caddesi', 'Güzelyalı Caddesi', 'Stad Caddesi', 'Postacılar Sokak', 'Müze Sokak'],
  },
  // Istanbul - Kadıköy Moda & Caferağa
  'KAD-MOD': {
    code: 'MOD',
    districtCode: 'KAD',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'Moda & Caferağa', en: 'Moda & Caferaga' },
    bbox: [40.975, 40.992, 29.02, 29.04],
    center: { latitude: 40.983, longitude: 29.03 },
    majorArterials: ['Moda Caddesi', 'Rıhtım Caddesi', 'Söğütlüçeşme Caddesi'],
    collectorStreets: ['Bahariye Caddesi', 'Şair Nefi Sokak', 'Bademaltı Sokak'],
    residentialStreets: ['Dr. Esat Işık Caddesi', 'Ağabey Sokak', 'Dalga Sokak', 'Kafesçi Sokak', 'Cem Sokak', 'Ferit Tek Sokak'],
  },
  // Istanbul - Beşiktaş Sinanpaşa & Çarşı
  'BES-CRS': {
    code: 'CRS',
    districtCode: 'BES',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'Beşiktaş Çarşı & Sinanpaşa', en: 'Besiktas Carsi' },
    bbox: [41.038, 41.05, 29.001, 29.015],
    center: { latitude: 41.043, longitude: 29.006 },
    majorArterials: ['Barbaros Bulvarı', 'Çırağan Caddesi', 'Dolmabahçe Caddesi'],
    collectorStreets: ['Köyiçi Caddesi', 'Ihlamurdere Caddesi', 'Şair Nedim Caddesi'],
    residentialStreets: ['Hasfırın Caddesi', 'Kartal Meydanı Sokak', 'Mumcu Bakkal Sokak', 'Şehit Asım Caddesi', 'Alaybeyi Sokak'],
  },
  // Istanbul - Beyoğlu İstiklal & Cihangir
  'BEY-IST': {
    code: 'IST',
    districtCode: 'BEY',
    provinceCode: 'TR-34',
    countryCode: 'TR',
    name: { tr: 'İstiklal & Cihangir', en: 'Istiklal & Cihangir' },
    bbox: [41.028, 41.04, 28.975, 28.989],
    center: { latitude: 41.034, longitude: 28.982 },
    majorArterials: ['İstiklal Caddesi', 'Tarlabaşı Bulvarı', 'Meclis-i Mebusan Caddesi'],
    collectorStreets: ['Sıraselviler Caddesi', 'Meşrutiyet Caddesi', 'Boğazkesen Caddesi'],
    residentialStreets: ['Akarsu Yokuşu', 'Firuzağa Sokak', 'Turnacıbaşı Caddesi', 'Asmalı Mescit Sokak', 'Kumbaracı Yokuşu'],
  },
  // Ankara - Çankaya Kızılay & Tunalı
  'CNK-TUN': {
    code: 'TUN',
    districtCode: 'CNK',
    provinceCode: 'TR-06',
    countryCode: 'TR',
    name: { tr: 'Tunalı Hilmi & Kızılay', en: 'Tunali Hilmi & Kizilay' },
    bbox: [39.9, 39.925, 32.845, 32.865],
    center: { latitude: 39.912, longitude: 32.855 },
    majorArterials: ['Atatürk Bulvarı', 'İnönü Bulvarı', 'Ziya Gökalp Caddesi'],
    collectorStreets: ['Tunalı Hilmi Caddesi', 'Turan Güneş Bulvarı', 'Karanfil Sokak'],
    residentialStreets: ['Bestekar Sokak', 'Kuğulu Park Yolu', 'Konur Sokak', 'Yüksel Caddesi', 'Bülten Sokak', 'Büklüm Sokak'],
  },
  // New York - Manhattan Midtown & Times Square
  'MAN-MID': {
    code: 'MID',
    districtCode: 'MAN',
    provinceCode: 'US-NY',
    countryCode: 'US',
    name: { tr: 'Midtown Manhattan & Times Square', en: 'Midtown Manhattan & Times Sq' },
    bbox: [40.745, 40.765, -73.995, -73.975],
    center: { latitude: 40.755, longitude: -73.985 },
    majorArterials: ['Broadway', '7th Avenue', '5th Avenue', '42nd Street'],
    collectorStreets: ['6th Avenue (Avenue of the Americas)', '8th Avenue', '34th Street', '49th Street'],
    residentialStreets: ['West 43rd Street', 'West 44th Street', 'West 45th Street', 'West 46th Street (Restaurant Row)', 'West 48th Street'],
  },
  // London - Soho & West End
  'WES-SOH': {
    code: 'SOH',
    districtCode: 'WES',
    provinceCode: 'GB-LON',
    countryCode: 'GB',
    name: { tr: 'Soho & West End', en: 'Soho & West End' },
    bbox: [51.508, 51.518, -0.14, -0.125],
    center: { latitude: 51.513, longitude: -0.133 },
    majorArterials: ['Oxford Street', 'Regent Street', 'Shaftesbury Avenue', 'Charing Cross Road'],
    collectorStreets: ['Wardour Street', 'Dean Street', 'Old Compton Street'],
    residentialStreets: ['Frith Street', 'Greek Street', 'Berwick Street', 'Broadwick Street', 'Carnaby Street', 'Beak Street'],
  },
  // Paris - 1er Arrondissement / Louvre & Rivoli
  'PAR-LOU': {
    code: 'LOU',
    districtCode: 'PAR',
    provinceCode: 'FR-IDF',
    countryCode: 'FR',
    name: { tr: 'Louvre & Rue de Rivoli', en: 'Louvre & Rivoli' },
    bbox: [48.855, 48.868, 2.325, 2.348],
    center: { latitude: 48.861, longitude: 2.336 },
    majorArterials: ['Rue de Rivoli', 'Avenue de l’Opéra', 'Boulevard de Sébastopol'],
    collectorStreets: ['Rue Saint-Honoré', 'Quai François Mitterrand', 'Rue de Turbigo'],
    residentialStreets: ['Rue du Louvre', 'Rue Montmartre', 'Rue Jean-Jacques Rousseau', 'Rue Croix des Petits Champs', 'Rue de Richelieu'],
  },
  // Tokyo - Shibuya Crossing & Center Gai
  'SHI-CRX': {
    code: 'CRX',
    districtCode: 'SHI',
    provinceCode: 'JP-13',
    countryCode: 'JP',
    name: { tr: 'Shibuya Crossing & Center-gai', en: 'Shibuya Crossing' },
    bbox: [35.655, 35.665, 139.695, 139.708],
    center: { latitude: 35.659, longitude: 139.701 },
    majorArterials: ['Meiji-dori Avenue', 'Aoyama-dori Avenue', 'Roppongi-dori'],
    collectorStreets: ['Bunkamura-dori', 'Dogenzaka Avenue', 'Inokashira-dori'],
    residentialStreets: ['Center-gai Street', 'Spain-zaka Slope', 'Koen-dori', 'Sakuragaoka-cho', 'Udagawa-cho'],
  },
};

/**
 * Resolves the hierarchical administrative and geographic context for ANY coordinate on Earth.
 */
export function resolveWorldHierarchy(latitude: number, longitude: number): ResolvedHierarchy {
  // 1. Check detailed neighborhoods
  for (const n of Object.values(WORLD_NEIGHBORHOODS)) {
    if (
      latitude >= n.bbox[0] &&
      latitude <= n.bbox[1] &&
      longitude >= n.bbox[2] &&
      longitude <= n.bbox[3]
    ) {
      const country = WORLD_COUNTRIES[n.countryCode] || { name: { tr: n.countryCode, en: n.countryCode } };
      const province = WORLD_PROVINCES[n.provinceCode] || { name: { tr: n.provinceCode, en: n.provinceCode } };
      const district = WORLD_DISTRICTS[n.districtCode] || { name: { tr: n.districtCode, en: n.districtCode } };

      return {
        countryCode: n.countryCode,
        countryName: country.name,
        provinceCode: n.provinceCode,
        provinceName: province.name,
        districtCode: n.districtCode,
        districtName: district.name,
        neighborhoodCode: n.code,
        neighborhoodName: n.name,
        streetClusterName: {
          tr: `${n.name.tr} Ada Bloğu`,
          en: `${n.name.en} Block`,
        },
        frontCode: `${n.countryCode}-${n.districtCode}-${n.code}`,
        weight: 1.2,
      };
    }
  }

  // 2. Check known districts
  for (const d of Object.values(WORLD_DISTRICTS)) {
    if (
      latitude >= d.bbox[0] &&
      latitude <= d.bbox[1] &&
      longitude >= d.bbox[2] &&
      longitude <= d.bbox[3]
    ) {
      const country = WORLD_COUNTRIES[d.countryCode] || { name: { tr: d.countryCode, en: d.countryCode } };
      const province = WORLD_PROVINCES[d.provinceCode] || { name: { tr: d.provinceCode, en: d.provinceCode } };

      return {
        countryCode: d.countryCode,
        countryName: country.name,
        provinceCode: d.provinceCode,
        provinceName: province.name,
        districtCode: d.code,
        districtName: d.name,
        neighborhoodCode: 'MRK',
        neighborhoodName: { tr: `${d.name.tr} Bölgesi`, en: `${d.name.en} District` },
        streetClusterName: {
          tr: `${d.name.tr} Şehir Caddeleri`,
          en: `${d.name.en} City Streets`,
        },
        frontCode: `${d.countryCode}-${d.code}-MRK`,
        weight: 1.5,
      };
    }
  }

  // 3. Check known countries
  for (const c of Object.values(WORLD_COUNTRIES)) {
    if (
      latitude >= c.bbox[0] &&
      latitude <= c.bbox[1] &&
      longitude >= c.bbox[2] &&
      longitude <= c.bbox[3]
    ) {
      return {
        countryCode: c.code,
        countryName: c.name,
        provinceCode: `${c.code}-REG`,
        provinceName: { tr: `${c.name.tr} Bölgesi`, en: `${c.name.en} Region` },
        districtCode: 'ZON',
        districtName: { tr: 'Oyun Sektörü', en: 'Play Sector' },
        neighborhoodCode: 'LOC',
        neighborhoodName: { tr: 'Yerel Ada', en: 'Local Block' },
        streetClusterName: {
          tr: `${c.name.tr} Cephe Sahası`,
          en: `${c.name.en} Front Sector`,
        },
        frontCode: `${c.code}-SEC`,
        weight: 1.0,
      };
    }
  }

  // 4. Universal fallback for open ocean or international coordinates
  const latDir = latitude >= 0 ? 'N' : 'S';
  const lngDir = longitude >= 0 ? 'E' : 'W';
  const sector = `${Math.abs(Math.floor(latitude))}${latDir}-${Math.abs(Math.floor(longitude))}${lngDir}`;

  return {
    countryCode: 'GL',
    countryName: { tr: 'Küresel Sektör', en: 'Global Sector' },
    provinceCode: 'GL-OCEAN',
    provinceName: { tr: 'Uluslararası Alan', en: 'International Field' },
    districtCode: 'GLB',
    districtName: { tr: 'Açık Sektör', en: 'Open Sector' },
    neighborhoodCode: 'SEC',
    neighborhoodName: { tr: `Sektör ${sector}`, en: `Sector ${sector}` },
    streetClusterName: {
      tr: `Küresel Cephe Koordinatı [${sector}]`,
      en: `Global Front Coordinate [${sector}]`,
    },
    frontCode: `GL-${sector}`,
    weight: 1.0,
  };
}
