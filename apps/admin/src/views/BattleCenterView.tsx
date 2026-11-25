import React, { useState, useEffect } from 'react';
import { Swords, CheckCircle2, Clock, AlertTriangle, ShieldCheck, RefreshCw } from 'lucide-react';
import { fetchApi } from '../api.js';

export const BattleCenterView: React.FC = () => {
  const [battle, setBattle] = useState<any | null>(null);
  const [loading, setLoading] = useState(false);
  const [settleOutcome, setSettleOutcome] = useState<string | null>(null);

  const loadActiveBattle = async () => {
    try {
      const data = await fetchApi<any>('/battles/bb000000-0000-0000-0000-000000000001');
      setBattle(data);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    loadActiveBattle();
  }, []);

  const handleManualSettle = async () => {
    if (!battle) return;
    setLoading(true);
    try {
      const res = await fetchApi<any>(`/admin/battles/${battle.id}/settle`, { method: 'POST' });
      setSettleOutcome(`Savaş sonuçlandırıldı! Sonuç: ${res.outcome.toUpperCase()} — Kazanan: ${res.winnerTeamId ? 'Fenerbahçe' : 'Galatasaray'}`);
      await loadActiveBattle();
    } catch (err: any) {
      alert(`Sonuçlandırma hatası: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 24 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Savaş &amp; Fetih Operasyon Merkezi (A07)</h2>
          <p style={{ fontSize: 13, color: '#586271' }}>Aktif çatışmaları, geçerli katılım skorlarını ve sonuçlandırma döngüsünü canlı yönetin.</p>
        </div>
        <button
          onClick={loadActiveBattle}
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

      {settleOutcome && (
        <div style={{
          background: '#ECFDF3',
          border: '1px solid #A6F4C5',
          borderRadius: 12,
          padding: '16px 20px',
          color: '#027A48',
          fontWeight: 600,
          display: 'flex',
          alignItems: 'center',
          gap: 10,
        }}>
          <CheckCircle2 size={20} />
          {settleOutcome}
        </div>
      )}

      {battle && (
        <div style={{
          background: '#FFFFFF',
          borderRadius: 16,
          border: '1px solid #D9DEE6',
          padding: 28,
          boxShadow: '0 2px 8px rgba(0,0,0,0.04)',
        }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20, gap: 12 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 10, minWidth: 0 }}>
              <div style={{
                width: 36,
                height: 36,
                borderRadius: 10,
                background: '#FEF3F2',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: '#B42318',
                flexShrink: 0,
              }}>
                <Swords size={20} />
              </div>
              <div style={{ minWidth: 0 }}>
                <h3 title={battle.frontNameI18n?.tr || battle.frontNameI18n?.en} style={{ fontSize: 18, fontWeight: 700, color: '#111827', overflowWrap: 'anywhere' }}>
                  {battle.frontNameI18n?.tr || battle.frontNameI18n?.en || battle.frontCode || 'Cephe'}
                </h3>
                <div style={{ fontSize: 11, color: '#64748B' }}>{battle.frontCode}</div>
                <div style={{ fontSize: 12, color: '#8E98A8' }}>Savaş ID: <code>{battle.id}</code></div>
              </div>
            </div>

            <span style={{
              fontSize: 12,
              fontWeight: 700,
              padding: '6px 12px',
              borderRadius: 8,
              background: battle.status === 'active' ? '#FEF3F2' : '#EFF6FF',
              color: battle.status === 'active' ? '#B42318' : '#1D4ED8',
              flexShrink: 0,
            }}>
              {battle.status.toUpperCase()}
            </span>
          </div>

          {/* Versus Board */}
          <div style={{
            display: 'grid',
            gridTemplateColumns: '1fr auto 1fr',
            gap: 20,
            alignItems: 'center',
            background: '#F8FAFB',
            borderRadius: 12,
            padding: 24,
            border: '1px solid #EDF0F3',
            marginBottom: 24,
          }}>
            {/* Defender */}
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontSize: 12, fontWeight: 600, color: '#8E98A8', textTransform: 'uppercase', marginBottom: 4 }}>
                Savunan Takım
              </div>
              <div style={{ fontSize: 20, fontWeight: 700, color: '#A90432' }}>
                {battle.defenderTeam?.nameI18n?.tr || 'Galatasaray'}
              </div>
              <div style={{ fontSize: 36, fontWeight: 800, color: '#111827', marginTop: 8 }}>
                {battle.approvedCounts?.[battle.defenderTeamId] || 13}
              </div>
              <div style={{ fontSize: 12, color: '#586271' }}>Doğrulanmış Tekil Katkı</div>
            </div>

            <div style={{ fontSize: 20, fontWeight: 800, color: '#8E98A8' }}>VS</div>

            {/* Attacker */}
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontSize: 12, fontWeight: 600, color: '#8E98A8', textTransform: 'uppercase', marginBottom: 4 }}>
                Saldıran Takım
              </div>
              <div style={{ fontSize: 20, fontWeight: 700, color: '#002D72' }}>
                {battle.attackerTeam?.nameI18n?.tr || 'Fenerbahçe'}
              </div>
              <div style={{ fontSize: 36, fontWeight: 800, color: '#111827', marginTop: 8 }}>
                {battle.approvedCounts?.[battle.attackerTeamId] || 15}
              </div>
              <div style={{ fontSize: 12, color: '#586271' }}>Doğrulanmış Tekil Katkı</div>
            </div>
          </div>

          {/* Rules and Settlement criteria */}
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
            gap: 12,
            fontSize: 13,
            color: '#586271',
            marginBottom: 24,
          }}>
            <div style={{ padding: 12, background: '#FFFFFF', border: '1px solid #D9DEE6', borderRadius: 8 }}>
              <strong>Kazanma Koşulu:</strong> En az 3 onaylı saldırgan ve Savunanı geçmek.
            </div>
            <div style={{ padding: 12, background: '#FFFFFF', border: '1px solid #D9DEE6', borderRadius: 8 }}>
              <strong>Beraberlik Kuralı:</strong> Eşitlikte savunan korur.
            </div>
            <div style={{ padding: 12, background: '#FFFFFF', border: '1px solid #D9DEE6', borderRadius: 8 }}>
              <strong>Sonraki Koruma:</strong> El değiştirirse 48 saat koruma.
            </div>
          </div>

          {/* Settle Action */}
          <div style={{ display: 'flex', gap: 12 }}>
            <button
              onClick={handleManualSettle}
              disabled={loading || battle.status === 'finalized'}
              style={{
                background: battle.status === 'finalized' ? '#8E98A8' : '#0F766E',
                color: '#FFFFFF',
                border: 'none',
                padding: '12px 24px',
                borderRadius: 8,
                fontSize: 14,
                fontWeight: 700,
                cursor: battle.status === 'finalized' ? 'not-allowed' : 'pointer',
              }}
            >
              {loading ? 'Sonuçlandırılıyor...' : battle.status === 'finalized' ? 'Savaş Kesinleşti' : 'Savaşı Şimdi Sonuçlandır (Worker Trigger)'}
            </button>
          </div>
        </div>
      )}
    </div>
  );
};
