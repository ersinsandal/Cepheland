# CEPHELAND — Karar Günlüğü (DECISIONS.md)

Bu belge, `CEPHELAND_MASTER_BLUEPRINT.md` uyarınca proje süresince alınan mimari, ürün, güvenlik ve oyun tasarımı kararlarını kayıt altında tutar.

---

## ADR-001: Monorepo ve Modüler Monolit Mimarisi
- **Tarih:** 2 Kasım 2026
- **Durum:** Kabul edildi
- **Karar:** Sistem tek bir monorepo altında (`pnpm` workspaces + `turborepo`) modüler monolit olarak yapılandırıldı. API ve Worker aynı paylaşılan çekirdek kuralları (`@cepheland/game-rules`, `@cepheland/contracts`, `@cepheland/geo`) kullanır.
- **Gerekçe:** Erken aşamada mikroservis karmaşası ve dağıtık transaction risklerinden kaçınmak; PostgreSQL transaction'larını tek kaynaktan yönetmek.

## ADR-002: Üç Eşzamanlı Metrik (Cephe vs Destek vs Ağırlık)
- **Tarih:** 2 Kasım 2026
- **Durum:** Kabul edildi
- **Karar:**
  1. **Cephe Kontrol Payı (`front_control_share`):** Şehirdeki sahip olunan cephe sayısı / toplam oynanabilir cephe sayısı.
  2. **Doğrulanmış Halk Desteği (`verified_support_share`):** Her onaylı kullanıcının sezonda İLK fiziksel katılım gösterdiği cephenin şehrine yazılan tekil hesap oranı (1 kullanıcı = sezonda 1 şehirde 1 oy).
  3. **Ağırlıklı Harita Hâkimiyeti (`weighted_control_share`):** Her cephenin sezon başında dondurulan `weight ∈ [1.0, 5.0]` değeri üzerinden hesaplanan endeks.
- **Gerekçe:** Küçük sokaklarda çok sayıda cephe tutan takım ile kalabalık caddelerde yüksek insan kitlesine sahip takımın adil ve şeffaf biçimde ayrışması (örn. GS 8 cephe / 80 kişi; FB 2 cephe / 160 kişi senaryosu). Sezon şampiyonluk metriği varsayılanı `weighted_control`dür.

## ADR-003: Atomik Savaş ve Katkı Durum Makinesi
- **Tarih:** 2 Kasım 2026
- **Durum:** Kabul edildi
- **Karar:**
  - Nötr cephede: ilk eylem 24 saatlik `neutral_open` başlatır. Min 3 benzersiz onaylı oyuncu şarttır; eşitlikte nötr kalır.
  - Sahipli cephede: ilk eylem `proposed` oluşturur. 2 saat içinde ikinci farklı güvenilir takım arkadaşı onay verirse 24 saatlik `active` savaşa dönüşür; aksi halde `expired`.
  - Her oyuncu bir savaşa en fazla 1 geçerli katkı verebilir (`battle_id, user_id` UNIQUE).
  - Fetih sonrası 48 saat koruma (`protected`). Başarısız saldırı sonrası 12 saat savunma soğuma (`cooldown`).
  - Günlük lig başına en fazla 3 farklı cepheye katkı hakkı.

## ADR-004: Anti-Cheat ve İki Aşamalı Güvenlik Akışı
- **Tarih:** 2 Kasım 2026
- **Durum:** Kabul edildi
- **Karar:** Tek başına GPS koordinatına asla güvenilmez. `POST /claims/challenge` ile kısa ömürlü (120s) tek kullanımlık nonce üretilir. İstemci foreground konum örnekleri ve platform integrity proof ile `POST /claims` gönderir. Şüpheli durumlar `pending_review` statüsünde tutulur ve savaş skorunu etkilemez.

## ADR-005: Marka Görseli ve Logo Entegrasyonu
- **Tarih:** 2 Kasım 2026
- **Durum:** Kabul edildi
- **Karar:** Tasarımcının hazırladığı `cepheland_icon.png` (1254x1254 RGBA) temel ikon kabul edildi. `@cepheland/ui-tokens` içinde 512, 192, 64, 32 boyutlarında optimize edildi ve yanına "CEPHELAND" kurumsal logotipi ile "Tarafını seç. Cepheni kazan." resmi sloganı eklenerek yatay/dikey marka logoları üretildi.

## ADR-006: Çift Onaylı Admin Yönetimi (Four-Eyes Principle)
- **Tarih:** 2 Kasım 2026
- **Durum:** Kabul edildi
- **Karar:** Lig yayını, harita yayını ve savaş kararı iptali (`battle_reversal`) gibi kritik işlemlerde tek bir yöneticinin tek başına eylem yapması engellendi. İki ayrı yetkili (hazırlayan ve onaylayan) onayı zorunlu kılındı.
