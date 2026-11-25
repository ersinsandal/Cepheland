import React, { useEffect, useState } from 'react';
import { History, CheckCircle2, Clock, RefreshCw } from 'lucide-react';
import { fetchApi } from '../api.js';

interface ActivityData {
  claims: { id: string; frontId: string; frontNameI18n?: Record<string, string>; status: string; createdAt: string }[];
  remainingDailyFronts: number; dailyLimit: number;
}
export const ActivityView: React.FC<{ user: any; currentSeasonId: string }> = ({ user, currentSeasonId }) => {
  const [data, setData] = useState<ActivityData | null>(null);
  const [error, setError] = useState('');
  const [attempt, setAttempt] = useState(0);
  useEffect(() => {
    setData(null); setError('');
    if (!user) return;
    const controller = new AbortController();
    fetchApi<ActivityData>(`/me/activity?season_id=${encodeURIComponent(currentSeasonId)}`, { signal: controller.signal })
      .then(result => { if (!controller.signal.aborted) setData(result); })
      .catch(() => { if (!controller.signal.aborted) setError('Aktivite bilgilerin alınamadı.'); });
    return () => controller.abort();
  }, [user?.id, currentSeasonId, attempt]);
  return <div className="game-page"><div className="page-inner">
    <header className="page-header"><div className="eyebrow">OYUNCU GÜNLÜĞÜ</div><h1>İzin burada kalır.</h1><p>Katkıların, cephelerin ve bu sezondaki hareketlerin.</p></header>
    {!user ? <div className="empty-state"><History size={30} /><h2>Henüz oyuna katılmadın.</h2><p>Katkı geçmişini görmek için hesabınla giriş yap.</p></div>
      : error ? <div className="empty-state"><History size={30} /><h2>{error}</h2><p>Bağlantını kontrol edip tekrar deneyebilirsin.</p><button className="game-button" onClick={() => setAttempt(attempt + 1)}><RefreshCw size={15} />Yeniden dene</button></div>
      : !data ? <div className="notice" role="status">Oyuncu günlüğün açılıyor…</div> : <>
        <div className="panel quota-panel"><div><div className="section-label">BUGÜNKÜ CEPHE HAKKIN</div><p className="muted-copy">Her gün en fazla {data.dailyLimit} farklı cepheye katkı verebilirsin.</p></div><div className="quota-count">{data.remainingDailyFronts}<small> / {data.dailyLimit}</small></div></div>
        <h2 className="section-label">SON KATKILAR</h2>
        {data.claims.length === 0 ? <div className="empty-state"><History size={30} /><h2>İlk adımını bekliyor.</h2><p>Haritadan bir cephe seç. Bulunduğun yerde takımın için yaptığın katkılar burada görünür.</p></div>
          : <ol className="activity-list">{data.claims.map(claim => <li className="activity-row" key={claim.id}>
            {claim.status === 'approved' ? <CheckCircle2 size={21} /> : <Clock size={21} />}
            <div><h3>{claim.frontNameI18n?.tr || claim.frontNameI18n?.en || 'Cephe katkısı'}</h3>
              <p>{({ approved: 'Katkın onaylandı', pending: 'Katkın inceleniyor', rejected: 'Katkın onaylanmadı' } as Record<string, string>)[claim.status] || 'Katkın kaydedildi'}</p>
              <time dateTime={claim.createdAt}>{new Date(claim.createdAt).toLocaleString('tr-TR', { day: 'numeric', month: 'long', hour: '2-digit', minute: '2-digit' })}</time></div>
          </li>)}</ol>}
      </>}
  </div></div>;
};
