import React, { useState, useEffect } from 'react';
import { Trophy, Pause, Play, AlertCircle, Users, MapPin, Eye } from 'lucide-react';
import { fetchApi } from '../api.js';

export const LeaguesView: React.FC = () => {
  const [leagues, setLeagues] = useState<any[]>([]);
  const [selectedLeague, setSelectedLeague] = useState<any | null>(null);

  const loadLeagues = async () => {
    try {
      const data = await fetchApi<any[]>('/leagues');
      setLeagues(data);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    loadLeagues();
  }, []);

  const handleTogglePause = async (leagueId: string, currentStatus: string) => {
    try {
      if (currentStatus === 'active') {
        await fetchApi(`/admin/leagues/${leagueId}/pause`, {
          method: 'POST',
          body: JSON.stringify({ reason: 'Yönetici tarafından geçici duraklatıldı' }),
        });
      } else {
        await fetchApi(`/admin/leagues/${leagueId}/publish`, { method: 'POST' });
      }
      await loadLeagues();
    } catch (err: any) {
      alert(`İşlem hatası: ${err.message}`);
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Ligler ve Takım Yönetimi (A04)</h2>
          <p style={{ fontSize: 13, color: '#586271' }}>Her lig kendi bağımsız harita sahipliğini, takımlarını ve sezonlarını barındırır.</p>
        </div>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(360px, 1fr))', gap: 16 }}>
        {leagues.map((l) => (
          <div
            key={l.id}
            style={{
              background: '#FFFFFF',
              borderRadius: 12,
              border: '1px solid #D9DEE6',
              padding: 20,
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              boxShadow: '0 1px 3px rgba(0,0,0,0.04)',
            }}
          >
            <div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 10 }}>
                <div>
                  <h3 style={{ fontSize: 16, fontWeight: 700, color: '#111827' }}>{l.nameI18n.tr || l.slug}</h3>
                  <div style={{ fontSize: 12, color: '#8E98A8' }}>slug: {l.slug}</div>
                </div>
                <span
                  style={{
                    fontSize: 11,
                    fontWeight: 700,
                    padding: '3px 8px',
                    borderRadius: 999,
                    background: l.status === 'active' ? '#ECFDF3' : '#FEF3F2',
                    color: l.status === 'active' ? '#027A48' : '#B42318',
                    textTransform: 'uppercase',
                  }}
                >
                  {l.status}
                </span>
              </div>

              <p style={{ fontSize: 13, color: '#586271', lineHeight: 1.5, marginBottom: 16 }}>
                {l.descriptionI18n.tr || l.descriptionI18n.en}
              </p>

              {/* Teams Pills */}
              <div style={{ marginBottom: 16 }}>
                <div style={{ fontSize: 12, fontWeight: 600, color: '#111827', marginBottom: 6 }}>Lig Takımları:</div>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
                  {l.teams?.map((t: any) => (
                    <span
                      key={t.id}
                      style={{
                        fontSize: 11,
                        fontWeight: 600,
                        padding: '4px 8px',
                        borderRadius: 6,
                        background: '#F8FAFB',
                        border: '1px solid #D9DEE6',
                        display: 'flex',
                        alignItems: 'center',
                        gap: 6,
                      }}
                    >
                      <span style={{ width: 8, height: 8, borderRadius: '50%', background: t.colorPrimary }} />
                      {t.nameI18n.tr || t.slug}
                    </span>
                  ))}
                </div>
              </div>

              {/* Active Season Info */}
              {l.activeSeason && (
                <div style={{ background: '#F8FAFB', padding: '10px 12px', borderRadius: 8, fontSize: 12, color: '#586271', border: '1px solid #EDF0F3' }}>
                  <div><strong>Aktif Sezon:</strong> {l.activeSeason.titleI18n.tr || 'Sezon 1'}</div>
                  <div style={{ marginTop: 2 }}><strong>Şampiyonluk Kuralı:</strong> {l.activeSeason.championshipMetric}</div>
                </div>
              )}
            </div>

            <div style={{ display: 'flex', gap: 8, marginTop: 20, paddingTop: 16, borderTop: '1px solid #EDF0F3' }}>
              <button
                onClick={() => setSelectedLeague(l)}
                style={{
                  flex: 1,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  gap: 6,
                  padding: '8px 12px',
                  borderRadius: 6,
                  border: '1px solid #D9DEE6',
                  background: '#FFFFFF',
                  fontSize: 12,
                  fontWeight: 600,
                  cursor: 'pointer',
                }}
              >
                <Eye size={14} /> Detay
              </button>
              <button
                onClick={() => handleTogglePause(l.id, l.status)}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: 6,
                  padding: '8px 12px',
                  borderRadius: 6,
                  border: 'none',
                  background: l.status === 'active' ? '#FEF3F2' : '#ECFDF3',
                  color: l.status === 'active' ? '#B42318' : '#027A48',
                  fontSize: 12,
                  fontWeight: 600,
                  cursor: 'pointer',
                }}
              >
                {l.status === 'active' ? <Pause size={14} /> : <Play size={14} />}
                {l.status === 'active' ? 'Durdur' : 'Aktifleştir'}
              </button>
            </div>
          </div>
        ))}
      </div>

      {/* Details Modal */}
      {selectedLeague && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          background: 'rgba(0,0,0,0.5)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          zIndex: 50,
        }}>
          <div style={{ background: '#FFFFFF', borderRadius: 16, width: 520, maxWidth: '90%', padding: 24, boxShadow: '0 20px 25px -5px rgba(0,0,0,0.1)' }}>
            <h3 style={{ fontSize: 18, fontWeight: 700, marginBottom: 8 }}>{selectedLeague.nameI18n.tr}</h3>
            <p style={{ fontSize: 13, color: '#586271', marginBottom: 16 }}>{selectedLeague.descriptionI18n.tr}</p>
            <div style={{ fontSize: 13, color: '#111827', lineHeight: 1.8 }}>
              <div><strong>Saat Dilimi:</strong> {selectedLeague.timezone}</div>
              <div><strong>Yaş Sınırı:</strong> {selectedLeague.ageMin}+</div>
              <div><strong>Ülke Kodları:</strong> {selectedLeague.allowedCountryCodes?.join(', ')}</div>
            </div>
            <button
              onClick={() => setSelectedLeague(null)}
              style={{
                marginTop: 20,
                width: '100%',
                padding: '10px',
                borderRadius: 8,
                border: 'none',
                background: '#0F766E',
                color: '#FFFFFF',
                fontWeight: 600,
                cursor: 'pointer',
              }}
            >
              Kapat
            </button>
          </div>
        </div>
      )}
    </div>
  );
};
