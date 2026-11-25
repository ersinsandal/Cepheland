# Hazır başlangıç haritası

Bu klasör Mahmutlar, Moda, Konya merkezi ve Ankara merkezi çevresindeki 12 sabit karonun gerçek OpenStreetMap yol/su geometrisini ve önceden hesaplanmış cephelerini içerir. Hazır alanlar internet sorgusu veya ilk açılışta poligon hesabı beklemeden gösterilir. Bu, dünyanın önceden indirildiği anlamına gelmez.

- `maps/v1`: mevcut çalışma önbelleğiyle aynı sürüm ve biçimde ham yol karoları; `osm-names-v1` dosyalarında gerçek yer adları.
- `parcels`: `road-parcels-v3` hesabının içerik özetiyle eşleşen sonuçları. Geometri girdileri değişirse otomatik olarak kullanılmaz ve yeniden hesaplanır.
- `names`: aynı geometri ve yer verisine ait ad adayları. İlk istekte pahalı işletme/sınır eşleştirmesini tekrar yapmaz; kalıcı isim kayıt sistemi yine benzersizlik ve önceden verilmiş adların korunmasını sağlar.
- `preparation-report.json`: hazırlama zamanı, kapsama sınırları, kaynak ve sonuç sayıları.

Mevcut `scratch/osm-cache/v1` kaydı her zaman bu paketten önce gelir; bir oyuncunun kullanılan haritası sessizce değiştirilmez. Hazır dosyalar salt okunur kaynaklardır, oyun sahipliği veya oyuncu verisi içermez.

Kaynak: © [OpenStreetMap contributors](https://www.openstreetmap.org/copyright), [ODbL 1.0](https://opendatacommons.org/licenses/odbl/1-0/). Yeni karolar 25 Kasım 2026 tarihinde OSM harita API'sinden sınırlı başlangıç alanları için indirildi. Önceden bulunan Moda karosu sürüm sürekliliği için korundu.

Yeniden üretim: API paketinde `pnpm maps:prepare` veya belirli alan için `pnpm maps:prepare mahmutlar`. Script yalnızca eksik dosyaları hazırlar. Geniş ölçekli veri hazırlamak için bölgesel OSM özeti veya ayrı bir Overpass sunucusu kullanılmalıdır; OSM düzenleme API'si oyun sırasında ya da dünya indirme aracı olarak kullanılmaz.
