import React, { useState, useEffect } from 'react';
import { ShieldCheck, AlertTriangle, CheckCircle, XCircle, UserX, Info } from 'lucide-react';
import { fetchApi } from '../api.js';

export const SecurityReviewView: React.FC = () => {
  const [cases, setCases] = useState<any[]>([]);
  const [loading, setLoading] = useState(false);

  const loadCases = async () => {
    try {
      const data = await fetchApi<any>('/admin/reviews');
      setCases(data.cases || []);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    loadCases();
  }, []);

  const handleResolve = async (caseId: string, decision: 'approved' | 'rejected') => {
    setLoading(true);
    try {
      await fetchApi(`/admin/reviews/${caseId}/decision`, {
        method: 'POST',
        body: JSON.stringify({
          decision,
          notes: decision === 'approved' ? 'Manuel konum ve cihaz doğrulaması kabul edildi.' : 'Cihaz bütünlüğü sağlanamadığı için reddedildi.',
        }),
      });
      await loadCases();
    } catch (err: any) {
      alert(`Hata: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
      <div>
        <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Güvenlik &amp; Sahtecilik İnceleme Merkezi (A09)</h2>
        <p style={{ fontSize: 13, color: '#586271' }}>
          Şüpheli cihaz bütünlüğü, emulator veya sahte GPS tespiti yapılan katkılar burada bekletilir ve savaş skorunu etkilemez.
        </p>
      </div>

      <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
        {cases.map((c) => (
          <div
            key={c.id}
            style={{
              background: '#FFFFFF',
              borderRadius: 12,
              border: '1px solid #D9DEE6',
              padding: 20,
              boxShadow: '0 1px 3px rgba(0,0,0,0.04)',
            }}
          >
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 12 }}>
              <div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 4 }}>
                  <AlertTriangle size={18} color="#B54708" />
                  <span style={{ fontSize: 15, fontWeight: 700, color: '#111827' }}>
                    Vaka ID: <code>{c.id}</code>
                  </span>
                </div>
                <div style={{ fontSize: 12, color: '#8E98A8' }}>
                  Kullanıcı ID: {c.userId} | Tür: {c.caseType}
                </div>
              </div>

              <span style={{
                fontSize: 11,
                fontWeight: 700,
                padding: '3px 8px',
                borderRadius: 999,
                background: c.status === 'open' ? '#FEF3F2' : '#ECFDF3',
                color: c.status === 'open' ? '#B42318' : '#027A48',
              }}>
                {c.status.toUpperCase()}
              </span>
            </div>

            <div style={{ marginBottom: 16 }}>
              <div style={{ fontSize: 12, fontWeight: 600, color: '#111827', marginBottom: 6 }}>
                Tespit Edilen Güvenlik Kodları:
              </div>
              <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                {c.reasonCodes?.map((code: string, idx: number) => (
                  <span
                    key={idx}
                    style={{
                      background: '#FEF3F2',
                      color: '#B42318',
                      border: '1px solid #FECDCA',
                      padding: '3px 8px',
                      borderRadius: 4,
                      fontSize: 11,
                      fontFamily: 'monospace',
                    }}
                  >
                    {code}
                  </span>
                ))}
              </div>
            </div>

            {c.status === 'open' ? (
              <div style={{ display: 'flex', gap: 10, borderTop: '1px solid #EDF0F3', paddingTop: 14 }}>
                <button
                  onClick={() => handleResolve(c.id, 'approved')}
                  disabled={loading}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: 6,
                    padding: '8px 14px',
                    borderRadius: 6,
                    border: 'none',
                    background: '#027A48',
                    color: '#FFFFFF',
                    fontSize: 13,
                    fontWeight: 600,
                    cursor: 'pointer',
                  }}
                >
                  <CheckCircle size={14} /> Katkıyı Onayla
                </button>
                <button
                  onClick={() => handleResolve(c.id, 'rejected')}
                  disabled={loading}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: 6,
                    padding: '8px 14px',
                    borderRadius: 6,
                    border: 'none',
                    background: '#B42318',
                    color: '#FFFFFF',
                    fontSize: 13,
                    fontWeight: 600,
                    cursor: 'pointer',
                  }}
                >
                  <XCircle size={14} /> Katkıyı Reddet
                </button>
              </div>
            ) : (
              <div style={{ fontSize: 12, color: '#027A48', fontWeight: 600 }}>
                Karar Çözümlendi: {c.resolution}
              </div>
            )}
          </div>
        ))}
      </div>
    </div>
  );
};
