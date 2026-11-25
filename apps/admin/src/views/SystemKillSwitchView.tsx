import React, { useState } from 'react';
import { ShieldAlert, AlertTriangle, CheckCircle } from 'lucide-react';
import { fetchApi } from '../api.js';

interface KillSwitchProps {
  isActive: boolean;
  onActivated: () => void;
}

export const SystemKillSwitchView: React.FC<KillSwitchProps> = ({ isActive, onActivated }) => {
  const [scope, setScope] = useState<'all_claims' | 'single_league' | 'maintenance'>('all_claims');
  const [reason, setReason] = useState('Güvenlik ihlali şüphesi nedeniyle acil durdurma');
  const [loading, setLoading] = useState(false);
  const [confirmed, setConfirmed] = useState(false);

  const handleTrigger = async () => {
    if (!confirmed) {
      alert('Lütfen acil durdurmayı onaylayın.');
      return;
    }
    setLoading(true);
    try {
      await fetchApi('/admin/kill-switch', {
        method: 'POST',
        body: JSON.stringify({ scope, reason }),
      });
      alert('Acil durdurma başarıyla devreye alındı!');
      onActivated();
    } catch (err: any) {
      alert(`Hata: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ maxWidth: 600, background: '#FFFFFF', borderRadius: 16, border: '1px solid #D9DEE6', padding: 32 }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 16 }}>
        <div style={{ padding: 10, borderRadius: 10, background: '#FEF3F2', color: '#B42318' }}>
          <ShieldAlert size={28} />
        </div>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Acil Durdurma Anahtarı (Kill Switch - A14)</h2>
          <p style={{ fontSize: 13, color: '#586271' }}>Tehlike veya sahtecilik anında sunucu işlemlerini anında bloke eder.</p>
        </div>
      </div>

      <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
        <div>
          <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Durdurma Kapsamı</label>
          <select
            value={scope}
            onChange={(e: any) => setScope(e.target.value)}
            style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
          >
            <option value="all_claims">Tüm Yeni İşaretlemeleri Durdur (Tüm Ligler)</option>
            <option value="single_league">Yalnızca Seçili Ligi Duraklat</option>
            <option value="maintenance">Tam Bakım Modu (Yalnızca Salt Okunur Harita)</option>
          </select>
        </div>

        <div>
          <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Kayıtlı Gerekçe (Audit)</label>
          <input
            type="text"
            value={reason}
            onChange={(e) => setReason(e.target.value)}
            style={{ width: '100%', padding: '10px 12px', borderRadius: 8, border: '1px solid #D9DEE6' }}
          />
        </div>

        <label style={{ display: 'flex', alignItems: 'center', gap: 10, cursor: 'pointer', padding: 12, background: '#FEF3F2', borderRadius: 8, border: '1px solid #FECDCA' }}>
          <input
            type="checkbox"
            checked={confirmed}
            onChange={(e) => setConfirmed(e.target.checked)}
          />
          <span style={{ fontSize: 13, color: '#B42318', fontWeight: 600 }}>
            Bu eylemin tüm oyuncuların puanlı işaretlemelerini durduracağını onaylıyorum.
          </span>
        </label>

        <button
          onClick={handleTrigger}
          disabled={loading || !confirmed}
          style={{
            background: confirmed ? '#B42318' : '#D9DEE6',
            color: '#FFFFFF',
            border: 'none',
            padding: '14px',
            borderRadius: 8,
            fontSize: 14,
            fontWeight: 700,
            cursor: confirmed ? 'pointer' : 'not-allowed',
          }}
        >
          {loading ? 'Devreye Alınıyor...' : 'ACİL DURDURMAYI TETİKLE'}
        </button>
      </div>
    </div>
  );
};
