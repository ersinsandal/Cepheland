import React from 'react';
import { MapPin, ShieldCheck, Navigation, ArrowRight } from 'lucide-react';
export const LocationExplainerView: React.FC<{ onGrantPermission: () => void; onSkip: () => void }> = ({ onGrantPermission, onSkip }) => <div className="onboarding"><div className="onboarding-inner">
  <div className="eyebrow">SAHADA OYNAMAK</div><h1>Orada ol.<br />İzini bırak.</h1><p className="muted-copy">Takımına katkı vermek için gerçekten cephede olmalısın. Konum iznini katkı verirken soracağız.</p>
  <div className="principles"><div className="principle"><MapPin size={22} /><div><strong>Yalnızca katkı sırasında</strong>Konumun, seçtiğin cephede olduğunu doğrulamak için kullanılır.</div></div><div className="principle"><ShieldCheck size={22} /><div><strong>Oyuncular konumunu görmez</strong>Ham koordinatların haritada diğer oyunculara gösterilmez.</div></div><div className="principle"><Navigation size={22} /><div><strong>Önce keşfedebilirsin</strong>Haritayı gezmek ve liglere bakmak için konum izni gerekmez.</div></div></div>
  <button className="game-button game-button--primary game-button--full" onClick={onGrantPermission}>Haritaya devam et<ArrowRight size={18} /></button><button className="quiet-button location-skip" onClick={onSkip}>Önce etrafa bak</button>
</div></div>;
