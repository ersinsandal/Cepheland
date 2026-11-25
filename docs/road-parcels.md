# Sokaklardan otomatik parsel üretimi

Aktif `/maps/viewport` akışı artık `planetary-grid.ts` üretimini kullanmaz. Açılan bölgenin gerçek OpenStreetMap yolları indirilir; kapalı sokak adaları korunur, geriye kalan açık kara parçaları sabit tohumlu Voronoi hücreleriyle bölünür. Aynı veri ve konum aynı parsel kimliklerini üretir. Haritayı kaydırmak mülkiyeti değiştirmez.

## Akış

1. `apps/api/src/services/osm-source.ts` görünümü sabit 0,02° karolara ayırır. Her karoda 0,005° çevre payıyla yollar, kıyılar ve su çoklu poligonları alınır. Tam OSM yol geometrileri kullanılır. Aynı anda en fazla iki yol isteği çalışır; aynı karo için eşzamanlı istekler birleştirilir. İsim sorguları ayrı tek işlik kuyruktadır; hazır yolu bekletmez.
2. `packages/geo/src/road-parcels.ts` yol parçalarını kavşak noktalarında böler ve kapalı yüzleri çıkarır. Köprüler/tüneller zemin sınırı sayılmaz. Kapalı sokak adaları karo kenarında kırpılmaz. Yol koridorları, kıyının deniz tarafı ve göller araziden çıkarılır.
3. Kapalı ada dışında kalan arazi düzensiz Voronoi parsellerine bölünür. Bu parseller de gerçek yol ve su sınırlarında kesilir. Çıkmaz sokaklar birer yol boşluğu olarak korunur. Hiçbir sonuç 140 adetle veya komşu merkeze mesafesiyle elenmez.
4. `parcel-builder.ts` ağır geometri hesabını en fazla iki arka plan işçisinde çalıştırır. Express diğer isteklere yanıt vermeye devam eder. Hesaplanmış geometri içerik özetiyle diske yazılır.
5. `map.service.ts` çokgenin görünümle kesişimini kontrol eder; yalnızca merkeze bakmaz. Pilot cephelerin gerçek geometrileri ayrılır, mevcut savaş ve sahiplik kimlikleri korunur. Her yeni sezon için bağımsız nötr durum oluşturulur.
6. Mobil ve yönetici haritaları gerçek Leaflet görünüm alanını `progressive=1` ile sorgular. Hazır karolar hemen döner; eksik yol indirmeleri ve poligon hesapları arka planda ilerler. Yanıttaki `loading` hazır/bekleyen/başarısız karo sayılarını ve tekrar deneme süresini taşır. Bir karo başarısız olduğunda diğerleri silinmez. Önceki istemci istekleri iptal edilir; gecikmiş cevaplar uygulanmaz. `geometryRings` dış sınırın yanında su/yol boşluklarını taşır. Katılım kontrolü de bu boşlukları hariç tutar.

## Veri, doğruluk ve ölçek sınırları

- OSM çoğunlukla yol merkez çizgisi sağlar. Asfalt kenarı, `width` etiketi varsa onunla; yoksa şerit sayısı veya yol sınıfına göre **yaklaşık** hesaplanır. Bu bir kadastro/parsel ölçüm sistemi değildir.
- Kapalı sokak adaları gerçek yollardan türetilir. Açık arazi tanımı, indirilen yol ağında kapalı ada dışında kalan kara alanıdır; bina veya tapu verisiyle yapılmış bir boş arsa sınıflaması değildir. Eksik OSM yolları ve çevre payından daha geniş açık bloklar sonucu etkileyebilir.
- Bir sorgu en fazla 16 karoyu kapsar. Daha geniş görünüm `422 VIEWPORT_TOO_LARGE` ve yakınlaştırma mesajı alır; haritanın bir köşesini sessizce eksik döndürmez. Kapsama, Web Mercator'ın ±85,0511° enlemlerindeki sokak ölçeği içindir. Tüm gezegen önceden işlenmiş değildir; farklı bölgeler istek üzerine hazırlanır.
- Mahmutlar, Moda, Konya ve Ankara'nın başlangıç alanlarındaki 12 karo gerçek verisi ve hesaplanmış parselleriyle `apps/api/data` altında uygulamaya dahildir. Bu alanlarda ilk açılış internetten yol verisi indirmeyi gerektirmez. Hazır paket tüm şehir veya dünya kapsamı iddiası değildir.
- Kamuya açık Overpass sunucuları gecikebilir veya kota hatası verebilir. Hazır alanların dışında veri ve geometri arka planda hazırlanır. Her dış istek en fazla 8 saniye sürer; başarısız karo 30 saniyelik beklemeye alınır. Hızlı kaydırma sınırsız indirme kuyruğu oluşturamaz. Etkileşimli yanıt kısmi durumu açıkça bildirir; eski, tam yanıtı bekleyen API çağrısı `503 OSM_UNAVAILABLE` dönebilir. Yol verisi yokken şehir üzerinde rastgele sahte parseller çizilmez. Üretim trafiği için ayrı bir Overpass aynası veya önceden hazırlanmış OSM kaynağı yapılandırılmalıdır.
- Ham karo verisi `apps/api/scratch/osm-cache/v1`, hesaplanan parseller `apps/api/scratch/parcel-cache` altında tutulur. Her iki klasör Git dışında kalır. Ham veri sürümü bilerek sabit tutulur. Canlı oyunda veri sürümünü değiştirmeden önce cephe/sahiplik geçişi planlanmalıdır.
- Önbellek yalnızca coğrafi veriyi kalıcı tutar. Mevcut oyun veritabanı hâlâ bellek içidir; sunucu yeniden başlatıldığında oyun durumlarının kalıcılığı bu değişikliğin kapsamı dışındadır.

`OSM_OVERPASS_URLS`, `OSM_CACHE_DIR` ve `PARCEL_CACHE_DIR` isteğe bağlı yapılandırmalardır; örnekleri `.env.example` dosyasındadır. Varsayılan kaynaklar [Overpass API](https://overpass-api.de/) ve [Private.coffee Overpass](https://overpass.private.coffee/) servisleridir. Kıyı yönü [OSM'nin kara solda kuralına](https://wiki.openstreetmap.org/wiki/Tag:natural%3Dcoastline) göre değerlendirilir. Yol ağının kavşaklarda bölünmesi [Turf polygonize](https://turfjs.org/docs/api/polygonize) gerekliliğidir.

## Gerçek cephe adları

Cephelerin görünen adı parsel içindeki adlandırılmış işletme, okul, tarihi yapı veya diğer OSM yerlerinden seçilir. Noktanın parselin içinde olması gerekir; göl/yol boşluğundaki veya karşı sokaktaki bir işletme seçilmez. Alan olarak işaretlenmiş bir yerin en az yarısı cephe içinde kalmalıdır. Sınırdaki sokaklar, sınır boyunca yakınlık ve cephe uzunluğuyla eşleştirilir. Wikipedia/Wikidata veya tarihi yapı etiketleri seçim önceliği sağlayabilir; popülerlik iddiası üretilmez.

Öncelik `işletme/yapı · sokak`, `sokak / ikinci sokak`, bilinen gerçek yerin `çevresi` şeklindedir. Bunlar yoksa en fazla 250 metre uzaktaki gerçek yolun adı `Sokak adı çevresi` olarak kullanılır; bu yol parsel sınırı gibi gösterilmez. Gerçek ad bulunamazsa konum belirtilen `Adsız arazi` kullanılır; hayali sokak veya işletme adı üretilmez. Aynı aday başka bir cephede kullanılıyorsa gerçek ikinci sokak/yer bilgileriyle ayırt edilir; bunlar da yetmezse gerçek adın sonuna kısa ve sabit bir kod eklenir. Dolayısıyla adlar aynı ilçeyle sınırlı olmayan tek bir ad alanında benzersizdir.

`front-name-registry.ts` tahsis edilmiş adları ve geçmiş takma adlarını `apps/api/scratch/front-names/v1.json` dosyasında saklar (`FRONT_NAMES_FILE` ile değiştirilebilir). İsimler görünüm alanı veya sezonla yeniden tahsis edilmez. API ilk isteği kabul etmeden kayıtlı pilot adlarını yükler; doğrudan açılan cephe ve savaş ekranları da aynı adı görür. Sonradan gelen doğrulanmış işletme verisi sokak/konum adını zenginleştirebilir; sonraki bir veri kesintisi adı geri düşürmez. İsimlerin kalıcılığı için bu dosya korunmalı ve yedeklenmelidir. Test çalışmaları gerçek ad kaydına yazmaz.

POI verileri, geometri önbelleğinden ayrı `osm-names-v1` dosyalarında saklanır. İsim sorgusu başarısızsa mevcut gerçek sokak adları kullanılır. Ad güncellemek parsel UUID'sini, geometrisini, savaşını veya sahipliğini değiştirmez. Harita, kart, savaş ve katılım alanları aynı adı kullanır; OSM metinleri tooltip HTML'i olarak çalıştırılmaz.

## Mobil arama ve harita akışı

Ana arayüz mobil kullanıma göre düzenlenmiştir. Konum arama bir hazır şehir seçicisi değildir: `/maps/places?q=...` serbest yer/adres araması yapar. Sonuçlar gerçek koordinat, ad ve ilçe/il/ülke ayrımıyla gösterilir; seçim haritayı ilgili konuma götürür. Kaynak [Photon](https://github.com/komoot/photon) ve OpenStreetMap'tir. Servis `PLACE_SEARCH_URL` ile değiştirilebilir; sorgular yalnız kullanıcı gönderdiğinde yapılır, aynı sorgular birleştirilir, sonuçlar 24 saat önbelleğe alınır ve dış istekler saniyede biri aşmaz. Servis kesilirse eldeki yer kayıtları açık bir durum mesajıyla sunulur; sonuç bulunamaması ile bağlantı kesintisi ayrılır. Kamuya açık Photon hizmeti erişim garantisi vermez; yüksek trafik için özel servis gerekir.

Konum aramasında kuyrukta bekleme dahil toplam süre 8 saniyeyle sınırlıdır. Süresi dolan bekleyen sorgu dış servise gönderilmez; gecikmiş cevap önbelleğe yazılmaz. Bu durumda kayıtlı konumlar ve açık bir bağlantı mesajı gösterilir.

Harita ilerleme sorguları sınırlı sürede sona erer; ekranda sonsuz yükleme bırakılmaz. Yakınlaştırma yetersizse veri indirmek yerine yakınlaştırma kontrolü gösterilir. Seçili cephe değiştirilirken tüm poligonlar yeniden oluşturulmaz; Canvas katmanı kullanılır. Oyun verileri ve günlük katkılar API'den gelir; sabit örnek skorlar ve teknik taslak etiketleri kaldırılmıştır.

Pilot 12 cephenin başlangıç adları, repodaki gerçek `mahmutlar_raw.osm` ve `parsed_highways.json` kayıtlarından türetilen `apps/api/src/db/pilot-front-names.json` dosyasındadır. Bu tarihsel OSM anlık görüntüsü işletmelerin bugün açık olduğuna dair doğrulama değildir. Varsayılan dış kaynakta isim bulunması OSM kapsamına bağlıdır.

## Çalıştırma ve doğrulama

Windows PowerShell'de `pnpm.ps1` çalıştırma ilkesi engelleniyorsa `pnpm.cmd` kullanın:

```powershell
pnpm.cmd install --frozen-lockfile
pnpm.cmd build
pnpm.cmd test
pnpm.cmd test:integration
pnpm.cmd dev:api
# Ayrı terminal:
pnpm.cmd dev:mobile
```

Geometri testleri yol kıvrımı, kavşak, çıkmaz sokak, kıyı, göl boşluğu, deterministik açık arazi kapsaması, komşu karo ve 169 bitişik ada davranışlarını sınar. API testleri dış ağ yerine kontrollü yol girdileriyle çalışır; canlı OSM erişimi ayrıca doğrulanmalıdır.

23 Kasım 2026 canlı Moda denemesinde 2.603 OSM yolu, 7 su geometrisi ve 7 kıyı çizgisinden tek karoda 898 sokak parseli ile 81 açık arazi parseli üretildi. Bu sayı tüm İstanbul veya dünya kapsamını ifade etmez.
