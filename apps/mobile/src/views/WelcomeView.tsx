import React from 'react';
import { ArrowRight, ArrowUpRight, Compass, Globe } from 'lucide-react';
import { BrandMark } from '../components/BrandMark.js';
interface WelcomeViewProps {
  onStart: () => void; onExploreMap: () => void; locale: 'tr' | 'en'; onToggleLocale: () => void; loading?: boolean;
}
export const WelcomeView: React.FC<WelcomeViewProps> = ({ onStart, onExploreMap, locale, onToggleLocale, loading }) => {
  const tr = locale === 'tr';
  return <div className="welcome">
    <header className="welcome-header">
      <div className="brand-lockup"><BrandMark /><span>CEPHELAND</span></div>
      <button className="quiet-button" onClick={onToggleLocale} aria-label="Dil değiştir"><Globe size={15} />{locale.toUpperCase()}</button>
    </header>
    <div className="welcome-body">
      <section className="welcome-copy">
        <div className="eyebrow"><span className="small-rule" />{tr ? 'GERÇEK SOKAKLAR. GERÇEK REKABET.' : 'REAL STREETS. REAL RIVALRY.'}</div>
        <h1>{tr ? <>Şehir senin<br /><em>sahan.</em></> : <>The city is<br /><em>your turf.</em></>}</h1>
        <p className="welcome-lead">{tr ? 'Sokağını tanı. Tarafını seç. Takımınla birlikte şehrin haritasını yeniden yaz.' : 'Know your streets. Choose your side. Rewrite the city map with your team.'}</p>
        <div className="welcome-actions">
          <button className="game-button game-button--primary" disabled={loading} onClick={onExploreMap}>
            {loading ? (tr ? 'Haritaya giriliyor…' : 'Entering map…') : (tr ? 'Haritaya gir' : 'Enter the map')}<ArrowRight size={20} />
          </button>
          <button className="welcome-secondary" onClick={onStart}>{tr ? 'Takımını seç' : 'Choose your team'}<ArrowUpRight size={18} /></button>
        </div>
        <div className="welcome-principle"><Compass size={18} /><span>{tr ? 'Her cephe bir sokak. Her katkı bir adım.' : 'Every front is a street. Every contribution is a step.'}</span></div>
      </section>
      <div className="welcome-cartography" aria-label="Mahmutlar sokak cephelerinin çizimi">
        <img src="/welcome-map.svg" alt="Mahmutlar'daki gerçek sokak bloklarının çizimi" />
        <div className="cartography-top"><span>ALANYA / MAHMUTLAR</span><span>36°29′ N · 32°05′ E</span></div>
        <div className="cartography-bottom"><span className="cartography-index">01</span><div><span>{tr ? 'SOKAKTAN CEPHEYE' : 'STREETS BECOME FRONTS'}</span><p>{tr ? 'Rekabet, kapının önünde başlar.' : 'The rivalry starts on your doorstep.'}</p></div><ArrowUpRight size={28} /></div>
      </div>
    </div>
    <footer className="welcome-footer"><span>{tr ? 'TARAFINI SEÇ. CEPHENİ KAZAN.' : 'CHOOSE YOUR SIDE. CLAIM YOUR FRONT.'}</span><span>© CEPHELAND <span className="footer-divider">/</span> 18+</span></footer>
  </div>;
};
