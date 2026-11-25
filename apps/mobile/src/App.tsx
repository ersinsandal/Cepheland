import React, { useState, useEffect } from 'react';
import { WelcomeView } from './views/WelcomeView.js';
import { AuthView } from './views/AuthView.js';
import { LocationExplainerView } from './views/LocationExplainerView.js';
import { MapView } from './views/MapView.js';
import { LeaguesView } from './views/LeaguesView.js';
import { ActivityView } from './views/ActivityView.js';
import { ProfileView } from './views/ProfileView.js';
import { BattleModal } from './views/BattleModal.js';
import { BottomTabBar, MobileTab } from './components/BottomTabBar.js';
import { fetchApi, setUserToken } from './api.js';

export const App: React.FC = () => {
  const [screen, setScreen] = useState<'welcome' | 'auth' | 'location_explainer' | 'main'>('welcome');
  const [currentTab, setCurrentTab] = useState<MobileTab>('map');
  const [user, setUser] = useState<any | null>(null);
  const [locale, setLocale] = useState<'tr' | 'en'>('tr');
  const [activeLeague, setActiveLeague] = useState<any | null>(null);
  const [activeBattleId, setActiveBattleId] = useState<string | null>(null);
  const [entering, setEntering] = useState(false);

  useEffect(() => {
    const controller = new AbortController();
    fetchApi<any[]>('/leagues', { signal: controller.signal })
      .then(leagues => { if (!controller.signal.aborted && leagues.length) setActiveLeague(leagues[0]); })
      .catch(() => {});
    return () => controller.abort();
  }, []);
  const enterMap = async () => {
    if (entering) return;
    setEntering(true);
    setCurrentTab('map');
    setScreen('main');
    try {
      const result = await fetchApi<any>('/auth/verify', {
        method: 'POST', signal: AbortSignal.timeout(8000),
        body: JSON.stringify({ identifier: 'ahmet_gs', code: '123456' }),
      });
      setUserToken(result.accessToken);
      setUser(result.user);
    } catch {
      // Public map exploration remains available if sign-in is unavailable.
      setUserToken(''); setUser(null);
    } finally { setEntering(false); }
  };
  const handleLogout = () => {
    setUser(null); setUserToken(''); setActiveBattleId(null); setScreen('welcome');
  };
  const toggleLocale = () => setLocale(prev => prev === 'tr' ? 'en' : 'tr');
  const seasonId = activeLeague?.activeSeason?.id || 'e0000000-0000-0000-0000-000000000001';
  return <div className={`app-shell ${screen === 'main' ? 'app-shell--playing' : ''}`}>
    {screen === 'welcome' && <WelcomeView onStart={() => setScreen('auth')} onExploreMap={enterMap}
      locale={locale} onToggleLocale={toggleLocale} loading={entering} />}
    {screen === 'auth' && <AuthView onBack={() => setScreen('welcome')} onSuccess={authenticatedUser => {
      setUser(authenticatedUser); setScreen('location_explainer');
    }} />}
    {screen === 'location_explainer' && <LocationExplainerView
      onGrantPermission={() => { setScreen('main'); setCurrentTab('map'); }}
      onSkip={() => { setScreen('main'); setCurrentTab('map'); }} />}
    {screen === 'main' && <>
      <BottomTabBar currentTab={currentTab} onSelectTab={setCurrentTab} />
      <main className="app-main" id="game-content">
        {currentTab === 'map' && <MapView currentSeasonId={seasonId} activeLeague={activeLeague}
          user={user} onOpenBattle={setActiveBattleId} onOpenLeagues={() => setCurrentTab('leagues')}
          isDesktopMode={false} />}
        {currentTab === 'leagues' && <LeaguesView activeLeagueId={activeLeague?.id}
          user={user} onSelectLeague={league => { setActiveLeague(league); setCurrentTab('map'); }} />}
        {currentTab === 'activity' && <ActivityView user={user} currentSeasonId={seasonId} />}
        {currentTab === 'profile' && <ProfileView user={user} onLogout={handleLogout}
          locale={locale} onToggleLocale={toggleLocale} />}
      </main>
      {activeBattleId && <BattleModal battleId={activeBattleId} onClose={() => setActiveBattleId(null)} />}
    </>}
  </div>;
};
export default App;
