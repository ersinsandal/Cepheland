import React, { useState, useEffect, useRef } from 'react';
import { Globe, MapPin, Layers } from 'lucide-react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

const WORLD_SHOWCASE_CITIES = [
  { name: 'Alanya / Mahmutlar', tag: 'Pilot', bbox: { minLat: 36.480, maxLat: 36.490, minLng: 32.090, maxLng: 32.105 } },
  { name: 'İstanbul / Kadıköy Moda', tag: 'Türkiye', bbox: { minLat: 40.978, maxLat: 40.988, minLng: 29.025, maxLng: 29.035 } },
  { name: 'İstanbul / Beşiktaş Çarşı', tag: 'Türkiye', bbox: { minLat: 41.038, maxLat: 41.048, minLng: 29.001, maxLng: 29.012 } },
  { name: 'İstanbul / Beyoğlu İstiklal', tag: 'Türkiye', bbox: { minLat: 41.029, maxLat: 41.039, minLng: 28.977, maxLng: 28.987 } },
  { name: 'Ankara / Çankaya Tunalı', tag: 'Türkiye', bbox: { minLat: 39.907, maxLat: 39.917, minLng: 32.850, maxLng: 32.860 } },
  { name: 'New York / Manhattan Times Sq', tag: 'ABD', bbox: { minLat: 40.750, maxLat: 40.760, minLng: -73.990, maxLng: -73.980 } },
  { name: 'Londra / Westminster Soho', tag: 'İngiltere', bbox: { minLat: 51.508, maxLat: 51.518, minLng: -0.138, maxLng: -0.128 } },
  { name: 'Paris / Louvre & Rivoli', tag: 'Fransa', bbox: { minLat: 48.856, maxLat: 48.866, minLng: 2.330, maxLng: 2.342 } },
  { name: 'Tokyo / Shibuya Crossing', tag: 'Japonya', bbox: { minLat: 35.654, maxLat: 35.664, minLng: 139.696, maxLng: 139.706 } },
];

export const WorldFrontsTab: React.FC = () => {
  const [selectedWorldCity, setSelectedWorldCity] = useState(0);
  const [worldCityFronts, setWorldCityFronts] = useState<any[]>([]);
  const [loadingWorldFronts, setLoadingWorldFronts] = useState(false);
  const [customLat, setCustomLat] = useState('41.8902');
  const [customLng, setCustomLng] = useState('12.4922');
  const [customFrontResult, setCustomFrontResult] = useState<any | null>(null);

  // Map refs
  const mapContainerRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<L.Map | null>(null);
  const layerGroupRef = useRef<L.LayerGroup | null>(null);

  const fetchWorldCityFronts = async (cityIdx: number) => {
    setSelectedWorldCity(cityIdx);
    setLoadingWorldFronts(true);
    try {
      const city = WORLD_SHOWCASE_CITIES[cityIdx];
      const res = await fetch(
        `http://localhost:3001/maps/viewport?minLat=${city.bbox.minLat}&maxLat=${city.bbox.maxLat}&minLng=${city.bbox.minLng}&maxLng=${city.bbox.maxLng}`
      );
      const data = await res.json();
      setWorldCityFronts(data.fronts || []);
    } catch (err) {
      console.error(err);
    } finally {
      setLoadingWorldFronts(false);
    }
  };

  useEffect(() => {
    fetchWorldCityFronts(0);
  }, []);

  // Initialize Showcase Leaflet Map
  useEffect(() => {
    if (!mapContainerRef.current) return;
    if (mapInstanceRef.current) return;

    const initialCity = WORLD_SHOWCASE_CITIES[0];
    const initialCenter: [number, number] = [
      (initialCity.bbox.minLat + initialCity.bbox.maxLat) / 2,
      (initialCity.bbox.minLng + initialCity.bbox.maxLng) / 2,
    ];

    const map = L.map(mapContainerRef.current, {
      center: initialCenter,
      zoom: 16,
      attributionControl: false,
    });

    L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}', {
      maxZoom: 19,
      subdomains: 'abcd',
    }).addTo(map);

    const layerGroup = L.layerGroup().addTo(map);
    layerGroupRef.current = layerGroup;
    mapInstanceRef.current = map;

    return () => {
      map.remove();
      mapInstanceRef.current = null;
    };
  }, []);

  // Fly map when city changes
  useEffect(() => {
    const map = mapInstanceRef.current;
    if (!map) return;
    const city = WORLD_SHOWCASE_CITIES[selectedWorldCity];
    const center: [number, number] = [
      (city.bbox.minLat + city.bbox.maxLat) / 2,
      (city.bbox.minLng + city.bbox.maxLng) / 2,
    ];
    map.flyTo(center, 16, { animate: true, duration: 1 });
  }, [selectedWorldCity]);

  // Paint GTA turf polygons on the showcase map
  useEffect(() => {
    const map = mapInstanceRef.current;
    const group = layerGroupRef.current;
    if (!map || !group) return;

    group.clearLayers();

    worldCityFronts.forEach((f) => {
      if (!f.geometry || !f.geometry.length) return;
      const latlngs: [number, number][] = f.geometry.map(([lng, lat]: [number, number]) => [lat, lng]);

      const isGS = f.ownerTeam?.slug === 'galatasaray';
      const isFB = f.ownerTeam?.slug === 'fenerbahce';
      const isContested = f.status === 'contested';

      let fillColor = '#64748B';
      let strokeColor = '#94A3B8';

      if (isGS) {
        fillColor = '#A90432';
        strokeColor = '#FDB913';
      } else if (isFB) {
        fillColor = '#002D72';
        strokeColor = '#FFED02';
      }

      if (isContested) {
        strokeColor = '#EF4444';
      }

      const polygon = L.polygon(latlngs, {
        color: strokeColor,
        weight: isContested ? 3 : 2,
        fillColor,
        fillOpacity: isContested ? 0.7 : 0.55,
      }).addTo(group);

      polygon.bindTooltip(`<strong>${f.displayNameI18n?.tr || f.frontCode}</strong><br/>${f.frontCode}`, {
        sticky: true,
      });

      if (isContested) {
        const battleIcon = L.divIcon({
          className: 'battle-badge',
          html: `<div style="background:#B42318;color:#FFF;padding:2px 6px;border-radius:12px;font-size:9px;font-weight:800;border:1px solid #FFF;white-space:nowrap;">⚔️ SAVAŞ</div>`,
          iconSize: [60, 20],
          iconAnchor: [30, 10],
        });
        L.marker([f.center.latitude, f.center.longitude], { icon: battleIcon }).addTo(group);
      }
    });
  }, [worldCityFronts]);

  const testArbitraryCoord = async (lat: string, lng: string) => {
    try {
      const latitude = parseFloat(lat);
      const longitude = parseFloat(lng);
      const latDelta = 0.001;
      const lngDelta = 0.0015;
      const res = await fetch(
        `http://localhost:3001/maps/viewport?minLat=${latitude - latDelta}&maxLat=${latitude + latDelta}&minLng=${longitude - lngDelta}&maxLng=${longitude + lngDelta}`
      );
      const data = await res.json();
      if (data.fronts && data.fronts.length) {
        setCustomFrontResult(data.fronts[0]);

        // Fly map to custom coordinate
        const map = mapInstanceRef.current;
        if (map) {
          map.flyTo([latitude, longitude], 17, { animate: true });
        }
      }
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div style={{ flex: 1, padding: 36, overflowY: 'auto', maxWidth: 1200, margin: '0 auto', width: '100%' }}>
      <div style={{ marginBottom: 24 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 8 }}>
          <Globe size={28} color="#2DD4BF" />
          <h2 style={{ fontSize: 26, fontWeight: 800, color: '#FFFFFF' }}>
            Tüm Dünya Haritası &amp; Küresel Çete Bölge (Turf War) Haritası
          </h2>
        </div>
        <p style={{ fontSize: 14, color: '#9CA3AF', lineHeight: 1.6 }}>
          GTA San Andreas çete bölge savaşlarındaki gibi: Gerçek dünya sokakları üzerinde takım renkleriyle kaplanmış yarı saydam ada ve 4-5 sokaklık küresel fetih poligonları. Sıfır mock veri.
        </p>
      </div>

      {/* Feature Highlights */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 16, marginBottom: 28 }}>
        <div style={{ background: '#161E2E', border: '1px solid #1F2937', borderRadius: 12, padding: 20 }}>
          <div style={{ fontSize: 12, color: '#2DD4BF', fontWeight: 700, marginBottom: 4 }}>CANLI TURF WAR HARİTASI</div>
          <div style={{ fontSize: 16, fontWeight: 700, color: '#FFFFFF', marginBottom: 6 }}>Gerçek Sokak Geometrisi</div>
          <div style={{ fontSize: 13, color: '#9CA3AF', lineHeight: 1.5 }}>
            Sokakların ve yapı adalarının üzerinde parlayan yarı saydam takım kontrol renkleri ve canlı savaş göstergeleri.
          </div>
        </div>
        <div style={{ background: '#161E2E', border: '1px solid #1F2937', borderRadius: 12, padding: 20 }}>
          <div style={{ fontSize: 12, color: '#2DD4BF', fontWeight: 700, marginBottom: 4 }}>STANDART KATKI DÜZENİ</div>
          <div style={{ fontSize: 16, fontWeight: 700, color: '#FFFFFF', marginBottom: 6 }}>Her Cephe Eşit Puan (+1 Katkı)</div>
          <div style={{ fontSize: 13, color: '#9CA3AF', lineHeight: 1.5 }}>
            Tüm bölgeler şampiyonluk yarışında eşit ağırlığa sahiptir; fethedilen veya savunulan her ada takımınıza net +1 puan kazandırır.
          </div>
        </div>
        <div style={{ background: '#161E2E', border: '1px solid #1F2937', borderRadius: 12, padding: 20 }}>
          <div style={{ fontSize: 12, color: '#2DD4BF', fontWeight: 700, marginBottom: 4 }}>GERÇEK İDARİ HİYERARŞİ</div>
          <div style={{ fontSize: 16, fontWeight: 700, color: '#FFFFFF', marginBottom: 6 }}>ISO 3166-1/2 &amp; Mahalle Kodları</div>
          <div style={{ fontSize: 13, color: '#9CA3AF', lineHeight: 1.5 }}>
            Ülke (TR, US, GB) &gt; İl (07, 34, NY) &gt; İlçe (ALN, KAD, MAN) &gt; Mahalle (MHM, MOD, MID) formatında değişmez UUID ve kod üretimi.
          </div>
        </div>
      </div>

      {/* City Selector Buttons */}
      <div style={{ marginBottom: 20 }}>
        <div style={{ fontSize: 13, fontWeight: 700, color: '#E2E8F0', marginBottom: 10, display: 'flex', alignItems: 'center', gap: 6 }}>
          <MapPin size={16} color="#0F766E" />
          Öne Çıkan Dünya Metropolleri ve Pilot Bölgeler (Tıklayarak Haritada Uçun):
        </div>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
          {WORLD_SHOWCASE_CITIES.map((city, idx) => (
            <button
              key={idx}
              onClick={() => fetchWorldCityFronts(idx)}
              style={{
                padding: '8px 14px',
                borderRadius: 8,
                border: selectedWorldCity === idx ? '1px solid #0F766E' : '1px solid #374151',
                background: selectedWorldCity === idx ? '#0F766E' : '#1F2937',
                color: selectedWorldCity === idx ? '#FFFFFF' : '#D1D5DB',
                fontSize: 12,
                fontWeight: 600,
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                gap: 6,
              }}
            >
              <span>{city.name}</span>
              <span style={{ fontSize: 10, background: 'rgba(0,0,0,0.25)', padding: '2px 6px', borderRadius: 4 }}>
                {city.tag}
              </span>
            </button>
          ))}
        </div>
      </div>

      {/* REAL LEAFLET MAP CONTAINER (Showcase) */}
      <div style={{
        background: '#111827',
        border: '1px solid #1F2937',
        borderRadius: 16,
        padding: 20,
        marginBottom: 24,
      }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
          <div>
            <div style={{ fontSize: 16, fontWeight: 700, color: '#FFFFFF' }}>
              {WORLD_SHOWCASE_CITIES[selectedWorldCity].name} — Gerçek Sokak &amp; Çete Haritası
            </div>
            <div style={{ fontSize: 12, color: '#9CA3AF' }}>
              CartoDB Dark Matter Altlık · Canlı Turf War Katmanı · {worldCityFronts.length} Belirlenmiş Cephe
            </div>
          </div>
          <div style={{
            fontSize: 12,
            fontWeight: 700,
            background: '#0F766E',
            color: '#FFFFFF',
            padding: '4px 12px',
            borderRadius: 999,
          }}>
            {loadingWorldFronts ? 'Yükleniyor...' : 'CANLI KONTROL'}
          </div>
        </div>

        <div
          ref={mapContainerRef}
          style={{
            width: '100%',
            height: 480,
            borderRadius: 12,
            overflow: 'hidden',
            border: '1px solid #374151',
          }}
        />
      </div>

      {/* Arbitrary Coordinate Live Partitioning Tester */}
      <div style={{
        background: '#161E2E',
        border: '1px solid #1F2937',
        borderRadius: 14,
        padding: 24,
      }}>
        <h3 style={{ fontSize: 16, fontWeight: 700, color: '#FFFFFF', marginBottom: 8 }}>
          Canlı Koordinat Testi: Dünyanın Herhangi Bir Noktasını Anında Cephelendir
        </h3>
        <p style={{ fontSize: 13, color: '#9CA3AF', marginBottom: 16 }}>
          Aşağıya gezegen üzerindeki herhangi bir enlem ve boylamı girin veya hazır örneklere tıklayın. Sistem anında bölgeyi matematiksel geodezik grid ile böler ve deterministik sokak bloğu cephesi üretir:
        </p>

        <div style={{ display: 'flex', gap: 8, marginBottom: 16 }}>
          <button
            onClick={() => { setCustomLat('41.8902'); setCustomLng('12.4922'); testArbitraryCoord('41.8902', '12.4922'); }}
            style={{ padding: '6px 12px', borderRadius: 6, border: '1px solid #374151', background: '#1F2937', color: '#E2E8F0', fontSize: 12, cursor: 'pointer' }}
          >
            Roma (Kolezyum)
          </button>
          <button
            onClick={() => { setCustomLat('52.5163'); setCustomLng('13.3777'); testArbitraryCoord('52.5163', '13.3777'); }}
            style={{ padding: '6px 12px', borderRadius: 6, border: '1px solid #374151', background: '#1F2937', color: '#E2E8F0', fontSize: 12, cursor: 'pointer' }}
          >
            Berlin (Brandenburg)
          </button>
          <button
            onClick={() => { setCustomLat('-33.8568'); setCustomLng('151.2153'); testArbitraryCoord('-33.8568', '151.2153'); }}
            style={{ padding: '6px 12px', borderRadius: 6, border: '1px solid #374151', background: '#1F2937', color: '#E2E8F0', fontSize: 12, cursor: 'pointer' }}
          >
            Sidney (Opera Binası)
          </button>
          <button
            onClick={() => { setCustomLat('25.1972'); setCustomLng('55.2744'); testArbitraryCoord('25.1972', '55.2744'); }}
            style={{ padding: '6px 12px', borderRadius: 6, border: '1px solid #374151', background: '#1F2937', color: '#E2E8F0', fontSize: 12, cursor: 'pointer' }}
          >
            Dubai (Burj Khalifa)
          </button>
        </div>

        <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 16 }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
            <span style={{ fontSize: 12, color: '#9CA3AF' }}>Enlem (Lat):</span>
            <input
              type="text"
              value={customLat}
              onChange={(e) => setCustomLat(e.target.value)}
              style={{ padding: '6px 10px', borderRadius: 6, border: '1px solid #374151', background: '#111827', color: '#FFFFFF', width: 100, fontSize: 13 }}
            />
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
            <span style={{ fontSize: 12, color: '#9CA3AF' }}>Boylam (Lng):</span>
            <input
              type="text"
              value={customLng}
              onChange={(e) => setCustomLng(e.target.value)}
              style={{ padding: '6px 10px', borderRadius: 6, border: '1px solid #374151', background: '#111827', color: '#FFFFFF', width: 100, fontSize: 13 }}
            />
          </div>
          <button
            onClick={() => testArbitraryCoord(customLat, customLng)}
            style={{
              padding: '8px 18px',
              borderRadius: 6,
              border: 'none',
              background: '#0F766E',
              color: '#FFFFFF',
              fontWeight: 700,
              fontSize: 13,
              cursor: 'pointer',
            }}
          >
            Koordinatı Cephelendir
          </button>
        </div>

        {customFrontResult && (
          <div style={{
            background: '#111827',
            border: '1px solid #0F766E',
            borderRadius: 10,
            padding: 16,
            fontSize: 13,
            color: '#E2E8F0',
          }}>
            <div style={{ fontWeight: 700, color: '#2DD4BF', marginBottom: 6 }}>
              ÜRETİLEN CEPHE: {customFrontResult.frontCode}
            </div>
            <div style={{ marginBottom: 4 }}>
              <strong>Adı:</strong> {customFrontResult.displayNameI18n?.tr || customFrontResult.streetName}
            </div>
            <div style={{ marginBottom: 4 }}>
              <strong>Deterministik UUID:</strong> <span style={{ fontFamily: 'monospace', color: '#9CA3AF' }}>{customFrontResult.id}</span>
            </div>
            <div style={{ marginBottom: 4 }}>
              <strong>Alan:</strong> ~{customFrontResult.areaM2} m²
            </div>
            <div style={{ color: '#6EE7B7', fontSize: 12 }}>
              ✓ PostGIS Geometrisi oluşturuldu · Safe PlayZone onaylandı · Durum: {customFrontResult.status}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
