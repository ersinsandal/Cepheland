import React, { useState, useEffect } from 'react';
import { Sidebar, AdminTab } from './components/Sidebar.js';
import { Header } from './components/Header.js';
import { OverviewView } from './views/OverviewView.js';
import { LeagueWizardView } from './views/LeagueWizardView.js';
import { LeaguesView } from './views/LeaguesView.js';
import { MapEditorView } from './views/MapEditorView.js';
import { BattleCenterView } from './views/BattleCenterView.js';
import { RankingsAuditView } from './views/RankingsAuditView.js';
import { SecurityReviewView } from './views/SecurityReviewView.js';
import { AuditLogView } from './views/AuditLogView.js';
import { SystemKillSwitchView } from './views/SystemKillSwitchView.js';
import { fetchApi, setAdminToken } from './api.js';

export const App: React.FC = () => {
  const [currentTab, setCurrentTab] = useState<AdminTab>('overview');
  const [isKillSwitchActive, setIsKillSwitchActive] = useState(false);
  const [kpis, setKpis] = useState({
    activeLeagues: 2,
    liveBattles: 1,
    todayApprovedClaims: 27,
    pendingReviewCases: 1,
    suspendedFronts: 0,
    apiErrorRatePercent: 0.05,
    avgSettlementLatencySeconds: 1.2,
  });

  useEffect(() => {
    // Automatically authenticate super admin in demo/staging environment
    fetchApi<any>('/auth/verify', {
      method: 'POST',
      body: JSON.stringify({ identifier: 'admin', code: '123456' }),
    })
      .then((res) => {
        setAdminToken(res.accessToken);
        return fetchApi<any>('/admin/overview');
      })
      .then((data) => {
        setKpis(data);
      })
      .catch((err) => console.error('Admin init error:', err));
  }, []);

  return (
    <div style={{ display: 'flex', minHeight: '100vh', background: '#F8FAFB' }}>
      <Sidebar currentTab={currentTab} onSelectTab={setCurrentTab} />

      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', minWidth: 0 }}>
        <Header
          currentTab={
            currentTab === 'overview'
              ? 'Genel Bakış'
              : currentTab === 'wizard'
              ? 'Lig Oluşturma Sihirbazı'
              : currentTab === 'leagues'
              ? 'Ligler ve Takımlar'
              : currentTab === 'map_editor'
              ? 'Harita ve Cepheler'
              : currentTab === 'battles'
              ? 'Savaş Merkezi'
              : currentTab === 'rankings_audit'
              ? 'Sıralamalar & Doğrulama'
              : currentTab === 'security'
              ? 'Güvenlik İnceleme'
              : currentTab === 'audit'
              ? 'Denetim Günlüğü'
              : 'Sistem & Acil Durdurma'
          }
          isKillSwitchActive={isKillSwitchActive}
          onOpenKillSwitch={() => setCurrentTab('system')}
        />

        <main style={{ flex: 1, padding: 32, overflowY: 'auto' }}>
          {currentTab === 'overview' && (
            <OverviewView onNavigate={setCurrentTab} kpis={kpis} />
          )}
          {currentTab === 'wizard' && (
            <LeagueWizardView onComplete={() => setCurrentTab('leagues')} />
          )}
          {currentTab === 'leagues' && <LeaguesView />}
          {currentTab === 'map_editor' && <MapEditorView />}
          {currentTab === 'battles' && <BattleCenterView />}
          {currentTab === 'rankings_audit' && <RankingsAuditView />}
          {currentTab === 'security' && <SecurityReviewView />}
          {currentTab === 'audit' && <AuditLogView />}
          {currentTab === 'system' && (
            <SystemKillSwitchView
              isActive={isKillSwitchActive}
              onActivated={() => setIsKillSwitchActive(true)}
            />
          )}
        </main>
      </div>
    </div>
  );
};

export default App;
