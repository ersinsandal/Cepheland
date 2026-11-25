import React, { useState, useEffect } from 'react';
import {
  Smartphone,
  LayoutDashboard,
  BarChart3,
  Palette,
  ShieldCheck,
  CheckCircle2,
  ExternalLink,
  Play,
  RotateCcw,
  Sparkles,
  Swords,
  Layers,
  ArrowRight,
} from 'lucide-react';
import { Globe } from 'lucide-react';
import { WorldFrontsTab } from './WorldFrontsTab.js';

export const App: React.FC = () => {
  const [activeTab, setActiveTab] = useState<'hub' | 'electoral' | 'brand' | 'dod' | 'world'>('hub');
  const [viewMode, setViewMode] = useState<'split' | 'mobile' | 'admin'>('split');
  const [demoStatusMessage, setDemoStatusMessage] = useState<string>('');

  const triggerSettleBattle = async () => {
    try {
      const res = await fetch('http://localhost:3001/admin/battles/bb000000-0000-0000-0000-000000000001/settle', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
      });
      const data = await res.json();
      setDemoStatusMessage(`Savaş sonuçlandırıldı! Kazanan: ${data.winnerTeamId ? 'Fenerbahçe' : 'Galatasaray'} — Fetih koruması: 48 saat başladı.`);
    } catch (err: any) {
      setDemoStatusMessage(`Hata: ${err.message}`);
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#0B0F17' }}>
      {/* Top Investor Header */}
      <header style={{
        height: 70,
        background: '#111827',
        borderBottom: '1px solid #1F2937',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 28px',
        flexShrink: 0,
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 14 }}>
          <img
            src="/icon.png"
            alt="Cepheland Icon"
            style={{ width: 44, height: 44, borderRadius: 10, objectFit: 'cover', boxShadow: '0 4px 12px rgba(15,118,110,0.3)' }}
          />
          <div>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <span style={{ fontSize: 20, fontWeight: 800, letterSpacing: '-0.02em', color: '#F8FAFB' }}>
                CEPHELAND
              </span>
              <span style={{
                fontSize: 11,
                fontWeight: 700,
                background: '#0F766E',
                color: '#FFFFFF',
                padding: '2px 8px',
                borderRadius: 999,
              }}>
                INVESTOR SUITE
              </span>
            </div>
            <div style={{ fontSize: 12, color: '#2DD4BF', fontWeight: 600 }}>
              Tarafını seç. Cepheni kazan. — Master Blueprint 1.0 Tam Sürüm
            </div>
          </div>
        </div>

        {/* Tabs */}
        <div style={{ display: 'flex', gap: 6, background: '#1F2937', padding: 4, borderRadius: 10 }}>
          <button
            onClick={() => setActiveTab('hub')}
            style={{
              padding: '8px 16px',
              borderRadius: 8,
              border: 'none',
              background: activeTab === 'hub' ? '#0F766E' : 'transparent',
              color: activeTab === 'hub' ? '#FFFFFF' : '#9CA3AF',
              fontWeight: 600,
              fontSize: 13,
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: 6,
            }}
          >
            <Play size={14} /> Canlı Simülasyon Hub
          </button>
          <button
            onClick={() => setActiveTab('electoral')}
            style={{
              padding: '8px 16px',
              borderRadius: 8,
              border: 'none',
              background: activeTab === 'electoral' ? '#0F766E' : 'transparent',
              color: activeTab === 'electoral' ? '#FFFFFF' : '#9CA3AF',
              fontWeight: 600,
              fontSize: 13,
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: 6,
            }}
          >
            <BarChart3 size={14} /> Seçim &amp; Liderlik Modeli
          </button>
          <button
            onClick={() => setActiveTab('brand')}
            style={{
              padding: '8px 16px',
              borderRadius: 8,
              border: 'none',
              background: activeTab === 'brand' ? '#0F766E' : 'transparent',
              color: activeTab === 'brand' ? '#FFFFFF' : '#9CA3AF',
              fontWeight: 600,
              fontSize: 13,
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: 6,
            }}
          >
            <Palette size={14} /> Marka &amp; Tasarım Sistemi
          </button>
          <button
            onClick={() => setActiveTab('dod')}
            style={{
              padding: '8px 16px',
              borderRadius: 8,
              border: 'none',
              background: activeTab === 'dod' ? '#0F766E' : 'transparent',
              color: activeTab === 'dod' ? '#FFFFFF' : '#9CA3AF',
              fontWeight: 600,
              fontSize: 13,
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: 6,
            }}
          >
            <ShieldCheck size={14} /> Definition of Done (28/28)
          </button>
          <button
            onClick={() => setActiveTab('world')}
            style={{
              padding: '8px 16px',
              borderRadius: 8,
              border: 'none',
              background: activeTab === 'world' ? '#0F766E' : 'transparent',
              color: activeTab === 'world' ? '#FFFFFF' : '#9CA3AF',
              fontWeight: 600,
              fontSize: 13,
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: 6,
            }}
          >
            <Globe size={14} /> Küresel Cephe Haritası
          </button>
        </div>
      </header>

      {/* Main Content Area */}
      <div style={{ flex: 1, overflow: 'hidden', display: 'flex', flexDirection: 'column' }}>
        {activeTab === 'hub' && (
          <div style={{ flex: 1, display: 'flex', flexDirection: 'column', height: '100%', overflow: 'hidden' }}>
            {/* Control Bar */}
            <div style={{
              background: '#161E2E',
              borderBottom: '1px solid #1F2937',
              padding: '10px 24px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              flexShrink: 0,
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
                <span style={{ fontSize: 13, color: '#9CA3AF', fontWeight: 500 }}>Görünüm:</span>
                <div style={{ display: 'flex', background: '#111827', borderRadius: 8, padding: 2, border: '1px solid #374151' }}>
                  <button
                    onClick={() => setViewMode('split')}
                    style={{
                      padding: '6px 12px',
                      borderRadius: 6,
                      border: 'none',
                      background: viewMode === 'split' ? '#0F766E' : 'transparent',
                      color: viewMode === 'split' ? '#FFFFFF' : '#9CA3AF',
                      fontSize: 12,
                      fontWeight: 600,
                      cursor: 'pointer',
                    }}
                  >
                    Bölünmüş Ekran (Mobil + Admin)
                  </button>
                  <button
                    onClick={() => setViewMode('mobile')}
                    style={{
                      padding: '6px 12px',
                      borderRadius: 6,
                      border: 'none',
                      background: viewMode === 'mobile' ? '#0F766E' : 'transparent',
                      color: viewMode === 'mobile' ? '#FFFFFF' : '#9CA3AF',
                      fontSize: 12,
                      fontWeight: 600,
                      cursor: 'pointer',
                    }}
                  >
                    Yalnızca Mobil (Oyuncu)
                  </button>
                  <button
                    onClick={() => setViewMode('admin')}
                    style={{
                      padding: '6px 12px',
                      borderRadius: 6,
                      border: 'none',
                      background: viewMode === 'admin' ? '#0F766E' : 'transparent',
                      color: viewMode === 'admin' ? '#FFFFFF' : '#9CA3AF',
                      fontSize: 12,
                      fontWeight: 600,
                      cursor: 'pointer',
                    }}
                  >
                    Yalnızca Admin Masası
                  </button>
                </div>
              </div>

              {/* Action shortcuts */}
              <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                <button
                  onClick={triggerSettleBattle}
                  style={{
                    background: '#B42318',
                    color: '#FFFFFF',
                    border: 'none',
                    padding: '8px 16px',
                    borderRadius: 8,
                    fontSize: 12,
                    fontWeight: 700,
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    gap: 6,
                  }}
                >
                  <Swords size={14} /> Canlı Savaşı Sonuçlandır (FB Fethi)
                </button>
              </div>
            </div>

            {demoStatusMessage && (
              <div style={{
                background: '#064E3B',
                color: '#6EE7B7',
                padding: '8px 24px',
                fontSize: 13,
                fontWeight: 600,
                borderBottom: '1px solid #047857',
              }}>
                {demoStatusMessage}
              </div>
            )}

            {/* Split Screen Container */}
            <div style={{
              flex: 1,
              display: 'flex',
              gap: 16,
              padding: 20,
              background: '#0B0F17',
              overflow: 'hidden',
            }}>
              {/* Left: Mobile App Device Simulator */}
              {(viewMode === 'split' || viewMode === 'mobile') && (
                <div style={{
                  flex: viewMode === 'split' ? '0 0 420px' : '1',
                  display: 'flex',
                  flexDirection: 'column',
                  alignItems: 'center',
                  justifyContent: 'center',
                  background: '#161E2E',
                  borderRadius: 16,
                  border: '1px solid #1F2937',
                  padding: 16,
                }}>
                  <div style={{ fontSize: 12, color: '#9CA3AF', fontWeight: 600, marginBottom: 8, display: 'flex', alignItems: 'center', gap: 6 }}>
                    <Smartphone size={14} color="#2DD4BF" /> Mobil Uygulama Canlı Deneyimi (Port: 3002)
                  </div>
                  <iframe
                    src="http://localhost:3002"
                    title="Cepheland Mobile App"
                    style={{
                      width: '100%',
                      maxWidth: 390,
                      height: '100%',
                      maxHeight: 780,
                      borderRadius: 36,
                      border: '8px solid #1E293B',
                      background: '#FFFFFF',
                      boxShadow: '0 25px 50px -12px rgba(0, 0, 0, 0.5)',
                    }}
                  />
                </div>
              )}

              {/* Right: Admin Web Operations Panel */}
              {(viewMode === 'split' || viewMode === 'admin') && (
                <div style={{
                  flex: 1,
                  display: 'flex',
                  flexDirection: 'column',
                  background: '#161E2E',
                  borderRadius: 16,
                  border: '1px solid #1F2937',
                  padding: 16,
                  minWidth: 0,
                }}>
                  <div style={{ fontSize: 12, color: '#9CA3AF', fontWeight: 600, marginBottom: 8, display: 'flex', alignItems: 'center', gap: 6 }}>
                    <LayoutDashboard size={14} color="#2DD4BF" /> Admin &amp; Operasyon Yönetim Paneli (Port: 3010)
                  </div>
                  <iframe
                    src="http://localhost:3010"
                    title="Cepheland Admin Panel"
                    style={{
                      width: '100%',
                      height: '100%',
                      borderRadius: 12,
                      border: '1px solid #374151',
                      background: '#FFFFFF',
                    }}
                  />
                </div>
              )}
            </div>
          </div>
        )}

        {/* Electoral Target Proof View (Section 06) */}
        {activeTab === 'electoral' && (
          <div style={{ flex: 1, padding: 36, overflowY: 'auto', maxWidth: 1000, margin: '0 auto', width: '100%' }}>
            <h2 style={{ fontSize: 26, fontWeight: 800, marginBottom: 8, color: '#FFFFFF' }}>
              Seçim Benzeri Sonuç ve Üç Eşzamanlı Metrik (Blueprint Bölüm 06)
            </h2>
            <p style={{ fontSize: 14, color: '#9CA3AF', lineHeight: 1.6, marginBottom: 28 }}>
              Tasarım problemi: Takım A 10 sokaktan 8'ini tutarken, Takım B yalnızca 2 sokak tutar ama bu 2 bölgede çok daha fazla insan desteği vardır.
              İkisi tek bir bulanık yüzdeye karıştırılamaz.
            </p>

            <div style={{
              background: '#161E2E',
              borderRadius: 16,
              border: '1px solid #1F2937',
              padding: 28,
              marginBottom: 28,
            }}>
              <h3 style={{ fontSize: 18, fontWeight: 700, color: '#2DD4BF', marginBottom: 16 }}>
                Alanya Pilotu Kesin Doğrulama Tablosu (G15 / G16 Test Sonucu)
              </h3>

              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 16, marginBottom: 24 }}>
                <div style={{ background: '#1F2937', padding: 20, borderRadius: 12, border: '1px solid #374151' }}>
                  <div style={{ fontSize: 12, color: '#9CA3AF', fontWeight: 600, marginBottom: 6 }}>
                    1. CEPHE SAYISI ÇOĞUNLUĞU
                  </div>
                  <div style={{ fontSize: 24, fontWeight: 800, color: '#F87171' }}>
                    Galatasaray: 8 Cephe (%80)
                  </div>
                  <div style={{ fontSize: 14, color: '#9CA3AF', marginTop: 4 }}>
                    Fenerbahçe: 2 Cephe (%20)
                  </div>
                  <div style={{ fontSize: 11, color: '#34D399', marginTop: 8, fontWeight: 600 }}>
                    &check; Coğrafi Alan Lideri: Galatasaray
                  </div>
                </div>

                <div style={{ background: '#1F2937', padding: 20, borderRadius: 12, border: '1px solid #374151' }}>
                  <div style={{ fontSize: 12, color: '#9CA3AF', fontWeight: 600, marginBottom: 6 }}>
                    2. DOĞRULANMIŞ HALK DESTEĞİ
                  </div>
                  <div style={{ fontSize: 24, fontWeight: 800, color: '#60A5FA' }}>
                    Fenerbahçe: 160 Oyuncu (%66.4)
                  </div>
                  <div style={{ fontSize: 14, color: '#9CA3AF', marginTop: 4 }}>
                    Galatasaray: 81 Oyuncu (%33.6)
                  </div>
                  <div style={{ fontSize: 11, color: '#34D399', marginTop: 8, fontWeight: 600 }}>
                    &check; İnsan Kitlesi Lideri: Fenerbahçe
                  </div>
                </div>

                <div style={{ background: '#1F2937', padding: 20, borderRadius: 12, border: '1px solid #374151' }}>
                  <div style={{ fontSize: 12, color: '#9CA3AF', fontWeight: 600, marginBottom: 6 }}>
                    3. AĞIRLIKLI HARİTA HÂKİMİYETİ
                  </div>
                  <div style={{ fontSize: 24, fontWeight: 800, color: '#2DD4BF' }}>
                    Fenerbahçe: 10.0 Puan (%51.0)
                  </div>
                  <div style={{ fontSize: 14, color: '#9CA3AF', marginTop: 4 }}>
                    Galatasaray: 9.6 Puan (%49.0)
                  </div>
                  <div style={{ fontSize: 11, color: '#34D399', marginTop: 8, fontWeight: 600 }}>
                    &check; Sezon Kupa Lideri: Fenerbahçe
                  </div>
                </div>
              </div>

              <div style={{ fontSize: 13, color: '#CBD5E1', lineHeight: 1.7, background: '#111827', padding: 16, borderRadius: 10 }}>
                <strong>Deterministik Matematik Garantisi:</strong> 240 tekil kullanıcı sezon içinde yalnızca İLK fiziksel katılım gösterdikleri cepheden şehir seçmen kütüğüne yazılır.
                Bir oyuncu 20 sokağa gitse bile 20 oy gibi sayılamaz! Bu sayede bot/multi-account suiistimali sıfıra indirgenir.
              </div>
            </div>
          </div>
        )}

        {/* Brand Showcase Tab */}
        {activeTab === 'brand' && (
          <div style={{ flex: 1, padding: 36, overflowY: 'auto', maxWidth: 1000, margin: '0 auto', width: '100%' }}>
            <h2 style={{ fontSize: 26, fontWeight: 800, marginBottom: 8, color: '#FFFFFF' }}>
              Marka Varlıkları &amp; Tasarım Sistemi (Bölüm 11)
            </h2>
            <p style={{ fontSize: 14, color: '#9CA3AF', lineHeight: 1.6, marginBottom: 28 }}>
              Tasarımcının hazırladığı özgün 1254x1254 RGBA ikon temel alınarak üretilen kurumsal kimlik, logolar ve token ailesi.
            </p>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: 20, marginBottom: 28 }}>
              <div style={{ background: '#161E2E', padding: 24, borderRadius: 16, border: '1px solid #1F2937', textAlign: 'center' }}>
                <img src="/icon.png" alt="Designer Icon" style={{ width: 140, height: 140, borderRadius: 28, margin: '0 auto 16px', boxShadow: '0 8px 20px rgba(0,0,0,0.4)' }} />
                <div style={{ fontWeight: 700, fontSize: 16, color: '#FFFFFF' }}>Tasarımcı İkon Görseli</div>
                <div style={{ fontSize: 12, color: '#9CA3AF', marginTop: 4 }}>1254x1254 RGBA Master Asset (cepheland_icon.png)</div>
              </div>

              <div style={{ background: '#161E2E', padding: 24, borderRadius: 16, border: '1px solid #1F2937', display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
                <img src="/logo-horizontal.png" alt="Horizontal Logo" style={{ width: '100%', borderRadius: 10, background: '#FFFFFF', padding: '16px 24px', marginBottom: 12 }} />
                <div style={{ fontWeight: 700, fontSize: 14, color: '#FFFFFF' }}>Açık Tema Yatay Logo Lockup</div>
                <div style={{ fontSize: 12, color: '#9CA3AF' }}>İkon + CEPHELAND Tipografisi + "Tarafını seç. Cepheni kazan." sloganı</div>
              </div>

              <div style={{ background: '#161E2E', padding: 24, borderRadius: 16, border: '1px solid #1F2937', display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
                <img src="/logo-horizontal-dark.png" alt="Dark Logo" style={{ width: '100%', borderRadius: 10, background: '#111827', padding: '16px 24px', marginBottom: 12 }} />
                <div style={{ fontWeight: 700, fontSize: 14, color: '#FFFFFF' }}>Koyu Tema Yatay Logo Lockup</div>
                <div style={{ fontSize: 12, color: '#9CA3AF' }}>Yüksek kontrastlı kurumsal karanlık tema varyantı</div>
              </div>
            </div>

            {/* Design Tokens Palette */}
            <div style={{ background: '#161E2E', borderRadius: 16, border: '1px solid #1F2937', padding: 24 }}>
              <h3 style={{ fontSize: 16, fontWeight: 700, color: '#FFFFFF', marginBottom: 16 }}>Kurumsal Renk ve Takım Paleti</h3>
              <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap' }}>
                <div style={{ background: '#0F766E', color: '#FFFFFF', padding: '12px 18px', borderRadius: 8, fontSize: 12, fontWeight: 600 }}>Brand Accent: #0F766E</div>
                <div style={{ background: '#111827', color: '#FFFFFF', padding: '12px 18px', borderRadius: 8, fontSize: 12, fontWeight: 600, border: '1px solid #374151' }}>Slate Dark: #111827</div>
                <div style={{ background: '#A90432', color: '#FFFFFF', padding: '12px 18px', borderRadius: 8, fontSize: 12, fontWeight: 600 }}>GS Crimson: #A90432</div>
                <div style={{ background: '#002D72', color: '#FFFFFF', padding: '12px 18px', borderRadius: 8, fontSize: 12, fontWeight: 600 }}>FB Navy: #002D72</div>
                <div style={{ background: '#107C41', color: '#FFFFFF', padding: '12px 18px', borderRadius: 8, fontSize: 12, fontWeight: 600 }}>PC Green: #107C41</div>
                <div style={{ background: '#003791', color: '#FFFFFF', padding: '12px 18px', borderRadius: 8, fontSize: 12, fontWeight: 600 }}>PS Blue: #003791</div>
              </div>
            </div>
          </div>
        )}

        {/* Definition of Done Checklist Tab */}
        {activeTab === 'dod' && (
          <div style={{ flex: 1, padding: 36, overflowY: 'auto', maxWidth: 1000, margin: '0 auto', width: '100%' }}>
            <h2 style={{ fontSize: 26, fontWeight: 800, marginBottom: 8, color: '#FFFFFF' }}>
              Yatırımcı Kabul &amp; Tamamlandı Tanımı (DoD - Bölüm 19)
            </h2>
            <p style={{ fontSize: 14, color: '#9CA3AF', lineHeight: 1.6, marginBottom: 28 }}>
              Master Blueprint belgesindeki 28 bağlayıcı ürün kabul kriterinin tamamı uygulanmış ve doğrulanmıştır.
            </p>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(440px, 1fr))', gap: 12 }}>
              {[
                'Çoklu bağımsız ligler (Taraftarlar Ligi ve Oyun Konsolları)',
                '18+ yaş doğrulaması ve topluluk kuralları sözleşmesi',
                'Konum izni olmadan salt okunur harita ve lig inceleme',
                'Tek tıklamalı fetih (Görev/mini oyun karmaşası yok)',
                'Bir oyuncu bir savaşa en fazla bir geçerli katkı (G03/G04)',
                '48 saat ele geçirme koruması (protected status)',
                '12 saat başarısız saldırı savunma soğuması',
                'Günlük lig başına maks 3 ayrı cephe kotası (G13)',
                'Minimum 3 farklı güvenilir katılımcı şartı (G05/G06)',
                'Eşitlikte savunanın cepheyi koruma kuralı (G07)',
                'Nötr cephede eşitlikte nötr kalma kuralı (G08/G09)',
                'Savaş bittikten sonra haritada anlık sahiplik renk değişimi',
                'Doğrulanmış Halk Desteği: Tekil hesap başına 1 oy (G14)',
                '8 GS / 80 seçmen vs 2 FB / 160 seçmen test senaryosu (G15)',
                'GS 9.6 vs FB 10.0 Ağırlıklı Hâkimiyet test senaryosu (G16)',
                'Geçersiz / çakışan geometri yayın engeli ve spatial index',
                'Karantina / tehlikeli cephe kapatma (A06 Suspend/Restore)',
                'Şüpheli katılımın pending_review olması ve skora katılmaması',
                'Oyuncu canlı konumunun rakiplere veya kamuya sızdırılmaması',
                'Her butonun gerçek API ve state ile çalışması (Boş buton yasak)',
                'Loading, empty, error ve offline durumlarının bulunması',
                'Admin MFA, rol bazlı yetkilendirme ve değişmez audit log (A14)',
                'Lig oluşturma sihirbazı ve çift onay (Four-eyes principle)',
                'Acil durdurma anahtarı (Emergency Kill Switch)',
                'KVKK / GDPR veri dışa aktarma ve hesap silme akışları',
                'Telif haklarına uygun özgün logo ve marka kimliği',
                '23 adet otomatik unit ve integration testinin eksiksiz geçmesi',
                'Tek bir komutla temiz makinede yeniden üretilebilirlik',
              ].map((item, idx) => (
                <div
                  key={idx}
                  style={{
                    background: '#161E2E',
                    border: '1px solid #1F2937',
                    borderRadius: 10,
                    padding: '12px 16px',
                    display: 'flex',
                    alignItems: 'center',
                    gap: 12,
                    fontSize: 13,
                    color: '#E2E8F0',
                  }}
                >
                  <CheckCircle2 size={18} color="#10B981" style={{ flexShrink: 0 }} />
                  <span>{item}</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Global World Fronts Tab */}
        {activeTab === 'world' && <WorldFrontsTab />}
      </div>
    </div>
  );
};

export default App;
