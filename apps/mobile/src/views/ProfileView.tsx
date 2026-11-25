import React, { useState } from 'react';
import { Download, Trash2, LogOut, Globe, ArrowUpRight } from 'lucide-react';
import { fetchApi } from '../api.js';
import { GameDialog } from '../components/GameDialog.js';

interface ProfileViewProps { user: any; onLogout: () => void; locale: 'tr' | 'en'; onToggleLocale: () => void }
export const ProfileView: React.FC<ProfileViewProps> = ({ user, onLogout, locale, onToggleLocale }) => {
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [busy, setBusy] = useState(false);
  const [confirmDelete, setConfirmDelete] = useState(false);
  const exportData = async () => {
    setBusy(true); setError(''); setMessage('');
    try {
      const result = await fetchApi<any>('/privacy/export', { method: 'POST' });
      const url = URL.createObjectURL(new Blob([JSON.stringify(result.data, null, 2)], { type: 'application/json' }));
      const link = document.createElement('a'); link.href = url; link.download = 'cepheland-verilerim.json'; link.click();
      setTimeout(() => URL.revokeObjectURL(url), 1000);
      setMessage('Veri dosyan indirildi.');
    } catch { setError('Verilerin alınamadı. Biraz sonra tekrar deneyebilirsin.'); }
    finally { setBusy(false); }
  };
  const deleteAccount = async () => {
    setBusy(true); setError('');
    try { await fetchApi('/privacy/delete', { method: 'POST' }); setConfirmDelete(false); onLogout(); }
    catch { setError('İşlem tamamlanamadı. Tekrar deneyebilirsin.'); }
    finally { setBusy(false); }
  };
  return <div className="game-page"><div className="page-inner">
    <header className="page-header"><div className="eyebrow">OYUNCU KARTI</div><h1>Senin tarafın.</h1><p>Hesabın, tercihlerin ve gizlilik kontrollerin.</p></header>
    <section className="profile-identity"><div className="player-monogram">{user?.displayName?.slice(0, 2).toLocaleUpperCase('tr') || 'CL'}</div><div><h2>{user?.displayName || 'Ziyaretçi'}</h2><p>{user?.handle ? `@${user.handle}` : 'Haritayı keşfediyorsun.'}</p></div></section>
    <h2 className="section-label">HESAP VE TERCİHLER</h2>
    <div className="settings-list">
      <button className="settings-row" onClick={onToggleLocale}><Globe size={19} /><span>Karşılama dili</span><small>{locale.toUpperCase()}</small></button>
      <button className="settings-row" onClick={exportData} disabled={!user || busy}><Download size={19} /><span>Verilerimi indir</span><ArrowUpRight size={17} /></button>
      <button className="settings-row settings-row--danger" onClick={() => setConfirmDelete(true)} disabled={!user || busy}><Trash2 size={19} /><span>Hesabımı anonimleştir</span><ArrowUpRight size={17} /></button>
      <button className="settings-row" onClick={onLogout}><LogOut size={19} /><span>{user ? 'Oturumu kapat' : 'Giriş ekranına dön'}</span></button>
    </div>
    {message && <p className="notice" role="status">{message}</p>}
    {error && <p className="notice notice--error" role="alert">{error}</p>}
    <p className="legal-note">Konumun haritada diğer oyunculara gösterilmez. Katkı vermek için konum doğrulaması gerekir.</p>
    {confirmDelete && <GameDialog title="Hesabını anonimleştir" onClose={() => { if (!busy) setConfirmDelete(false); }}>
      <p className="muted-copy">Görünen adın ve kullanıcı adın anonimleştirilir. Bu işlem geri alınamaz.</p>
      {error && <p className="notice notice--error" role="alert">{error}</p>}
      <div className="dialog-actions"><button className="game-button" disabled={busy} onClick={() => setConfirmDelete(false)}>Vazgeç</button><button className="game-button game-button--danger" disabled={busy} onClick={deleteAccount}>{busy ? 'İşleniyor…' : 'Anonimleştir'}</button></div>
    </GameDialog>}
  </div></div>;
};
