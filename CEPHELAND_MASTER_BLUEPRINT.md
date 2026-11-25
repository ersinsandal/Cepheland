# CEPHELAND
## Product Requirements Document (PRD) + Game Design Document (GDD) + Technical Architecture + Build Specification

**Belge kimliği:** `CEPHELAND-MASTER-SPEC`  
**Sürüm:** 1.0 — 2 Kasım 2026  
**Dil:** Türkçe (ürün ilk dili); İngilizce tam yerelleştirme  
**Hedef okuyucu:** Ürün yöneticileri, oyun tasarımcıları, mobil ve backend geliştiricileri, veri mühendisleri, güvenlik uzmanları ve test ekipleri.<br>
**Hedef teslimat:** Android + iOS üretim uygulaması, yönetici web paneli, backend API/işçiler, PostgreSQL/PostGIS veritabanı, harita işleme hattı, CI/CD, testler ve operasyon dokümanları.<br>
**Durum:** Üretim hedefini tanımlayan tasarım ve gereksinim referansı. Bu belgedeki akışlar, mimari tercihler ve kabul ölçütleri önerilen ürün kapsamını açıklar; mevcut kodun bunların tamamını uyguladığı anlamına gelmez. Çalışan sürümün kapsamı, kurulum adımları ve bilinen sınırlamaları için [README.md](README.md) ve [Türkçe proje dokümanı](README.tr.md) esas alınmalıdır.

> **Gereksinimlerin uygulanması:** `MUST/ZORUNLU` ifadeleri hedef ürünün kabul ölçütlerini belirtir. Bir özellik, ilgili API, durum yönetimi, yükleme/hata/boş durumları ve testleriyle birlikte doğrulandıktan sonra tamamlanmış sayılır. Varsayılan kararlardan sapmalar ve çözümlenmemiş konular `DECISIONS.md` içinde izlenir. Güvenlik, hukuki uygunluk ve ödeme kapsamındaki kararlar üretim öncesi ilgili incelemelerden geçmelidir. Üçüncü taraf kod ve görsel varlıklar kullanım haklarıyla birlikte değerlendirilir. Ekran görüntüleri, sıralamalar ve istatistikler doğrulanabilir veriyi yansıtmalı; simüle edilen akışlar ile örnek değerler açıkça belirtilmelidir. Hedef üretim düzeninde demo ortamı ayrı tutulur ve `Demo` olarak işaretlenir.

---

# 00 — HIZLI ÖZET VE KESİN KARARLAR

**Ürün tanımı:** Cepheland, insanların mevcut sosyal/oyunsal aidiyetlerini temsil eden takımlara katılarak **gerçek dünya haritasındaki küçük, tamamen sanal cephelerin** kontrolü için yarıştığı; tek hesap altında çok sayıda, birbirinden bağımsız lig barındıran Android/iOS konum tabanlı stratejik sosyal oyundur. Cepheler gerçek arazi, mülk veya kişilerin üzerinde hak oluşturmaz; **oyun içi soyut kontrol bölgeleridir.**

**Örnek:** `Taraftarlar Ligi > Antalya > Alanya > Mahmutlar > Kumru Sokak / Cephe 03`: Galatasaray kontrolünde; Fenerbahçe saldırısı devam ediyor. Başka ligde aynı coğrafi konumdaki cephe PlayStation takımının olabilir. Oyun ligleri ayrı sahiplik, savaş ve sezon verisi tutar.

**Temel döngü:** Lig seç → o ligde taraf seç → yakındaki cepheyi incele → güvenli erişilebilir katılım noktasına yürü → uygulamadan **"Takımım İçin İşaretle"** → sunucu güvenlik doğrulaması → ilgili savaşta bir geçerli katkı → savaş sonuçlanınca cephe ya elde kalır ya el değiştirir → yeni savaşlar ve sezon hedefleriyle döngü sürer.

**Ürün kuralları — başlangıç için sabit:**

1. Ligler yalnızca yetkili platform yöneticisi tarafından açılır ve yayımlanır. Kullanıcı kendi ligini oluşturamaz (ileriye dönük modül ayrı).
2. Her ligin **ayrı sahiplik haritası**, takımları, sezonu, kuralları, lig liderlik tabloları ve arşivi vardır; fiziksel coğrafi taban katmanı paylaşılabilir.
3. Cephe boyutu tercihen yapı adası/sokak ölçeğindedir; 10–20 oyunculuk yerel mücadeleleri destekler. Sistem şehir büyüdükçe sezon aralarında cepheleri parçalayabilir.
4. **Tek tıklamalı fetih:** Görev/mini oyun/karakol sistemi yoktur. Kullanıcı görünen bir `İşaretle` eylemi yapar. Güvenlik doğrulamaları arka plandadır.
5. **Bir oyuncu bir savaşa en fazla bir geçerli katkı** yapabilir. **Aynı cephedeki sonraki savaşlara tekrar katılabilir.** Ömür boyu tek katkı yasağı yoktur.
6. Aktif saldırı/normal yarışma penceresi varsayılan **24 saat**, fetih sonrası yeniden saldırı bekleme süresi **48 saat**; yönetici lig bazlı değiştirebilir, bir savaş başladıktan sonra kuralları sürümle sabitlenir.
7. Lig bazında günlük **en fazla üç ayrı cepheye** geçerli katkı; şehir/lig yoğunluğuna göre kurallı ayar yapılır; gece çıkmaya zorlamaz.
8. Aktif savaş, tek bir cephe için aynı anda **tek** olur; savunan takım + savaş başlatan rakip takım arasında yürür. Nötr cephelerde tüm lig takımlarına açık başlatma yarışması vardır (ayrıntı Bölüm 06).
9. Bir zafer için **en az üç farklı güvenilir katılımcı** ve savunana karşı daha çok onaylı katkı gerekir; eşitlikte mevcut sahibi korur; nötr yarışmada eşitlikte nötr kalır. Düşük yoğunlukta ikiye düşürme yalnızca ayrı kural profili ve güvenlik onayıyla.
10. Haritada **iki farklı başarı ölçümü** eşzamanlı gösterilir: **Cephe Sayısı** ve **Doğrulanmış Halk Desteği**. Üçüncü metrik **Ağırlıklı Harita Hâkimiyeti**dir. Bunlar birbirine karıştırılmaz.
11. Bir bölgede kalabalık ve yoğun destek bulan takım, daha fazla sayıda küçük sokağı elinde tutan takımdan **genel destek yüzdesinde önde olabilir**. Bunun deterministik hesabı Bölüm 07'dedir.
12. GPS tek başına gerçek insanı veya fiziksel varlığı ispatlamaz. Risk tabanlı kontrol + cihaz/uygulama bütünlüğü + sunucu tarafı doğrulama + katkı defteri + itiraz/inceleme zorunludur. **%100 botsuzluk iddiası yasaktır.**
13. Yaş sınırı ilk lansmanda **18+**; tam ev konumu, kullanıcıların canlı koordinatları ve rakip üyelerin gerçek kimlikleri gösterilmez. Gerçek dünyada fiziksel çatışma, takip veya toplanma ödüllendirilmez.
14. Takım aidiyetleri eğlenceli ve kurgusal rekabettir; nefret, tehdit, hedef gösterme, gerçek çatışma çağrısı, kişisel veri ifşası yasaktır. Gerçek kulüp adları/armaları için ayrı hak ve marka incelemesi gerekir.
15. Ödül mimarisi **pay-to-win değildir**. Ücretli ürünler bölge ele geçirme hakkı, oylama gücü, güvenlik onayı veya savaş başarısı sağlamaz.
16. Kullanıcı arayüzü özgün ve tutarlı bir oyun tasarım sistemine dayanır. Dekoratif emoji, ürüne özgü olmayan gösterge paneli kalıpları, işlevsiz gradyanlar, aşırı animasyon, gerçek veri gibi sunulan örnek değerler ve gereksiz açılır pencereler kullanılmaz.
17. Birincil platformlar gerçek native **Android ve iOS** uygulamalarıdır. Yönetim paneli web'dir. İsteğe bağlı kamuya açık web harita izleyicisi salt okunurdur.
18. Oyunla ilgili her sonuç **sunucu saatine**, olay günlüğüne, kural sürümüne ve değişmez tamamlanma kaydına bağlanır. İstemciden gelen puan veya kazanan bilgisine güvenilmez.

**Temel başarı tanımı:** Alanya pilotunda test kullanıcıları iki farklı lig açıp katılabilmeli, yönetici bir harita oluşturabilmeli, kullanıcı güvenli konumdan savaşa katkı verebilmeli, bir savaş sorunsuz sonuçlanmalı, yeniden saldırı/koruma döngüsü çalışmalı ve hem sokak sayısı hem farklı yoğunlukta oyuncu desteğine dayalı şehir tablosu doğru hesaplanmalıdır.

---

# 01 — ÜRÜNÜN FELSEFESİ VE KULLANICI HİKÂYESİ

## 01.1 Kullanıcı hangi duyguyu yaşamalı?

- **Aidiyet:** “Bu ligde benim tarafım var.”
- **Yakınlık:** “Kendi sokağımın kime ait olduğunu görüyorum.”
- **Etki:** “Benim tek dokunuşum gerçekten bir sonuç değiştirdi.”
- **Rövanş:** “Kaybettiğim yer geri alınabilir.”
- **Süreklilik:** “Bu hafta mahallemiz iyi gidiyor; sezon şampiyonluğuna katkıda bulunuyorum.”
- **Sosyal yayılım:** “Bizim takıma üç kişi daha gerekiyor.”
- **Şeffaflık:** “Kazanan nasıl belirlendi, hangi katkılar sayıldı, hangi incelemeler sonucu etkiledi?”

Ürün uzun eğitim ekranlarına değil, öğrenmesi 30 saniye süren tek çekirdek eyleme dayanır. Strateji oyunu arayüzü kadar ağır; rutin check-in uygulaması kadar sığ olmamalıdır.

## 01.2 Temel kişi profilleri

| Persona | Beklenti | Sorun | Cepheland karşılığı |
|---|---|---|---|
| Mahalle oyuncusu | Evine yakın 2–3 cepheyi takip etmek | Şehre yayılan büyük savaşlara yetişemez | “Yakınımdaki Cepheler” ve favori cephe |
| Taraftar | Desteklediği kulübün yerel üstünlüğünü görmek | Sadece skor tablosu sıkıcı | Sokak kontrolü + yerel farklar |
| Çoklu lig oyuncusu | Futbol ve oyun dünyasında farklı takımları tutmak | Liglerin karışması | Her lig için bağımsız üyelik ve harita |
| Yeni gelen | Karmaşık kuralları öğrenmek istemiyor | Nasıl katkı vereceğini bilmiyor | Tek aksiyonlu onboarding |
| Rekabetçi oyuncu | Uzun süreli kişisel hedef | Hep aynı işaretleme rutini | Zafer geçmişi, savunma, bölgeler, sezon başarıları |
| Moderatör | Hile, tehdit ve riskli alanları yönetmek | Sosyal/konumsal riskler | Kanıtlı vaka, koruma/kapatma/yaptırım |
| Platform yöneticisi | Kod yazmadan yeni lig açmak | Her lig için ayrı uygulama çıkarmak istemez | Lig sihirbazı + önizleme + yayımlama |

## 01.3 Kapsam dışı olanlar

MVP'de PvP dövüş/mini oyun, gerçek kavga, silah, kişilere yönelik rakip canlı haritası, açık sohbet/DM, grupların fiziksel toplanma çağrıları, para karşılığı savaş gücü, bahis/şans oyunu, QR noktalarının tamamına fiziksel donanım kurma, kamuya açık kullanıcıların lig oluşturması, arka planda sürekli GPS izleme, sokak görüntüsü/AR, sponsor ödemeleri **yoktur**. Bunlar eklenirse ayrı ürün-güvenlik kararı gerekir.

## 01.4 Oyun içi dil

- **Lig:** Ayrı rekabet evreni. Örn. Taraftarlar Ligi.
- **Takım:** Ligde seçilebilen taraf. Örn. Galatasaray (izinli kullanım).
- **Cephe:** Haritada tek tek ele geçirilebilen küçük sanal poligon.
- **Savaş:** Bir cephenin kontrolü için tarihli, tekil yarışma.
- **Katkı:** Bir doğrulanmış oyuncunun aynı savaşta sayılan tek işaretlemesi.
- **Kontrol:** Son kesinleşmiş savaşın belirlediği takım sahipliği.
- **Koruma:** Ele geçirme sonrası yeni savaşın başlatılamadığı süre.
- **Doğrulanmış destek:** Belirli sezon ve coğrafi kapsamda geçerli en az bir fiziksel katılım göstermiş **tekil hesapların** takım dağılımı; “tekil insan garantisi” değildir.
- **Cephe gücü:** Savaşta kullanılan geçerli katılımcı sayısı; kişi sayısından ayrı gizli saldırı puanları yoktur.
- **Ağırlıklı hâkimiyet:** Kalabalık/önemli cephelerin sabit sezon katsayısıyla katkıda bulunduğu sahiplik endeksi.
- **Sezon:** Ligin belirlenmiş tarih aralığındaki kayıtlı sıralama dönemi.

---

# 02 — ÜRÜN MODÜLLERİ VE MİMARİ ÖZETİ

```text
                     +-----------------------------------------+
                     |      Cepheland Admin (Next.js)          |
                     | lig, harita, güvenlik, moderasyon, rapor|
                     +--------------------+--------------------+
                                          |
  +---------------------------+           |          +--------------------------+
  | Android App (React Native)|-----------+----------| iOS App (React Native)   |
  | MapLibre + Expo native    |       HTTPS API       | MapLibre + Expo native    |
  +---------------------------+           |          +--------------------------+
                                          v
                            +-----------------------------+
                            | API Gateway / NestJS       |
                            | Auth, rate limit, Zod, RBAC|
                            +--------------+--------------+
                                           |
         +-------------------------+-------+--------+--------------------+
         |                         |                |                    |
         v                         v                v                    v
 +---------------+       +----------------+ +--------------+   +----------------+
 | Game Engine   |       | Risk Engine    | | Map Engine   |   | League Engine  |
 | Battle/Claims |       | Attest/Geo/OTP | | Front/Region |   | Teams/Seasons  |
 +-------+-------+       +--------+-------+ +------+-------+   +-------+--------+
         |                        |                |                   |
         +------------------------+----------------+-------------------+
                                           |
                              +------------+--------------+
                              | PostgreSQL + PostGIS      |
                              | transactional source      |
                              +-----------+---------------+
                                          / \
                              +----------+   +-------------+
                              v                            v
                         Redis (cache/queue)        Object Storage (S3)
                              |                            |
                              v                            v
                       BullMQ workers                map exports/assets
                              |
                +-------------+--------------+
                | settlement, notifications  |
                | aggregation, fraud review  |
                +----------------------------+
```

**Kural:** İlk sürüm **modüler monolit** olsun; dağıtık mikroservislere gereksiz bölünme yok. İş alanları ayrı modüller, tek deploy edilebilir API ve ayrı worker süreci. Veritabanı tek doğru kaynak; Redis hiçbir zaman kalıcı savaş kaydı yerine geçmez.

## 02.1 Önerilen teknoloji yığını

| Katman | Teknik seçim | Gerekçe / sınır |
|---|---|---|
| Mobil | React Native + TypeScript + Expo (development/production builds) | Android/iOS tek kod, gerektiğinde native modül |
| Mobil navigasyon | Expo Router | Deep link ve typed routes |
| Harita | `@maplibre/maplibre-react-native`, native MapLibre | Vektör harita, poligon renk/çizgi kontrolü; **Expo Go desteklenmez** |
| Konum | `expo-location` (foreground) | Katkı anında izinle ölçüm, sürekli arka plan takibi yok |
| Android integrity | Google Play Integrity API | Resmî Play dağıtımındaki uygulama bütünlüğü sinyali |
| iOS integrity | Apple App Attest / DeviceCheck | Donanım temelli uygulama ispat sinyali |
| Backend | Node.js aktif LTS + NestJS + TypeScript | Modüler servis, doğrulama, API sözleşmeleri |
| API sözleşmesi | OpenAPI 3.1 + Zod / DTO | Kod üretimi, istemci şemaları, validasyon |
| Veri | PostgreSQL + PostGIS | Transaction, coğrafi sorgu, bütünlük |
| Harita indeksleme | H3 (yardımcı coğrafi indeks) | Bölgesel yoğunluk/bucket; insanın gördüğü şekil H3 olmak zorunda değil |
| ORM/veri | Drizzle veya Prisma + **elle SQL PostGIS migrations** | Karmaşık coğrafi işlemleri ORM içinde gizleme |
| Queue/cache | Redis + BullMQ | Sonuçlandırma, bildirim, özetler |
| Admin | Next.js + TypeScript | Harita editörü, veri tabloları, vaka inceleme |
| Mobil data fetching | TanStack Query | Cache/yenileme/optimistik olmayan önemli işlemler |
| Mobil state | Zustand (UI), sunucu state Query | Ayrı roller, az boilerplate |
| Gerçek zamanlı | WebSocket veya SSE (sadece gerekli görünür ekranda) | Savaş güncellemesi, sonuç, bildirim |
| Dosya | S3 uyumlu nesne depolama | Lig kapakları, avatarlar, rapor çıktıları |
| Telemetri | OpenTelemetry + Sentry/uyumlu hata izleme + Prometheus/Grafana | Hata, gecikme, güvenlik alarmı |
| Push | FCM/APNs (Expo Notifications kullanılabilir) | Tercihe bağlı, oran sınırı |
| CI/CD | GitHub Actions + Docker + EAS Build/Submit | Birim/entegrasyon/E2E ve imzalı ikili |

**Sürüm politikası:** Geliştirme başladığında güvenlik güncellemesi alan ve birbiriyle uyumlu **güncel kararlı** sürümleri lockfile ile sabitle. Belgedeki sürüm numaralarını uzun vadeli garanti sayma. MapLibre React Native için native Expo development build zorunlu; Expo Go ile çalışıyor gibi gösterme.

## 02.2 Monorepo yapısı

```text
cepheland/
  README.md
  CEPHELAND_MASTER_BLUEPRINT.md
  DECISIONS.md
  SECURITY.md
  PRIVACY.md
  CODEOWNERS
  package.json
  pnpm-workspace.yaml
  turbo.json
  .env.example
  .github/workflows/{ci,security,deploy,release-mobile}.yml
  apps/
    mobile/
      app/
        (auth)/{welcome,sign-in,verify,permissions}.tsx
        (tabs)/{map,leagues,activity,profile}.tsx
        league/[leagueId]/{overview,teams,map,rankings,season}.tsx
        front/[frontId].tsx
        battle/[battleId].tsx
        settings/{index,privacy,notifications,account}.tsx
      src/{components,design,features,lib,native,locales,tests}/
      app.config.ts
      eas.json
    admin/
      app/{login,dashboard,leagues,maps,seasons,battles,trust,users,moderation,audit,settings}/
      src/{components,features,lib,tests}/
    api/
      src/modules/{auth,users,leagues,teams,regions,maps,fronts,battles,claims,risk,rankings,
                   seasons,notifications,moderation,admin,analytics,legal}/
      src/common/{guards,errors,interceptors,db,events}/
      test/{integration,e2e,fixtures}/
    worker/
      src/jobs/{settle-battle,aggregate-ranking,send-push,expire-intents,freeze-season,
                erase-location,flag-abuse,refresh-geo}/
  packages/
    contracts/      # OpenAPI / Zod / generated client
    game-rules/     # pure deterministic scoring and state machines
    ui-tokens/      # color, type, spacing, motion, icons
    geo/            # H3, OSM, GeoJSON utilities
    config/         # lint, tsconfig, testing presets
  infrastructure/
    docker/{Dockerfile.api,Dockerfile.worker,Dockerfile.admin}
    compose.yml
    terraform/      # prod network/db/storage/services/secrets
    sql/migrations/
    sql/seed/
    maps/{pipeline,osm-import,safety-review}/
    monitoring/{dashboards,alerts}/
  docs/
    architecture/{adr-001-monolith,adr-002-geo,adr-003-scoring}.md
    api/openapi.yaml
    operations/{runbook,backup-restore,incidents}.md
    product/{screen-inventory,copy,accessibility,game-balance}.md
    legal/{brand-clearance,data-retention,privacy-notice}.md
  tests/{load,security,geo,game,visual}/
```

---

# 03 — LİG / TAKIM / SEZON SİSTEMİ

## 03.1 Lig kurulumu

Her lig: `id`, benzersiz `slug`, iki dilde ad/açıklama, görsel kimlik, ülke/şehir erişim alanı, takım sayısı, kabul kuralları, katılım yaşı, etkin kural seti, harita katman/poligon sürümü, saat dilimi, sezona bağlı sıralamalar ve yayın durumu. Aynı kullanıcı birden fazla ligde yer alabilir; her ligde **bir sezon boyunca bir takım** seçer. Ligler arası katkılar, konum kanıtları, puanlar ve envanter birbirine geçmez.

**Durumlar:** `draft → review → scheduled → active → paused → archived`. `paused` tüm saldırı başlatmayı durdurur; mevcut savaşlar yönetici kararıyla `paused` olur ve süreleri aynı miktar uzatılır; admin bunu audit'e yazar. `archived` salt okunur ve geri açılmaz; yeni sezon ve yeni lig sürümü gerekir.

Örnek ligler:

- `football-tr`: izin alınmış/bağımsız tasarlanmış takımlarla Türkiye taraftar ligi.
- `gaming-global`: PC / PlayStation / Xbox gibi tüketici tercihi esaslı lig; markaların kullanımı incelemeye bağlı.
- `pets-global`: kedi/köpek taraftarları gibi mizahi ve güvenli lig.

**Önemli:** Cinsiyet, cinsel yönelim, etnik köken, din vb. gerçek ve hassas kimlikleri birbirine düşmanlaştıran ligler açılmamalı; oyuncuların bu bilgilerini toplama veya doğrulama istenmemeli. Hedef eğlenceli tercih rekabeti, gerçek dünya toplumsal düşmanlıkları değil.

## 03.2 Takım seçimi

- Kullanıcı lige ilk girdiğinde takım kartlarını, açıklamalarını ve görsel renklerini görür.
- `Takıma Katıl` onayı iki adımlıdır: seç → `Bu sezon için ... takımını seçiyorum` onayı; çift dokunma iki üyelik oluşturmaz.
- Başarılı üyelik `league_memberships` satırıdır; `user_id + season_id` unique.
- İlk lansmanda sezon içinde takım değişikliği **kapalı**. Güvenlik/yanlış seçim istisnası için destek başvurusu; onaylanırsa savaş katkıları ve oy kaydı geriye dönük değiştirilmez, ilgili sezon için oyun katkısı yeni takıma geçirilemez. Tercihen değişiklik sonraki sezonda yürürlüğe girer.
- Bir lig için takım seçmek başka lig üyeliğini değiştirmez.
- Ücretsiz takım değişikliği sezon arasında mümkün; önceki sezon rozetleri geçmişe bağlı kalır.

## 03.3 Sezonlar

- Yönetici başlangıç ve bitiş anını IANA saat dilimi ile tanımlar; DB'de `timestamptz` UTC saklanır.
- Aynı ligde bir anda en fazla bir `active` sezon. Gelecek sezon `scheduled` olabilir.
- Yeni sezon öncesi bütün cephe sınırları ve ağırlıkları **dondurulur**; sezon ortasında sınır değiştirilmez, tehlikeli cepheler oyun dışı alınabilir.
- Sezon bitiminde yeni katkı kabulü kesilir, aktif savaşlar önceden ilan edilen politika uyarınca tamamlanır veya “sezon dışı dostça savaş” olarak ayrılır; MVP: **sezon bitimine <24 saat kala yeni savaş başlatma kapalı**, mevcut savaşlar bitişten önce tamamlanacak şekilde başlatma penceresi daraltılır.
- Sahiplik sezonlar arasında varsayılan **taşınır**. Yeni sezonun cephe sayısı ve ağırlıklı kontrol tablosu mevcut sahiplikle başlar; **sezonluk destek oylaması yeniden sıfırlanır**. Bu açıkça anlatılır.
- Arşiv sezonun son durumunu, kayda geçen seçilmiş oy hesabını, sınır sürümünü ve kural sürümünü değişmez snapshot olarak tutar.

## 03.4 Yönetici ayarları — başlangıç değerleri

```yaml
league_rules_v1:
  battle_duration_hours: 24
  capture_protection_hours: 48
  contributions_per_user_per_battle: 1
  distinct_fronts_per_user_per_utc_day: 3
  minimum_attackers_to_win: 3
  minimum_neutral_claimants_to_win: 3
  tie_policy: defender_retains_or_neutral
  overlapping_battles_per_front: 1
  battle_start_cooldown_minutes: 60
  maximum_battles_started_per_user_per_day: 1
  eligibility_min_account_age_hours: 24
  integrity_required_for_counted_claims: true
  location_validation_required: true
  eligible_location_accuracy_meters: 40    # başlangıç hedefi; tek başına geçerlik kanıtı değil
  allowed_location_sample_window_seconds: 30
  claim_window_nonce_ttl_seconds: 120
  ranking_snapshot_seconds: 60
  push_notifications_per_league_per_user_per_day: 3
  front_weight_min: 1.0
  front_weight_max: 5.0
  minimum_age: 18
  claim_requires_foreground_app: true
```

Bu ayarlar güvenlik kontrolleriyle çeliştiğinde sunucunun daha sıkı kuralı geçerlidir. Risk eşikleri yayınlanabilir kurallara dahil edilmez; ayrı güvenli konfigürasyonda saklanır. Her savaş `rules_snapshot_json` kaydını alır; savaş başladıktan sonra değerler değiştirilemez.

---
# 04 — COĞRAFYA: SOKAK ÖLÇEĞİNDE CEPHELERİN ÜRETİMİ

## 04.1 Coğrafi katmanlar

```text
Dünya
 └── Ülke
      └── İl / eyalet
           └── İlçe / şehir
                └── Mahalle / oyun bölgesi
                     └── Cephe (sokak/yapı adası/alt bölüm)
                          └── Katılım noktaları (oyun için güvenli kamusal alan)
```

**Gerçek coğrafi isimler** kamuya açık yol/yer verilerinden gelir; ör. `Türkiye / Antalya / Alanya / Mahmutlar / Kumru Sokak / Cephe 03`. Bir sokağın birden fazla cephesi olabilir. `front_code` kalıcı örnek `ALN-MHM-KUM-003`. Sokak adı değişebilir; ID değişmez. Gerçek kadastro mülkiyet sınırları ve özel kişilerin adresleri gösterilmez.

## 04.2 Ham harita kaynakları ve lisans

- OSM yol ağı ve şehir/mahalle sınırları; harita verisi ODbL koşulları ve görünür `© OpenStreetMap contributors` atfıyla.
- Ticari üretimde **topluluk `tile.openstreetmap.org` sunucularına yoğun yüklenme veya toplu indirme yasak**; lisanslı vektör tile sağlayıcısı ya da kendi tile hizmeti kullan.
- Geometri üretimi için şehir bbox/OSM PBF içe aktar; `osm2pgsql`/GDAL/ogr2ogr gibi araçlar. Yol kesişimi ve üst geçit/alt geçit ayrımını topolojik olarak doğru işle.
- H3'ü indeks/süreç optimizasyonu için kullan; kullanıcıya gösterilecek poligonlar *gerçek sokaklara* göre hazırlanır.
- EPSG:4326 GeoJSON depolama/gösterim; metre hesabı için `geography` veya uygun lokal projeksiyon. Enlem/boylam koordinat sırası GeoJSON'da `[longitude, latitude]`.
- OSM lisans yükümlülüklerini, türetilmiş veri/üretilmiş iş ayrımını hukuk danışmanıyla doğrula; oyun sahiplik verilerinin lisans durumunu otomatik olarak OSM ile eşitleme.

## 04.3 Cephe oluşturma algoritması (deterministik)

**Girdiler:** OSM/şehir idari sınırı, güvenli yaya erişimi, bina blok/yol ağı, hedef alan büyüklüğü, riskli bölgelerin maskesi, sezon öncesi kayıtlı aktif oyuncu yoğunluğu.  
**Çıktılar:** geçerli, örtüşmeyen cephe poligonları; kalıcı kod; temsilî yol/sokak ismi; önerilmiş güvenli erişim noktası; komşuluk ilişkileri; fiziksel alana girmeden katılım mümkün olup olmadığı.

1. İdari bölgeyi doğrulanmış kapalı `MultiPolygon` olarak içe aktar.
2. Yaya/araç yollarını, kavşakları ve yapı adalarını topolojik veri modeline dönüştür. Üst geçit–alt geçitleri yanlış kesiştirme.
3. Su, yüksek hızlı yol ortası, özel mülk içi, askerî alan, okul/hastane hassas noktaları, erişilemeyen arazi, tehlikeli uçurum, tekne gerektiren alanlar için oyun erişim maskesi oluştur. Bu alanların **sanal sahipliği haritada olabilir** ancak oyuncular oraya gitmeye zorlanamaz; güvenli katılım noktası yoksa cephe `disabled`.
4. Sokaklarla çevrili yapı adalarını temel poligon adayları olarak oluştur (`polygonize` / `ST_Polygonize` + temizlik).
5. Her adayı hedef alana ve güvenli erişime göre incele. Ortalama H3 res10 yaklaşık **15.048 m²**, res11 yaklaşık **2.150 m²**; bunlar *referans alanlar*, otomatik zorunlu cephe boyutu değil.
6. Aşırı büyük yapı adalarını yol cephesine paralel ve erişilebilir yürüyüş segmentlerine böl; aşırı küçük alanları komşuya birleştir. Poligonları kesişimsiz ve deliksiz tut; oluşan parçaların alan toleransı şehir testinde kontrol edilir.
7. Her cepheye bir veya birkaç `play_zone` ata: kaldırım, kamusal yaya noktası, parkın güvenli giriş hattı, izinli ticari mekân önü. **Oynanabilirliğin ölçütü güvenli yaya erişimidir**, yalnızca poligonun merkez koordinatı değildir.
8. OSM isim ilişkilerine göre en uygun sokak adını ata; ad belirsizse `Mahmutlar · Cephe 142` kullan; aynı sokakta numaralandırma insanın okuyabileceği düzende olsun.
9. Aynı harita sürümünde iki aktif cephenin iç alanları üst üste binmesin; mikro geometrilerde 1–2 metre tolerans olabilir ama çakışan puan hakları olmasın.
10. Yol sınırından ayırıcı `adjacency` grafı üret (`ST_Touches` tek başına yetmeyebilir; ortak sınır uzunluğu filtresi + yaya grafı). Çizgiye değen ama gerçek geçişi olmayan iki alanı komşu kabul etme.
11. Her cepheye `map_version`, `geometry_hash`, `data_source_version`, `safety_review` ve `created_at` ekle.
12. Otomatik önerilerin tamamını admin harita editörüne aktar; **yayına almadan insan güvenlik kontrolü** yap.

**Basit üretim algoritması örneği:**

```python
# PSEUDOCODE. Üretimde geospatial library ve geometry validity tests gerekir.
def build_fronts(city_polygon, street_edges, excluded_zones, density_profile):
    road_blocks = polygonize_cleaned_street_network(street_edges, city_polygon)
    candidates = []
    for block in road_blocks:
        if is_hazardous_or_inaccessible(block, excluded_zones):
            continue
        target = desired_front_area(density_profile, block)  # sakin: daha büyük, yoğun: küçük
        pieces = split_or_merge(block, target, preserve_safe_access=True)
        for piece in pieces:
            zones = find_reviewable_public_play_zones(piece, street_edges, excluded_zones)
            if zones:
                candidates.append(make_front(piece, zones, stable_label=True))
    return validate_no_overlap_and_assign_adjacency(candidates)
```

## 04.4 Yoğunluğa göre cephe ölçeği

Başlangıç pilotunda yapı adası/sokak kesiti hedefi; aktif oyuncu yoğunluğuna göre sezon öncesi **sabit** cephe bölme/birleştirme işlemi yapılır. Sezon devam ederken sırf oyuncu arttı diye cephe bölünmez. Birleşmeden önce sahiplik anlaşmazlığı varsa önce bitiş kaydı ve yönetici kararı gerekir; yeni cephenin varsayılan sahibi `neutral`, geçmiş arşiv erişilebilir olur. Eski cephe ID'leri tekrar kullanılmaz; `front_lineage` ilişkisi tutulur.

**Sınır durumları:** Deniz, özel konut blokları, kapalı site, kavşak, viyadük, kent ormanı, dağ/orman yolu, ana yol, ülke sınırı, iki mahallenin kesişimi, çok uzun sokak, dar çıkmaz, GPS'in sapabildiği yüksek yapı koridorları, yeniden adlandırılan cadde. Bunların hepsi `geo-test` fixture olarak oluşturulmalı.

## 04.5 Konum kanıtı ve play zone

- Cephe sahipliği poligonu ile **oyuncunun katılım yaptığı güvenli bölge** aynı şey değildir.
- Her `play_zone` erişilebilir nokta veya küçük poligon; `front_id`, `safe_hours`, `notes`, `status`, `accuracy_policy`, `walkable_access=true`.
- Cepheyi bir sokak cephesi olarak işaretlemek için konum ölçümünün **izinli katılım bölgesi içinde ya da onaylı toleransta** olması gerekir.
- GPS sınırda sallanıyorsa kullanıcıya `Konum hassasiyeti yetersiz; güvenli bir yerde tekrar dene.` mesajı göster; fiziksel hareketi tehlikeli noktaya yönlendirme.
- Kullanıcı `Konumumu Göster`e basmadan sistem arka planda sürekli konum kaydetmez. Mobil uygulama açıkken aktif katkı eyleminde kısa örneklem alınır.
- Erişilebilir olmayan veya risk raporu gelen cephe `suspended` olur; savaş süresi durdurulur, sonradan uygun noktaya taşınır veya nötrleştirilir; işlem gerekçesi audit kaydında tutulur.

## 04.6 Harita sunumu

| Zoom kademesi | Gösterim | Etkileşim |
|---|---|---|
| Dünya/ülke | Ülke/şehir özet dağılımı, aktif lig | Yer seç, zoom yap |
| Şehir | Mahalle kontrol oranları, yoğunluk seçimi | Bölge seç |
| Mahalle | Küçük cephe poligonları ve sınırlar | Cepheye dokun |
| Sokak | Seçili cephe, güvenli katılım bölgesi, komşu cepheler | Ayrıntı paneli / gezinme |

- Harita katmanları ayrı: `base`, `ownership`, `contested`, `selection`, `safe_zones`, `boundaries`, `label`.
- Saldırıdaki cephe animasyonu **hareket hassasiyetine uygun**, düşük yoğunluklu sınır vurgusu; sürekli yanıp sönme yok.
- Renk körlüğüne uygun desen/çizgi stilleri; yalnız renge dayanan bilgi yasak.
- Atlas verisi tile/GeoJSON parçalaması, viewport filtreleme, cluster/aggregate ve LOD ile taşınır; tüm Türkiye'nin 100 binlerce poligonunu tek istekle yükleme.
- Poligon üzerine basma hassasiyetini cihaz ekranına göre `hitSlop` ile artır; birbiriyle komşu çok küçük bölgeler yanlış seçilmesin.

---

# 05 — OYUN DURUM MAKİNESİ VE FETİH İŞLEYİŞİ

## 05.1 Cephe ve savaş durumları

`front_season_state.status`: `neutral | owned | contested | protected | suspended | archived`.

`battle.status`: `proposed | active | settling | finalized | cancelled | paused | under_review`.

**İzinli geçişler:**

```text
Front:
  neutral -> contested -> owned/protected
  owned -> contested -> owned/protected
  protected -> owned (koruma biter)
  any active -> suspended (güvenlik müdahalesi)
  suspended -> previous-safe-state / neutral (inceleme)
  season_end -> archived snapshot (yeni sezon sahipliği ayrıca devam eder)

Battle:
  proposed -> active -> settling -> finalized
  proposed -> expired / cancelled
  active -> paused -> active (süre kaydırılarak)
  active/settling -> under_review -> settling/finalized/cancelled
```

DB, `finalized` durumunda immutable tally kaydı saklar. `cancelled` katkılar kullanıcı başarılarına katılmaz ve gerekçesi duyurulur.

## 05.2 Sahipsiz cepheler — başlangıç yarışı

1. Nötr cephede `Takımım İçin İşaretle` kullanıldığında, henüz bir savaş yoksa sunucu **24 saatlik neutral battle** açar ve bu kişinin katkısını koşullu kaydeder. Durumu `active`, `mode=neutral_open`.
2. Tüm takımlar aynı nötr savaşta katkı verebilir.
3. Sonuçta en çok `approved` **benzersiz hesap** katkısı alan takım, en az **3** katkı sınırını da geçiyorsa kazanır. Eşitlikte veya eşik altındaysa nötr kalır.
4. Savaş sona erince koruma penceresi başlar; kazanan yoksa kısa `neutral_retry_cooldown` uygulanır (varsayılan 6 saat).
5. Bir kişinin tek başına büyük bölgeyi anında kendi takımına boyaması **yasak**. Nötrden ilk fetih bile takım eylemi olmalı.

## 05.3 Sahipli cepheye rakip saldırısı

**Senaryo:** Kumru Sokak GS'de, FB oyuncusu gelmiş.

1. `state=owned` ve koruma süresi dolmuşsa kullanıcı `Saldırı Başlat` görür.
2. İlk başarılı işaretlemede `battle.status=proposed`, `attacker_team_id=FB`, `defender_team_id=GS`, `proposal_expires_at=+2 saat`. İlk katkı `reserved` tutulur, puan olarak henüz sayılmaz. UI: “İlk çağrıyı yaptın. Saldırının açılması için bir takım arkadaşın daha gerekli.”
3. İkinci **farklı ve güvenilir** FB oyuncusu 2 saat içinde `Takımım İçin İşaretle` yapınca, teklif `active` olur; iki ayrılmış katkı `approved`e alınır, `starts_at=now`, `ends_at=now+24 saat`.
4. Teklif süresinde ikinci katkı gelmezse `expired`, bekleyen katkılar geçersiz sayılır; kişisel günlük cephe kotası geri verilir (hileli denemeler ayrı kotalanabilir).
5. Saldırı aktifken FB ve GS üyeleri kendi takımlarına birer katkı verebilir. Üçüncü takım bu savaşın tarafı değildir; `Bu cephede başka iki takım mücadele ediyor` ekranı gösterilir, sonraki savaş için favoriye ekleme mümkün.
6. Her iki tarafın onaylanan katkıları anlık **ön sonuç** olarak görünür. `pending` katkılar ilan edilen toplamda sayılmaz.
7. Savaş sonunda FB en az 3 benzersiz onaylı katılımcıya sahipse **ve** FB katkısı > GS katkısı ise FB kazanır. Aksi hâlde GS korur; beraberlikte GS korur.
8. Kazanan yeni takım ise sahiplik FB'ye geçer ve 48 saat koruma başlar. Savunan kazandıysa (saldırı başarısız) **12 saat** aynı cephenin tekrar tekrar spam saldırıya açılmasını engelleyen savunma soğuma süresi uygulanır.
9. Yeni savaş açıldığında önceki savaşta işaretlemiş oyuncu yeniden bir kez katılabilir; ömür boyu hak tükenmez.

**Önemli kullanıcı denetimi:** Kullanıcıdan görünür kartta izin istenmeden “saldırı” başlatma; butonun üst yazısı ve onay metni açık olmalı. İkinci kişi tek dokunuşla hem teklifi açıp hem kendi katkısını saydırır; ayrı gizli ikinci tıklama gerekmez.

## 05.4 Savunma

- Sahibi takımın üyesi: `Cepheyi Savun` / aktif savaş ayrıntısında `Takımım İçin İşaretle`.
- Savunma için aktif savaşta cepheye ait güvenli play zone'da doğrulanmış konum gerekir. Geceleri fiziksel hareketi zorlamamak için görev noktaları güvenli saatlerle sınırlıdır; oyun görevinin asenkron olması başka kişiyi yakalamayı gerektirmez.
- Sahipli cephede aktif savaş yoksa fiziksel olarak oraya gidip rastgele +1 savunma biriktirme yok. Kullanıcı cepheyi favorileyebilir, yaklaşan operasyonları izleyebilir.
- Savaş başlayınca, cepheye ait eşik dışında da yakın ve güvenli kamusal oyun noktaları kullanılabilir; bizzat aynı kaldırımda buluşmak zorunlu değildir.

## 05.5 Katkı ve günlük kısıtlar

- `contributions`: `(battle_id, user_id)` veritabanında unique.
- Onaylanmış aynı `battle_id` içinde tekrar `+1` yapılmaz; UI `Bu savaşta katkın kaydedildi` gösterir.
- Günlük kota: bir ligde **farklı front_id adedi ≤3**, kullanıcı saat dilimi manipülasyonuna açık olmaması için **sunucu UTC günü** veya lig yerel gün sabiti (varsayılan `Europe/Istanbul`) kullanılır; sunucuda bir kez seçilip kural sürümüne yazılır. Varsayılan **lig yerel takvim günü**.
- Aynı sokakta arka arkaya biten iki ayrı savaş: yeni `battle_id`, yeni katkı hakkı; fakat 48 saat koruma zaten yeniden saldırıyı geciktirir.
- Bir kullanıcı aynı gün 3 farklı cepheye katkıda bulunduktan sonra dördüncü cepheyi inceleyebilir, savaşa **puanlı katılamaz**.
- Aynı katılımcı farklı şehirlerde kısa sürede görüldüyse risk kontrolü; önceki katkıyı otomatik silme, gerekli incelemeyi başlat.
- Yeni hesap olgunlaşma koşulu; SMS + integrite geçse bile ilk 24 saat puanlı katılım kapalı (güvenilir sosyal hesap veya etkinlik kullanımı için admince, auditli istisna mümkün).

## 05.6 Güvenlik veya bağlantı hataları

- Mobil çevrimdışıyken **savaş katkısı kuyruğa alınmaz**; konum, sunucu saatli challenge ve integrity anlık doğrulanmalıdır. `Bağlantı gerekli` mesajı.
- İstek zaman aşımına uğrarsa istemci aynı `Idempotency-Key` ile durumu sorgular, ikinci katkı oluşturmaz.
- Onay bekleyen katkı `pending`; panelde görünür, savaş skoruna henüz yansımaz; doğrulanırsa puanlanır.
- Aktif savaş `under_review` olursa sonucu kesinleştirme askıya alınır; durum ve çözüm süresi tahmini verilmez, kullanıcılara bildirilecek güvenli mesaj yazılır.
- Konum reddi halinde haritayı inceleme ve şehir istatistikleri kullanılabilir; yalnız **puanlı işaretleme** kapalıdır.

## 05.7 Tam karar tablosu

| Front durumu | Kullanıcı | Buton/eylem | Sunucu sonucu |
|---|---|---|---|
| neutral | lig üyesi, izinli yerde, güvenilir | `Takımım İçin İşaretle` | nötr yarış aç/katkı |
| owned, saldırı yok, koruma yok | rakip lig üyesi | `Saldırı Başlat` | teklif başlat |
| owned, saldırı yok, koruma var | rakip | `Koruma Bitince Hatırlat` | bildirim tercihi, katkı yok |
| proposed | saldıran takımın farklı üyesi | `Saldırıya Katıl` | 2. güvenilir katkıda aktif |
| proposed | savunan takım | `Cepheyi Takip Et` | önerilen saldırı açılana kadar savunma puanı yok |
| active | saldıran takım | `Takımım İçin İşaretle` | attack +1 (tekil) |
| active | savunan takım | `Cepheyi Savun` | defend +1 (tekil) |
| active | üçüncü takım | `Bu Savaşı İzle` | salt okunur |
| any | konum izni yok | `Konum İznini Aç` | OS izni iste |
| any | günlük kota dolu | `Yarın Yeniden Katıl` (pasif) | kota nedeni ve yenilenme zamanı |
| any | suspended | `Neden Kapalı?` | açıklama ve destek |
| any | aynı battle'da katkı var | `Katkın Kaydedildi` (pasif) | ek işlem yok |
| active | risk incelemesi | `İncelemede` (pasif) | puan kesinleşene kadar beklet |

## 05.8 Atomik savaş sonuçlandırma

`SETTLE(battle_id)` yalnızca worker'da çalışır; idempotent. İşlem:

1. DB transaction aç; `SELECT ... FOR UPDATE` ile battle ve ilgili `season_front_state` satırlarını kilitle.
2. `status=active` ve `ends_at <= database_now()` koşulunu doğrula; değilse çık.
3. `status=settling`; erken itiraz/güvenlik işlemleri nedeniyle blok varsa `under_review`.
4. Sadece `approved`, `valid_before_deadline`, `not_voided`, `same_season` katkıları `(team_id, COUNT(DISTINCT user_id))` gruplandır.
5. `neutral_open` için en yüksek tekil katkı ve minimum eşik; eşitlikte tarafsız. `attack` için saldıran katkı > savunan katkı + min eşik; aksi halde savunan kalır.
6. `battle_team_tallies` ve `battle_result` kaydını `rules_snapshot_hash`, `tally_hash`, tarih ve kazanan ile yaz.
7. Kazanan değiştiyse front sahipliğini güncelle, `protection_until` hesapla; değişmediyse savunma cooldown koy.
8. `battle.finalized`, `front_version++`, `outbox_event` oluştur, transaction commit.
9. Ayrı worker outbox üzerinden bildirim/leaderboard materialization başlatır. Aynı job tekrar çalışırsa mevcut finalized sonucu döndürür; **asla iki kez galibiyet/ödül vermez**.
10. Sonradan hile kanıtlanırsa doğrudan eski veriyi sessizce güncelleme; `battle_reversal` onaylı denetim olayı oluştur, bağımlı cephe zinciri varsa adil yeniden hesaplama/karar prosedürünü uygula, oyunculara açık “sonuç düzeltildi” kaydı göster.

```ts
// Saf fonksiyon: ilk sürüm; gerçek uygulamada üretilen testlerle eşleştir.
type Tally = { teamId: string; approvedUniquePlayers: number };
export function winnerOfBattle(input: {
  kind: 'neutral_open' | 'attack';
  defendingTeamId?: string;
  attackingTeamId?: string;
  allTeamTallies: Tally[];
  minAttacker: number;
}): string | null {
  const counts = new Map(input.allTeamTallies.map(x => [x.teamId, x.approvedUniquePlayers]));
  if (input.kind === 'attack') {
    const attack = counts.get(input.attackingTeamId!) ?? 0;
    const defend = counts.get(input.defendingTeamId!) ?? 0;
    return attack >= input.minAttacker && attack > defend
      ? input.attackingTeamId! : input.defendingTeamId!;
  }
  const ordered = [...input.allTeamTallies].sort(
    (a,b) => b.approvedUniquePlayers - a.approvedUniquePlayers
  );
  if (!ordered.length || ordered[0].approvedUniquePlayers < input.minAttacker) return null;
  if (ordered[1]?.approvedUniquePlayers === ordered[0].approvedUniquePlayers) return null;
  return ordered[0].teamId;
}
```

---

# 06 — KALABALIK SOKAKLAR, YEREL SEÇİM BENZERİ SONUÇ VE LİDERLİK ALGORİTMASI

**Tasarım problemi:** Takım A 10 sokaktan 8'ini kontrol ediyor olabilir; Takım B yalnızca 2 sokak kontrol eder ama bu iki bölgede çok daha fazla **gerçek katılımcı** vardır. Kullanıcı her iki gerçeği de görmeli: **coğrafi üstünlük** ve **insan desteği**. İkisinin tek, belirsiz bir yüzdeye karışması kesinlikle yasaktır.

## 06.1 Üç eşzamanlı gösterge

### A. Cephe çoğunluğu — `front_control_share`

Şehirdeki etkin ve oynanabilir cephelerin sahiplik adedi üzerinden hesaplanır:

`front_count(team, region) = COUNT(owned_fronts of team within region)`

`front_share(team) = front_count(team) / total_playable_fronts * 100`

Nötr/korumalı/çatışmalı cephelerde en son **kesinleşmiş** sahibi kullan; nötrler paydaya girer ama takımlara yazılmaz. `suspended` ve `archived` cepheleri paydaya dahil etme. Geçici savaş sonucu kesinleşmemişse sahip değişmiş gibi gösterme.

### B. Doğrulanmış halk desteği — `verified_support_share`

Yerli seçimdeki oy sayısı sezgisinin ürün karşılığı: belirtilen şehir/ilçe/mahalle kapsamındaki **farklı onaylı oyuncu hesaplarının** hangi takıma katıldığı. Her kullanıcı bu destek istatistiğine lig sezonunda en fazla **bir kez**, ilk onaylı fiziksel katkısının gerçekleştiği cephe, mahalle ve şehir oyun alanıyla kaydedilir; böylece mahalleden şehre ve ile doğru toplulaştırma yapılır.

`support_count(team, city, season) = COUNT(DISTINCT season_voter.user_id where team_id=team AND assigned_city=city AND status=verified)`

`support_share = support_count(team) / SUM(verified_support_counts of all teams in city) * 100`

**Önemli veri doğruluğu:** Bu seçim veya nüfus ölçümü değildir, yalnızca *doğrulanmış oyun hesapları içinde destek yüzdesidir*. Bir gerçek kişinin birden fazla hesap açması %100 önlenemez. Harita üzerinde veya duyuruda “resmî oy” / “şehrin gerçek seçmeni” gibi ifadeler kullanma. Ürün dili: `Doğrulanmış Oyuncu Desteği`.

**Kural:** Her oyuncu sezon içinde bir kez `season_voter` kaydı alır (`season_id + user_id` unique). İlk güvenilir fiziksel katkıda cephe/mahalle/şehir atanır; daha sonra başka cephe veya şehre gitse bile aynı sezonda ikinci bir oy desteği kaydı oluşmaz. Daha üst coğrafi raporlar bu ilk cephe konumundan ilçe/il/ülke hiyerarşisine toplulaştırılır. Böylece 1 kişi 20 cephede oynayıp 20 oy gibi sayılmaz. Farklı sezonda yeni destek kaydı açılabilir. Yerleşim/adres verisi **gerekmez**. Bu ölçüm oyuncunun doğum yeri veya kalıcı ikametini değil, ilk doğrulanmış katılım yerini gösterir.

**Mahalle/sokak detayı:** `season_voters.first_front_id` ile tek bir cephenin kaydedilmiş, benzersiz oyuncu desteği ölçülebilir; bu, o cephedeki bütün savaş katılımlarının toplamı değildir. Şehir sonucu ise her oyuncunun ilk atandığı cepheden yalnız bir defa üst bölgeye yansır. Mahalle bazında `<5` gibi küçük örneklemler gizlenir.

**Örnek (tam istenen senaryo):**

| Mahalledeki cepheler | Kazanan | O cepheden katılmış, şehir bazında daha önce sayılmamış kullanıcılar |
|---|---|---:|
| 8 ayrı sakin sokak | Galatasaray | Toplam 80 farklı oyuncu |
| 2 ayrı yoğun sokak | Fenerbahçe | Toplam 160 farklı oyuncu |
| **Sonuç** | **GS 8, FB 2 cephe** | **GS 80 (%33,33), FB 160 (%66,67) doğrulanmış destek** |

Bu 240 kişi birbirinden farklı ve ilk atanan şehir aynı olmak zorundadır; tablodaki sayılar **temsili veri**, gerçek Alanya istatistiği değildir. Aynı kullanıcı başka cepheye katkı verirse sokak savaşına +1 eklenebilir ama şehir destek oranı +1 daha artmaz.

### C. Ağırlıklı harita hâkimiyeti — `weighted_control_share`

Bazı cepheler şehir yaşamında daha önemli/yoğun olabilir. Şehrin 8 sakin sokağına karşı 2 yoğun caddenin önemini göstermek için sezon başlamadan **sabit** `front_weight ∈ [1, 5]` hesapla. Skor:

`weighted_control(team) = Σ front_weight(f) for each playable front f whose owner=team`

`weighted_share(team) = weighted_control(team) / Σ front_weight(all playable fronts) * 100`

**Örnek:** GS'nin sekiz sokağının her biri 1,2 puan = **9,6** ağırlıklı kontrol; FB'nin iki yoğun cephesinin her biri 5,0 = **10,0** ağırlıklı kontrol. GS **8–2 cephe çoğunluğuyla**, FB ise **%51,02–%48,98 ağırlıklı kontrol üstünlüğüyle** önde olabilir.

Bu endeks bir “oy sayısı” değildir. Kullanıcı ekranında ayrı etiketle gösterilir: `Ağırlıklı Hâkimiyet`. Bir takım tek dev cephe ile koca şehri sonsuz etkileyemez; katsayı üst sınırı **5.0**.

## 06.2 Ağırlık nasıl hesaplanmalı?

`front_weight` gerçek zamanlı kalabalık anlık GPS akışından **üretilmez**. Bu hem manipülasyona açık hem mahremiyet açısından sakıncalı olur.

Sezon öncesi dondurulan örnek formül (parametreler saha testiyle ayarlanabilir):

```text
w_f = round_to_2_decimals(
    clamp(
      1.0 + 2.0 * normalized_population_density_f
          + 2.0 * normalized_historical_verified_activity_f,
      min=1.0, max=5.0
    )
)
```

- `normalized_population_density_f ∈ [0,1]`: kamuya açık **toplu** nüfus/yerleşim yoğunluğu verisinin mahalle veya yeterince büyük güvenilir istatistik alanındaki değeri; cepheye sahte kişi sayısı atama. Güncel, yeterince ayrıntılı ve lisanslı kaynak yoksa bu terimi **0** yap.
- `normalized_historical_verified_activity_f ∈ [0,1]`: önceki tamamlanmış sezonların güvenlik filtreli, farklı hesap sayısının şehir bazlı robust percentile normalizasyonu; son 28 günlük kayıttan hesaplanabilir ancak **yalnızca sonraki sezon ağırlığına** yansır; yeni ligde 0.
- Kaynak güveni, `method_version`, `calculated_at`, `safety_decision`, `admin_approved_by` saklanır.
- Kişisel konum geçmişlerinden ve gerçek zamanlı oyuncu yığılmasından nüfus tahmin etmeyin.
- Sezon boyunca yeni bir gruplaşma daha fazla ağırlık yaratmaz; ağırlık ancak sonraki sezonun onaylı haritasında değişebilir.
- Çok dar coğrafi destek dağılımından hassas grup özelliği veya özel kişi kimliği çıkarılmaması için az sayıdaki destek toplamını gizle (`<k`, örn. k=5).

**Alternatif ilk sezon:** Kamuya açık güvenilir yoğunluk yoksa bütün cephelere `weight=1.0` ver; `verified_support_share` yine kalabalık cephelerin etkisini gösterecektir. Veriye dayanmayan 5x ağırlık uydurma.

## 06.3 Sunum kuralları — kimin kazandığı hangi anlama gelir?

Her şehir ekranında **üç ayrı sekme/ölçüm**:

- `Cephe`: “GS: 145, FB: 110, BJK: 45 cephe.”
- `Destek`: “GS: 420, FB: 610, BJK: 215 doğrulanmış oyuncu.”
- `Ağırlık`: “GS: %47, FB: %49, BJK: %4 ağırlıklı kontrol.”

Ürün **tek bir genel kazanan** ilan edecekse sezon kurallarında açıkça `championship_metric` seçilmeli; MVP varsayılanı `weighted_control_share`, eşitlikte `front_count`, sonra `verified_support`, hâlâ eşitse ortak galip. Destek ekranında FB önde diye otomatik şampiyon FB değildir; `Bu ligde sezon kupası Ağırlıklı Harita Hâkimiyeti ile belirlenir` bilgisi gösterilir. Yöneticinin bu metriği sezon ortasında değiştirmesi yasak.

## 06.4 SQL hesap mantığı (görünür, denetlenebilir)

```sql
-- Şehirde oynanabilir ve aktif sezon cepheleri için toplamlar; örnek.
SELECT s.owner_team_id AS team_id,
       COUNT(*) AS front_count,
       SUM(fw.weight) AS weighted_control
FROM season_front_states s
JOIN fronts f ON f.id = s.front_id
JOIN front_season_weights fw ON fw.season_id = s.season_id AND fw.front_id = s.front_id
WHERE s.season_id = :season_id AND f.city_region_id = :city_id
  AND s.status NOT IN ('suspended', 'archived')
  AND s.owner_team_id IS NOT NULL
GROUP BY s.owner_team_id;

-- Her kullanıcı tek bir şehirde yalnızca bir kez, sezonluk destekçi sayılır.
SELECT team_id, COUNT(*) AS verified_support
FROM season_voters
WHERE season_id = :season_id AND city_region_id = :city_id AND status='verified'
GROUP BY team_id;
```

**Matematik testi:** `SUM(front_shares) ≤100%`, nötrler varsa `<100%`; `SUM(support_share)=100%` (oyuncu varsa); `SUM(weighted_shares) ≤100%`; hiç oyuncu yoksa “Henüz destek kaydı yok”, sıfıra bölme yok. Yüzdeler 1 ondalığa yuvarlanır, toplamda 99,9 veya 100,1 hata arayüzde son elemana düzeltmeyle giderilebilir fakat DB ham oranı saklar.

## 06.5 Savaş çoğunluğu ile büyük kalabalığın uzlaşması

- Tek bir **cephe savaşının** sonucunu “katılan farklı hesapların basit çoğunluğu” belirler. Örneğin GS 17, FB 30 → FB kazanır.
- **Bir cephede +50 kişilik fark** başka cepheyi doğrudan değiştirmez. O cepheye katılan ekstra farklı oyuncular, önceden atanmamışlarsa **şehir destek yüzdesine** katkıda bulunur.
- Kalabalık cephe, sabit ağırlığı yüksekse, **ağırlıklı kontrol** tablosunda da daha önemli olabilir.
- Böylece oyunun yerel adaleti korunur: “FB Kumru Sokak'ta 100 kişi topladı, Alanya'daki 30 farklı sokağı doğrudan ele geçirdi” gibi saçma bir mekanik yoktur.

---
# 07 — ANTI-CHEAT, KONUM DOĞRULAMA, BOT / MULTI-ACCOUNT SAVUNMASI

**Tehdit modeli:** sahte GPS, fake device, değiştirilen mobil uygulama, emulator, rooted/jailbroken cihaz, replay edilen attestation, SMS çiftliği, yüzlerce telefon numarası, çalıntı oturum, sahte ağ istekleri, click farm, sahte konumdan kitlesel işaretleme, koordineli botlar, görev/teklif spam'i, hesap ele geçirme, admin suiistimali, sahte sosyal yakınlık, GPS drift.

**Temel ilke:** Hiçbir yöntem tek başına “gerçek insan + gerçek konum” garantilemez. Çoklu kanıt + risk skoru + manuel inceleme + olayı geri çevirebilme ile sahteciliğin maliyetini yükselt ve etkinliğini sınırlı tut.

## 07.1 Çok katmanlı güvenlik

1. **Hesap katmanı:** Parola yerine doğrulanmış OTP/passkey; rate limit; tekil telefon kullanımı (numara tekrar atama ve geri dönüştürme istisnalarıyla); şüpheli toplu hesap açılmasının analizi; erişim/refresh oturum iptali.
2. **Cihaz katmanı:** Android Play Integrity ve Apple App Attest; platforma göre server challenge; fail-open yalnız sınırlı salt-okunur erişimde, `claim` işlemlerinde `review/pending` veya `deny`.
3. **Konum katmanı:** Foreground yüksek doğrulukta kısa örnek, sağlayıcı hassasiyeti, örnekler arası tutarlılık, imkânsız seyahat, sunucu zamanıyla karşılaştırma, izinli geofence.
4. **İşlem katmanı:** `claim_challenge` için tek kullanımlık nonce, user/device/battle/front/action binding, kısa TTL, imzalı yetki, DB unique/idempotency.
5. **Davranış katmanı:** Aynı IP/device/ASN/şüpheli konum örgüsü, yeni hesapların eşzamanlı katkıları, aynı adrese sıkışma, aynı dakika toplu katılım, yüksek otomasyon örüntüsü; **tek sinyalle kalıcı ban yok**.
6. **Operasyon katmanı:** şüpheli katkıyı `pending_review` tut; savaş kesinleşmesini gerektiğinde beklet; itiraz ve açıklanabilir admin olayı.

## 07.2 Katkı güvenlik akışı

```text
TAP: Takımım İçin İşaretle
  -> GET /claims/eligibility(front, league) [salt-okunur]
  -> POST /claims/challenge {front, battle?, client_device_id, action}
     -> auth + membership + age + quotas + battle state + location permission info
     <- challenge_id, nonce, expires_at, required_integrity_level
  -> App foreground location samples (e.g. 2-3 readings, max 30 seconds)
  -> Native Play Integrity / App Attest request bound to challenge
  -> POST /claims {challenge_id, location_samples, integrity_proof, idempotency_key}
     -> verify signature + nonce + expiry + app package/bundle + server challenge
     -> verify time, samples, play_zone, accuracy & plausible movement
     -> verify season/team/front/battle and quota atomically
     -> risk engine decision: APPROVE / REVIEW / REJECT
     -> append evidence + contribution ledger in one transaction
     <- outcome + battle scoreboard version + receipt
  -> Refresh battle/front/leaderboard; never trust client-side score.
```

Güvenlik kanıtı önceden çözülmüş bir hesabın her isteğine yeniden körlemesine bağlanmaz; yüksek riskli `claim` başına challenge gereklidir. Server-side Google/Apple doğrulama önerilerindeki geçerlilik, nonce/hash, package/bundle, certificate, timestamp ve replay korumasına uy. Değişen platform detaylarına göre uygulama güncellemesinde test et.

## 07.3 Konum politikasının hassas ayrıntıları

- İzin yalnız puanlı eylem sırasında: “Bu cephede bulunduğunu doğrulamak için, uygulama açıkken kısa süreli konum kullanılır.”
- Konumu görme/gezme izni yokken harita tümüyle engellenmez.
- `location_samples` doğruluk/timestamp içeren örneklerdir; **ham koordinat kullanıcılar arası paylaşılmaz**.
- Son ölçüm süresi sunucu kontrolünde; geçmişten gönderilmiş ekran görüntüsü/GPS kaydı geçersiz.
- Konumun accuracy bilgisi düşükse `RETRY_AT_SAFE_POSITION`; “yolun ortasına yürü” gibi yönlendirme asla yok.
- Çok hassas rota/gece ev adresi çıkarmaya elverişli sürekli GPS geçmişi tutulmaz.
- Ham kanıt DB'de şifreli ve kısa süreli (öneri 24–72 saat, açık güvenlik vakası istisnası); sonra kaba bölge/kanıt sonucu dışındaki alanları sil. Kesin saklama süreleri hukuk ve güvenlik incelemesinden sonra uygulanır.
- Aynı cihazla 2 kardeş veya aile üyesi kullanabilir; aynı IP'den gelen bütün hesapları otomatik engelleme. Sinyalleri birleştir, adil itiraz sun.

## 07.4 Trust / risk karar sistemi

**İç modül arayüzü:**

```ts
type ClaimRiskResult = {
  decision: 'approve' | 'review' | 'reject';
  reasonCodes: string[];        // internal only; kullanıcıya hassas eşikler gösterilmez
  riskBucket: 'low' | 'medium' | 'high';
  proofVersion: string;
  evidenceReferenceIds: string[];
  evaluatedAt: string;
};
```

**MVP risk kuralları:** aktif/başarılı cihaz attestation yok; nonce tekrar; hesabın 24 saatten yeni olması; konum dışı; zaman damgası tutarsız; aşırı hız; günlük kota dolu; daha önce aynı savaşta geçerli katkı; eşzamanlı farklı şehirlerde katkı; moderasyon ban. Bazıları kesin `reject`, bazıları `review`. Gereksiz veri toplama/biometrik doğrulama yok.

**Hangi karar geri alınabilir?** Tüm `review` kararları yetkili iki aşamalı süreçle onay/red alır. `reject` hata nedeniyle itiraz edilebilir. Sistem `risk_reason_codes` teknik ayrı kayıt; kullanıcı sadece `Konum doğrulanamadı`, `Güvenlik incelemesi gerekiyor` gibi uygun düzeyde açıklama alır.

## 07.5 Güvenli gerçek dünya tasarımı

- Fiziksel buluşma, rakip bulma, yüzleşme, yer işgali, zorunlu hızlı yürüme, araç sürerken puan, gece riskli görev **yok**.
- Stadyum önleri, maç gününde yoğun toplanma alanları, protesto/toplanma alanları, hastaneler, okul yerleşkeleri, askeri bölgeler, özel mülkler ve trafik riski yüksek konumlar özel dikkatle devre dışı.
- Oyuncunun konumunu rakip takım oyuncuları, yönetici dışı moderatörler, sponsorlar veya genel harita izleyicileri göremez.
- Gerçek kulüp taraftarlarıyla ilgili sözlü tehdit ve koordinasyon, kullanıcı rapor modülüyle ele alınır. Oyunda chat/DM lansmanda yoktur; kullanıcı adı bile moderasyondan geçer.
- `18+` giriş doğrulaması, topluluk kuralları ve uygulama mağazası yaş sınıflandırması yapılır; çocuk hedefleyen pazarlama kullanılmaz.
- Kullanıcı “Şu cephede daha güvenli katılım noktası öner” talep edebilir; anonim ve güvenli olay raporu eklenir.
- Aktif bir tehlike iddiasında cephenin oynanabilirliği tek tıkla `suspended` durumuna alınabilir.

## 07.6 Güvenlik başarı kriterleri

- 1 challenge yalnız bir katılım için kabul edilir.
- Aynı `(battle_id,user_id)` için eşzamanlı 100 istek atılsa bile en fazla 1 geçerli katkı.
- Eski/çalıntı token kullanımı reddedilir.
- Fake integrity proof asla otomatik `approved`e dönüşmez.
- Şüpheli katılım `pending_review` olduğu sürece savaş sonucunu değiştirmez.
- Yanlış pozitif güvenlik kararları için destek bileti ve denetlenebilir inceleme ekranı bulunur.
- Konum verileri dışa aktarılan analitiklerde bulunmaz; analitik coğrafi hücreler minimum kalabalık eşiğine göre gruplanır.

---

# 08 — VERİTABANI TASARIMI (POSTGRESQL + POSTGIS)

## 08.1 Sözleşme / şema standardı

- UUID PK (`gen_random_uuid`), `timestamptz` UTC, para için `numeric(12,2)`, koordinat için `geometry/geography`.
- Soft delete ancak gerektiği yerde; topluluk/gizlilik silme talepleri için kimlik ve oyun kayıtları ayrılır. Silinen kullanıcının `public_display_name`ı anonimleştirilir, kesinleşmiş tarihî savaşın denetlenebilir anonim katkısı korunabilir; hukuki dayanak ve saklama süresi ayrı kontrol edilir.
- Yüksek hacimli `location_proofs`, `battle_events`, `security_events`, `outbox_events` ay/hafta bazlı partition edilebilir; ilk pilotta daha basit yapı yeterli.
- Kimlik/konum delilleri ayrı erişim şemasında/şifreli kolonda saklanır; tabloya doğrudan mobil erişim yok. Tüm erişim API'den.
- Tek bir sezona ait `league_id`yi `seasons` üzerinden doğrula; cross-league ve cross-season id karışmasına uygulama ve DB düzeyinde izin verme.
- Migrations sırayla ve geri uyumlu; staging'de rollback/backup deneyleri zorunlu.

## 08.2 ER ilişki haritası

```text
users --< user_devices
  | \--< auth_sessions
  | \--< league_memberships >-- teams
  |           \-- seasons >-- leagues
  |                         \-- league_rule_versions
  |                            \-- league_territory_maps >-- map_versions
  |                                                        \-- fronts >-- play_zones
  |                                                        \-- front_adjacencies
  |                            \-- season_front_states >-- fronts
  |                            \-- front_season_weights >-- fronts
  |                            \-- battles >-- battle_team_tallies
  |                                       \-- battle_contributions >-- users
  |                                             \-- claim_challenges
  |                                             \-- location_proofs
  |                            \-- season_voters >-- users + city_region
  |                            \-- season_awards
  |                            \-- ranking_snapshots
  +--< notifications
  +--< user_reports
  +--< moderation_actions
  +--< security_events / review_cases
admin_users --< admin_audit_logs
```

## 08.3 Uygulanabilir ana DDL başlangıcı

Aşağıdaki SQL bir **çekirdek başlangıç migrasyonudur**. Ortamın gerekli PostGIS/pgcrypto sürümlerini kur; `auth` ve `risk` detay tablolarının alt bölümdeki sözleşmelerini ikinci migrasyonda tamamla. Uygulama bu DDL'yi yalnızca ER taslağı olarak değil, migration testine alınacak gerçek temel olarak kabul etmeli.

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  handle varchar(32) NOT NULL UNIQUE,
  display_name varchar(72) NOT NULL,
  locale varchar(10) NOT NULL DEFAULT 'tr',
  birth_year smallint,
  email_ciphertext bytea,
  phone_ciphertext bytea,
  email_lookup_hash char(64),
  phone_lookup_hash char(64),
  status text NOT NULL DEFAULT 'active'
    CHECK(status IN ('active','limited','suspended','deleted')),
  age_18_confirmed_at timestamptz,
  terms_version text NOT NULL,
  privacy_version text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);
CREATE UNIQUE INDEX uq_phone_hash_not_null ON users(phone_lookup_hash)
  WHERE phone_lookup_hash IS NOT NULL AND status <> 'deleted';
CREATE UNIQUE INDEX uq_email_hash_not_null ON users(email_lookup_hash)
  WHERE email_lookup_hash IS NOT NULL AND status <> 'deleted';

CREATE TABLE auth_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  refresh_token_hash char(64) NOT NULL UNIQUE,
  device_id uuid,
  expires_at timestamptz NOT NULL,
  revoked_at timestamptz,
  last_seen_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_sessions_user ON auth_sessions(user_id,expires_at);

CREATE TABLE user_devices (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  platform text NOT NULL CHECK(platform IN ('android','ios')),
  device_key_hash char(64),
  attest_key_id text,
  app_version text,
  integrity_status text NOT NULL DEFAULT 'unknown',
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at timestamptz NOT NULL DEFAULT now(),
  revoked_at timestamptz
);
CREATE INDEX ix_devices_user ON user_devices(user_id);

CREATE TABLE admin_users (
  user_id uuid PRIMARY KEY REFERENCES users(id),
  role text NOT NULL CHECK(role IN ('super_admin','league_admin','map_editor','moderator','analyst','support')),
  mfa_enabled boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE leagues (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug varchar(72) NOT NULL UNIQUE,
  name_i18n jsonb NOT NULL,
  description_i18n jsonb NOT NULL DEFAULT '{}'::jsonb,
  banner_asset_key text,
  status text NOT NULL DEFAULT 'draft'
    CHECK(status IN ('draft','review','scheduled','active','paused','archived')),
  timezone text NOT NULL DEFAULT 'Europe/Istanbul',
  age_min smallint NOT NULL DEFAULT 18 CHECK(age_min >= 18),
  allowed_country_codes text[] NOT NULL DEFAULT ARRAY['TR'],
  public_at timestamptz,
  created_by uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE teams (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id uuid NOT NULL REFERENCES leagues(id),
  slug varchar(72) NOT NULL,
  name_i18n jsonb NOT NULL,
  about_i18n jsonb NOT NULL DEFAULT '{}'::jsonb,
  color_primary char(7) NOT NULL,
  color_secondary char(7) NOT NULL,
  emblem_asset_key text,
  status text NOT NULL DEFAULT 'active'
    CHECK(status IN ('active','disabled')),
  order_no integer NOT NULL DEFAULT 0,
  UNIQUE(league_id, slug),
  UNIQUE(id,league_id)
);

CREATE TABLE league_rule_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id uuid NOT NULL REFERENCES leagues(id),
  version integer NOT NULL,
  rules_json jsonb NOT NULL,
  rules_hash char(64) NOT NULL,
  approved_by uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(league_id,version)
);

CREATE TABLE seasons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id uuid NOT NULL REFERENCES leagues(id),
  title_i18n jsonb NOT NULL,
  status text NOT NULL DEFAULT 'scheduled'
    CHECK(status IN ('draft','scheduled','active','closing','finished','archived')),
  rule_version_id uuid NOT NULL REFERENCES league_rule_versions(id),
  championship_metric text NOT NULL DEFAULT 'weighted_control'
    CHECK(championship_metric IN ('weighted_control','front_count','verified_support')),
  starts_at timestamptz NOT NULL,
  ends_at timestamptz NOT NULL,
  freeze_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  CHECK(ends_at > starts_at),
  UNIQUE(id,league_id)
);
CREATE UNIQUE INDEX uq_active_season_per_league ON seasons(league_id)
  WHERE status='active';
CREATE INDEX ix_seasons_schedule ON seasons(league_id,starts_at,ends_at);

CREATE TABLE league_memberships (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  league_id uuid NOT NULL REFERENCES leagues(id),
  team_id uuid NOT NULL,
  joined_at timestamptz NOT NULL DEFAULT now(),
  status text NOT NULL DEFAULT 'active'
    CHECK(status IN ('active','banned','removed')),
  UNIQUE(user_id,season_id),
  FOREIGN KEY(team_id,league_id) REFERENCES teams(id,league_id),
  FOREIGN KEY(season_id,league_id) REFERENCES seasons(id,league_id)
);
CREATE INDEX ix_memberships_team ON league_memberships(season_id,team_id);

CREATE TABLE geographic_regions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  parent_id uuid REFERENCES geographic_regions(id),
  level text NOT NULL CHECK(level IN ('country','province','city','district','neighborhood')),
  canonical_code varchar(72) UNIQUE,
  name_i18n jsonb NOT NULL,
  geom geometry(MultiPolygon,4326),
  center geometry(Point,4326),
  is_playable boolean NOT NULL DEFAULT true,
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_regions_geom ON geographic_regions USING gist(geom);
CREATE INDEX ix_regions_parent ON geographic_regions(parent_id);

CREATE TABLE map_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  city_region_id uuid NOT NULL REFERENCES geographic_regions(id),
  version integer NOT NULL,
  name text NOT NULL,
  source_version text,
  status text NOT NULL DEFAULT 'draft'
    CHECK(status IN ('draft','review','published','retired')),
  reviewed_by uuid REFERENCES admin_users(user_id),
  published_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(city_region_id,version)
);

CREATE TABLE fronts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  map_version_id uuid NOT NULL REFERENCES map_versions(id),
  city_region_id uuid NOT NULL REFERENCES geographic_regions(id),
  neighborhood_region_id uuid REFERENCES geographic_regions(id),
  front_code varchar(80) NOT NULL,
  display_name_i18n jsonb NOT NULL,
  street_name text,
  geom geometry(MultiPolygon,4326) NOT NULL,
  center geometry(Point,4326) NOT NULL,
  h3_index varchar(20),
  area_m2 double precision NOT NULL CHECK(area_m2 > 0),
  geometry_hash char(64) NOT NULL,
  safety_status text NOT NULL DEFAULT 'pending'
    CHECK(safety_status IN ('pending','approved','suspended','rejected')),
  enabled boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(map_version_id,front_code),
  CHECK(ST_IsValid(geom))
);
CREATE INDEX ix_fronts_geom ON fronts USING gist(geom);
CREATE INDEX ix_fronts_center ON fronts USING gist(center);
CREATE INDEX ix_fronts_city_map ON fronts(city_region_id,map_version_id,enabled);
CREATE INDEX ix_fronts_h3 ON fronts(h3_index);

CREATE TABLE play_zones (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  front_id uuid NOT NULL REFERENCES fronts(id),
  geom geometry(MultiPolygon,4326) NOT NULL,
  label_i18n jsonb NOT NULL DEFAULT '{}'::jsonb,
  safety_notes text,
  safe_hours_json jsonb,
  status text NOT NULL DEFAULT 'pending'
    CHECK(status IN ('pending','approved','suspended','disabled')),
  reviewed_by uuid REFERENCES admin_users(user_id),
  reviewed_at timestamptz,
  CHECK(ST_IsValid(geom))
);
CREATE INDEX ix_play_zones_geom ON play_zones USING gist(geom);
CREATE INDEX ix_play_zones_front ON play_zones(front_id,status);

CREATE TABLE front_adjacencies (
  front_id_a uuid NOT NULL REFERENCES fronts(id),
  front_id_b uuid NOT NULL REFERENCES fronts(id),
  walkable boolean NOT NULL DEFAULT false,
  PRIMARY KEY(front_id_a,front_id_b),
  CHECK(front_id_a <> front_id_b),
  CHECK(front_id_a < front_id_b)
);

CREATE TABLE front_lineage (
  predecessor_front_id uuid NOT NULL REFERENCES fronts(id),
  successor_front_id uuid NOT NULL REFERENCES fronts(id),
  reason text NOT NULL,
  PRIMARY KEY(predecessor_front_id, successor_front_id)
);

CREATE TABLE league_territory_maps (
  season_id uuid NOT NULL REFERENCES seasons(id),
  map_version_id uuid NOT NULL REFERENCES map_versions(id),
  PRIMARY KEY(season_id,map_version_id)
);

CREATE TABLE season_front_states (
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  owner_team_id uuid REFERENCES teams(id),
  status text NOT NULL DEFAULT 'neutral'
    CHECK(status IN ('neutral','owned','contested','protected','suspended','archived')),
  active_battle_id uuid,
  protection_until timestamptz,
  cooldown_until timestamptz,
  version bigint NOT NULL DEFAULT 1,
  last_changed_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(season_id,front_id)
);
CREATE INDEX ix_front_states_owner ON season_front_states(season_id,owner_team_id,status);
CREATE INDEX ix_front_states_protection ON season_front_states(protection_until);

CREATE TABLE front_season_weights (
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  weight numeric(4,2) NOT NULL CHECK(weight >= 1.0 AND weight <= 5.0),
  method_version text NOT NULL,
  input_summary jsonb NOT NULL DEFAULT '{}'::jsonb,
  approved_by uuid REFERENCES admin_users(user_id),
  approved_at timestamptz,
  PRIMARY KEY(season_id,front_id)
);

CREATE TABLE battles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  mode text NOT NULL CHECK(mode IN ('neutral_open','attack')),
  status text NOT NULL DEFAULT 'proposed'
    CHECK(status IN ('proposed','active','paused','settling','under_review','finalized','cancelled','expired')),
  defender_team_id uuid REFERENCES teams(id),
  attacker_team_id uuid REFERENCES teams(id),
  created_by uuid REFERENCES users(id),
  rules_snapshot_json jsonb NOT NULL,
  rules_snapshot_hash char(64) NOT NULL,
  proposed_at timestamptz NOT NULL DEFAULT now(),
  proposal_expires_at timestamptz,
  starts_at timestamptz,
  ends_at timestamptz,
  settled_at timestamptz,
  winner_team_id uuid REFERENCES teams(id),
  outcome text CHECK(outcome IN ('capture','defended','neutral_remains','cancelled')),
  tally_hash char(64),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(id,season_id,front_id),
  CHECK(mode='neutral_open' OR (defender_team_id IS NOT NULL AND attacker_team_id IS NOT NULL)),
  CHECK(attacker_team_id IS NULL OR attacker_team_id <> defender_team_id)
);
CREATE UNIQUE INDEX uq_one_live_battle_per_front_season
  ON battles(season_id,front_id)
  WHERE status IN ('proposed','active','paused','settling','under_review');
CREATE INDEX ix_battles_due ON battles(status,ends_at) WHERE status IN ('active','settling');
CREATE INDEX ix_battles_by_front ON battles(season_id,front_id,created_at DESC);

ALTER TABLE season_front_states ADD CONSTRAINT fk_front_state_active_battle
  FOREIGN KEY(active_battle_id) REFERENCES battles(id) DEFERRABLE INITIALLY DEFERRED;

CREATE TABLE claim_challenges (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  device_id uuid REFERENCES user_devices(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  battle_id uuid REFERENCES battles(id),
  action text NOT NULL,
  nonce_hash char(64) NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  consumed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_claim_challenges_user ON claim_challenges(user_id,expires_at);

CREATE TABLE location_proofs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  challenge_id uuid NOT NULL UNIQUE REFERENCES claim_challenges(id),
  user_id uuid NOT NULL REFERENCES users(id),
  encrypted_samples bytea,
  coarse_h3_index varchar(20),
  accuracy_m numeric(7,2),
  server_verified_at timestamptz NOT NULL DEFAULT now(),
  retain_until timestamptz NOT NULL,
  verdict text NOT NULL CHECK(verdict IN ('pass','review','fail')),
  public_coordinates_available boolean NOT NULL DEFAULT false
    CHECK(public_coordinates_available=false)
);
CREATE INDEX ix_location_retain ON location_proofs(retain_until);

CREATE TABLE battle_contributions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  battle_id uuid NOT NULL REFERENCES battles(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  user_id uuid NOT NULL REFERENCES users(id),
  team_id uuid NOT NULL REFERENCES teams(id),
  challenge_id uuid NOT NULL UNIQUE REFERENCES claim_challenges(id),
  proof_id uuid REFERENCES location_proofs(id),
  status text NOT NULL DEFAULT 'pending'
    CHECK(status IN ('reserved','pending','approved','rejected','voided')),
  risk_bucket text CHECK(risk_bucket IN ('low','medium','high')),
  decision_code text,
  idempotency_key uuid NOT NULL,
  submitted_at timestamptz NOT NULL DEFAULT now(),
  approved_at timestamptz,
  voided_at timestamptz,
  UNIQUE(battle_id,user_id),
  UNIQUE(user_id,idempotency_key),
  FOREIGN KEY(battle_id,season_id,front_id) REFERENCES battles(id,season_id,front_id)
);
CREATE INDEX ix_contributions_battle_status ON battle_contributions(battle_id,status,team_id);
CREATE INDEX ix_contributions_user_time ON battle_contributions(user_id,submitted_at DESC);

CREATE TABLE battle_team_tallies (
  battle_id uuid NOT NULL REFERENCES battles(id),
  team_id uuid NOT NULL REFERENCES teams(id),
  approved_unique_players integer NOT NULL CHECK(approved_unique_players>=0),
  finalized_at timestamptz NOT NULL,
  PRIMARY KEY(battle_id,team_id)
);

CREATE TABLE season_voters (
  season_id uuid NOT NULL REFERENCES seasons(id),
  user_id uuid NOT NULL REFERENCES users(id),
  team_id uuid NOT NULL REFERENCES teams(id),
  city_region_id uuid NOT NULL REFERENCES geographic_regions(id),
  neighborhood_region_id uuid REFERENCES geographic_regions(id),
  first_front_id uuid NOT NULL REFERENCES fronts(id),
  first_approved_contribution_id uuid NOT NULL UNIQUE REFERENCES battle_contributions(id),
  status text NOT NULL DEFAULT 'verified'
    CHECK(status IN ('verified','review','voided')),
  registered_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(season_id,user_id)
);
CREATE INDEX ix_voters_city_team ON season_voters(season_id,city_region_id,team_id,status);

CREATE TABLE battle_events (
  id bigserial PRIMARY KEY,
  battle_id uuid NOT NULL REFERENCES battles(id),
  event_type text NOT NULL,
  details jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_battle_events_history ON battle_events(battle_id,id);

CREATE TABLE front_ownership_history (
  id bigserial PRIMARY KEY,
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  battle_id uuid REFERENCES battles(id),
  old_owner_team_id uuid REFERENCES teams(id),
  new_owner_team_id uuid REFERENCES teams(id),
  changed_at timestamptz NOT NULL DEFAULT now(),
  reason text NOT NULL,
  UNIQUE(battle_id)
);
CREATE INDEX ix_ownership_history_front ON front_ownership_history(season_id,front_id,changed_at DESC);

CREATE TABLE ranking_snapshots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  season_id uuid NOT NULL REFERENCES seasons(id),
  region_id uuid NOT NULL REFERENCES geographic_regions(id),
  snapshot_version bigint NOT NULL,
  metric_json jsonb NOT NULL,
  calculated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(season_id,region_id,snapshot_version)
);

CREATE TABLE notifications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  league_id uuid REFERENCES leagues(id),
  type text NOT NULL,
  title_i18n jsonb NOT NULL,
  body_i18n jsonb NOT NULL,
  deep_link text,
  payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  read_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_notifications_user_time ON notifications(user_id,created_at DESC);

CREATE TABLE user_reports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  reporter_user_id uuid REFERENCES users(id),
  target_type text NOT NULL CHECK(target_type IN ('front','battle','user','team','map','other')),
  target_id uuid,
  reason text NOT NULL,
  description text,
  status text NOT NULL DEFAULT 'open'
    CHECK(status IN ('open','triaged','resolved','dismissed')),
  created_at timestamptz NOT NULL DEFAULT now(),
  closed_at timestamptz
);

CREATE TABLE review_cases (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id),
  contribution_id uuid REFERENCES battle_contributions(id),
  battle_id uuid REFERENCES battles(id),
  case_type text NOT NULL,
  reason_codes text[] NOT NULL DEFAULT ARRAY[]::text[],
  status text NOT NULL DEFAULT 'open'
    CHECK(status IN ('open','investigating','escalated','approved','rejected','closed')),
  assigned_admin_id uuid REFERENCES admin_users(user_id),
  resolution text,
  created_at timestamptz NOT NULL DEFAULT now(),
  resolved_at timestamptz
);

CREATE TABLE moderation_actions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  subject_user_id uuid REFERENCES users(id),
  league_id uuid REFERENCES leagues(id),
  action text NOT NULL,
  reason text NOT NULL,
  case_id uuid REFERENCES review_cases(id),
  performed_by uuid NOT NULL REFERENCES admin_users(user_id),
  effective_from timestamptz NOT NULL DEFAULT now(),
  effective_until timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE admin_audit_logs (
  id bigserial PRIMARY KEY,
  admin_user_id uuid NOT NULL REFERENCES admin_users(user_id),
  action text NOT NULL,
  target_type text NOT NULL,
  target_id text,
  before_json jsonb,
  after_json jsonb,
  reason text,
  request_id text,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_admin_audit_by_admin ON admin_audit_logs(admin_user_id,created_at DESC);

CREATE TABLE outbox_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  aggregate_type text NOT NULL,
  aggregate_id uuid NOT NULL,
  event_type text NOT NULL,
  payload jsonb NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  processed_at timestamptz,
  attempts integer NOT NULL DEFAULT 0
);
CREATE INDEX ix_outbox_unprocessed ON outbox_events(created_at)
  WHERE processed_at IS NULL;
```

### DDL sonrası zorunlu tamamlayıcı migrasyonlar

- `users.phone_lookup_hash` HMAC/pepper uygulaması (sade SHA-256 ile telefon brute force etmeye elverişli tasarım **yasak**); kişisel alanlar application envelope encryption/KMS ile.
- `users` için hesabı anonimleştirme, gerçek e-posta/telefon tanımlayıcısı için anahtar döndürme ve silme prosedürü.
- `season_front_states.owner_team_id`, `battle.team_id`, `contribution.team_id` gibi alanların **aynı league_id'ye** ait olduğunu denetleyen transaction/constraint trigger.
- `league_territory_maps` ve `fronts.map_version_id` eşleşmesini `season_front_states` insert/update sırasında denetleyen trigger.
- `active_battle_id` gerçekte aynı `(season,front)` ile eşleşmeli; trigger ve uygulama invariant testi.
- `approved` bir contribution ancak `league_membership.status='active'` ve proof/integrity/rules geçerliyse; uygulama command handler + transactional trigger/prosedür.
- `team_id` güncellemeleri sezon sırasında kısıtlı; backfill için iki yetkili migration prosedürü.
- `user_devices` ve `auth_sessions` ilişki `device_id` FK'si migrasyon sırasına uygun eklenmeli.
- `notification_preferences`, `push_tokens` (token encrypted), `privacy_requests`, `user_blocks`, `support_tickets`, `app_feature_flags`, `localized_copy`, `asset_license_registry`, `session_events`, `security_events`, `battle_reversals`, `season_awards`, `season_final_snapshots`, `map_import_jobs`, `billing_accounts` (**ileride**) ayrıca oluşturulmalı. Bunların alan sözleşmeleri aşağıda.

## 08.4 Tam tablo kataloğu (çekirdek dışı dahil)

| Tablo | Zorunlu alanlar / açıklama | Önemli invariant |
|---|---|---|
| `notification_preferences` | `user_id`, `league_id` nullable, `battle_alerts`, `front_alerts`, `season_alerts`, `quiet_start/end`, `timezone`, `marketing_opt_in` | kullanıcı başına tercih; sessiz saat |
| `push_tokens` | `id`, `user_id`, `device_id`, `token_ciphertext`, `platform`, `last_valid_at`, `revoked_at` | ham token log'da yok |
| `favorite_fronts` | `user_id`, `season_id`, `front_id`, `created_at` | `(user,season,front)` unique; favori ≠ ev adresi |
| `privacy_requests` | `id`, `user_id`, `type` export/delete/restrict, `status`, `requested_at`, `fulfilled_at`, `data_package_key` | hukuki SLA, audit |
| `user_blocks` | `blocker_user_id`, `blocked_user_id`, `created_at` | rakip kullanıcı profil/etiket gösterim kısıtı |
| `support_tickets` | `user_id`, `category`, `description`, `status`, `agent_id`, `timestamps` | konum detaylarını normal destek mesajına koyma |
| `security_events` | `id`, `user_id`, `device_id`, `event_type`, `reason_codes`, `risk_bucket`, `encrypted_evidence`, `retain_until`, `timestamp` | salt yetkili güvenlik rolü |
| `battle_reversals` | `id`, `battle_id`, `decision_json`, `reason`, `reviewed_by`, `approved_by`, `created_at`, `applied_at` | **iki farklı yetkili**, zincir hesaplama |
| `season_awards` | `id`, `season_id`, `user_id/team_id`, `award_code`, `awarded_at`, `reason_ref` | `award_code + season + beneficiary` unique |
| `season_final_snapshots` | `season_id`, `region_id`, `finalized_json`, `hash`, `published_at` | immutable |
| `map_import_jobs` | `id`, `source`, `map_version_id`, `input_hash`, `status`, `stats`, `error`, `created_by` | retry idempotent |
| `app_feature_flags` | `key`, `scope`, `value_json`, `updated_by`, `updated_at` | prod change audit |
| `localized_copy` | `key`, `locale`, `text`, `revision` | çeviri geri düşüşü |
| `asset_license_registry` | `asset_key`, `rights_holder`, `license`, `evidence_link`, `allowed_uses`, `expiry` | kulüp markası lisans kapısı |
| `analytics_events` | `id`, `user_id` (pseudonym), `event`, `properties`, `created_at`, `consent_scope` | kesin koordinat yok |
| `billing_accounts` | `id`, `customer_type`, `processor_customer_id`, `status` | gelecekte; satın alma güce etki etmez |

## 08.5 İndeks, transaction ve veri koruma detayları

- `GiST(fronts.geom)` / `GiST(play_zones.geom)` / `GiST(regions.geom)` üzerinden index-aware `ST_Covers`, `ST_Intersects`, `ST_DWithin`.
- Aynı cephede savaşa başlangıç için `uq_one_live_battle_per_front_season` zorunlu; uygulama kontrolü yetmez.
- `battle_contributions UNIQUE(battle_id,user_id)` yarışan istekleri atoma bağlar.
- `COUNT DISTINCT` için `(battle_id,status,team_id)` indeks.
- `season_voters PK(season_id,user_id)` şehir destek oranında aynı kişinin çok cepheden sayılmasını engeller.
- Ranking snapshots yeniden üretilebilir; kaynağı `battle_contributions`, `front states`, `season voters`, `weights` tablolarıdır; Redis yanlışsa yeniden kur.
- Uzun süreli `serializable` transaction her yerde gerekmez; katkı ve settlement için row lock + unique + retry kullan. Deadlock oluşursa jitter ile sınırlı tekrar.
- İstemciye dönen `row_version` ile optimistic UI geçişleri; resmi sonuç daima sunucu kararı.
- `INSERT ... ON CONFLICT` tekrar işlem için tekil receipt döndürür; yarışan istekleri farklı katkı sanma.
- Gizli/şifreli veriyi log ve analitiklere asla kopyalama.

## 08.6 Yerel demo seed senaryosu

`seed:demo` **yalnız development/staging** ortamında, `DEMO_MODE=true` ile çalışır; production'da komut güvenlik kilidiyle reddedilir.

- Şehir: Alanya (temsili sınırlar; gerçek harita demoda özel gösterim).
- İki lig: `football-demo` (3 özgün takım), `gaming-demo` (3 takım).
- 12 cephe (3 nötr, 5 A, 3 B, 1 C); iki farklı harita sahipliği.
- 30 yapay kullanıcı, 4 tamamlanmış savaş, 1 aktif savaş, 1 koruma altındaki cephe, 2 incelemedeki katkı.
- Destek istatistiği demo: A 8 cephe / 80 farklı oyuncu; B 2 cephe / 160 farklı oyuncu (bu senaryo 240 demo hesap gerektirir, bu test seed'inde ayrıca `seed:stress-electoral` komutuyla üret).
- `TEST_LOCATION_PROVIDER` yalnız development build/test, resmî release'de compile-time kapalı.

---
# 09 — BACKEND API SÖZLEŞMESİ (OPENAPI 3.1)

**Temel URL:** `https://api.cepheland.example/v1` (örnek; domain satın alınmış veya boş olduğu iddia edilmez).  
**Kimlik:** Kısa ömürlü bearer access token + rotasyonlu HttpOnly güvenli refresh akışı (mobil için OS secure storage ve refresh token rotation); admin için ayrı oturum, MFA, cihaz ve IP bazlı risk.  
**Yetki:** Her endpoint için BOLA/BFLA kontrolü; `user_id`, `team_id`, `league_id`, `season_id` gibi sahiplikler istemciden gelse bile sunucu oturumu ve DB ile doğrulanır.  
**Dil:** `Accept-Language: tr-TR | en-US`; gömülü adlar `name_i18n` fallback.  
**Zaman:** RFC3339/ISO-8601 UTC; client tarafında yerelleştir.  
**Hata:** `application/problem+json` (RFC 9457 biçiminde) ve `error.code`, `error.message`, `request_id`, `retry_after` (gerektiğinde).  
**Sayfalama:** `limit` (max50) + opak `cursor`; offset büyük akışlarda kullanılmaz.  
**Güvenlik:** POST/PUT/PATCH kritik işlemler için `Idempotency-Key` UUID; request body şema doğrulama; global ve endpoint bazlı rate limit; cihaz app attestation; JWT/JWKS rotasyonu.

## 09.1 Endpoint matrisi — oyuncu

| Method | Endpoint | Yetki | İş / yanıt |
|---|---|---|---|
| `POST` | `/auth/start` | public + rate limit | Telefon/e-posta OTP başlat, PII enumeration yok |
| `POST` | `/auth/verify` | public | OTP doğrula, cihaz kaydet, access/refresh |
| `POST` | `/auth/refresh` | refresh | Oturum yenile, refresh rotation |
| `POST` | `/auth/logout` | user | Aktif session iptal |
| `GET` | `/me` | user | Profil, izinler, cihaz/hesap durumu |
| `PATCH` | `/me` | user | Görünen ad, dil, profil ayarları |
| `DELETE` | `/me` | user + re-auth | Hesap silme süreci (hukuki/audit istisnaları) |
| `GET` | `/leagues` | public | Yayındaki ligler, filtreler, aktif sezon |
| `GET` | `/leagues/:id` | public | Lig kimliği, durum, kurallar özeti |
| `GET` | `/leagues/:id/teams` | public | Takım kartları ve renk/semboller |
| `POST` | `/seasons/:id/join` | user | Takım seç, tek üyelik; onay akışı |
| `GET` | `/seasons/:id/me` | user | Takımım, hakkım, katkı limitleri |
| `GET` | `/seasons/:id/summary` | public | Sezon hedefi, kalan süre, metrikler |
| `GET` | `/maps/viewport` | public | `season_id,bbox,zoom,since_version` → GeoJSON/tile referansı |
| `GET` | `/fronts/:id?season_id=...` | public | Sınır, sahip, durum, koruma, görev alanı özeti |
| `GET` | `/fronts/:id/history?season_id=...` | public | Sayfalı fetih tarihçesi |
| `GET` | `/fronts/:id/battles?season_id=...` | public | Aktif ve önceki savaşlar |
| `POST` | `/fronts/:id/favorite` | user | Favoriye ekle; idempotent |
| `DELETE` | `/fronts/:id/favorite` | user | Favoriden çıkar |
| `GET` | `/me/favorites?season_id=...` | user | Takip cepheleri |
| `GET` | `/claims/eligibility?front_id=...&season_id=...` | user | `can_claim`, nedeni, kalan kota, güvenli saat |
| `POST` | `/claims/challenge` | user | Tek kullanımlık challenge/nonce oluştur |
| `POST` | `/claims` | user + challenge + integrity | Katkı isteğini güvenlik akışına kaydet |
| `GET` | `/claims/:id` | user sahibi | Receipt, pending/approved/rejected |
| `GET` | `/battles/:id` | public | Resmî skor, katılım, süre, durum |
| `GET` | `/battles/:id/events` | public | Kamuya açık anonim savaş günlüğü |
| `GET` | `/rankings?season_id&region_id&metric=` | public | Cephe/destek/ağırlık sıralaması |
| `GET` | `/regions/search?q=...` | public | Şehir/mahalle araması, rate limit |
| `GET` | `/notifications` | user | Okundu/okunmadı ile sayfalı akış |
| `PATCH` | `/notifications/:id/read` | user sahibi | Okundu olarak işaretle |
| `PATCH` | `/me/notification-preferences` | user | Lig ve sessiz saat tercihleri |
| `POST` | `/me/push-tokens` | user | Mobil push token bağla/değiştir |
| `DELETE` | `/me/push-tokens/:id` | user sahibi | Bildirim cihaz kaydı sil |
| `GET` | `/me/achievements?season_id=...` | user | Kişisel savaş/savunma başarıları |
| `GET` | `/profiles/:handle` | public | Minimal, gizlilik ayarına uygun profil |
| `POST` | `/reports` | user | Cephe güvenliği, hile, içerik raporu |
| `GET` | `/reports/mine` | user | Kendi rapor durumları |
| `POST` | `/appeals` | user | Ban veya yanlış katkı reddi itirazı |
| `POST` | `/privacy/export` | user + re-auth | Kişisel veri dışa aktarma talebi |
| `POST` | `/privacy/delete` | user + re-auth | Silme talebi ve açıklaması |
| `GET` | `/legal/terms`, `/legal/privacy`, `/legal/rules` | public | Yayımlanan sürümlü metinler |
| `GET` | `/health/public` | public | Servis erişilebilirlik (ayrıntısız) |

**Önemli API tasarım kararı:** `POST /battles` gibi doğrudan herkese açık, konum kontrolü atlanabilen bir savaş başlatma endpoint'i **yoktur**. Nötr başlatma, saldırı teklifi ve aktif savaşa katkı verme yalnızca doğrulanan `POST /claims` transaction'ının domain command olarak yönettiği işlemlerdir. `GET /claims/eligibility` sadece tahmindir; gerçek karar POST sırasında tekrar hesaplanır.

## 09.2 Örnek response/claim akışı

```json
{
  "front_id": "<uuid>",
  "season_id": "<uuid>",
  "battle": {
    "id": "<uuid>",
    "mode": "attack",
    "status": "active",
    "starts_at": "2026-11-02T08:00:00Z",
    "ends_at": "2026-11-03T08:00:00Z",
    "defender_team_id": "<uuid>",
    "attacker_team_id": "<uuid>",
    "approved_counts": { "attacker": 15, "defender": 12 }
  },
  "ownership": {
    "team_id": "<uuid>",
    "is_final": true,
    "front_version": 17
  },
  "viewer": {
    "claim_eligibility": "eligible",
    "contributed_to_this_battle": false,
    "remaining_daily_fronts": 2
  },
  "updated_at": "2026-11-02T11:55:00Z"
}
```

**Örnek istek: `POST /claims/challenge`**

```json
{
  "season_id": "<uuid>",
  "front_id": "<uuid>",
  "action": "join_battle",
  "device_id": "<uuid>"
}
```

**Örnek istek: `POST /claims` (platform integrity kanıtı temsili)**

```json
{
  "challenge_id": "<uuid>",
  "idempotency_key": "<uuid>",
  "location_samples": [
    { "latitude": 36.0, "longitude": 32.0, "accuracy_m": 14.2,
      "recorded_at": "2026-11-02T11:55:08Z" }
  ],
  "integrity": {
    "platform": "android",
    "signed_proof": "<opaque-platform-proof>"
  }
}
```

**Not:** Yukarıdaki 36.0/32.0 sadece JSON şekli için uydurma örnek koordinattır; Mahmutlar'daki gerçek görev noktası değildir. Üretimde cihaz koordinatları loglara basılmaz.

**Örnek yanıt: `POST /claims` — 202 Accepted, incelemede**

```json
{
  "claim_id": "<uuid>",
  "receipt_id": "<uuid>",
  "status": "pending_review",
  "counted": false,
  "user_message_key": "claim.security_review",
  "battle_id": "<uuid>",
  "server_time": "2026-11-02T11:55:12Z"
}
```

Başarılı sayılan katkı: `201 Created` + `status=approved`, `counted=true`. Daha önce aynı idempotency key ile kaydedilen istekte aynı receipt dön. Mevcut savaşta katkı varsa `409 ALREADY_CONTRIBUTED` veya aynı idempotent çağrıysa önceki receipt dön. Konum izin sorunu `422 LOCATION_UNRELIABLE`, zaman penceresi bitti `409 BATTLE_EXPIRED`, günlük kota `429/403 DAILY_QUOTA_REACHED` (kota iş mantığı için `409` tercih), integrity başarısız `403 INTEGRITY_REQUIRED`.

## 09.3 Hata sözlüğü ve gösterilecek metin

| Code | HTTP | Kullanıcı metni (TR) | Kullanıcı aksiyonu |
|---|---:|---|---|
| `AUTH_REQUIRED` | 401 | Katkı vermek için giriş yap. | Giriş ekranı |
| `TEAM_NOT_SELECTED` | 409 | Önce bu ligde takımını seç. | Takım seç |
| `AGE_NOT_ELIGIBLE` | 403 | Bu oyun için yaş koşulu sağlanmıyor. | Yardım |
| `LOCATION_PERMISSION_DENIED` | 422 | Konum izni olmadan işaretleme yapamazsın. | İzin ayarı |
| `LOCATION_UNRELIABLE` | 422 | Konum doğrulanamadı. Güvenli bir yerde tekrar deneyebilirsin. | Yeniden dene |
| `OUTSIDE_PLAY_ZONE` | 422 | Bu cephe için izinli katılım alanında değilsin. | Güvenli alanı göster |
| `ALREADY_CONTRIBUTED` | 409 | Bu savaşa katkın zaten kaydedildi. | Savaş ekranına dön |
| `DAILY_QUOTA_REACHED` | 409 | Bugünkü üç cephe hakkını kullandın. | Hakların |
| `BATTLE_PROTECTED` | 409 | Bu cephe koruma altında. | Koruma bitince hatırlat |
| `BATTLE_EXPIRED` | 409 | Bu savaş sonuçlanıyor. | Güncel durumu yenile |
| `FRONT_SUSPENDED` | 423 | Bu cephe geçici olarak oynanmaya kapalı. | Gerekçeyi gör |
| `INTEGRITY_REQUIRED` | 403 | Güvenli oyun doğrulaması tamamlanamadı. | Yardım / tekrar |
| `CLAIM_PENDING_REVIEW` | 202 | Katkın incelemede; henüz skora eklenmedi. | Durumu görüntüle |
| `REQUEST_RATE_LIMITED` | 429 | Çok sık deneme yapıldı. Biraz sonra tekrar dene. | Bekle |
| `SERVICE_UNAVAILABLE` | 503 | Bağlantı kurulamadı. Verilerin korunuyor. | Tekrar dene |

Hata mesajları suçlayıcı olmamalı. “Bot olduğun tespit edildi” gibi doğrulanmamış ithamlar yerine ölçülü teknik açıklamalar sun.

## 09.4 WebSocket/SSE olay sözleşmesi

`/realtime?season_id=...` sadece kimliği doğrulanmış istemciye gerekli kanalları verir; kamuya açık savaş özetleri anonim yayımlanabilir. Olaylar:

```ts
type GameEvent =
  | { type:'battle.updated'; battleId:string; frontId:string; approvedCounts:Record<string,number>; version:number; at:string }
  | { type:'battle.finalized'; battleId:string; frontId:string; winnerTeamId:string|null; version:number; at:string }
  | { type:'front.owner_changed'; frontId:string; newOwnerTeamId:string|null; version:number; at:string }
  | { type:'season.ranking_updated'; seasonId:string; regionId:string; snapshotVersion:number; at:string }
  | { type:'claim.review_resolved'; claimId:string; status:'approved'|'rejected'; at:string };
```

- Sunucu olayları sıralı `version` verir; gecikmiş olay eski versiyon ise istemci gösterimini geriye almaz.
- Reconnect sonrası `GET` ile tam durumu yeniden al, sadece WebSocket'e güvenme.
- Public kanalda kullanıcı kimliği veya konum proof yoktur.
- Bir cephedeki aktif skor değişimleri 2–5 saniyede bir gruplanabilir; her katkı için tüm şehir haritasını invalidate etme.

## 09.5 Backend modül sorumlulukları

- `AuthModule`: oturum, OTP, MFA, passkey, cihaz.
- `LeagueModule`: listeleme, takım katılımı, sezon.
- `MapModule`: bbox/tiles, front geometry, safe zones, geospatial sanity.
- `GameEngine`: savaş state machine, idempotent command, settle.
- `ClaimModule`: challenge, katkı, günlük kota.
- `RiskModule`: integrity validation, geolocation, davranış risk, inceleme.
- `RankingModule`: count/verified support/weighted snapshots ve reconcile.
- `NotificationModule`: push tercih/sessiz saat/dedup.
- `AdminModule`: RBAC, güvenli yazma işlemleri, publish gates, audit.
- `ModerationModule`: rapor, ban, itiraz, tehlikeli cephe kapatma.
- `PrivacyModule`: export, silme, konum saklama, consent.

## 09.6 Worker / zamanlanmış iş matrisi

| İş | Frekans/tetikleme | Idempotency ve kilit |
|---|---|---|
| `expire-proposed-battles` | Dakikada 1 | status+expiry + row lock |
| `activate-battle` | 2. güvenilir katkı | DB transaction + unique live battle |
| `settle-due-battles` | Dakikada 1 | battle row lock + immutable result |
| `expire-front-protection` | Dakikada 1 | `protection_until` doğrulaması |
| `rankings-incremental` | outbox + en az 60 sn debounce | `(season,region,version)` unique |
| `rankings-full-reconcile` | Gece; admin istekli | kaynaktan baştan hesap, drift alarmı |
| `process-claim-reviews` | güvenlik kararında | iki aşamalı inceleme |
| `send-notifications` | outbox | dedup, quiet-hours, per-user limit |
| `purge-location-evidence` | Saatlik | retain_until <= now + audit |
| `season-freeze` | sezon bitiş koşulları | single winner, immutable snapshot |
| `map-validate` | harita import tamamlanınca | geometry overlap & safety checks |
| `privacy-requests` | kuyruğa göre | ACL, export/silme doğrulaması |

Redis arızalandığında claim DB'ye yazılmışsa kaybolmamalı; `outbox_events` ile worker'ların eventual-consistent yan etkilerini tekrar üretebilmesi gerekir.

---

# 10 — MOBİL UYGULAMA: TAM EKRAN VE HER BUTON DAVRANIŞI

**Temel navigasyon:** Alt sekmeler `Harita`, `Ligler`, `Aktivite`, `Profil`. Aktif lig seçili olduğu sürece harita yalnız o ligin sahipliğini gösterir. Uygulamanın üst kısmındaki **Lig Değiştirici** her zaman görünür; oyuncu bir lige geçmeden başka ligin savaşlarına yanlışlıkla katılmaz.

## 10.1 Ortak etkileşim standardı

Her tıklanabilir öğede şunlar gerekir: `idle`, `pressed`, `loading`, `disabled`, `success`, `error` durumları; çift tıklama önleme; erişilebilir etiket; dokunma alanı en az platform ergonomisine uygun (iOS 44 pt, Android 48 dp hedef); gerekiyorsa onay/geri alma; network kesilirse doğru hata ve yeniden deneme. **Görsel buton asla sahte/boş onClick içeremez.**

Her ekranda `Back`/geri davranışı, yükleme skeleton'ı, boş durum, hata durumu, bağlantı yok ekranı, erişilebilir screen reader başlıkları, küçük cihaz ve büyük font denetimi zorunlu.

## 10.2 Ekran M00 — Açılış / Splash

- Görünüm: Cepheland tipografik logosu, düz yüzey rengi; 1–2 saniye gereksiz animasyon yok.
- Oturum kontrolü: token geçerli→son seçili aktif lig haritası; token süresi bitmiş→silent refresh; refresh iptal→Karşılama; yeni kullanıcı→Onboarding.
- Button: Yok. “Ağ yok” ise `Tekrar Dene` (backend health/session check), `Hesap Olmadan Keşfet` (salt-okunur lig ve kamu harita).

## 10.3 M01 — Karşılama

**Görsel:** 1 geniş gerçek oyun haritası görseli (üretimden alınmış, demo etiketi ile ayrı), kısa başlık `Tarafını seç. Cepheni kazan.` ve açıklama `Gerçek şehirlerin sanal rekabet haritası.`

| Kontrol | Tıklanınca | Koşul / not |
|---|---|---|
| `Başla` (primary) | `M02 Giriş/Kayıt` | yeni ve mevcut için aynı hesap akışı |
| `Haritayı Keşfet` (secondary) | public lig seçimi, salt okunur harita | katkı butonu sign-in çağırır |
| `Nasıl Oynanır?` (text) | 3 ekranlık açıklama | geçilebilir, video zorunlu değil |
| `Dil` | TR/EN alt sayfa seçimi | tercih cihazda tutulur |
| `Gizlilik`, `Koşullar` | yasal sürümlü metin | kayıt olmadan erişim |

## 10.4 M02 — Giriş / Kayıt

- Telefon veya e-posta sekmeleri; ülkeler listesi, format ve hata metinleri; numara doğrulama SMS servisi sınırlı.
- `Kod Gönder`: form doğrula; rate limit; OTP başlat; loading ve tekrar basma kilidi.
- `Apple ile Giriş` (iOS varsa): Apple kuralları çerçevesinde kimlik oluştur/bağla; `Google ile Giriş`: OAuth/OIDC; provider kimliği tekil `auth_identities` (ikincil migration).
- `Geri`: Karşılama.
- `Yardım`: doğrulama problemi açıklaması.
- “Devam ederek şartları kabul et” **tek başına gizli pazarlama onayı sayılmaz**; ayrı pazarlama tercihi.

## 10.5 M03 — OTP doğrula

- 6 haneli kod kutusu, otomatik ilerleme; platform izinliyse OTP autofill.
- `Doğrula`: server verify; başarılı ise yeni hesap kurulumu veya Harita.
- `Tekrar Gönder`: süre göstergesi; önceki OTP invalidate; rate limit.
- `Numarayı Düzenle`: M02.
- Hata: yanlış kod, süresi dolmuş, çok deneme, servis sorunu, telefon geri dönüştürme riski.

## 10.6 M04 — Profil kurulumu / yaş / kurallar

- `Kullanıcı Adı`: 3–24 alfanümerik ve `._` sınırlı; küfür, taklit, kişisel veri/marka ihlali filtrele.
- `Görünen Ad`: 2–40 karakter; gerçek ad isteme.
- `18 yaşını doldurdum` onayı ve gerekiyorsa uygun yaş kontrol prosedürü; yaş altına hesap açma.
- `Topluluk Kurallarını Okudum` işaret kutusu, sürüm sakla.
- `Devam Et`: doğrulama geçince M05; tekrar dokununca çift profil üretme.
- `Geri`: oturum durumuna göre M03/çıkış.

## 10.7 M05 — İlk turda konum açıklaması

- Metin: `Konumu yalnız işaretleme sırasında, senin izninle kullanıyoruz. Haritayı konum vermeden de inceleyebilirsin.`
- `Şimdi İzin Ver`: foreground izni OS prompt; izin verilirse haritayı yaklaşık konuma ortala; reddedilirse arama ile şehir seç.
- `Şimdilik Geç`: M06; sonra harita ve cephe inceleme çalışır.
- `Gizliliği Öğren`: konum retention/izin sayfası.
- **Arka plan GPS izni isteme.**

## 10.8 M06 — Lig keşfi

- Başlık `Hangi rekabete katılıyorsun?`; kartta lig adı, açıklama, açık sezon, 2–4 takım sembolü, ülkeler, toplam etkin cephe, güvenilir gecikmeli oyuncu sayısı (veri yoksa boş, uydurma sayı yok).
- `Lig kartı`: M07 Lig ayrıntı.
- `Ara`: debounce 250ms, arama sonuçları; hiç eşleşme yoksa uygun mesaj.
- `Filtreler`: Ülke, kategori, yeni/aktif/kapanan; `Uygula`, `Sıfırla`, `Kapat`.
- `Katıldıklarım`: sadece üye ligler.
- `Katıl`: takım seçilmediyse M08; seçildiyse ilgili lig haritası.
- `Aktif lig olarak ayarla`: seçili ligi cihaza kaydet, cache key değiştir; eski ligin renklerini bırakma.
- Lig yoksa: `Henüz lig açılmadı`, admin destek ve güvenli örnek demo erişimi.

## 10.9 M07 — Lig ayrıntı

- İçerik: görsel kimlik, açıklama, örnek harita, takımlar, kurallar, sezon süresi, sınırlı oynanabilir şehirler, mevcut kazanan metriği.
- `Takımları Gör`: takım listesi.
- `Takım Seç`: M08.
- `Haritayı İncele`: üye olmadan salt-okunur.
- `Kurallar`: alt modal, sınır ve cooldown.
- `Geri`: Lig keşfine.

## 10.10 M08 — Takım seçimi

- Her takımda telif hakkı uygun amblem, iki renk, kısa kimlik, mevcut sıralama (opsiyonel).
- `Takım kartı`: görsel olarak seçili olur, henüz kaydetmez.
- `Devam`: `M08b` onay alt sayfası: `Bu sezon boyunca [takım] tarafında oynayacaksın. Onaylıyor musun?`
- `Onayla`: `POST /seasons/:id/join` + idempotency, başarılı→M09 Harita.
- `Vazgeç`: seçim ekranına dön; hiçbir değişiklik olmaz.
- Geri: lig ayrıntı. Takım seçilmeden katkı mümkün değil.

## 10.11 M09 — Ana harita (ürünün birinci ekranı)

**Görsel hiyerarşi:**

```text
+-------------------------------------------+
| Cepheland   [Taraftarlar Ligi  v]    [Bell]|
| [Mahmutlar, Alanya]          [Search]      |
|                                           |
|          GERÇEK HARİTA KATMANI            |
|         Renkli küçük cephe poligonları    |
|                                           |
|                            [My location]  |
| [Cephe sayısı][Destek][Ağırlıklı kontrol]  |
|  [Yakınımdaki cepheler] / seçili panel     |
+-------------------------------------------+
| Harita       Ligler      Aktivite    Profil|
+-------------------------------------------+
```

**Her kontrol ve davranış:**

| Öğe | Aksiyon | Durum, güvenlik ve koşul |
|---|---|---|
| Üst `Lig Değiştir` | Lig bottom sheet; seçilen haritayı yükle | diğer ligin state'ini sızdırma; yeni `season_id` cache key |
| `Bildirim` zil ikonu | M15 Bildirimler | okunmamış sayısı doğru |
| `Konum/şehir` | Bölge araması aç | ekran kendi anlık konumunu ifşa etmez |
| `Ara` | Şehir, mahalle, sokak ve cephe kodu araması | PII ve ev adresi arama amacı değil |
| `Konumuma Git` | OS foreground izin, GPS iste, kamera konumunu değiştir | izin yoksa M05 izin açıklaması; sadece harita merkezleme |
| `Harita üzerinde cepheye dokun` | Seçili poligonun konturu + M10 özet sheet | küçük alan hit test; aynı anda tek seçim |
| `Haritayı kaydır` | mevcut viewport için önbellekli poligonları yükle | son viewport sunucuda kişiye özel rota olarak loglanmaz |
| `Yakınımdakiler` | 3–10 en yakın oynanabilir cephe listesi | uzaklık yaklaşıktır; kesin ev konumu gösterilmez |
| `Cephe sayısı` | seçim metriğini değiştir | görsel başlık değişir, owner renkleri değişmez |
| `Destek` | doğrulanmış benzersiz oyuncu desteği kartı | k-anonimlik / az veriyi gizle |
| `Ağırlık` | sabit ağırlık endeksi kartı | bilgi tooltip'inde formül özetlenir |
| `Harita katmanları` | Sahiplik / güvenli noktalar / sınırlar seçenekleri | tüm liglerde standart |
| `Güncelle` (hata halinde) | son bbox isteğini tekrar eder | idempotent GET |
| `Geri` | seçili sheet kapanır, sonra önceki sayfa | Android hardware back destek |

**Harita yüklenirken** boş beyaz ekran gösterme; düşük detaylı nötr harita + “Cepheler yükleniyor”. Konum servisleri çalışmazsa seçili şehri manuel aç. Harita attribution daima görünür.

## 10.12 M10 — Cephe özet bottom sheet

Üstte `Kumru Sokak · Cephe 03`, altında `Galatasaray kontrolünde`, `Koruma: ...`, `Aktif savaş`, `Sahiplik geçmişi`. Üç duruma göre tek ana CTA:

- `Neutral`: `Takımım İçin İşaretle` (katılmaya uygunsa).
- `Owned`, kendi takımında, savaş yok: `Favoriye Ekle` ana CTA değil, küçük; ana açıklama `Şu anda savaş yok`.
- `Owned`, rakibin, koruma yok: `Saldırı Başlat`.
- `Proposed`, saldıran takımdaysan: `Saldırıya Katıl`; değilse `Takip Et`.
- `Active`, tarafsan: `Takımım İçin İşaretle` veya `Cepheyi Savun`.
- `Protected`: `Koruma Bitince Hatırlat`.
- `Suspended`: `Neden Kapalı?`.

Diğer kontroller: `Detayları Gör`→M11, `Yol Tarifi`→varsayılan harita uygulamasını **güvenli kamu noktasına** aç (trafik/araç kullanırken oyun yok), `Favori`→toggle, `Paylaş`→cephe kimliği/link içeren görsel (oyuncu konumu yok), `Raporla`→M19, `Kapat`→sheet kapanır.

## 10.13 M11 — Tam cephe detay sayfası

Başlık; sokak, mahalle, cephe kodu; sahip, sürümlü poligon, son fetih, koruma bitişi, üç metrik özeti, son savaş, son 5 sonuç, güvenli katılım bölgesi, yöntem açıklaması.

| Buton | İşlem |
|---|---|
| `İşaretle / Saldırı Başlat / Savun` | M12 Konum ve güvenlik akışı (özgün CTA server eligibility ile) |
| `Savaşın Detayları` | M13 Savaş sayfası |
| `Fetih Tarihçesi` | M14 liste / tarih arşivi |
| `Favori` | API POST/DELETE, görsel feedback |
| `Paylaş` | platform share-sheet; hassas metadata yok |
| `Güvenli Katılım Noktalarını Göster` | haritada kamusal erişim poligonları; kesin özel konum yok |
| `Raporla` | M19 |
| `Kurallar` | mevcut savaş kural snapshot'ının okunabilir özeti |
| `Geri` | haritada seçili cepheye dön |

## 10.14 M12 — İşaretleme/konum akışı (çekirdek işlem)

Ekran akışı: `Ön bilgi`→`Güvenlik/konum kontrolü`→`İstek gönderildi`→`Başarılı/Pending/Hata`.

1. Kullanıcı ana CTA'ya basar; kısa bilgi kartı: `Bu savaşta takımın için bir katkı kullanacaksın. Konum yalnız bu işlem için doğrulanacak.`
2. `Konumu Doğrula`: permission → `GET eligibility` → server challenge → native location → platform integrity → POST claim. UI istek bitene kadar **tek kez** gönderir; uygulama arka plana giderse challenge süresi dolduğunda iptal/yeniden başlat.
3. `Vazgeç`: proof gönderilmeden sheet kapanır, hak tüketilmez.
4. `İşlem Başarılı`: `Takımına +1 katkı`, `Bu savaşta toplam: ...`, `Savaşı Gör` CTA; `Haritaya Dön` secondary.
5. `İncelemede`: `Henüz puanlanmadı`; `Durumu Gör` ve `Yardım`; inceleme bittiğinde kendi hesabına bildirim.
6. `Konum Hatası`: `Tekrar Dene` (yeni nonce gerekirse), `İzinleri Aç`, `Güvenli Alanı Gör`.
7. `Zaten Katıldın`: `Bu savaşta katkın kaydedilmiş`, `Savaşı Gör`.
8. `Günlük Hak Bitti`: kaç farklı cephe katılımı ve yenilenme zamanı; `Haritaya Dön`.

**ÖNEMLİ:** İstemci HTTP success görüp de server `approved` dememişse “Bayrağı diktin” deme. Pozitif sonuçta DB receipt olmalı. Kullanıcı işlem ortasında ekranı kapatırsa `POST /claims/:id` veya son challenge status ile kesinleşmiş durumu çöz.

## 10.15 M13 — Savaş ayrıntısı

Üstte cephe adı, savunan ve saldıran, `active/proposed/under_review/finalized`, sunucu saatine göre kalan süre; iki tarafın **onaylı** oyuncu katkısı, asgari eşik, kendi katkı durumu. Sistem olarak `2. oyuncu bekleniyor` vs. `24 saatlik savaş sürüyor` metni açık.

Butonlar: `Takımım İçin İşaretle` (yalnız üye tarafın eylemi), `Cepheyi Takip Et`, `Paylaş`, `Savaşa Ait Kuralları Gör`, `Sonuçlandıysa Tarihçeyi Gör`, `İtiraz Et` (yalnız ilgili ve süresi içindeki vaka), `Geri`.

Savaş sürerken başka takımın canlı konumu veya kullanıcı listesi gösterme. Katılım sayısı küçükse kişilerin adı da gizli. Gerekirse sadece sayı/anonim olay günlüğü.

## 10.16 M14 — Fetih tarihçesi

Her satır: tarih, eski takım, yeni takım, savaş kimliği, iki tarafın onaylı katkısı, `finalized` bilgisi. Aynı sahip kaldıysa `Başarılı Savunma` etiketi. `Bir Savaşı Aç` → M13 salt okunur. `Düzeltme kaydı` varsa sebep ve auditli açıklama. `Filtre`: sezon, sahiplik değişimi, savunma. `Temizle`: varsayılan filtreye dön, tarihî kayıtları silmez.

## 10.17 M15 — Bildirim merkezi

Filtreler `Tümü / Savaşlar / Ligler / Güvenlik`. Satır dokununca deep-link; `Tümünü Okundu Yap` bulk API; `Tercihler`→M21. Push ile ulaşan olayın yazılı in-app kaydı da bulunur.

Örnek bildirimler: `Takip ettiğin Kumru Sokak cephesinde savaş başladı`, `Kumru Sokak cephesi el değiştirdi`, `Katkın onaylandı`, `Sezon sonuçları açıklandı`. **FOMO/tehdit dili yok** (“Hemen çıkmazsan...” yasak). Bildirimler kullanıcının sessiz saatlerine ve günlük sınıra uyar.

## 10.18 M16 — Ligler sekmesi

`Katıldığım Ligler`, `Tüm Ligler`, `Yeni Ligleri Keşfet`, lig kartını aç, takım değişimi yalnız sezon arası, aktif lig değiştir. `Katıldığım Ligler` kartı sıralaması `son kullanılan` ve kullanıcı düzeni; başka ligin haritasına doğrudan yönlendirirken renk/copy doğru yenilenir.

## 10.19 M17 — Liderlik tabloları

- Şehir seçici: `Türkiye > Antalya > Alanya > Mahmutlar`.
- Ölçüm sekmeleri: `Cephe`, `Destek`, `Ağırlıklı Kontrol`.
- `Nedir?` butonu 3 formülün kısa ve açık açıklamasını açar.
- Takım satırı: amblem, isim, değer, yüzde, dönem, güncellenme zamanı.
- `Sezon Seç`: mevcut/arşiv, bitmiş sezon snapshot.
- `Bölgede Gör`: seçili coğrafyaya haritayı taşır.
- `Paylaş`: veri zamanı ve kaynak etiketi olan görsel; sahte seçmen/kesin nüfus iddiası yok.
- `Sonuç İtirazı`: destek vaka akışı.

**Özel boş durum:** 0 doğrulanmış oyuncu varsa destek çubukları `0%` değil `Henüz destek verisi yok`. Sayı 5'ten küçükse rakip hedefleme ve yeniden kimliklendirme riskine karşı `5'ten az` göster.

## 10.20 M18 — Aktivite

Bölümler `Katıldığım savaşlar`, `Kazandığımız cepheler`, `Savunmalar`, `Favoriler`, `Sezon başarılarım`. Her kartta tarih/lig/cephe/durum; kendi katkısı `approved/pending/rejected`. Filtreler sezon ve lig. `Savaş kartı` M13; `Cephe kartı` M11; `Haklarım` günlük 3 cephe limit durumu. Kullanıcının ev/sabit rutin haritası otomatik üretilmez.

## 10.21 M19 — Raporla / Yardım / İtiraz

`Neyi bildiriyorsun?` seçici: `Güvensiz oyun noktası`, `Sahte konum/bot şüphesi`, `Uygunsuz kullanıcı adı`, `Harita hatası`, `Yanlış sonuç`, `Diğer`. Çok satırlı açıklama, opsiyonel güvenli dosya kanıtı (EXIF konum temizle), `Gönder`, `Vazgeç`.

- Anında riskli oyun noktası raporlarında otomatik karantina önerisi admin önüne düşer.
- `Rapor Durumum`: `Gönderildi / İnceleniyor / Kapatıldı`, teknik detay ifşa edilmez.
- `İtiraz Et`: katkı reddedildi/bana yaptırım uygulandı durumunda form; kimlik fotoğrafını gereksiz yere isteme.

## 10.22 M20 — Profil

Avatar/monogram (özgün, telifli olmayan), kullanıcı adı, lig armaları, sezonlarda başarı sayıları, kendi katkı istatistikleri. Profil varsayılanı: **hangi cepheye hangi gün gittiği herkese açık değildir.** Kamuya açık görünürlük için yalnız toplam istatistikler ve kullanıcı onayı. `Profil Düzenle`, `Başarılarım`, `Ayarlar`, `Liglerim`, `Paylaş`, `Çıkış Yap`.

## 10.23 M21 — Ayarlar

| Kontrol | Beklenen davranış |
|---|---|
| `Hesap` | kullanıcı adı/oturumlar/bağlı kimlik sağlayıcıları |
| `Güvenlik` | aktif cihazlar, cihazı kaldır, passkey/2FA, şüpheli giriş bildir |
| `Gizlilik` | konum açıklaması, veri saklama, destek paylaşımı, engellenen hesaplar |
| `Bildirimler` | lig başına takip, savaş, koruma, sezon; sessiz saat; push opt-in |
| `Dil` | Türkçe/English ve anlık UI değişimi |
| `Erişilebilirlik` | hareket azalt, desenli takım renkleri, yüksek kontrast (OS ile uyumlu) |
| `Destek` | yardım, SSS, iletişim, rapor geçmişi |
| `Kurallar` | topluluk ve oyun kuralları sürümü |
| `Verilerimi İndir` | yeniden kimlik doğrula ve talep başlat |
| `Hesabımı Sil` | iki aşama + sonuç/geri alınamazlık ve işleme açıklaması |
| `Çıkış` | token revoke ve secure storage temizle; push token iptali |

## 10.24 Ekran durumları matrisi

| Ekran | Loading | Empty | Error | Offline | Success |
|---|---|---|---|---|---|
| Harita | nötr skeleton + katman yükleniyor | şehirde etkin cephe yok | tile yüklenemedi, Retry | son cache salt okunur | renklendirme ve zaman damgası |
| Ligler | kart skeleton | aktif lig yok | yeniden dene | son liste ve offline etiketi | seçilen lig route |
| Cephe | sheet skeleton | cephe kapalı/nötr | veri yenile | salt okunur, katkı yok | doğru sahip/süre |
| Katkı | ilerleme adımı | geçerli takım yok | neden ve çözüm | katkı hiç gönderilmez | receipt / review |
| Savaş | skor skeleton | henüz savaş yok | yenile | son bilinen skor + stale | final sonucu kesin |
| Liderlik | kısa iskelet | destek yok | yenile | son snapshot etiketli | 3 ayrı metrik |
| Aktivite | timeline skeleton | henüz katkı yok | yenile | cache | filtreli savaşlar |
| Bildirimler | liste skeleton | yeni bildirim yok | yenile | son liste | read state |
| Profil | temel iskelet | başarı yok | yeniden dene | cache | yeni ayar kaydı |

---
# 11 — TASARIM SİSTEMİ: PROFESYONEL, YALIN, ÖZGÜN, ERİŞİLEBİLİR

## 11.1 Kesin tasarım yasakları

**Tasarım kısıtları:** Emoji ikon yerine kullanılmaz. Ürüne özgü olmayan yönetim paneli kalıpları, gereksiz neon veya cam efektleri, aşırı renk ve gölge kullanımı, büyük kart yığınları, işlevsiz sayaçlar ve gradyanlar kapsam dışıdır. Görsellerin kullanım hakları doğrulanmalı; ikonlar aynı tasarım sistemine ait olmalıdır. Gerçek olmayan istatistikler, temel eylemi gizleyen alt menüler, zorunlu karanlık tema, sürekli titreyen cepheler, yalnız renkle aktarılan durumlar ve çalışmayan bir eylemin etkin düğme gibi sunulması kabul edilmez.

**Hedef:** Apple/Google birinci sınıf mobil ürün kalitesi; kendi markası olan, haritayı ve takım rekabetini merkeze alan, yüzeyleri sakin, tipografisi ölçülü, etkileşimleri tahmin edilebilir bir arayüz. Yalnızca “güzel” değil, kullanıcı bir sokakta ne yapabileceğini üç saniye içinde anlamalı.

## 11.2 Görsel kimlik

- **Logo:** özgün vektör monogram/soyut kırılan bölge sınırı; rakip futbol kulübü amblemlerini kopyalamak yok. Marka adının yazı tipi telif/dağıtım koşullarını kontrol et.
- **Nötr marka paleti:** harita takımlarının farklı renkleri ile yarışmayan ink/slate yüzeyler. Takım rengi sadece cephe poligonu, takım kimliği, yarış skoru, ilgili CTA detayında.
- **Ana arka plan:** açık tema `#F8FAFB`, kart `#FFFFFF`, temel metin `#111827`, ikincil metin `#586271`, border `#D9DEE6`, kritik hata `#B42318`. Karanlık tema `#101419`, surface `#1B2129`, metin `#F4F6F8`.
- **Marka aksanı:** `#0F766E` veya AA kontrastını geçen benzer tek accent; bütün butonları takım rengiyle boyama.
- **Takım paleti:** yönetici tanımlar, kontrast için açık/koyu yardımcı renk çiftleri gerekir. Koyu renk harita üzerinde outline/desen ile ayrılır.
- **Tipografi:** kurumsal, Latin+Türkçe karakterleri iyi destekleyen lisansı uygun bir font (ör. Inter/Manrope veya eşdeğeri). Türkçe `ı, İ, ğ, ş, ü, ö, ç` tüm kesitlerde test edilir; font kaynağını izinsiz dağıtma.
- **Ölçek:** 12/14/16/18/22/28/34 pt; body 16, caption 12–14; uzun metin cihazın Dynamic Type/Font Scaling ayarına uyar.
- **Spacing:** 4pt temel grid; 4/8/12/16/24/32; minimum 16px yatay ekran kenarı güvenli alanı; büyük kartlarda 20–24.
- **Radius:** 8 input, 12 kart, 16 sheet, 999 pill; her bileşen aynı yarıçapta olmak zorunda değil. Büyük köşeler harita detaylarına baskın olmamalı.
- **Icon:** tek tutarlı vektör icon ailesi, 20/24 ölçü; dekoratif emoji yasak. İkonların anlamı yazı veya accessible label ile desteklenir.
- **Gölgeler:** özellikle harita üstü sheet/overlay üzerinde küçük ve işlevsel; kart tabakaları sırf estetik için üst üste binmez.

## 11.3 Bileşen kütüphanesi

`AppHeader`, `LeagueSwitcher`, `LeagueCard`, `TeamCard`, `TerritoryPolygonLayer`, `FrontBottomSheet`, `OwnershipBadge`, `BattleScoreBar`, `CooldownCountdown`, `RankMetricTabs`, `RankingTeamRow`, `ClaimActionButton`, `ClaimSecurityProgress`, `ErrorInline`, `EmptyState`, `PlaceSearch`, `AuditTimeline`, `ConfirmationDialog`, `Toast`, `BottomTabBar`, `ScreenHeader`, `OfflineBanner`, `ReportForm`, `AdminDataGrid`, `MapPolygonEditor`, `RuleVersionDiff`, `TrustDecisionPanel`.

Her bir bileşenin `props` TypeScript tipi, state matrisi, hikâye örnekleri (Storybook veya mobil alternatifi), screenshot/visual regression testleri ve erişilebilirlik testleri olmalı.

## 11.4 Map-first tasarım kararları

- Harita ekranın yaklaşık %70–85'ini kaplar; menüler içeriğin üstünü gereksiz örtmez.
- Haritaya dokununca tam sayfa yerine 1/3 yükseklikte özet sheet; yukarı kaydırınca detay.
- Dar ekranlarda “Önce Konum / Sonra Cephe / Sonra Katkı” yolculuğu görünür hiyerarşidir.
- Cephe poligonları yaklaşık %50–65 opacity; yollar ve sokak adları okunur kalır. Seçili cephede 2px güçlü kontur + opaklık farkı.
- Rakip takımların rengi aynı olabilir; renk çakışması için desen/çizgi simge/etiket eşlik eder.
- Harita dışı listeler, erişilebilir alternatif navigasyon sağlar; screen reader kullanıcısı sadece poligon tıklamasıyla sınırlanmaz.
- Kullanıcının konumu varsayılan olarak başka kullanıcılara, paylaşılan screenshot'a veya savaş log'una girmez.

## 11.5 Mikro etkileşimler

- Buton basımı 80–120ms basit görsel geri bildirim; `Reduce Motion` aktifse animasyon yok.
- Savaş sonuçlanınca seçili cepheye **tek bir** renk geçiş animasyonu (200–350ms) ve metin güncellemesi; konfeti veya bağıran animasyon yok.
- `İşaretle` sırasında ilerleme metni: `Konum kontrol ediliyor` → `Güvenlik doğrulanıyor` → `Katkı kaydediliyor`; sistem kontrolü gerçek durumdan gelir, sahte yüzde progress bar kullanılmaz.
- Sunucu cevabı alınmadan “Başarılı” animasyonu başlamaz.
- Başarılı ekrandan haritaya dönüldüğünde skor sürümü tutarlı; ağ gecikmesinde `Güncelleniyor` etiketi.
- Yüksek frekanslı savaş olaylarında ekrandaki rakamlar sakin biçimde güncellenir; her +1'de tam ekran hareket olmaz.

## 11.6 UX kullanılabilirlik kabul ölçütleri

- Yeni kullanıcı test ortamında ilk lig seçimi + takım seçimi + cephe inceleme akışını dış yönlendirme olmadan tamamlayabilmeli.
- Oyun kuralı bir cümle ile anlatılır: `Güvenli noktaya git. Takımın için bir kez işaretle. En çok doğrulanmış destek alan cepheyi kazanır.`
- Cephe durumları `Sahipsiz / Galatasaray kontrolünde / Savaş var / Koruma altında / İncelemede / Geçici kapalı` olarak metinle ayrılır.
- Her önemli eylemden sonra kullanıcı **ne oldu, katkısı sayıldı mı, sonra ne olabilir** sorularını cevaplayabilmeli.
- “Cephe sayısı” ile “Destek” birbirine karıştırılmamalı; tooltip ve kısa örnek hesap tabloda mevcut.
- Takım değiştirici, lig değiştirici ve ülke/şehir seçici farkı net olmalı.
- İzin verilmemiş konumun oyun dışı harita kullanımını bloke etmemesi gerekir.
- Erişilebilirlik hedefi WCAG 2.2 AA ilkeleri, platform screen-reader testleri, büyük yazı, kontrast ve dokunmatik hedef ölçümleri.

---

# 12 — WEB YÖNETİCİ PANELİ: HER MODÜL VE BUTON

**Route:** `admin.cepheland.example` (temsili URL). Oyuncu mobil API'siyle ortak servis, fakat admin kimlik/izinleri ayrı. Üretimde MFA zorunlu; tüm yazma işlemleri audit izli. `super_admin`, `league_admin`, `map_editor`, `moderator`, `analyst`, `support` rolleri yetki matrisi aşağıda. Yalnız admin yeni lig açabilir.

## 12.1 Admin görünümü

Sol navigasyon: `Genel Bakış`, `Ligler`, `Sezonlar`, `Haritalar`, `Cepheler`, `Savaşlar`, `Sıralamalar`, `Güvenlik`, `Moderasyon`, `Kullanıcılar`, `Bildirimler`, `Analitik`, `Sistem`, `Denetim Günlüğü`. Üst bar `Ortam`, `Aktif Lig`, `Arama`, `Bildirim`, `Hesap`. Production/staging belirgin ve karıştırılmaz.

## 12.2 A01 — Admin giriş

- `E-posta`, `Parola/SSO`, `Giriş Yap`, `MFA Kodunu Doğrula`, `Şifremi Unuttum`, `Güvenlik Yardımı`.
- Kurumsal SSO ve MFA tavsiye edilir; rate limit/lockout/oturum cihaz izi; IP allowlist opsiyonel.
- `Giriş Yap` ancak RBAC kaydı ve MFA başarılı ise dashboard'a yönlendirir.
- Yetkili değilse kullanıcıya genel hata; ayrıntı güvenlik logunda.

## 12.3 A02 — Genel bakış

Kartlar: aktif lig sayısı, canlı savaş, bugün onaylı katkı, incelemedeki katkı, kapatılmış cephe, API hata oranı, ortalama settlement gecikmesi. Gerçek zaman ve veri kaynağı açıkça belirtilir.

| Buton | Eylem |
|---|---|
| `Lig Oluştur` | A03 yeni lig sihirbazı |
| `Canlı Savaşları Aç` | A07 filtrenin canlı savaşları |
| `İncelemeleri Aç` | A09 açık güvenlik vakaları |
| `Güvenli Olmayan Alanlar` | A06 safety raporu |
| `Rapor İndir` | filtreli CSV/PDF; PII role ve onay kontrolü |
| `Yenile` | sadece güncel API sorguları |

## 12.4 A03 — Lig sihirbazı (yedi adım)

### Adım 1: Kimlik

Alanlar: `slug`, Türkçe ad, İngilizce ad, TR/EN kısa açıklama, kategori, hedef pazar, yayın görünürlüğü. `Kaydet ve Devam` benzersiz slug ve uzunluk kontrolü; `Taslak Kaydet` her adımda çalışır; `İptal` geri dönüş onayı.

### Adım 2: Takımlar

`Takım Ekle` → ad/slug/iki dil açıklama/renk/ikon/logo lisans kanıtı. `Takımı Düzenle`, `Takımı Kaldır` (aktif üyelik yoksa), `Sırala`, `Renk Kontrastı Kontrol Et`. Minimum 2, varsayılan maksimum 8 takım (daha fazlası ayrı ölçek deneyi). Aynı ligde slug benzersiz.

### Adım 3: Harita kapsamı

`Ülke Seç`, `Şehir Ekle`, `Harita Sürümü Seç`, `Önizle`, `Uygun Cephe Sayısını Kontrol Et`, `Güvenli Alan Raporu`. Bir şehirde map published değilse yayın engeli.

### Adım 4: Sezon

`Başlangıç`, `Bitiş`, `Saat Dilimi`, `Sezon İsmi`, `Önceki Sahipliği Taşı`, `Kural Sürümü Seç`, `Şampiyonluk Metriği Seç`. Geçmişte başlangıç/bitiş veya üst üste binen aktif sezon doğrulaması.

### Adım 5: Kurallar

`Savaş süresi`, `Koruma`, `Günlük cephe sınırı`, `Minimum katkı`, `Düşük yoğunluk profili`, `Yeniden saldırı soğuma`, `Bildirim limiti`, `Yaş sınırı` alanları. `Önerilen Varsayılanlar`, `Kaydet`, `Sürüm Farkını Göster`.

### Adım 6: Marka ve hukuk

`Kapak Yükle`, `İkon Yükle`, `Logo Kaynak/Lisans Kaydı`, `Hak Kontrolü Tamamlandı`, `Yasal Metinleri Önizle`, `Riskli Lig Konusu Kontrolü`. Gerçek kulüp adları ve armaları için lisans doğrulaması aksi halde yayın engeli. Nefret/kimlik hedefleme veya gerçek dünya düşmanlığı üreten kategori reddedilir.

### Adım 7: Yayın onayı

Özet ve checklist; eksik maddelerin yanında `Düzelt` deep link. `Test Ligini Aç` staging demo (production görünmez); `İncelemeye Gönder`; ikinci yetkilinin `Onayla`; tarihi geldiğinde `Yayımla`; `Reddet` gerekçeli. **Tek yönetici hem hazırlayıp hem son onayı veremez** (four-eyes).

## 12.5 A04 — Lig listesi ve detay

Tablo: ad/slug/statü/üye/şehir/aktif sezon/son işlem. Filtreler `Tüm/ Taslak/ İncelemede/ Aktif/ Duraklatılmış`. `Detay`, `Düzenle` (yayın değişikliği sürüm), `Kopyala` (yeni draft, üye/savaş kopyalama **yok**), `Duraklat`, `Devam`, `Arşivle`, `İstatistik`, `Dışa Aktar`, `Denetim Kaydı`. Silme aktif üye/savaş olan ligde yok; archive.

## 12.6 A05 — Sezonlar

`Yeni Sezon`: kural snapshot + map seçim. `Takvimi Gör`, `Düzenle` (henüz başlamamışsa), `Aç`, `Bitir`, `Dondur`, `Sonuçları Hesapla`, `Tam Mutabakat Çalıştır`, `Sonuçları Yayımla`, `Arşivle`.

Savaşlar tamamlanmadan `Sezonu Bitir` -> güvenli ve ayrıntılı uyarı; `Zorla Bitir` sadece super-admin+ikinci onay, audit ve oyuncu bildirimi. Metriği sezon sırasında değiştirme butonu **yok**.

## 12.7 A06 — Harita editörü ve cephe yönetimi

**Görünüm:** Sol harita sürüm ağacı/filtre; ortada MapLibre harita; sağda seçili poligon özellik paneli. Masaüstünde 1440px ölçeğinde rahat, tablet responsive; mobilde admin tam harita poligon çizimini sınırlamak kabul edilebilir.

| Buton/araç | Eylem | Önlem |
|---|---|---|
| `Şehir Seç` | çalışma bbox'ı | farklı şehirde yanlış düzenlemeyi önle |
| `OSM Veri Aktar` | map_import_job başlat | lisans/sürüm kaydı |
| `Otomatik Cephe Oluştur` | algoritmayı çalıştır | üretim haritasına otomatik publish YOK |
| `Poligon Çiz` | yeni çokgen | self-intersection/overlap kontrol |
| `Poligon Noktası Taşı` | geometri düzenle | taslakta izinli, aktif sezon geometriye yasak |
| `Cepheyi Böl` | yeni child front'lar | yalnız yeni map version, lineage |
| `Cepheleri Birleştir` | yeni successor front | iki eski sahip farklıysa admin uyarısı |
| `Güvenli Nokta Ekle` | play_zone düzenleyici | kamu erişimi kontrol formu |
| `Güvenli Nokta Kaldır` | disabled, sebep | son güvenli nokta kalmıyorsa cephe disabled |
| `Cepheyi Kapat` | safety suspended | aktif savaşı pause et, bildirim |
| `Cepheyi Aç` | güvenlik yeniden onayla | 2. kişi incelemesi |
| `Etiket Düzenle` | TR/EN ve cephe kodu | kalıcı ID korunur |
| `Çakışma Denetle` | spatial validation | invalid poligon yayın engeli |
| `Erişilebilirlik Denetle` | güvenli yaya erişimi | manuel kontrol dosyası |
| `Önizleme` | mobil viewport ve 3 lig | owner verisi preview, salt okunur |
| `Taslak Kaydet` | revision commit | admin audit |
| `Geri Al` | mevcut edit transaction geri | yayınlanmış sürümde undo değil yeni sürüm |
| `Yayınlamaya Gönder` | review checklist | aktif savaş/season engelleri |
| `Yayımla` | onaylı sezon başı deploy | iki yetkili onay, version hash |
| `Dışa Aktar` | GeoJSON/bbox + meta | lisans/PII kontrol |

İşleme sırasında harita sürümü yalnız published önizleme ile karışmamalı; sol üstte `TASLAK` bant etiketi. Geometri geçerlilik sorunları ekrandaki ilgili poligonda açıklanmalı.

## 12.8 A07 — Savaş merkezi

Tablo: `battle_id`, lig, cephe, şehir, mod, saldıran/savunan, approved skor, pending katkı, süre, status, son event. `Savaş Detayı` event timeline, contributions masked; `Kural Snapshot`, `İşlem Günlüğü`, `Konum Riski` (rol uygunsa), `Raporla`, `Savaşı Duraklat`, `Devam Ettir`, `Güvenlik İncelemesine Al`, `İptal Et` (iki aşamalı), `Sonucu Tekrar Hesapla` (preview/dry-run), `İtiraz Bağla`, `CSV Dışa Aktar` (minimized). Kasten kazanan takımı el ile yazma özelliği yok; istisna `battle_reversal` prosedürü.

## 12.9 A08 — Sıralama ve istatistik doğrulama

Şehir/lig/sezon seç; üç metrik ayrı. `Snapshot Yenile`, `Kaynakla Karşılaştır`, `Farkları Göster`, `Tam Mutabakat`, `CSV Dışa Aktar`, `Hesap Açıklaması`. Snapshot ile source-of-truth mismatch `ranking_drift_alarm`; fark gizlenmez, sonuç geçici “Güncelleniyor” olur.

## 12.10 A09 — Güvenlik inceleme merkezi

Filtreler: `Yeni`, `Yüksek risk`, `Konum`, `Cihaz`, `Çoklu hesap`, `Bildirilen`, `Savaş etki riski`, `Tamamlanan`. Tablo masked user, case ID, risk bucket, reason codes, son işlem, ilişkilenen battle. 

`Vakayı Aç` → kronoloji, kanıtların erişim amaç/günlüğü, risk değerlendirmesi, kişi geçmişi (gerekli asgari), katkının savaşı etkileyip etkilemediği. Butonlar:

- `İncelemeye Al`: vakayı atanır, diğer admins'e read-only.
- `Katkıyı Onayla`: düşük/orta riskte gerekli kanıt varsa, audit ve sonuç işleme.
- `Katkıyı Reddet`: gerekçe zorunlu, kullanıcının itiraz yolu belirtilir.
- `Ek İnceleme İste`: ikinci güvenlik uzmanına ata.
- `Hesabı Geçici Sınırla`: belirli süre/eylem kapsamı, orantılılık.
- `Hesabı Askıya Al`: ağır ve doğrulanabilir ihlalde; en az bir üst rol onayı.
- `Savaşı İncelemeye Al`: settlement beklet.
- `Konum Kanıtını Gör`: salt yetkili, amaç sınırlı, ekran görüntüsü/indirme kısıtları ve erişim logu.
- `Vaka Notu`, `Kapat`, `İtirazı İşle`.

Hile eşiklerinin ham sayıları geniş operasyon ekibine gösterilmez; yetki gerektirir. Yapay zekâ tarafından otomatik “dolandırıcı” etiketleme ile kalıcı ban atma yok.

## 12.11 A10 — Moderasyon / içerik / güvenli şehir

`Rapor Listesi`, `Detay`, `Kritik Cepheyi Kapat`, `Riskli Noktayı Kaldır`, `Kullanıcı Adını Gizle/Değiştir`, `Kullanıcıyı Uyar`, `Geçici Engelle`, `Kalıcı Yaptırım` (yükseltilmiş onay), `İtirazı İncele`, `Vaka Kapat`.

Mesajlaşma lansmanda yok. Bununla birlikte profil adları, lig/takım adları, rapor açıklamaları moderasyon kapsamındadır. Asılsız toplu raporlamaya karşı report spam rate-limit.

## 12.12 A11 — Kullanıcı yönetimi

- Arama yalnız `handle/user ID` ile; e-posta/telefon araması yalnız support yetkisiyle gerekçeli.
- `Profil Gör` minimal; `Üyelikler`, `Cihazlar` (masked), `Güvenlik Vaka Geçmişi`, `Otumu Sonlandır`, `Kısıtla`, `İtiraz`, `Veri Talebi`.
- Destek personelinin `Oyuncu Takımını Değiştir` butonu yok. İstisna destekleme `team-change-request` prosedüründe sezon sonunu hedefler.
- Hiçbir panel kullanıcının günlük rota haritasını çizmez.

## 12.13 A12 — Bildirim ve içerik paneli

Şablon yönetimi: olay türü, TR/EN başlık/metin, push/in-app, deep link, sessiz saat, frekans sınırı. `Önizle (iOS/Android)`, `Test Cihaza Gönder` (izinli test hesabı), `Kaydet`, `İkinci Onaya Gönder`, `Yayımla`, `Geri Al`, `Gönderim Raporu`. Toplu pazarlama bildirimleri ayrı hukuki izin gerektirir.

## 12.14 A13 — Analitik / ürün raporları

İzleme: DAU/WAU, yeni lig üyeliği, ilk işaretlemeye dönüşüm, ilk savaşa katılım süresi, aktif cephe başına farklı oyuncu, savaş başına onay oranı, 7/28 gün retention, şehir başına aktif front yoğunluğu, sesiz cephe oranı, konum başarısızlık oranı, güvenlik yanlış pozitif itiraz oranı, push opt-out ve crash-free sessions. `Tarih`, `Lig`, `Şehir`, `Raporu İndir`, `Karşılaştır`; **hassas koordinat export yok**. Yetersiz istatistik hücrelerini anonimlik eşiğiyle gizle.

## 12.15 A14 — Sistem, özellik bayrakları, audit

`Feature Flags`, `API Sağlığı`, `Kuyruklar`, `Harita Tile Durumu`, `Database/Redis`, `Release Bilgisi`, `Sırları Yenile` (secrets manager), `Audit Filtrele`, `Export`, `Sistem Acil Durdurma` (iki aşamalı).

Kill switch türleri: bütün yeni claims; belirli lig, şehir, cephe veya riskli play_zone; savaş duraklatma; yalnız salt-okunur bakım. Acil durdurma `POST /admin/incidents/kill-switch` kayıtlı gerekçe ve gözlemle yürütülür. Tekrar açma ikinci onay gerektirir.

## 12.16 Yönetici endpoint matrisi

| Method/route | İşlem | Rol |
|---|---|---|
| `POST /admin/leagues` | taslak lig oluştur | league_admin+ |
| `PATCH /admin/leagues/:id` | yayınlanmamış alanlar | league_admin+ |
| `POST /admin/leagues/:id/submit-review` | incelemeye gönder | league_admin+ |
| `POST /admin/leagues/:id/publish` | iki onaydan sonra yayımla | super_admin |
| `POST /admin/leagues/:id/pause` | lig duraklat | super_admin / league_admin scoped |
| `POST /admin/seasons` | yeni sezon | league_admin+ |
| `POST /admin/seasons/:id/finalize` | sezon finalize | super_admin iki onay |
| `POST /admin/maps/import` | OSM import | map_editor |
| `POST /admin/maps/:id/generate-fronts` | geometri üret | map_editor |
| `PATCH /admin/fronts/:id` | taslak cephe edit | map_editor |
| `POST /admin/fronts/:id/suspend` | güvenlik kapatma | moderator+ |
| `POST /admin/maps/:id/submit-review` | harita inceleme | map_editor |
| `POST /admin/maps/:id/publish` | harita yayımla | super_admin + second approver |
| `GET /admin/battles` | savaş arama | moderator/analyst read scoped |
| `POST /admin/battles/:id/hold` | inceleme beklet | moderator+ |
| `POST /admin/battles/:id/reversal-request` | düzeltme başlat | super_admin + ikinci onay |
| `POST /admin/reviews/:id/decision` | risk kararı | moderator/security assigned |
| `POST /admin/notifications/templates` | bildirim şablonu | league_admin+ |
| `GET /admin/audit` | audit log | super_admin/denetçi |
| `POST /admin/kill-switch` | acil koruma | super_admin/on-call |

**Yetki ilkesi:** Role ek olarak *lig kapsamı ve neden* kontrolü gerekir; bir ligi yöneten kişinin başka ligin risk delilini görmesi yasak. Analistin PII ve konum deliline erişimi yoktur. Admin için bütün işlemler `who/what/when/why/before/after/request_id` kayıtlı.

---
# 13 — UYGULAMA İÇİ VERİ AKIŞI, DURUM YÖNETİMİ VE PSEUDOCODE

## 13.1 Kaynak doğruluk ilkeleri

- `useState`/Zustand UI'da sadece seçili lig, sheet, filtre, tema, permission prompt gibi **geçici arayüz** bilgilerini taşır.
- TanStack Query sunucu state: `['front',seasonId,frontId]`, `['battle',battleId]`, `['rankings',seasonId,regionId,metric]` vb.
- `claims` için **optimistic +1 yasak**. Önce sunucudan `approved` receipt gelir, sonra skor güncellenir.
- `front.owner_team_id` ancak `battle.finalized` event'inden sonra kesin değişir.
- Mobile secure storage token içerir; PII ve ham GPS geçmişi local storage'da tutulmaz.
- Offline cache sadece kamuya açık harita/son skor ve user'ın izin verdiği genel UI verilerini içerir; offline katkı kaydı yok.

## 13.2 Konum uygunsuzluğunda güvenli SQL sorgusu

```sql
-- Query is example; application does timestamp/accuracy/integrity gates BEFORE this query.
-- Longitude/latitude order is critical: ST_MakePoint(longitude, latitude).
SELECT z.id, z.front_id
FROM play_zones z
JOIN fronts f ON f.id = z.front_id
WHERE z.front_id = :front_id
  AND z.status = 'approved'
  AND f.safety_status = 'approved'
  AND f.enabled = TRUE
  AND z.geom && ST_SetSRID(ST_MakePoint(:longitude, :latitude), 4326)
  AND ST_Covers(z.geom, ST_SetSRID(ST_MakePoint(:longitude, :latitude), 4326));
```

**Bu tek sorgu yeterli değildir.** Cihaz ölçüm hata yarıçapı, örnekler arası tutarlılık, saat/sunucu konumu, platform integrity, güvenli saat, katılım bölgesi erişimi ve gerektiğinde istisna toleransı ayrıca değerlendirilir. Nokta zorunlu olarak dar poligon içinde olsun demek yüksek binalı bölgelerde gerçek oyuncuyu reddedebilir; tolerans politikası geofencing modelinin parçasıdır ve güvenlik onayı alır.

## 13.3 Tekil katkı transaction pseudocode

```ts
async function submitClaim(input: ClaimRequest, ctx: VerifiedAuthContext) {
  const idempotent = await contributions.findByUserAndKey(ctx.userId, input.idempotencyKey);
  if (idempotent) return receiptOf(idempotent);

  const challenge = await challenges.consumeOnceOrThrow(input.challengeId, ctx.userId);
  assertChallengeBindsAction(challenge, input);
  const integrity = await nativeIntegrity.verify(ctx.platform, input.integrity, challenge);
  const proof = await geo.verifyForegroundSamples(input.locationSamples, challenge);
  const risk = await riskEngine.evaluate(ctx, challenge, integrity, proof);
  if (risk.decision === 'reject') return createRejectedClaimReceiptSafely(...);

  return db.transaction(async tx => {
    // Atomic locks prevent two requests from creating two battles / multiple daily quotas.
    await tx.lockUserSeasonQuota(ctx.userId, challenge.seasonId);
    const membership = await tx.getActiveMembershipForUpdate(ctx.userId, challenge.seasonId);
    const state = await tx.getFrontStateForUpdate(challenge.seasonId, challenge.frontId);
    const rules = await tx.resolveFrozenRules(challenge.seasonId, state);
    await tx.assertClaimEligibility({ctx, membership, state, rules, proof, integrity});
    await tx.assertDailyDistinctFrontLimit(ctx.userId, membership, rules);
    const battle = await tx.getOrCreateBattleAsPerStateMachine(state, membership.teamId, rules);
    await tx.assertNoExistingContribution(battle.id, ctx.userId);
    const contribution = await tx.insertContribution({
      battleId: battle.id, userId: ctx.userId, teamId: membership.teamId,
      status: risk.decision === 'approve' ? 'approved' : 'pending',
      challengeId: challenge.id, proofId: proof.id, idempotencyKey: input.idempotencyKey
    });
    await tx.tryActivateProposedBattle(battle.id);
    if (contribution.status === 'approved' && battle.isOrBecomesActive()) {
      await tx.createSeasonVoterIfAbsent(ctx.userId, membership, state.cityRegionId, contribution.id);
    }
    await tx.insertOutbox('claim.submitted', contribution.id, ...);
    return receiptOf(contribution);
  });
}
```

**Uygulama uyarısı:** Kod mimari sözde koddur; `...` yerleri gerçek parametrelerle doldurulmalı. `consumeOnceOrThrow` ve DB transaction parçalanmışsa, nonce kilitleme de aynı transactional garantiye taşınır veya doğrulanmış Redis atomic script + DB unique ile korunur. `proposed` savaşın ilk üyesi reserved iken `season_voter` oluşmaz; aktifleşip onaylı katkıya dönüşünce oluşur. İlk fiziksel katılımın şehir seçiminde şehir kimliği kullanıcının adresinden değil, approved play_zone'un kayıtlı city id'sinden alınır.

## 13.4 Concurrent case örnekleri

- **İki kişi aynı anda nötr cephe başlatır:** sadece bir nötr savaş; ikisi aynı `battle_id`ye girer.
- **Aynı anda iki rakip takım teklifi başlatır:** tek `proposed` kilitlenir, önce DB'de yaratılan teklife öncelik; ikinci takım “Bu cephede başka saldırı teklifi var” mesajı alır; sürümden sonra retry.
- **Aynı kullanıcı telefonuyla çoklu tap:** aynı idempotency key sonucu; farklı key'lerde `(battle,user)` unique.
- **24 saat bittiği anda istek:** `accepted_at <= ends_at` DB zamanı; istemci saati kullanılmaz.
- **Saat dilimi değişimi:** kota `league.timezone` sınırına göre sunucuda, istemci OS saatini değiştirmek hak yenilemez.
- **Worker crash:** transaction tam değilse rollback; tam ise outbox üzerinden tamamlanır; çift sonuç olmaz.
- **Savaş sırasında cephe safety suspended:** battle pause ve `paused_at`, `total_paused_duration`; devam ederse `ends_at` aynı süre ileri alınır; bir daha açılmazsa iptal ve katkılar iptal gerekçeli arşiv.
- **İncelemeden gelen geç onay:** battle already finalized ise otomatik değiştirme değil, `late_review`/`reversal` yönetimi; kullanıcıya sonuç uyuşmazlığı bildirilir.

## 13.5 Günlük kota gerçek SQL mantığı

```sql
SELECT COUNT(DISTINCT bc.front_id) AS distinct_fronts
FROM battle_contributions bc
JOIN battles b ON b.id = bc.battle_id
JOIN seasons s ON s.id = bc.season_id
JOIN leagues l ON l.id = s.league_id
WHERE bc.user_id = :user_id
  AND s.league_id = :league_id
  AND bc.status IN ('approved','pending','reserved')
  AND (bc.submitted_at AT TIME ZONE l.timezone)::date =
      (:server_now AT TIME ZONE l.timezone)::date;
```

- Pending/reserved hakkı geçici olarak rezerve eder; explicit `rejected/expired` olduğunda hak serbest bırakılır (köşe durumlarında yeni toplulaştırma).
- Günlük kota hesabı için concurrency-safe **advisory/user-season lock** kullan; SELECT ardından INSERT'in yarışa girmesine izin verme.
- Başka lig günlük limitleri bağımsızdır; anti-cheat cihaz seviyesinde aşırı trafik ayrıca takip edilir.

## 13.6 Katkı güvenliğinden ranking'e akış

```text
contribution.approved
 ├── battle live tally (approved UNIQUE accounts only)
 ├── season_voters INSERT ... ON CONFLICT DO NOTHING (once per user/season)
 ├── outbox: claim.approved
 └── rankings refresh (region, season; throttled)

battle.finalized
 ├── battle_team_tallies (immutable)
 ├── season_front_states owner update
 ├── front_ownership_history append
 ├── achievement ledger / awards (idempotent)
 ├── outbox: front.owner_changed
 └── rankings refresh (front count + weighted control)
```

Aynı season voter'ın uygunsuz hesap olduğu sonradan kanıtlanırsa `season_voters.status=voided`, incident case açılır ve snapshot'lar kaynaklardan yeniden hesaplanır.

---

# 14 — OYUN DENGESİ, TOPLULUK, EKONOMİ VE TİCARİ MODEL

## 14.1 Etkin oyuncu yoğunluğu

Bölge sayısı çok, oyuncu az olursa bütün sokaklar nötr kalır. Yönetici `Pilot Başlangıç Modu` kullanır:

- İlk pilotta **1 şehir/1 pilot mahalle**; 20–50 güvenli cephe, 3 takım, 1 sezon.
- Sadece yeterli gerçek oyuncu olan bölgelerde cepheleri `playable=true` aç.
- Oyuncu sayısı arttıkça **sezon aralarında** cepheleri daha küçük adalara böl.
- Düşük yoğunluklu şehirler için fiziksel tehlikeye zorlamayan daha geniş `play_zone` kapsaması ve ayrı minimum katılımcı profili; şeffaf kurallarla.
- Şehirde yeni cephe açmak moderatör ve harita yetkilisi onayı gerektirir.

## 14.2 Büyük takım–küçük takım adaleti

İlk sürümde tüm başarılı katılımcılar eşit `+1`; bu anlaşılır ve denetlenebilir. “Sonradan gelenin katkısı 0,3” gibi gizli puan çarpanları yok. Ancak büyük takımın tüm şehri sonsuza dek kaplamaması için yapı taşları:

- Günlük 3 cephe sınırı ve her savaşta kişi başına tek katkı.
- Fiziksel yakınlık / güvenli katılım koşulu.
- Bir cephe sadece tek savaş; 48 saat koruma.
- Başarısız saldırı sonrası 12 saat cooldown.
- Şehir/mahalle açılışını etkin oyuncu yoğunluğuna göre planlamak.
- Düşük yoğunluklu liglerde **tüm takımlar için aynı** minimum katkı eşiği; team-specific yapay bonus yok.
- Her sezon takım dağılımı, yeni kullanıcı onboarding ve yoğunluk raporları incelenir; ama zaten kazanmış takımın puanı admin keyfiyle silinmez.

İleri sürümde dengelemek için “azalan getirili maç katkısı” düşünülebilir, fakat açıklanabilirlik zarar görür; MVP'de **tek kişiye tek katkı** netliğini koru.

## 14.3 Süreklilik ve ilerleme

- Oyuncu aynı cepheye her yeni savaşta yeniden katkı verebilir.
- Kendi seçtiği en fazla 3 favori cephe (ev adresini ifşa etmeyen, herkese açık olmayan liste).
- Lig/şehir bazlı sezon görevleri: `3 farklı cephede katılım`, `5 savunmaya katkı`, `kendi seçtiğin mahallede 2 başarılı sonuç` gibi; **oyuncunun gece yürüyüşüne veya kesintisiz aktivitesine bağlı streak** ödülü yok.
- Madalyalar kozmetik: `İlk Fetih`, `İlk Savunma`, `10 Farklı Cephe`, `Sezon Katılımcısı`, `Şampiyon Takım Üyesi`.
- Takım şampiyonluğu tek metrik, açıkça belirtilmiş; destek sıralaması farklıysa açıkça ayrı gösterilir.
- Harita tarihçesi sezonlar arası arşivlenir; kullanıcı kazanılan sokakları geçmişte görüntüleyebilir.
- Kişisel başarı kartları güvenli/anonymized biçimde paylaşılabilir.

## 14.4 Ticari model — ilk sürüm ücretsiz

**Önerilen model:** Kozmetik profil dekoru, sezon özel arayüz teması/rozet tasarımları, takım grafik paketleri, sponsorlu **izinli sanal etkinlikler**, organizatörler için özel lig hizmeti (sonraki sürüm). Bütün ücretli ürünlerin App Store / Play ödeme politikalarına uygunluğu kontrol edilir.

**Yasak satın alımlar:** Ekstra puan, ekstra günlük fetih hakkı, rakibin doğrulamasını düşürme, cephenin hazır kazanılması, paid safety bypass, gerçek parayla bahis/ödüllü şans oyunu, görünmeyen algoritmik avantaj.

**Gelir ve kullanıcı edinim hipotezi:** İlk topluluk olarak lokal taraftar oyun ligi; oyunun organik yayılma sinyali yakın çevredeki farklı takım kullanıcılarının ilk hafta geri dönme oranı. Bunlar doğrulanmamış hipotezdir, pazar araştırması ve pilot test gerekir.

## 14.5 Marka/lig hakları

`Cepheland` çalışma adıdır; `.com`, `.io`, TÜRKPATENT/WIPO uygunluğu doğrulanmış değildir. Kullanılan gerçek kulüp adları, armaları, sponsor işaretleri, oyun markaları ayrı marka/telif lisansı ve yanıltıcı resmî ilişki yasağına tabidir. Üretim öncesi logo ve isimlerin yazılı kullanım haklarını kontrol et. Lisans sağlanmıyorsa **kendi takım adları, özgün amblemler** ile yayın yap; “resmî kulüp oyunu” ibaresi kullanma.

## 14.6 Uygunsuz topluluk davranışı

Futbol rekabeti tahrik edici olabilir; tasarım eğlenceli rekabete hizmet eder ama nefret, gözdağı, fiziksel yüzleşme, konum bazlı rakip arama, hassas kimlik hedefleme ve zorla toplanma içermez. Kulüp rekabeti şaka ve sportif atışma düzeyinde kalır; kullanıcı rapor/engelleme mekanizmaları etkin.

---

# 15 — GİZLİLİK, HUKUK, UYGULAMA MAĞAZALARI VE VERİ SAKLAMA

## 15.1 KVKK / GDPR benzeri gereklilikler

Ürün Türkiye'de başlarsa KVKK; diğer pazarlarda ilgili veri koruma ve çocuk koruma mevzuatı uzman hukuk incelemesine tabidir. Bu belge hukuk görüşü değil teknik kontrol listesidir.

- Kişisel veri işleme amaçlarını, veri sorumlusunu, işleme şartını, aktarımları ve kullanıcı haklarını **ayrı aydınlatma metninde** açıkla.
- Her veri akışı için uygun hukuki dayanak saptanır; açık rızanın gerçekten gerekli olduğu işlemlerde rıza alınır, **aydınlatma ile rızayı aynı kutuya sıkıştırma**.
- Konum işlemenin amacı işaretleme doğrulamasıyla sınırlandırılır; süreklilik taşıyan rota takibi yapılmaz.
- Veri minimizasyonu: doğum tarihi yerine minimum yaş uygunluğu, ev adresi yerine kamuya açık görev alanı, tam rota yerine tekil katılım kanıtı.
- Gerekli olmadıkça hassas nitelikte kimlik, cinsel yönelim, din, siyasi görüş veya sağlık bilgisi isteme; takım seçimini gerçek kişisel kimliğin temsili sayma.
- Kişisel veriye erişimi teknik rol ve gerekçe ile sınırla; export ve silme taleplerini işlet.
- Uluslararası işleme/transfer için veri akışı envanteri, alıcılar, hukuki dayanak, DPA/SCC benzeri belgeleri gerektiği yerde değerlendir.

## 15.2 Önerilen veri saklama matrisi (hukuk onayından önce taslak)

| Veri | Varsayılan taslak saklama | Gerekçe |
|---|---|---|
| Kısa ham GPS konum örnekleri | 24–72 saat | katkı inceleme ve teknik sahtecilik tespiti |
| Gerekçeli güvenlik vakasındaki şifreli delil | onaylı vaka saklama planı | itiraz ve hukuki gereklilik |
| Katkı receipt, battle ve anonim tally | oyun tarihi + gerekli audit süresi | sonuç şeffaflığı |
| Kullanıcı oturum tokenları | token geçerliliği + kısa güvenlik kayıt süresi | oturum güvenliği |
| Bildirimler | 90 gün önerisi, kullanıcı temizleyebilir | bildirim merkezi |
| Push token | iptal, logout, geçersizlikte sil | bildirim teslimatı |
| Analitik event | 90–180 gün pseudonymous | hata/ürün metriği; veri minimizasyonu |
| Destek ve rapor kayıtları | vaka türüne göre plan | güvenlik/talep çözümü |
| Admin audit | yetkili politika uyarınca daha uzun | değişiklik hesap verebilirliği |

Süreler asla “kesin yasal süre” diye sunulmaz; hukuk ve veri envanteri onayından sonra konfigürasyonla uygulanır. `purge-location-evidence` işi otomatik siler; silme testi zorunlu.

## 15.3 Oyuncu mahremiyeti varsayılanları

- Gerçek ad zorunlu değil.
- Tam ev/adres koordinatı sistemde `home_front` olarak saklanmaz; favori cephe kullanıcıya özel.
- Takımın hangi cephede ne kadar oyuncusu olduğu gösterilebilir; **isim–saat–konum üçlüsü** herkese açık gösterilmez.
- Küçük grup (`n<5`) istatistiklerinde kullanıcıyı tanımlamayı kolaylaştıran değer gizlenir.
- Savaş sonuçları genel; katkı yapanların gerçek zamanlı konumları kapalı.
- Pazarlama push ayrı onay; güvenlik bildirimi hesap işlevi için ayrıştırılır.
- Hesabı sil ve kişisel veri indir akışı uygulama içinden erişilebilir.

## 15.4 Mağaza uyumluluğu

**Apple App Store:** konum yalnız özellik gerektiriyorsa ve kullanıcı bilgilendirilmişse; UGC moderasyonu/report/block; hesap açılıyorsa uygulama içinde hesap silme; fiziksel tehlike teşvik edilmemesi; gerçek markaların kullanım hakları; özgün deneyim ve tam çalışan app; dijital ürün IAP kuralları.  
**Google Play:** Data safety bildirimleri, foreground konum izni, Play Integrity, uygulama hesabı silme gereklilikleri, yaş sınıflandırması, kötüye kullanım ve yerel izinler; release öncesi güncel politika kontrolü.

**Önemli:** Mağaza inceleme ekibine test edilebilir sandbox/demo hesap ve sahte konum olmadan test etme planı ver; QA test konumu yalnız test ortamında, public release'de açık bırakma.

---

# 16 — TEST STRATEJİSİ, KABUL KRİTERLERİ VE KALİTE KAPILARI

## 16.1 Test katmanları

1. **Pure game-rules unit:** tüm savaş durum geçişleri, eşitlik, min eşik, süre, cooldown, destek ve ağırlık formülleri.
2. **DB integration:** gerçek PostgreSQL/PostGIS konteyneri; unique/index/transaction, geospatial queries.
3. **API contract:** OpenAPI request/response fixtures; auth/permissions; rate limit; hata sözlüğü.
4. **Risk integration:** Play Integrity/App Attest mock adapter testleri + gerçek cihaz sandbox sertifika testleri; sahte nonce/replay.
5. **Mobile E2E:** gerçek Android ve iOS cihaz/emülatör üzerinde UI; konum izin ret/izin, harita, derin link, idempotency, cihaz geçişi.
6. **Admin E2E:** lig sihirbazı, harita publish, iki kişi onayı, moderasyon, audit.
7. **Visual regression:** font, renk, iPhone/Android form factor, dark/light, büyük font, Türkçe karakter.
8. **Load/security:** 1.000+ eşzamanlı harita viewer, tek cephede eşzamanlı claim fırtınası, 1000 aynı `battle_id` yarışan istek, 100 bin cephe viewport performansı, DB lock latency.
9. **Geo safety:** her play_zone güvenli yaya alanı; tile atfı; mahremiyet maskesi.
10. **Release smoke:** test profilleri + monitoring + rollback + kritik alarm.

## 16.2 Minimum test vakaları — ürün kabul senaryoları

| ID | Senaryo | Kesin beklenen sonuç |
|---|---|---|
| G01 | Admin iki lig açar, aynı 10 cepheyi seçer | sahiplik ve sezonlar bağımsız |
| G02 | Lig A'da GS, Lig B'de PC seçimi | iki ayrı membership; doğru harita |
| G03 | Aynı kullanıcı battle'a 20 kez basar | tam 1 approved contribution |
| G04 | Aynı kullanıcı farklı idempotency key ile basar | `(battle,user)` constraint ikinciyi reddeder |
| G05 | 3. onaylı saldırgan, 2 savunmacı | saldıran kazanır |
| G06 | 2 saldırgan, 0 savunmacı | min3 sağlanmadı, savunan korur |
| G07 | 5 saldırgan, 5 savunmacı | eşitlik, savunan korur |
| G08 | neutral: A3, B3 | eşitlik, neutral |
| G09 | neutral: A2, B1 | min3 yok, neutral |
| G10 | neutral: A4, B3 | A sahip olur, koruma başlar |
| G11 | Bir cephenin savaşına katılan kişi sonraki savaşta döner | yeni battle'da yeniden 1 katkı alır |
| G12 | 48 saatlik koruma bitmeden yeni savaş | sunucu reddeder, UI kalan süre |
| G13 | Aynı kullanıcı günlük üç farklı cepheye katkı verir, dördüncü deneme | dördüncü reddedilir |
| G14 | Kullanıcı 3 farklı cephede katkı yapar ama aynı şehrin seçmen metriği | 1 doğrulanmış destek kaydı |
| G15 | 8 GS sokak/80 destek, 2 FB sokak/160 destek | GS cephe sayısında, FB destek oranında önde |
| G16 | GS 8×1,2; FB 2×5 ağırlık | GS 9,6, FB 10; FB ağırlıklı üstün |
| G17 | Aynı kullanıcı iki farklı city front'unda katkı | season_voters ilk atanan tek city'de |
| G18 | Üretimden test GPS provider çağrısı | compile-time kapalı; red |
| G19 | Konum izni reddedildi | public harita çalışır, claim kapalı |
| G20 | Eski 2 dakikalık nonce | claim reddi |
| G21 | Android sahte integrity proof | approved yok |
| G22 | iOS yeniden kullanılan attestation assertion | approved yok |
| G23 | 100 eşzamanlı claim isteği | at most 1 unique kullanıcı kontribüsyonu |
| G24 | Worker tam commit ardından çöker | retry çift savaş/çift reward oluşturmaz |
| G25 | Savaş sonunda pending 40 bot | pending sonuç hesabına girmez |
| G26 | Risk incelemesi aktif savaşın sonunda sürer | battle under_review; nihai galip yok |
| G27 | Harita için farklı iki şehir `bbox` | yalnız kapsamdaki cepheleri getirir |
| G28 | Malformed polygon / overlap | map publish engeli |
| G29 | private property tek girişli cephe | playable=false veya güvenli public access gerekir |
| G30 | Başka lig yöneticisi user konum proof okumaya çalışır | 403, audit/security log |
| G31 | Saldırı sırasında lig kuralı değişir | active battle frozen snapshot ile biter |
| G32 | Sezon biterken 24 saatten az kalmışsa yeni savaş | reddedilir veya erken bitiş politikası açık |
| G33 | Kullanıcı hesabını siler | PII anonimleşir; public handle silinir |
| G34 | Çok küçük şehir desteği (<5) | kullanıcı başına çıkarılamayan toplu değer gösterilir |
| G35 | Dark/light + büyük font | tüm butonlar sığar, kontrast geçer |
| G36 | Admin tek kişi hem hazırlayıp hem onaylamak ister | ikinci onay zorunlu |
| G37 | Cephe tehlikeli olarak kapatılır | yeni katkı yok, savaş pause, audit |
| G38 | Sezon arası cephe bölme | eski sonuç arşivlenir, lineage korunur |
| G39 | Redis geçici kesinti | DB receipt korunur, retry ile bildirim/ranking çalışır |
| G40 | Gerçek fikstürden 100 maçlık rastgele simülasyon | sahiplik ve liderlik invariants bozulmaz |

## 16.3 Örnek deterministik test kodu

```ts
import { describe, expect, it } from 'vitest';
import { winnerOfBattle } from '../packages/game-rules/src/winner';

describe('territory battle', () => {
  it('defender keeps front when tied', () => {
    expect(winnerOfBattle({
      kind: 'attack', defendingTeamId:'GS', attackingTeamId:'FB', minAttacker:3,
      allTeamTallies:[
        {teamId:'GS',approvedUniquePlayers:5},
        {teamId:'FB',approvedUniquePlayers:5}
      ]
    })).toBe('GS');
  });
  it('minimum attackers is mandatory', () => {
    expect(winnerOfBattle({
      kind:'attack', defendingTeamId:'GS', attackingTeamId:'FB', minAttacker:3,
      allTeamTallies:[{teamId:'GS',approvedUniquePlayers:0},{teamId:'FB',approvedUniquePlayers:2}]
    })).toBe('GS');
  });
  it('neutral tie means neutral', () => {
    expect(winnerOfBattle({kind:'neutral_open',minAttacker:3,
      allTeamTallies:[{teamId:'GS',approvedUniquePlayers:3},{teamId:'FB',approvedUniquePlayers:3}]
    })).toBe(null);
  });
});
```

## 16.4 SLO / performans hedefleri (ölçülecek, garanti değil)

| Metrik | Pilot hedef |
|---|---|
| API read p95 | <300ms (tile hariç, makul ağda) |
| Claim command p95 | <3sn *harici attestation beklemesi dahil değil* |
| Harita ilk anlamlı yükleme | <3sn iyi mobil ağda |
| Front seçimi | <150ms local interaction, detay yüklemesi ayrı |
| Settlement gecikmesi | savaş bitişinden <2dk (normal durumda) |
| Double claim hata sayısı | 0 doğrulanmış üretim örneği |
| Daily ranking reconcile | %100 kaynak eşleşmesi |
| Crash-free sessions | >99,5% pilot hedef |
| Konum reddi yanlış pozitif | pilot incelemesiyle izlenecek, tanımlı hedef sonra |
| Offline/public keşif | son cache salt okunur, aktif katkı sıfır |

Bu hedefler stres testi altyapısıyla raporlanır; gerçek olmayan performans yüzdeleri README'ye yazılmaz.

---
# 17 — GELİŞTİRME, DAĞITIM, GÜNCELLEME VE OPERASYON

## 17.1 Lokal geliştirme ortamı

**Minimum servisler:** PostgreSQL/PostGIS, Redis, MinIO (S3 geliştirme eşdeğeri), API, worker, admin. Mobile app emülatör/cihaz üzerinden API'ye erişir. Yerel ağ için güvenli cihaz–geliştirici ağ yapılandırması; gerçek test cihazında `localhost`un bilgisayarı göstermediğini unutma.

```yaml
# infrastructure/compose.yml (iskelettir; production-grade secret ve healthcheck ekle)
services:
  db:
    image: postgis/postgis:17-3.5
    environment:
      POSTGRES_DB: cepheland
      POSTGRES_USER: cepheland
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:?required}
    ports: ["127.0.0.1:5432:5432"]
    volumes: ["pgdata:/var/lib/postgresql/data"]
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U cepheland -d cepheland"]
      interval: 10s
      timeout: 5s
      retries: 15
  redis:
    image: redis:7-alpine
    command: ["redis-server", "--appendonly", "yes"]
    ports: ["127.0.0.1:6379:6379"]
    volumes: ["redisdata:/data"]
  minio:
    image: minio/minio:latest
    command: ["server", "/data", "--console-address", ":9001"]
    environment:
      MINIO_ROOT_USER: ${MINIO_USER:?required}
      MINIO_ROOT_PASSWORD: ${MINIO_PASSWORD:?required}
    ports: ["127.0.0.1:9000:9000", "127.0.0.1:9001:9001"]
    volumes: ["miniodata:/data"]
volumes:
  pgdata:
  redisdata:
  miniodata:
```

**Hedef geliştirme komutları:** Aşağıdaki liste üretim mimarisi için öngörülen komut sözleşmesidir. Mevcut sürümde desteklenen komutlar ve çalıştırma sırası README dosyalarında yer alır.

```bash
corepack enable
pnpm install --frozen-lockfile
cp .env.example .env
# .env doldur; sırları git'e commit etme
docker compose -f infrastructure/compose.yml up -d
pnpm db:migrate
pnpm db:seed:demo
pnpm dev:api
pnpm dev:worker
pnpm dev:admin
pnpm dev:mobile
pnpm test:unit
pnpm test:integration
pnpm test:e2e
pnpm lint
pnpm typecheck
```

Bu komutların kullanılabilirliği, ilgili `package.json` scriptleri ve çalıştırdıkları uygulama koduyla birlikte doğrulanmalıdır. Henüz uygulanmamış bir komut kurulum adımı olarak sunulmaz. `postgis/postgis:17-3.5` ve `redis:7-alpine` örnek etiketlerdir; dağıtım öncesinde destek durumu, güvenlik güncellemeleri ve hedef ortamla uyumluluk değerlendirilmelidir.

## 17.2 Ortam değişkenleri kataloğu

```dotenv
NODE_ENV=development
API_BASE_URL=http://localhost:3001
ADMIN_BASE_URL=http://localhost:3000
MOBILE_PUBLIC_API_BASE_URL=http://<LAN-IP>:3001
DATABASE_URL=postgresql://cepheland:<password>@localhost:5432/cepheland
REDIS_URL=redis://localhost:6379
S3_ENDPOINT=http://localhost:9000
S3_BUCKET=cepheland-assets
S3_ACCESS_KEY_ID=...
S3_SECRET_ACCESS_KEY=...
JWT_PRIVATE_KEY_PEM=...
JWT_PUBLIC_KEY_PEM=...
JWT_KEY_ID=...
PII_ENCRYPTION_KEY_ID=...
PII_HMAC_PEPPER_SECRET_REF=...
OTP_PROVIDER=mock_dev
SMS_PROVIDER_KEY=...
EMAIL_PROVIDER_KEY=...
GOOGLE_PLAY_INTEGRITY_PROJECT_NUMBER=...
GOOGLE_PLAY_SERVICE_ACCOUNT_SECRET_REF=...
APPLE_APP_ATTEST_TEAM_ID=...
APPLE_APP_ATTEST_BUNDLE_ID=...
APPLE_APP_ATTEST_ENV=development
FCM_SERVICE_ACCOUNT_SECRET_REF=...
APNS_KEY_SECRET_REF=...
TILE_STYLE_URL=https://<licensed-tile-provider>/style.json
OSM_ATTRIBUTION=© OpenStreetMap contributors
APP_ENV=development
DEMO_MODE=true
SENTRY_DSN=...
OTEL_EXPORTER_OTLP_ENDPOINT=...
```

**Güvenlik:** `.env.example` gerçek anahtar içermez; `.env`, signing key, auth token, Apple/Google credentials git'e girmez. Production secrets manager/KMS kullan. `MOCK_DEV` OTP veya `TEST_LOCATION_PROVIDER` release build'de derleme testleriyle **yasaklanır**.

## 17.3 Mobile build

- Expo + React Native yeni mimariyi destekleyen kararlı uyumlu sürümler.
- `@maplibre/maplibre-react-native` Expo Go'da çalışmaz; custom development build/native EAS Build zorunlu.
- `expo-location`, `expo-secure-store`, notification packages ve native integrity adapters için config plugins.
- `android.package` ve `ios.bundleIdentifier` final tescilli marka için tanımlanır (temsili: `com.envisionstation.cepheland`; gerçek varlık doğrulanacak).
- Android Play App Signing, target SDK güncel gereklilik; iOS signing, provisioning, APNs, entitlement, App Attest provisioning.
- EAS profil setleri: `development`, `preview`, `production`. Farklı kanal/host/secrets; yanlışlıkla üretim API'sine demo cihaz bağlanmaz.
- Release: Android Internal Testing, iOS TestFlight → pilot → staged rollout; crash monitor ve hızlı rollback planı.
- OTA JS update yalnız mağaza/native kod sınırlamalarına uygun; native integrity/MapLibre eklenti değişikliğinde **yeni binary**.

## 17.4 Backend production altyapısı

- TLS 1.2+/1.3, WAF/DDoS/rate limit, izole uygulama network; DB internete açık değil.
- Managed PostgreSQL + PostGIS, otomatik backup/PITR, multi-AZ hedefi; encryption at rest + in transit; replikaların veri gecikmesini kritik savaş settlement'e sokma.
- Redis queue durable konfig + retry/backoff; kaynak doğru DB outbox.
- API and worker container image digest pin, non-root, read-only FS uygun yerlerde; otomatik security scan/SBOM.
- `GET /health/live` süreç canlı, `/health/ready` DB bağlantı + kritik bağımlılıklar; erişim kontrollü monitoring.
- Harita tile servisi lisanslı; OSM toplum tile sunucusuna devasa yük bindirme.
- API pod yatay ölçeklenebilir; concurrency doğruluğu DB unique/lock ile korunur.
- Queue DLQ ve replay aracı; settlement gecikmesi için alarm.
- Dışarıya kullanıcı konumu içermeyen ürün olayları; log redaksiyon standardı.

## 17.5 Gözlemleme ve alarmlar

Zorunlu gösterge panelleri:

`api_request_latency_p95`, `api_5xx_rate`, `auth_otp_delivery_failures`, `claim_approved_rate`, `claim_review_rate`, `claim_location_fail_rate`, `battle_settlement_lag_seconds`, `ranking_reconciliation_diff`, `map_tile_failure_rate`, `db_deadlocks`, `queue_backlog`, `mobile_crash_free_sessions`, `integrity_verdict_distribution`, `unsafe_front_reports`, `account_delete_request_backlog`.

Alarmlar eşik/tekrar ile on-call’a gider. Kritik: çift galibiyet, yanlış takım sahipliği, PII sızıntı şüphesi, yetkisiz admin eylemi, 3rd-party integrity outage, illegal/tehlikeli play zone raporu → ilgili feature/cephe hızla durdurulur.

## 17.6 Güvenli geri yükleme ve kriz runbook

- Günlük backup verification, haftalık restore tatbikatı; oyun bütünlüğü kaydıyla birlikte geri yükleme.
- Schema migration hatasında expand/contract: önceden backup, reversible code, ayrı düzeltme migration; manuel prod DB DELETE yasak.
- Olay prosedürü: tespit → zarar sınırlama → kişisel veri erişimi denetimi → sahiplik dondurma → kanıt saklama (hukuka uygun) → incident log → doğrulanmış düzeltme → kullanıcı ve yetkili bildirim yükümlülüğü değerlendirmesi.
- Yanlış fetih sonuçları için `battle_reversal` ile denetlenebilir düzeltme; sonucu geçmişten sessizce silme.
- App Store / Play sürümü geri çekme gerekliliğinde açık destek kanalı ve read-only fallback.

---

# 18 — UYGULAMA PLANI VE BAĞIMLILIK SIRASI

**İlke:** Uygulama sırası çekirdek veri modeli ve oyun kurallarıyla başlar; uçtan uca çalışan temel akış, harita ve güvenlik bileşenleri, ardından üretim hazırlıklarıyla ilerler. Her fazın teslimatı çalışan kodu, test sonuçlarını ve güncel dokümantasyonu kapsar. Fazın tamamlanma kararı, tanımlanan çıkış ölçütlerine göre verilir.

## Faz 0 — Proje iskeleti ve karar günlüğü

- `pnpm` monorepo, TS strict, lint, format, test runner, CI.
- `README.md`, `DECISIONS.md`, `.env.example`, compose, docker healthchecks.
- `packages/contracts` OpenAPI başlangıcı; hata kod sözlüğü.
- `packages/game-rules` saf fonksiyonlar ve 20+ test.
- **Çıkış kriteri:** `pnpm install`, `lint`, `typecheck`, `test:unit` hatasız; açıklama çelişkisi yok.

## Faz 1 — DB ve backend domain

- Tüm 08 bölümündeki temel ve tamamlayıcı migrations, seed scriptleri.
- Token auth, OTP dev adapter, profiles, leagues, teams, seasons, membership.
- Savaş state machine ve claims idempotency; DB transaction, front state lock.
- `settle-due-battles` worker ve event/outbox.
- **Çıkış:** G01–G16 integration testleri geçmeli; salt API ile neutral/attack/defend/finalize döngüsü tamamlanmalı.

## Faz 2 — Gerçek harita ve güvenli cephe

- OSM içe aktarma pipeline, şehir poligonları, küçük cepheler, play_zone ve admin geo safety review.
- PostGIS geofence ve H3 yardımcı indeks; viewport API, GeoJSON + tile cache.
- İnsan onaylı 1 pilot mahallenin 20–50 oynanabilir cephesi.
- **Çıkış:** geçerli kesişimsiz poligonlar; güvenli play zone olmadan claim yok; harita/attribution doğru.

## Faz 3 — Android+iOS kullanıcı dikey dilimi

- React Native native build, TR/EN i18n, özgün tasarım tokens.
- Welcome/auth/onboarding/lig seç/takım seç/harita/cephe/claim/battle/ranking.
- M01–M17 temel fonksiyonlar API'ye bağlı, uçtan uca test akışı.
- **Çıkış:** Android test cihazı ve iPhone TestFlight cihazında gerçek native build ile aynı oyun sonucu.

## Faz 4 — Güvenlik ve konum sertleştirme

- Android Play Integrity, iOS App Attest native adapters, backend verification.
- Replay/attestation/OTP/device risk, user quotas, suspicious claims queue.
- PII şifreleme, konum verisi retention worker, denetimli risk kararları.
- **Çıkış:** G18–G30 güvenlik testleri, güvenlik incelemesi akışı gerçek çalışır.

## Faz 5 — Admin panelini tamamla

- Admin auth MFA/RBAC, A02–A14 ekranları, lig oluşturma wizard, geometri editörü, çift onay.
- Savaş/tehlikeli alan/vaka/moderasyon/analitik/audit.
- **Çıkış:** Yeni bir ligi kod değiştirmeden admin panelinden aç, harita sürümünü yayımla, ardından mobilde lig/cephe görünmeli.

## Faz 6 — Üretim UX, profil, bildirim ve erişilebilirlik

- M18–M21, push, favori, profil, achievements, history, reports, data requests.
- Dark/light, büyük yazı, screen reader, erişilebilir harita listesi.
- Minimal ve özel tasarım, uygun icon/font lisansı, gerçek verili ekranlar.
- **Çıkış:** Ürün QA ve erişilebilirlik denetimi, no dummy button, no fake counts.

## Faz 7 — Ölçek ve pilot

- 1.000 kullanıcı eşzamanlılık testleri, geo viewport yükü, API rate, DBA index tuning.
- KVKK/legal/store review, safe-site risk, kulüp logoları isim hakları.
- Alanya pilotu için gerçek test topluluğu; ilk günden kullanıcı davranışı ölç.
- **Çıkış:** Pilot metric scoreboard, dış kullanıcıların uçtan uca 1 savaşı tamamlaması, hile itirazı çözüm akışı.

## Faz 8 — Production rollout ve işletim

- CI/CD branch protections, staging/production secret separation, signed binary, monitoring, alarms, backups.
- TestFlight / Google Play internal testing → staged release; store policies read and acknowledged.
- Post-release bug handling, güvenlik yama politikası, şehir/lig açılım kriterleri.
- **Çıkış:** uygulama mağazalarında onaylı gerçek build veya onay engeli varsa açık durum raporu; production sağlık sayfası; backup restore tatbikatı.

## 18.1 Faz sonu ilerleme raporu

```markdown
### Phase N — Completion Report
- Implemented modules/files:
- Database migrations applied and verified:
- Endpoints implemented and their OpenAPI definitions:
- Mobile/admin screens and tested button interactions:
- Unit/integration/E2E test command + pass/fail summary:
- Accessibility and security checks:
- Known limitations (no concealment):
- Decisions added to DECISIONS.md:
- Next runnable task:
```

Yalnızca “Done”, “hepsi hazır”, “sitenizi oluşturduk” gibi kanıtsız özet kabul edilmez. İlgili PR/commit veya test çıktılarına dayanmalıdır.

---

# 19 — TAMAMLANDI TANIMI (DEFINITION OF DONE)

Aşağıdaki tüm maddeler gerçek prod hazır sürüm için doğrulanmalıdır:

- [ ] Android gerçek cihazında imzalı build çalışıyor; iOS gerçek cihazında imzalı build çalışıyor.
- [ ] Uygulama arayüzü Türkçe ve İngilizce; Türkçe karakterler sorunsuz.
- [ ] Konum izni yokken harita/lig izleme açık; claim kısıtlı.
- [ ] En az iki farklı ligde aynı cephe poligonunun bağımsız sahiplik durumu var.
- [ ] Kullanıcı aynı sezonda her ligde bir takım seçebiliyor; sezon ortası takım değişimi kurallı.
- [ ] Admin kod yazmadan yeni lig, takım, sezon ve harita oluşturabiliyor.
- [ ] Cepheler sokak/yapı adası ölçeğinde, gerçek güvenli yaya noktalarına bağlı.
- [ ] Sahipsiz cephe, saldırı teklifi, aktif savaş, savunma, sonuç, koruma döngüsü E2E çalışıyor.
- [ ] Oyuncu aynı savaşta en fazla bir katkı, yeni savaşta yeniden katkı verebiliyor.
- [ ] Günlük farklı 3 cephe sınırı, server-side ve yarış durumu emniyetli.
- [ ] Bot/GPS attestation doğrulaması Android/iOS native ve backend arasında bağlı.
- [ ] Şüpheli katkı `pending_review`yken savaş sonucunu etkileyemiyor.
- [ ] Aynı savaşın iki kez finalize edilmesi DB/worker düzeyinde imkânsız.
- [ ] Kazanılmış cephe sahibi kesinleştikten sonra haritadaki rengi değişiyor.
- [ ] Cephe sayısı, doğrulanmış destek, ağırlıklı kontrol ayrı hesaplanıyor ve açıklanıyor.
- [ ] 8–2 cephe fakat 80–160 doğrulanmış destek test senaryosu doğru.
- [ ] 9,6–10,0 ağırlıklı hâkimiyet test senaryosu doğru.
- [ ] Geometri invalid/overlap ve güvensiz fiziksel nokta yayınlanamıyor.
- [ ] Maç günü tehlikeli alanı duraklatma ve oyuncu raporu var.
- [ ] Oyuncu canlı konumu başka kullanıcılara, paylaşıma veya rakip feed'e sızmıyor.
- [ ] Her aksiyon gerçek backend ile bağlantılı; boş buton yok.
- [ ] Tüm ekranlarda loading/error/empty/offline/accessibility durumları bulunuyor.
- [ ] Admin MFA, rol bazlı yetkilendirme ve log kaydı çalışıyor.
- [ ] Nüfus, kulüp logosu, harita ve font kaynaklarının lisansı kontrol edilmiş.
- [ ] Güvenlik, KVKK, hesap silme/veri dışa aktarma ve mağaza inceleme kontrolleri var.
- [ ] Gerçek veriye dayanmayan istatistikler canlı uygulamada demo etiketsiz gösterilmiyor.
- [ ] E2E test paketi Android, iOS ve admin web'de çalışıyor; integration geospatial testleri geçiyor.
- [ ] Monitöring, alarmlar, staging, backup ve rollback prosedürleri denenmiş.
- [ ] README kurulum adımları farklı temiz makinede yeniden üretilebiliyor.

---

# 20 — AÇIK KARARLAR VE KESİNLİK DÜZEYLERİ

İlk uygulamada MVP varsayılanı olarak kullanılan, test ve ilgili uzmanlık incelemeleri sonucunda değişebilecek tasarım parametreleri:

| Konu | Başlangıç kararı | Değişiklik yöntemi |
|---|---|---|
| Ürün adı | Cepheland (çalışma adı) | tescil/alan adı araştırması sonrası marka kararı |
| Yaş | 18+ | yasal/pazar incelemesi + mağaza rating |
| İlk şehir | Alanya pilotu | yerel güvenli alan onayı |
| İlk lig | taraftar temalı bağımsız, marka haklarına uygun lig | yasal hak kontrolü |
| Savaş süresi | 24 saat | sonraki season rule version |
| Koruma süresi | 48 saat | sonraki season rule version |
| Kazanma | min3 ve daha çok approved benzersiz hesap | sonraki season version ve A/B test |
| Günlük katkı | 3 farklı cephe/lig/gün | sonraki season rule version |
| Sezon kupası | Ağırlıklı Harita Hâkimiyeti | sezon başlamadan ilan edilmiş kural |
| Yerel destek | aynı sezonda tek şehirde tekil hesap | privacy/fairness incelemesi |
| Ağırlık | 1–5, sezon başında dondurulur | kaynak veri varsa, aksi 1 |
| Harita | OSM tabanı + PostGIS + H3 yardımcı | lisans ve doğruluk denetimi |
| Başlangıç ölçeği | 20–50 cephe, 3 takım | oyuncu yoğunluğu pilotu |
| İletişim | açık chat/DM yok | moderasyon olgunluğu sonrası ayrı karar |
| Monetizasyon | ücretsiz oynanış, kozmetik/sponsor gelecek | mağaza ve marka uygunluğu |

Bunların dışında **bütün çekirdek akışlar** bu dokümana göre inşa edilmeli. Sürüm değişikliği `DECISIONS.md`, migration, test ve release note gerektirir.

---

# 21 — RESMÎ TEKNİK VE HUKUKİ KAYNAKLAR

Teknik seçimler ve yayın kararları sırasında bu kaynakların **güncel sürümleri** doğrulanmalıdır. Bağlantıların listelenmesi, belgenin otomatik güncellendiği veya ilgili incelemelerin tamamlandığı anlamına gelmez:

- Expo EAS Build, Submit, native releases: https://docs.expo.dev/eas/
- MapLibre React Native setup: https://maplibre.org/maplibre-react-native/docs/setup/getting-started/
- MapLibre Expo native setup: https://maplibre.org/maplibre-react-native/docs/setup/expo/
- Expo permissions: https://docs.expo.dev/guides/permissions/
- Google Play Integrity API: https://developer.android.com/google/play/integrity
- Apple DeviceCheck / App Attest: https://developer.apple.com/documentation/DeviceCheck
- PostGIS reference / spatial relationships: https://postgis.net/docs/reference.html
- H3 average cell areas: https://h3geo.org/docs/core-library/restable/
- OSM Tile Usage Policy: https://operations.osmfoundation.org/policies/tiles/
- OSM legal / license FAQ: https://osmfoundation.org/wiki/Licence_and_Legal_FAQ
- Apple App Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- OWASP API Security Top 10: https://owasp.org/API-Security/
- KVKK veri sorumlusu aydınlatma yükümlülüğü: https://www.kvkk.gov.tr/Icerik/6641/Obligation-to-inform
- TÜRKPATENT arama: https://www.turkpatent.gov.tr/
- WIPO Brand Database: https://branddb.wipo.int/

## 21.1 Gereksinim takibi ve uygulama değerlendirmesi

Geliştirme planı, gereksinimleri ilgili iş kalemleri, uygulama bileşenleri ve kabul testleriyle eşleştiren bir izlenebilirlik matrisi üzerinden yürütülür. Bölüm 18'deki fazlar bağımlılık sırasını tanımlar. Mevcut koddan devam eden çalışmalar, önce README dosyalarındaki uygulama kapsamı ve açık sınırlamalarla karşılaştırılır.

Her fazda ilgili veri şemaları, API davranışları, istemci ve yönetim ekranları birlikte değerlendirilir. Tasarım, oyun kuralları veya güvenlik gereksinimlerini etkileyen kapsam değişiklikleri `DECISIONS.md` içinde gerekçelendirilir. Gerçek cihaz, bütünlük doğrulaması veya hukuki inceleme gerektiren konular, kanıtı sağlanana kadar açık bağımlılık olarak tutulur.

Sonuç raporları test edilen davranışları, doğrulanmamış varsayımları ve kalan işleri ayrı belirtir. Cephe sayısı ile tekil hesap desteğine dayanan ölçümler ayrı hesaplanır ve ayrı sunulur. Örnek veriyle çalışan bir ekran, üretim entegrasyonu tamamlanmış gibi değerlendirilmez.

---

**CEPHELAND — Tarafını seç. Cepheni kazan.**

# EK A — TAMAMLAYICI VERİTABANI MİGRASYONU (08.4 TABLO KATALOĞUNUN SQL'İ)

Bu ek, ana DDL'nin ardından çalışacak ikinci migration için tablo şemalarını tanımlar. Üretim öncesinde test ortamında migration çalıştırılmalı, foreign key ve unique kuralları gerçek uygulama koduyla birlikte sınanmalıdır. `created_at`/`updated_at` trigger'ları ve role policies aynı migration setine eklenir.

```sql
CREATE TABLE auth_identities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  provider text NOT NULL CHECK(provider IN ('otp_email','otp_phone','google','apple','passkey')),
  provider_subject_hash char(64) NOT NULL,
  provider_metadata_encrypted bytea,
  linked_at timestamptz NOT NULL DEFAULT now(),
  revoked_at timestamptz,
  UNIQUE(provider, provider_subject_hash)
);
CREATE INDEX ix_auth_identities_user ON auth_identities(user_id);

ALTER TABLE auth_sessions ADD CONSTRAINT fk_auth_session_device
  FOREIGN KEY(device_id) REFERENCES user_devices(id);

CREATE TABLE notification_preferences (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  league_id uuid REFERENCES leagues(id),
  battle_alerts boolean NOT NULL DEFAULT true,
  front_alerts boolean NOT NULL DEFAULT true,
  season_alerts boolean NOT NULL DEFAULT true,
  security_alerts boolean NOT NULL DEFAULT true,
  marketing_opt_in boolean NOT NULL DEFAULT false,
  quiet_start time,
  quiet_end time,
  timezone text NOT NULL DEFAULT 'Europe/Istanbul',
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE NULLS NOT DISTINCT (user_id,league_id)
);

CREATE TABLE push_tokens (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  device_id uuid REFERENCES user_devices(id),
  platform text NOT NULL CHECK(platform IN ('ios','android')),
  token_ciphertext bytea NOT NULL,
  token_lookup_hash char(64) NOT NULL UNIQUE,
  last_valid_at timestamptz,
  revoked_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE favorite_fronts (
  user_id uuid NOT NULL REFERENCES users(id),
  season_id uuid NOT NULL REFERENCES seasons(id),
  front_id uuid NOT NULL REFERENCES fronts(id),
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(user_id,season_id,front_id)
);

CREATE TABLE privacy_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id),
  type text NOT NULL CHECK(type IN ('export','delete','restrict','correct')),
  status text NOT NULL DEFAULT 'requested'
    CHECK(status IN ('requested','verifying','processing','completed','declined')),
  data_package_key text,
  request_reason text,
  resolution_reason text,
  requested_at timestamptz NOT NULL DEFAULT now(),
  fulfilled_at timestamptz
);
CREATE INDEX ix_privacy_requests_status ON privacy_requests(status,requested_at);

CREATE TABLE user_blocks (
  blocker_user_id uuid NOT NULL REFERENCES users(id),
  blocked_user_id uuid NOT NULL REFERENCES users(id),
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(blocker_user_id,blocked_user_id),
  CHECK(blocker_user_id <> blocked_user_id)
);

CREATE TABLE support_tickets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id),
  category text NOT NULL,
  title text NOT NULL,
  description text NOT NULL,
  status text NOT NULL DEFAULT 'open'
    CHECK(status IN ('open','in_progress','waiting_user','resolved','closed')),
  assigned_admin_user_id uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  closed_at timestamptz
);

CREATE TABLE security_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id),
  device_id uuid REFERENCES user_devices(id),
  claim_id uuid REFERENCES battle_contributions(id),
  type text NOT NULL,
  reason_codes text[] NOT NULL DEFAULT ARRAY[]::text[],
  risk_bucket text CHECK(risk_bucket IN ('low','medium','high')),
  encrypted_evidence bytea,
  created_at timestamptz NOT NULL DEFAULT now(),
  retain_until timestamptz NOT NULL
);
CREATE INDEX ix_security_events_retain ON security_events(retain_until);
CREATE INDEX ix_security_events_user ON security_events(user_id,created_at DESC);

CREATE TABLE battle_reversals (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  battle_id uuid NOT NULL REFERENCES battles(id),
  decision_json jsonb NOT NULL,
  reason text NOT NULL,
  requested_by uuid NOT NULL REFERENCES admin_users(user_id),
  reviewed_by uuid REFERENCES admin_users(user_id),
  status text NOT NULL DEFAULT 'requested'
    CHECK(status IN ('requested','approved','rejected','applied')),
  created_at timestamptz NOT NULL DEFAULT now(),
  applied_at timestamptz,
  CHECK(reviewed_by IS NULL OR requested_by <> reviewed_by)
);

CREATE TABLE season_awards (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  season_id uuid NOT NULL REFERENCES seasons(id),
  user_id uuid REFERENCES users(id),
  team_id uuid REFERENCES teams(id),
  award_code text NOT NULL,
  reason_ref text,
  awarded_at timestamptz NOT NULL DEFAULT now(),
  CHECK((user_id IS NOT NULL) <> (team_id IS NOT NULL))
);
CREATE UNIQUE INDEX uq_season_user_award
  ON season_awards(season_id,user_id,award_code) WHERE user_id IS NOT NULL;
CREATE UNIQUE INDEX uq_season_team_award
  ON season_awards(season_id,team_id,award_code) WHERE team_id IS NOT NULL;

CREATE TABLE season_final_snapshots (
  season_id uuid NOT NULL REFERENCES seasons(id),
  region_id uuid NOT NULL REFERENCES geographic_regions(id),
  finalized_json jsonb NOT NULL,
  snapshot_hash char(64) NOT NULL,
  published_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(season_id,region_id)
);

CREATE TABLE map_import_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  map_version_id uuid NOT NULL REFERENCES map_versions(id),
  source_type text NOT NULL,
  source_version text,
  input_hash char(64) NOT NULL,
  status text NOT NULL DEFAULT 'queued'
    CHECK(status IN ('queued','running','failed','completed','cancelled')),
  stats jsonb NOT NULL DEFAULT '{}'::jsonb,
  error_message text,
  created_by uuid REFERENCES admin_users(user_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  finished_at timestamptz,
  UNIQUE(map_version_id,input_hash)
);

CREATE TABLE app_feature_flags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  flag_key text NOT NULL,
  scope_type text NOT NULL DEFAULT 'global',
  scope_id uuid,
  value_json jsonb NOT NULL,
  updated_by uuid REFERENCES admin_users(user_id),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE NULLS NOT DISTINCT(flag_key,scope_type,scope_id),
  CHECK(scope_type='global' OR scope_id IS NOT NULL)
);

CREATE TABLE localized_copy (
  copy_key text NOT NULL,
  locale varchar(10) NOT NULL,
  content text NOT NULL,
  revision integer NOT NULL DEFAULT 1,
  PRIMARY KEY(copy_key,locale)
);

CREATE TABLE asset_license_registry (
  asset_key text PRIMARY KEY,
  rights_holder text NOT NULL,
  license_text text NOT NULL,
  evidence_url text,
  allowed_uses text[] NOT NULL DEFAULT ARRAY[]::text[],
  expires_at timestamptz,
  verified_by uuid REFERENCES admin_users(user_id),
  verified_at timestamptz
);

CREATE TABLE analytics_events (
  id bigserial PRIMARY KEY,
  pseudonymous_user_id uuid,
  event_type text NOT NULL,
  properties jsonb NOT NULL DEFAULT '{}'::jsonb,
  consent_scope text,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_analytics_time_type ON analytics_events(created_at,event_type);

CREATE TABLE billing_accounts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_type text NOT NULL CHECK(customer_type IN ('user','organization')),
  user_id uuid REFERENCES users(id),
  processor_customer_ref text UNIQUE,
  status text NOT NULL DEFAULT 'inactive',
  created_at timestamptz NOT NULL DEFAULT now()
);
```

**Ek zorunlu DB invariant'ları:**

- `season_voters.first_front_id` ile `first_approved_contribution_id.front_id` aynı olmalı.
- `season_voters.city_region_id/neighborhood_region_id` ilişkisi ilk front'un harita sürümündeki coğrafi parent hiyerarşisinden alınmalı; istemci bu alanları seçemez.
- `front_season_weights` tüm açılmış cephelerin her biri için bir kere doldurulmalı; ağırlıklar aktif sezon sırasında UPDATE edilemez (admin düzeltmesi yeni sürüm/snapshot prosedürüyle).
- `battles.finalized` olduktan sonra `winner_team_id`, `outcome`, `tally_hash`, `battle_team_tallies` normal CRUD ile değiştirilemez; yalnız auditli reversal prosedürü.
- `season_final_snapshots` değişmez, yayınlandığında hash ve tarihle arşivlenir.
- `security_events`, `location_proofs` gibi kanıt tablosu için kısıtlı RBAC ve DB grants; API read rolü erişemez.
- UUID yabancı anahtarların aynı lig/sezon/map sürümüne ait olduğuna composite FK veya trigger + integration test ile garanti ver.
- Şüpheli ve reddedilmiş katkı approved sayılmaz; snapshot kullanımı için filtre zorunlu.

---

# EK B — SORUMLULUK MATRİSİ: MODÜL → DOSYA → TEST

| Gereksinim | Birincil modül | Mutlaka test |
|---|---|---|
| Çoklu bağımsız lig | `LeagueModule`, `season_front_states` | G01/G02 |
| Takım seçimi/üyelik | `MembershipService` | aynı sezonda 2 takım yasak |
| Nötr cephe ele geçirme | `GameEngine/neutral.ts` | G08–G10 |
| Rakip saldırı | `GameEngine/attack.ts` | G05–G07 |
| Koruma/cooldown | `GameEngine/cooldown.ts` | G11/G12 |
| Konum kanıtı | `RiskModule/geo.ts` | G18/G19/G27/G29 |
| Android integrity | `native/android-integrity` + `RiskModule` | G21 |
| iOS integrity | `native/ios-appattest` + `RiskModule` | G22 |
| Bot/çoklu hesap | `RiskModule` + `review_cases` | G23/G25/G26 |
| Destek oyu | `RankingModule/support.ts` + `season_voters` | G14/G15/G17 |
| Ağırlık | `RankingModule/weighted.ts` + `front_season_weights` | G16 |
| Harita poligonları | `packages/geo`, `MapModule`, admin editor | G27/G28/G38 |
| Savaş settlement | `Worker/settle-battle` | G24 |
| Savaş düzeltme | `ModerationModule/reversal` | audit consistency |
| Türkçe/İngilizce | `mobile/src/locales` | tüm route screenshot |
| Tasarım erişilebilirlik | `packages/ui-tokens`, mobile components | G35 |
| Admin 2 onay | `AdminModule/approval` | G36 |
| Mahremiyet | `PrivacyModule` | G30/G33/G34 |
| Bildirimler | `NotificationModule` | sessiz saat/dedup |
| Dağıtım | `infrastructure`, CI/CD | restore + rollout |

Bu dokümanın her `MUST` maddesi gerçek issue/PR ve test vakasına bağlanmalı. Gereksinim izlenebilirlik tablosu tutulmayan implementasyon **tamamlanmış sayılmaz**.

---

**CEPHELAND MASTER BLUEPRINT — BELGE SONU**
