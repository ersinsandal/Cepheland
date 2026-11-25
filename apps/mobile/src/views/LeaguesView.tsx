import React, { useState, useEffect } from 'react';
import { ArrowRight, Check, RefreshCw, Trophy } from 'lucide-react';
import { fetchApi } from '../api.js';
import { GameDialog } from '../components/GameDialog.js';

interface LeaguesViewProps { activeLeagueId: string; onSelectLeague: (league: any) => void; user: any }
const cleanName = (value: string | undefined) => value?.replace(/\s*\(Demo\)/gi, '') || 'Lig';
export const LeaguesView: React.FC<LeaguesViewProps> = ({ activeLeagueId, onSelectLeague, user }) => {
  const [leagues, setLeagues] = useState<any[]>([]);
  const [selectedId, setSelectedId] = useState(activeLeagueId);
  const [loading, setLoading] = useState(true);
  const [attempt, setAttempt] = useState(0);
  const [error, setError] = useState('');
  const [membership, setMembership] = useState<any>(null);
  const [teamConfirm, setTeamConfirm] = useState<any>(null);
  const [joining, setJoining] = useState(false);
  const selectedLeague = leagues.find(league => league.id === selectedId) || leagues[0];
  useEffect(() => {
    const controller = new AbortController();
    setLoading(true); setError('');
    fetchApi<any[]>('/leagues', { signal: controller.signal }).then(data => {
      if (!controller.signal.aborted) { setLeagues(data); setLoading(false); }
    }).catch(() => { if (!controller.signal.aborted) { setError('Ligler şu anda alınamıyor.'); setLoading(false); } });
    return () => controller.abort();
  }, [attempt]);
  useEffect(() => {
    setMembership(null);
    if (!user || !selectedLeague?.activeSeason?.id) return;
    const controller = new AbortController();
    fetchApi<any>(`/seasons/${selectedLeague.activeSeason.id}/me`, { signal: controller.signal })
      .then(data => { if (!controller.signal.aborted) setMembership(data.membership); }).catch(() => {});
    return () => controller.abort();
  }, [user?.id, selectedLeague?.activeSeason?.id]);
  const confirmJoin = async () => {
    if (!teamConfirm || !selectedLeague?.activeSeason) return;
    setJoining(true); setError('');
    try {
      await fetchApi(`/seasons/${selectedLeague.activeSeason.id}/join`, { method: 'POST', body: JSON.stringify({ teamId: teamConfirm.id }) });
      setTeamConfirm(null); onSelectLeague(selectedLeague);
    } catch (err) { setError(err instanceof Error ? err.message : 'Takıma katılamadın. Tekrar dene.'); }
    finally { setJoining(false); }
  };
  return <div className="game-page"><div className="page-inner">
    <header className="page-header"><div className="eyebrow">TARAFINI SEÇ</div><h1>Aynı şehir.<br />Başka bir rekabet.</h1><p>Her ligin ayrı takımları, ayrı cephesi var. Bu sezon kiminle sahadasın?</p></header>
    {loading ? <div className="notice" role="status">Ligler açılıyor…</div> : error && !leagues.length ? <div className="empty-state"><Trophy size={30} /><h2>{error}</h2><button className="game-button" onClick={() => setAttempt(attempt + 1)}><RefreshCw size={15} />Yeniden dene</button></div> : <>
      <div className="league-tabs" role="tablist" aria-label="Lig seçimi">{leagues.map(league => <button key={league.id} role="tab" aria-selected={selectedLeague?.id === league.id}
        className={selectedLeague?.id === league.id ? 'is-active' : ''} onClick={() => { setSelectedId(league.id); setError(''); }}>{cleanName(league.nameI18n?.tr || league.slug)}</button>)}</div>
      {selectedLeague && <>
        <section className="league-overview"><div><h2>{cleanName(selectedLeague.nameI18n?.tr)}</h2><p>{selectedLeague.descriptionI18n?.tr}</p><span className="league-season">{selectedLeague.activeSeason?.titleI18n?.tr || 'Aktif sezon yok'}</span></div><button className="game-button" onClick={() => onSelectLeague(selectedLeague)}>Haritada gör<ArrowRight size={16} /></button></section>
        {!user && <p className="notice">Takımına katılmak için önce giriş yapmalısın. Liglerin haritasını inceleyebilirsin.</p>}
        {error && <p className="notice notice--error" role="alert">{error}</p>}
        <h3 className="section-label">SEZONUN TAKIMLARI</h3>
        <div className="team-list">{selectedLeague.teams?.map((team: any) => <button className="team-choice" key={team.id}
          style={{ '--team-color': team.colorPrimary || '#526570' } as React.CSSProperties}
          disabled={!user || !selectedLeague.activeSeason || Boolean(membership && membership.teamId !== team.id)}
          onClick={() => { if (membership?.teamId === team.id) onSelectLeague(selectedLeague); else setTeamConfirm(team); }}>
          <span className="team-monogram">{(team.nameI18n?.tr || team.slug).split(' ').map((s: string) => s[0]).join('').slice(0, 2)}</span>
          <strong>{team.nameI18n?.tr || team.slug}</strong><span className="team-choice-footer">{membership?.teamId === team.id ? <><span>Senin takımın</span><Check size={17} /></> : <><span>Bu takımda oyna</span><ArrowRight size={17} /></>}</span>
        </button>)}</div>
      </>}
    </>}
    {teamConfirm && <GameDialog title="Tarafını belirle" onClose={() => { if (!joining) setTeamConfirm(null); }}>
      <p className="muted-copy">Bu sezon <strong>{teamConfirm.nameI18n?.tr}</strong> ile oynayacaksın. Sezon devam ederken takımını değiştiremezsin.</p>
      {error && <p className="notice notice--error" role="alert">{error}</p>}
      <div className="dialog-actions"><button className="game-button" disabled={joining} onClick={() => setTeamConfirm(null)}>Vazgeç</button><button className="game-button game-button--primary" disabled={joining} onClick={confirmJoin}>{joining ? 'Katılıyorsun…' : 'Takıma katıl'}</button></div>
    </GameDialog>}
  </div></div>;
};
