import React, { useState, useEffect } from 'react';
import { BarChart3, HelpCircle, CheckCircle, Info, RefreshCw } from 'lucide-react';
import { fetchApi } from '../api.js';

export const RankingsAuditView: React.FC = () => {
  const [rankings, setRankings] = useState<any | null>(null);
  const [activeTab, setActiveTab] = useState<'fronts' | 'support' | 'weighted'>('weighted');

  const loadRankings = async () => {
    try {
      const data = await fetchApi<any>('/rankings');
      setRankings(data);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    loadRankings();
  }, []);

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 24 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Sıralamalar &amp; Seçim Benzeri Sonuç Denetimi (A08)</h2>
          <p style={{ fontSize: 13, color: '#586271' }}>
            Master Blueprint Bölüm 06 uyarınca: Üç gösterge eşzamanlı hesaplanır ve birbirine karıştırılmaz.
          </p>
        </div>
        <button
          onClick={loadRankings}
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: 6,
            padding: '8px 14px',
            borderRadius: 8,
            border: '1px solid #D9DEE6',
            background: '#FFFFFF',
            fontSize: 13,
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          <RefreshCw size={14} /> Yenile
        </button>
      </div>

      {/* Explanatory Info Box for Investors & Admins */}
      <div style={{
        background: '#EFF6FF',
        border: '1px solid #BFDBFE',
        borderRadius: 12,
        padding: 20,
        color: '#1E40AF',
        fontSize: 13,
        lineHeight: 1.6,
      }}>
        <div style={{ fontWeight: 700, fontSize: 14, marginBottom: 6, display: 'flex', alignItems: 'center', gap: 8 }}>
          <Info size={18} />
          Yerel Seçim Benzeri İkili Gerçeklik (Electoral Duality)
        </div>
        <p>
          Alanya pilotunda Galatasaray 8 küçük sokağı elinde tutarken (Cephe Çoğunluğu: 8 - 2), Fenerbahçe 2 yoğun caddeyi kontrol etmektedir.
          Ancak Fenerbahçe'nin kontrol ettiği caddelerde <strong>160 tekil doğrulanmış oyuncu</strong> katılırken, Galatasaray'ın 8 sokağında toplam <strong>81 oyuncu</strong> yer almıştır.
          Bu sayede Fenerbahçe, <strong>%66.4 Doğrulanmış Halk Desteği</strong> ve <strong>10.0 puanlık (%51.0) Ağırlıklı Harita Hâkimiyeti</strong> ile sezon şampiyonluğunda öndedir.
        </p>
      </div>

      {/* Metric Selector Tabs */}
      <div style={{ display: 'flex', gap: 8, borderBottom: '1px solid #D9DEE6', paddingBottom: 12 }}>
        <button
          onClick={() => setActiveTab('weighted')}
          style={{
            padding: '8px 16px',
            borderRadius: 8,
            border: 'none',
            background: activeTab === 'weighted' ? '#0F766E' : '#F8FAFB',
            color: activeTab === 'weighted' ? '#FFFFFF' : '#586271',
            fontSize: 13,
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          1. Ağırlıklı Harita Hâkimiyeti (% Pay)
        </button>
        <button
          onClick={() => setActiveTab('support')}
          style={{
            padding: '8px 16px',
            borderRadius: 8,
            border: 'none',
            background: activeTab === 'support' ? '#0F766E' : '#F8FAFB',
            color: activeTab === 'support' ? '#FFFFFF' : '#586271',
            fontSize: 13,
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          2. Doğrulanmış Halk Desteği (Tekil Oyuncu)
        </button>
        <button
          onClick={() => setActiveTab('fronts')}
          style={{
            padding: '8px 16px',
            borderRadius: 8,
            border: 'none',
            background: activeTab === 'fronts' ? '#0F766E' : '#F8FAFB',
            color: activeTab === 'fronts' ? '#FFFFFF' : '#586271',
            fontSize: 13,
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          3. Cephe Sayısı Çoğunluğu (Sokak Adedi)
        </button>
      </div>

      {/* Ranking Cards */}
      {rankings && (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
          {rankings.teams?.map((team: any, index: number) => {
            const isFirst = index === 0;
            return (
              <div
                key={team.teamId}
                style={{
                  background: '#FFFFFF',
                  borderRadius: 12,
                  border: '1px solid #D9DEE6',
                  padding: 20,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
                  <div style={{
                    width: 32,
                    height: 32,
                    borderRadius: '50%',
                    background: isFirst ? '#FEF3F2' : '#F8FAFB',
                    color: isFirst ? '#B42318' : '#586271',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontWeight: 700,
                    fontSize: 14,
                  }}>
                    #{index + 1}
                  </div>
                  <div style={{ width: 14, height: 14, borderRadius: '50%', background: team.colorPrimary }} />
                  <div>
                    <div style={{ fontSize: 16, fontWeight: 700, color: '#111827' }}>
                      {team.nameI18n?.tr}
                    </div>
                    <div style={{ fontSize: 12, color: '#8E98A8' }}>slug: {team.slug}</div>
                  </div>
                </div>

                <div style={{ display: 'flex', gap: 32, textAlign: 'right' }}>
                  {/* Ağırlıklı Hâkimiyet */}
                  <div>
                    <div style={{ fontSize: 11, color: '#8E98A8', fontWeight: 500 }}>AĞIRLIKLI HÂKİMİYET</div>
                    <div style={{ fontSize: 16, fontWeight: 700, color: activeTab === 'weighted' ? '#0F766E' : '#111827' }}>
                      %{team.weightedControlSharePercent}
                    </div>
                    <div style={{ fontSize: 11, color: '#586271' }}>{team.weightedControlScore} Puan</div>
                  </div>

                  {/* Doğrulanmış Destek */}
                  <div>
                    <div style={{ fontSize: 11, color: '#8E98A8', fontWeight: 500 }}>DOĞRULANMIŞ DESTEK</div>
                    <div style={{ fontSize: 16, fontWeight: 700, color: activeTab === 'support' ? '#0F766E' : '#111827' }}>
                      {team.verifiedSupportCount} Oyuncu
                    </div>
                    <div style={{ fontSize: 11, color: '#586271' }}>%{team.verifiedSupportSharePercent}</div>
                  </div>

                  {/* Cephe Sayısı */}
                  <div>
                    <div style={{ fontSize: 11, color: '#8E98A8', fontWeight: 500 }}>CEPHE SAYISI</div>
                    <div style={{ fontSize: 16, fontWeight: 700, color: activeTab === 'fronts' ? '#0F766E' : '#111827' }}>
                      {team.frontCount} Cephe
                    </div>
                    <div style={{ fontSize: 11, color: '#586271' }}>%{team.frontSharePercent}</div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
};
