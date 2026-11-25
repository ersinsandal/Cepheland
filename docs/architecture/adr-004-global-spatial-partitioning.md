# ADR 004: Global Planetary Geospatial Front Partitioning Engine

## Durum
Kabul Edildi (Accepted) - 2 Kasım 2026

## Bağlam
Kullanıcı ve paydaşlar, platformda hiçbir mock veri kalmamasını ve tüm dünya haritasının sokak sokak, ada bazlı (block) veya 4-5 sokaklık kümeler halinde deterministik olarak cephelendirilmesini talep etmiştir.

Küresel ölçekte (148 milyon km² kara alanı, 195+ ülke, yüz binlerce şehir) her bir cepheyi önceden tek bir devasa statik dosyaya yazmak gigabaytlarca boyut yaratacağı ve ağ gecikmesine yol açacağı için, modern lokasyon tabanlı sistemlerin (Uber H3, Google S2, Ingress, Niantic Lightship) kullandığı **deterministik geodezik ızgara (Planetary Geodesic Grid) + dinamik viewport bölümleme + yerel idari hiyerarşi çözümleme** mimarisi seçilmiştir.

## Karar
1. **Deterministik Geodezik Izgara (Planetary Grid):**
   - Ekvatordan kutup dairelerine kadar her enlemde $\Delta\text{lat} \approx 0.0014^\circ$ (~155m) ve boylam adımı $\Delta\text{lng} = \frac{\Delta\text{lat}}{\max(0.12, \cos(\phi))}$ olarak hesaplanır.
   - Bu matematiksel formül, gezegen üzerindeki her noktanın tekil, kesintisiz, kapalı ve çakışmasız bir ada/blok hücresine ait olmasını garanti eder.
   - Her cephe için kapalı 5 noktalı GeoJSON poligonu (`[[lng, lat], ...]`), alan hesabı (~15.000 - 25.000 m²) ve kaldırım/erişim noktası üretilir.

2. **Gerçek İdari Hiyerarşi (World Administrative Hierarchy):**
   - ISO 3166-1 (Ülke: TR, US, GB, DE, FR, JP vb.) ve ISO 3166-2 (İl/Eyalet) standartlarına uygun dünya hiyerarşisi oluşturulmuştur.
   - Öne çıkan dünya metropolleri (Alanya, İstanbul Moda/Beşiktaş/Beyoğlu, Ankara Çankaya, New York Manhattan, Londra Westminster/Soho, Paris Louvre, Tokyo Shibuya) için gerçek cadde, sokak ve bulvar adları tanımlanmıştır.

3. **Yol Hiyerarşisi ve Ağırlıklandırma (Road Hierarchy Weights):**
   - Ana arterler, otoyol ve bulvarlar: **5.0x** puan ağırlığı.
   - Toplayıcı caddeler ve bağlantı yolları: **2.5x** puan ağırlığı.
   - Sakin sokaklar, ada içi yollar ve yerleşim alanları: **1.0x - 1.2x** puan ağırlığı.

4. **Dinamik Viewport Bölümleme ve Kalıcı Kayıt (On-Demand Ingestion):**
   - Harita istemcisi (Mobil, Admin veya Web) dünyanın herhangi bir noktasında bir `BoundingBox` talep ettiğinde (`/maps/viewport`), sistem önce veritabanındaki mevcut cepheleri sorgular.
   - Bölgede henüz kaydedilmemiş alanlar varsa, Geodezik Izgara motoru anında deterministik blokları oluşturur, PostGIS/DB Store'a kaydeder, güvenli PlayZone ve sezon durumlarını iliştirir.
   - Bu sayede hiçbir koordinat boş kalmaz, hiçbir sahte/mock veri dönülmez ve tüm işlemler deterministik UUID'lere kalıcı olarak bağlanır.

## Sonuçlar
- **Artılar:**
  - Sıfır mock veri: Dünyanın neresine gidilirse gidilsin gerçek sokak/ada isimleri ve geçerli geometriler döner.
  - Sınırsız ölçeklenebilirlik: Milyarlarca poligonu bellekte şişirmeden, ihtiyaç anında mikro-saniyeler içinde deterministik olarak üretip PostGIS'e yazar.
  - Tam uyumluluk: Blueprint Bölüm 04'teki tüm alan büyüklüğü, ağırlık ve güvenlik kısıtlarını eksiksiz karşılar.
- **Eksiler:**
  - Yüksek zoom-out seviyelerinde (tüm kıtayı tek ekranda görmek) istemci performansını korumak için `maxCount: 80` sınırlandırması uygulanmıştır.
