import React, { useState } from 'react';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { fetchApi, setUserToken } from '../api.js';
import { BrandMark } from '../components/BrandMark.js';

export const AuthView: React.FC<{ onSuccess: (user: any) => void; onBack: () => void }> = ({ onSuccess, onBack }) => {
  const [step, setStep] = useState<'input' | 'otp'>('input');
  const [channel, setChannel] = useState<'phone' | 'email'>('phone');
  const [identifier, setIdentifier] = useState('');
  const [code, setCode] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const submit = async (event: React.FormEvent) => {
    event.preventDefault(); setError('');
    if (!identifier.trim()) { setError('Telefon numaranı veya e-posta adresini gir.'); return; }
    if (step === 'otp' && !/^\d{6}$/.test(code)) { setError('Altı haneli giriş kodunu gir.'); return; }
    setLoading(true);
    try {
      if (step === 'input') {
        await fetchApi('/auth/start', { method: 'POST', body: JSON.stringify({ identifier: identifier.trim(), channel }) });
        setStep('otp');
      } else {
        const result = await fetchApi<any>('/auth/verify', { method: 'POST', body: JSON.stringify({ identifier: identifier.trim(), code }) });
        setUserToken(result.accessToken); onSuccess(result.user);
      }
    } catch (err) { setError(err instanceof Error ? err.message : 'Giriş tamamlanamadı. Tekrar dene.'); }
    finally { setLoading(false); }
  };
  return <div className="onboarding"><div className="onboarding-inner">
    <button className="quiet-button" onClick={step === 'otp' ? () => setStep('input') : onBack}><ArrowLeft size={17} />Geri</button>
    <div className="auth-brand"><BrandMark size={38} /></div>
    <div className="eyebrow">CEPHELAND'E KATIL</div><h1>{step === 'input' ? 'Takımına bir adım.' : 'Kodun, giriş biletin.'}</h1>
    <p className="muted-copy">{step === 'input' ? 'Hesabına gir, tarafını seç ve yakındaki cephelere katıl.' : `${identifier} için altı haneli giriş kodunu yaz.`}</p>
    <form onSubmit={submit}>
      {step === 'input' ? <>
        <div className="segmented-control"><button type="button" className={channel === 'phone' ? 'is-active' : ''} onClick={() => { setChannel('phone'); setIdentifier(''); }}>Telefon</button><button type="button" className={channel === 'email' ? 'is-active' : ''} onClick={() => { setChannel('email'); setIdentifier(''); }}>E-posta</button></div>
        <label className="form-label" htmlFor="identifier">{channel === 'phone' ? 'Telefon numaran' : 'E-posta adresin'}</label><input className="game-input" id="identifier" autoComplete={channel === 'phone' ? 'tel' : 'email'} inputMode={channel === 'phone' ? 'tel' : 'email'} value={identifier} onChange={e => setIdentifier(e.target.value)} placeholder={channel === 'phone' ? '05XX XXX XX XX' : 'ornek@eposta.com'} />
        <details className="preview-accounts"><summary>Önizleme hesabıyla dene</summary><div>{[['ahmet_gs', 'Ahmet · GS'], ['mehmet_fb', 'Mehmet · FB'], ['ayse_bjk', 'Ayşe · BJK']].map(([handle, label]) => <button key={handle} type="button" className="quiet-button" onClick={() => setIdentifier(handle)}>{label}</button>)}</div></details>
      </> : <><label className="form-label" htmlFor="code">Giriş kodun</label><input className="game-input otp-input" id="code" maxLength={6} inputMode="numeric" autoComplete="one-time-code" value={code} onChange={e => setCode(e.target.value.replace(/\D/g, ''))} placeholder="000000" /><p className="legal-note">Önizleme doğrulama kodu: <strong>123456</strong></p></>}
      {error && <p className="notice notice--error" role="alert">{error}</p>}
      <button className="game-button game-button--primary game-button--full auth-submit" disabled={loading}>{loading ? 'İşleniyor…' : step === 'input' ? 'Devam et' : 'Oyuna gir'}<ArrowRight size={18} /></button>
    </form>
    <p className="legal-note">Cepheland 18 yaş ve üzeri oyuncular içindir.</p>
  </div></div>;
};
