import React, { useEffect, useState } from 'react';
import {
  Trophy,
  Swords,
  CheckCircle,
  AlertTriangle,
  ShieldCheck,
  TrendingUp,
  MapPin,
  Clock,
  ArrowRight,
} from 'lucide-react';
import { AdminTab } from '../components/Sidebar.js';
import { fetchApi } from '../api.js';

interface OverviewViewProps {
  onNavigate: (tab: AdminTab) => void;
  kpis: {
    activeLeagues: number;
    liveBattles: number;
    todayApprovedClaims: number;
    pendingReviewCases: number;
    suspendedFronts: number;
    apiErrorRatePercent: number;
    avgSettlementLatencySeconds: number;
  };
}

export const OverviewView: React.FC<OverviewViewProps> = ({ onNavigate, kpis }) => {
  const [frontName, setFrontName] = useState('Cephe adı yükleniyor…');
  useEffect(() => {
    const controller = new AbortController();
    fetchApi<any>('/fronts/f0000000-0000-0000-0000-000000000003', { signal: controller.signal })
      .then(front => {
        if (!controller.signal.aborted) setFrontName(front.displayNameI18n?.tr || front.displayNameI18n?.en || front.streetName || front.frontCode || 'Cephe');
      })
      .catch(() => { if (!controller.signal.aborted) setFrontName('Cephe adı alınamadı'); });
    return () => controller.abort();
  }, []);
  const cards = [
    {
      title: 'Aktif Lig Sayısı',
      value: kpis.activeLeagues,
      sub: 'Taraftarlar Ligi + Oyun Konsolları',
      icon: <Trophy color="#0F766E" size={24} />,
      actionLabel: 'Ligleri Yönet',
      actionTab: 'leagues' as AdminTab,
    },
    {
      title: 'Canlı Savaşlar',
      value: kpis.liveBattles,
      sub: `${frontName} (FB saldırısı)`,
      icon: <Swords color="#B42318" size={24} />,
      actionLabel: 'Savaş Merkezini Aç',
      actionTab: 'battles' as AdminTab,
      highlight: true,
    },
    {
      title: 'Onaylanan Katkılar (Bugün)',
      value: kpis.todayApprovedClaims,
      sub: 'Fiziksel konum doğrulaması geçen',
      icon: <CheckCircle color="#027A48" size={24} />,
      actionLabel: 'Sıralamaları İncele',
      actionTab: 'rankings_audit' as AdminTab,
    },
    {
      title: 'İncelemedeki Güvenlik Vakaları',
      value: kpis.pendingReviewCases,
      sub: 'Şüpheli cihaz / integrity riski',
      icon: <ShieldCheck color="#B54708" size={24} />,
      actionLabel: 'Vakaları İncele',
      actionTab: 'security' as AdminTab,
      alert: kpis.pendingReviewCases > 0,
    },
    {
      title: 'Kapatılan / Askıya Alınan Cephe',
      value: kpis.suspendedFronts,
      sub: 'Güvenlik veya tehlike karantinası',
      icon: <MapPin color="#64748B" size={24} />,
      actionLabel: 'Harita Editörünü Aç',
      actionTab: 'map_editor' as AdminTab,
    },
    {
      title: 'Ortalama Settlement Süresi',
      value: `${kpis.avgSettlementLatencySeconds}s`,
      sub: 'Atomik kural sonuçlandırma hızı',
      icon: <Clock color="#4F46E5" size={24} />,
      actionLabel: 'Denetim Günlüğü',
      actionTab: 'audit' as AdminTab,
    },
  ];

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 24 }}>
      {/* Top Hero Banner */}
      <div style={{
        background: 'linear-gradient(135deg, #0F766E 0%, #115E59 100%)',
        borderRadius: 16,
        padding: '24px 32px',
        color: '#FFFFFF',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        boxShadow: '0 4px 12px rgba(15, 118, 110, 0.15)',
      }}>
        <div>
          <div style={{ fontSize: 22, fontWeight: 700, marginBottom: 6 }}>
            Alanya Mahmutlar Pilot Operasyon Merkezi
          </div>
          <div style={{ fontSize: 14, opacity: 0.9, maxWidth: 640, lineHeight: 1.5 }}>
            Master Blueprint 1.0 standartlarında tam çalışan konum tabanlı fetih motoru.
            12 cephe, 2 bağımsız lig ve 240 doğrulanmış seçmen senaryosu aktif.
          </div>
        </div>
        <button
          onClick={() => onNavigate('wizard')}
          style={{
            background: '#FFFFFF',
            color: '#0F766E',
            border: 'none',
            padding: '12px 20px',
            borderRadius: 10,
            fontSize: 14,
            fontWeight: 700,
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            gap: 8,
            boxShadow: '0 2px 6px rgba(0,0,0,0.1)',
          }}
        >
          Yeni Lig Sihirbazını Başlat
          <ArrowRight size={16} />
        </button>
      </div>

      {/* KPI Cards Grid */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))',
        gap: 16,
      }}>
        {cards.map((c, i) => (
          <div
            key={i}
            style={{
              background: '#FFFFFF',
              borderRadius: 12,
              padding: 20,
              border: c.alert ? '1px solid #FECDCA' : '1px solid #D9DEE6',
              boxShadow: '0 1px 3px rgba(0,0,0,0.05)',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
            }}
          >
            <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', marginBottom: 12 }}>
              <div>
                <div style={{ fontSize: 13, color: '#586271', fontWeight: 500, marginBottom: 4 }}>
                  {c.title}
                </div>
                <div style={{ fontSize: 28, fontWeight: 700, color: '#111827' }}>
                  {c.value}
                </div>
              </div>
              <div style={{
                padding: 10,
                borderRadius: 10,
                background: '#F8FAFB',
                border: '1px solid #EDF0F3',
              }}>
                {c.icon}
              </div>
            </div>

            <div>
              <div style={{ fontSize: 12, color: '#8E98A8', marginBottom: 12, overflowWrap: 'anywhere' }}>
                {c.sub}
              </div>
              <button
                onClick={() => onNavigate(c.actionTab)}
                style={{
                  background: 'transparent',
                  border: 'none',
                  color: '#0F766E',
                  fontSize: 13,
                  fontWeight: 600,
                  display: 'flex',
                  alignItems: 'center',
                  gap: 4,
                  cursor: 'pointer',
                  padding: 0,
                }}
              >
                {c.actionLabel} &rarr;
              </button>
            </div>
          </div>
        ))}
      </div>

      {/* Pilot front focus uses the same canonical name as the map. */}
      <div style={{
        background: '#FFFFFF',
        borderRadius: 12,
        padding: 24,
        border: '1px solid #D9DEE6',
      }}>
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 16, gap: 12 }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 10, minWidth: 0 }}>
            <span style={{
              width: 10,
              height: 10,
              borderRadius: '50%',
              background: '#B42318',
              display: 'inline-block',
              boxShadow: '0 0 0 4px #FEE4E2',
              flexShrink: 0,
            }} />
            <h3 title={frontName} style={{ fontSize: 16, fontWeight: 700, color: '#111827', overflowWrap: 'anywhere' }}>
              Canlı Takip: {frontName}
            </h3>
          </div>
          <span style={{
            fontSize: 12,
            fontWeight: 600,
            background: '#FEF3F2',
            color: '#B42318',
            padding: '4px 10px',
            borderRadius: 6,
            flexShrink: 0,
          }}>
            SALDIRI DEVAM EDİYOR (24h)
          </span>
        </div>

        <p style={{ fontSize: 14, color: '#586271', lineHeight: 1.6, marginBottom: 16 }}>
          {frontName} şu anda Galatasaray kontrolünde. Fenerbahçe takımı tarafından başlatılan saldırı devam ediyor.
          Sunucu doğrulamalı geçerli katılımcılar: <strong>FB 15 — GS 13</strong>.
          Savaş bitiminde saldıran FB takımı minimum 3 eşiğini geçip önde kalırsa cephe sahipliği el değiştirecek ve 48 saatlik koruma başlayacaktır.
        </p>

        <div style={{ display: 'flex', gap: 12 }}>
          <button
            onClick={() => onNavigate('battles')}
            style={{
              background: '#0F766E',
              color: '#FFFFFF',
              border: 'none',
              padding: '10px 16px',
              borderRadius: 8,
              fontSize: 13,
              fontWeight: 600,
              cursor: 'pointer',
            }}
          >
            Savaş Masasına Git
          </button>
          <button
            onClick={() => onNavigate('map_editor')}
            style={{
              background: '#FFFFFF',
              color: '#111827',
              border: '1px solid #D9DEE6',
              padding: '10px 16px',
              borderRadius: 8,
              fontSize: 13,
              fontWeight: 600,
              cursor: 'pointer',
            }}
          >
            Haritada Konumu İncele
          </button>
        </div>
      </div>
    </div>
  );
};
