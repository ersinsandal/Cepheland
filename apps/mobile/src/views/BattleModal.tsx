import React, { useState, useEffect } from 'react';
import { Clock, RefreshCw, Swords } from 'lucide-react';
import { fetchApi } from '../api.js';
import { GameDialog } from '../components/GameDialog.js';

export const BattleModal: React.FC<{ battleId: string; onClose: () => void }> = ({ battleId, onClose }) => {
  const [battle, setBattle] = useState<any>(null);
  const [error, setError] = useState('');
  const [attempt, setAttempt] = useState(0);
  useEffect(() => {
    const controller = new AbortController();
    setBattle(null); setError('');
    fetchApi<any>(`/battles/${encodeURIComponent(battleId)}`, { signal: controller.signal })
      .then(data => { if (!controller.signal.aborted) setBattle(data); })
      .catch(() => { if (!controller.signal.aborted) setError('Savaş bilgisi alınamadı.'); });
    return () => controller.abort();
  }, [battleId, attempt]);
  const status = ({ active: 'Savaş sürüyor', proposed: 'Katılım bekleniyor', finalized: 'Savaş tamamlandı', paused: 'Savaş duraklatıldı', cancelled: 'Savaş iptal edildi', expired: 'Katılım süresi doldu', settling: 'Sonuç hesaplanıyor', under_review: 'Sonuç inceleniyor' } as Record<string, string>)[battle?.status] || 'Cephe mücadelesi';
  return <GameDialog title="Cephe mücadelesi" onClose={onClose}>
    {error ? <div className="empty-state"><Swords size={28} /><h2>{error}</h2><button className="game-button" onClick={() => setAttempt(attempt + 1)}><RefreshCw size={15} />Yeniden dene</button></div>
      : !battle ? <div className="notice" role="status">Savaş bilgisi açılıyor…</div> : <>
        <p className="battle-location">{battle.frontNameI18n?.tr || battle.frontNameI18n?.en || 'Cephe'}</p>
        <div className="battle-status"><Swords size={14} />{status}</div>
        <div className="battle-score">
          <div><div className="battle-team">{battle.defenderTeam?.nameI18n?.tr || 'Tarafsız cephe'}</div><div className="battle-count">{battle.approvedCounts?.[battle.defenderTeamId] ?? 0}</div><div className="battle-role">Savunan</div></div>
          <div className="battle-separator">:</div>
          <div><div className="battle-team">{battle.attackerTeam?.nameI18n?.tr || 'Saldıran takım'}</div><div className="battle-count">{battle.approvedCounts?.[battle.attackerTeamId] ?? 0}</div><div className="battle-role">Saldıran</div></div>
        </div>
        {battle.endsAt && <div className="principle"><Clock size={17} /><p>Bitiş: {new Date(battle.endsAt).toLocaleString('tr-TR', { day: 'numeric', month: 'long', hour: '2-digit', minute: '2-digit' })}</p></div>}
        <div className="notice">Saldıran takımın en az {battle.minAttackerRequired ?? 3} onaylı katkıya ve savunandan daha fazla katkıya ihtiyacı var. Eşitlikte cephe savunanda kalır.</div>
        <button className="game-button game-button--primary game-button--full" onClick={onClose}>Haritaya dön</button>
      </>}
  </GameDialog>;
};
