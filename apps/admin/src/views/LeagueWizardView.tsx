import React, { useState } from 'react';
import {
  Check,
  ChevronRight,
  ChevronLeft,
  Sparkles,
  ShieldCheck,
  MapPin,
  Calendar,
  Sliders,
  FileCheck,
  CheckCircle2,
  AlertCircle,
} from 'lucide-react';
import { fetchApi } from '../api.js';

interface LeagueWizardViewProps {
  onComplete: () => void;
}

export const LeagueWizardView: React.FC<LeagueWizardViewProps> = ({ onComplete }) => {
  const [currentStep, setCurrentStep] = useState(1);
  const [loading, setLoading] = useState(false);
  const [successMessage, setSuccessMessage] = useState('');

  // Form State
  const [formData, setFormData] = useState({
    slug: 'basketbol-super-lig',
    nameTr: 'Türkiye Basketbol Süper Ligi',
    nameEn: 'Turkish Basketball Super League',
    descTr: 'Şehrin potalarında mahalle mahalle basketbol rekabeti',
    descEn: 'Street basketball rivalry across urban courts and districts',
    teams: [
      { slug: 'anadolu-efes', name: 'Anadolu Efes', primary: '#0A2540', secondary: '#00D4B2' },
      { slug: 'fenerbahce-beko', name: 'Fenerbahçe Beko', primary: '#002D72', secondary: '#FFED02' },
      { slug: 'galatasaray-basket', name: 'Galatasaray', primary: '#A90432', secondary: '#FDB913' },
    ],
    city: 'Alanya',
    mapVersion: 'v1.0 (Mahmutlar Pilot)',
    seasonTitle: '2026 Açılış Sezonu',
    seasonMetric: 'weighted_control',
    battleDuration: 24,
    protectionHours: 48,
    dailyFrontsQuota: 3,
    minAttackers: 3,
    brandCleared: true,
    secondAdminApproved: true,
  });

  const steps = [
    { num: 1, title: 'Kimlik', icon: <Sparkles size={16} /> },
    { num: 2, title: 'Takımlar', icon: <Sliders size={16} /> },
    { num: 3, title: 'Harita Kapsamı', icon: <MapPin size={16} /> },
    { num: 4, title: 'Sezon Tanımı', icon: <Calendar size={16} /> },
    { num: 5, title: 'Oyun Kuralları', icon: <Sliders size={16} /> },
    { num: 6, title: 'Marka & Hukuk', icon: <FileCheck size={16} /> },
    { num: 7, title: 'Çift Onay & Yayın', icon: <ShieldCheck size={16} /> },
  ];

  const handlePublish = async () => {
    setLoading(true);
    try {
      // 1. Create draft league with teams via API
      const league = await fetchApi<any>('/admin/leagues', {
        method: 'POST',
        body: JSON.stringify({
          slug: formData.slug,
          nameI18n: { tr: formData.nameTr, en: formData.nameEn },
          descriptionI18n: { tr: formData.descTr, en: formData.descEn },
          teams: formData.teams.map((t) => ({
            slug: t.slug,
            nameI18n: { tr: t.name, en: t.name },
            colorPrimary: t.primary,
            colorSecondary: t.secondary,
          })),
        }),
      });

      // 2. Publish league with dual approval
      await fetchApi<any>(`/admin/leagues/${league.id}/publish`, {
        method: 'POST',
      });

      setSuccessMessage(`Lig başarıyla oluşturuldu ve yayımlandı: ${formData.nameTr}`);
      setTimeout(() => {
        onComplete();
      }, 1500);
    } catch (err: any) {
      alert(`Lig yayını hatası: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ background: '#FFFFFF', borderRadius: 16, border: '1px solid #D9DEE6', padding: 32 }}>
      {/* Header */}
      <div style={{ marginBottom: 28 }}>
        <h2 style={{ fontSize: 22, fontWeight: 700, color: '#111827', marginBottom: 6 }}>
          Lig Oluşturma Sihirbazı (7 Adımlı Süreç)
        </h2>
        <p style={{ fontSize: 14, color: '#586271' }}>
          Master Blueprint Bölüm 12.4 uyarınca kod yazmadan yeni bir rekabet ligi tanımlayın, takımlarını ekleyin ve çift yönetici onayıyla yayına alın.
        </p>
      </div>

      {/* Step Indicators */}
      <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 36, overflowX: 'auto', paddingBottom: 8 }}>
        {steps.map((s, idx) => {
          const isDone = currentStep > s.num;
          const isCurrent = currentStep === s.num;
          return (
            <React.Fragment key={s.num}>
              <div
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: 8,
                  padding: '8px 12px',
                  borderRadius: 8,
                  background: isCurrent ? '#0F766E' : isDone ? '#ECFDF5' : '#F8FAFB',
                  color: isCurrent ? '#FFFFFF' : isDone ? '#027A48' : '#8E98A8',
                  fontSize: 13,
                  fontWeight: 600,
                  whiteSpace: 'nowrap',
                }}
              >
                {isDone ? <Check size={16} /> : s.icon}
                <span>{s.num}. {s.title}</span>
              </div>
              {idx < steps.length - 1 && <ChevronRight size={14} color="#D9DEE6" />}
            </React.Fragment>
          );
        })}
      </div>

      {/* Step Content */}
      <div style={{ minHeight: 320 }}>
        {currentStep === 1 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16, maxWidth: 600 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 1: Lig Kimliği ve İsimlendirme</h3>
            <div>
              <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Lig Benzersiz Kodu (Slug)</label>
              <input
                type="text"
                value={formData.slug}
                onChange={(e) => setFormData({ ...formData, slug: e.target.value })}
                style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
              />
            </div>
            <div>
              <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Türkçe Adı</label>
              <input
                type="text"
                value={formData.nameTr}
                onChange={(e) => setFormData({ ...formData, nameTr: e.target.value })}
                style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
              />
            </div>
            <div>
              <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>İngilizce Adı</label>
              <input
                type="text"
                value={formData.nameEn}
                onChange={(e) => setFormData({ ...formData, nameEn: e.target.value })}
                style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
              />
            </div>
            <div>
              <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Kısa Açıklama (TR)</label>
              <textarea
                value={formData.descTr}
                onChange={(e) => setFormData({ ...formData, descTr: e.target.value })}
                rows={2}
                style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
              />
            </div>
          </div>
        )}

        {currentStep === 2 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 2: Takımlar (En az 2, en fazla 8)</h3>
            <p style={{ fontSize: 13, color: '#586271' }}>Her takımın harita üzerinde kontrast sağlayan ana ve ikincil rengi bulunmalıdır.</p>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: 16 }}>
              {formData.teams.map((t, i) => (
                <div key={i} style={{ border: '1px solid #D9DEE6', borderRadius: 10, padding: 16, background: '#F8FAFB' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 10 }}>
                    <div style={{ width: 24, height: 24, borderRadius: 6, background: t.primary, border: `2px solid ${t.secondary}` }} />
                    <span style={{ fontWeight: 700, fontSize: 15 }}>{t.name}</span>
                  </div>
                  <div style={{ fontSize: 12, color: '#586271' }}>Slug: {t.slug}</div>
                  <div style={{ fontSize: 12, color: '#586271', marginTop: 4 }}>
                    Renkler: <code style={{ background: '#FFFFFF', padding: '2px 4px', borderRadius: 4 }}>{t.primary}</code> / <code style={{ background: '#FFFFFF', padding: '2px 4px', borderRadius: 4 }}>{t.secondary}</code>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {currentStep === 3 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16, maxWidth: 600 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 3: Harita Kapsamı ve Pilot Şehir</h3>
            <div style={{ border: '1px solid #D9DEE6', borderRadius: 10, padding: 16 }}>
              <div style={{ fontWeight: 600, marginBottom: 4 }}>Seçili Pilot Bölge: Türkiye &gt; Antalya &gt; Alanya &gt; Mahmutlar</div>
              <div style={{ fontSize: 13, color: '#586271' }}>Harita Sürümü: {formData.mapVersion}</div>
              <div style={{ fontSize: 13, color: '#027A48', marginTop: 8, display: 'flex', alignItems: 'center', gap: 6 }}>
                <CheckCircle2 size={16} /> 12 onaylı, çakışmasız sokak cephesi ve güvenli kamusal yaya noktaları hazır.
              </div>
            </div>
          </div>
        )}

        {currentStep === 4 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16, maxWidth: 600 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 4: Sezon Tanımı ve Şampiyonluk Metriği</h3>
            <div>
              <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Sezon Başlığı</label>
              <input
                type="text"
                value={formData.seasonTitle}
                onChange={(e) => setFormData({ ...formData, seasonTitle: e.target.value })}
                style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
              />
            </div>
            <div>
              <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Şampiyonluk Belirleme Metriği</label>
              <select
                value={formData.seasonMetric}
                onChange={(e) => setFormData({ ...formData, seasonMetric: e.target.value })}
                style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
              >
                <option value="weighted_control">Ağırlıklı Harita Hâkimiyeti (Weighted Control - Varsayılan)</option>
                <option value="front_count">Cephe Sayısı Çoğunluğu (Front Count)</option>
                <option value="verified_support">Doğrulanmış Halk Desteği (Verified Player Support)</option>
              </select>
            </div>
          </div>
        )}

        {currentStep === 5 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16, maxWidth: 600 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 5: Oyun Süreleri ve Kotalar</h3>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
              <div>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Savaş Süresi</label>
                <input
                  type="number"
                  value={formData.battleDuration}
                  readOnly
                  style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6', background: '#F8FAFB' }}
                />
                <span style={{ fontSize: 11, color: '#8E98A8' }}>24 saat (Sabit Kural)</span>
              </div>
              <div>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Fetih Koruma Süresi</label>
                <input
                  type="number"
                  value={formData.protectionHours}
                  readOnly
                  style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6', background: '#F8FAFB' }}
                />
                <span style={{ fontSize: 11, color: '#8E98A8' }}>48 saat koruma</span>
              </div>
              <div>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Günlük Cephe Sınırı</label>
                <input
                  type="number"
                  value={formData.dailyFrontsQuota}
                  readOnly
                  style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6', background: '#F8FAFB' }}
                />
                <span style={{ fontSize: 11, color: '#8E98A8' }}>Lig başına maks 3 ayrı cephe</span>
              </div>
              <div>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Kazanma İçin Min Saldırgan</label>
                <input
                  type="number"
                  value={formData.minAttackers}
                  readOnly
                  style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6', background: '#F8FAFB' }}
                />
                <span style={{ fontSize: 11, color: '#8E98A8' }}>En az 3 doğrulanmış hesap</span>
              </div>
            </div>
          </div>
        )}

        {currentStep === 6 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16, maxWidth: 600 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 6: Marka Hakları ve Hukuki Uygunluk</h3>
            <div style={{ border: '1px solid #D9DEE6', borderRadius: 10, padding: 16, display: 'flex', flexDirection: 'column', gap: 12 }}>
              <label style={{ display: 'flex', alignItems: 'center', gap: 10, cursor: 'pointer' }}>
                <input
                  type="checkbox"
                  checked={formData.brandCleared}
                  onChange={(e) => setFormData({ ...formData, brandCleared: e.target.checked })}
                />
                <span style={{ fontSize: 13, fontWeight: 600 }}>
                  Kullanılan takım adları, renkleri ve amblemleri telif haklarına ve topluluk ilkelerine uygundur.
                </span>
              </label>
              <label style={{ display: 'flex', alignItems: 'center', gap: 10, cursor: 'pointer' }}>
                <input type="checkbox" defaultChecked />
                <span style={{ fontSize: 13, fontWeight: 600 }}>
                  Gerçek dünya nefret söylemi, ayrımcılık veya fiziksel şiddet teşviki içermez (18+ yaş sınırı).
                </span>
              </label>
            </div>
          </div>
        )}

        {currentStep === 7 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 20, maxWidth: 640 }}>
            <h3 style={{ fontSize: 16, fontWeight: 700 }}>Adım 7: Çift Onay Denetimi ve Yayınlama (Four-Eyes Principle)</h3>
            <div style={{ border: '1px solid #BFDBFE', background: '#EFF6FF', borderRadius: 10, padding: 16 }}>
              <div style={{ fontWeight: 700, color: '#1D4ED8', marginBottom: 4 }}>Yayın Öncesi Doğrulama Özeti</div>
              <ul style={{ fontSize: 13, color: '#1E40AF', lineHeight: 1.8, paddingLeft: 18 }}>
                <li>Lig: <strong>{formData.nameTr}</strong> ({formData.slug})</li>
                <li>Takımlar: {formData.teams.map((t) => t.name).join(', ')}</li>
                <li>Harita: Alanya Mahmutlar (12 Cephe)</li>
                <li>Şampiyonluk: Ağırlıklı Harita Hâkimiyeti</li>
                <li>Hazırlayan: Super Admin (SA)</li>
              </ul>
            </div>

            <label style={{ display: 'flex', alignItems: 'center', gap: 10, cursor: 'pointer', border: '1px solid #D9DEE6', padding: 12, borderRadius: 8 }}>
              <input
                type="checkbox"
                checked={formData.secondAdminApproved}
                onChange={(e) => setFormData({ ...formData, secondAdminApproved: e.target.checked })}
              />
              <span style={{ fontSize: 13, fontWeight: 600 }}>
                2. Yetkili Denetçi (QA &amp; Operasyon Müdürü) lig kurallarını ve haritayı onayladı.
              </span>
            </label>

            {successMessage && (
              <div style={{ padding: '12px 16px', borderRadius: 8, background: '#ECFDF5', color: '#027A48', fontWeight: 600, fontSize: 14 }}>
                {successMessage}
              </div>
            )}
          </div>
        )}
      </div>

      {/* Navigation Buttons */}
      <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 36, paddingTop: 20, borderTop: '1px solid #EDF0F3' }}>
        <button
          onClick={() => setCurrentStep(Math.max(1, currentStep - 1))}
          disabled={currentStep === 1}
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: 6,
            padding: '10px 18px',
            borderRadius: 8,
            border: '1px solid #D9DEE6',
            background: '#FFFFFF',
            color: '#586271',
            fontSize: 14,
            fontWeight: 600,
            cursor: currentStep === 1 ? 'not-allowed' : 'pointer',
            opacity: currentStep === 1 ? 0.5 : 1,
          }}
        >
          <ChevronLeft size={16} /> Geri
        </button>

        {currentStep < 7 ? (
          <button
            onClick={() => setCurrentStep(currentStep + 1)}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: 6,
              padding: '10px 22px',
              borderRadius: 8,
              border: 'none',
              background: '#0F766E',
              color: '#FFFFFF',
              fontSize: 14,
              fontWeight: 600,
              cursor: 'pointer',
            }}
          >
            İleri <ChevronRight size={16} />
          </button>
        ) : (
          <button
            onClick={handlePublish}
            disabled={loading || !formData.secondAdminApproved}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: 8,
              padding: '12px 24px',
              borderRadius: 8,
              border: 'none',
              background: '#027A48',
              color: '#FFFFFF',
              fontSize: 14,
              fontWeight: 700,
              cursor: loading ? 'wait' : 'pointer',
              opacity: formData.secondAdminApproved ? 1 : 0.5,
            }}
          >
            <CheckCircle2 size={18} />
            {loading ? 'Yayımlanıyor...' : 'Ligi Resmen Yayımla'}
          </button>
        )}
      </div>
    </div>
  );
};
