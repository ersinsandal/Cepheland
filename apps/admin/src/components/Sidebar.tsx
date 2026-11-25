import React from 'react';
import {
  LayoutDashboard,
  Wand2,
  Trophy,
  Calendar,
  MapPin,
  Swords,
  BarChart3,
  ShieldCheck,
  AlertOctagon,
  ScrollText,
  Sliders,
  LogOut,
} from 'lucide-react';

export type AdminTab =
  | 'overview'
  | 'wizard'
  | 'leagues'
  | 'seasons'
  | 'map_editor'
  | 'battles'
  | 'rankings_audit'
  | 'security'
  | 'moderation'
  | 'audit'
  | 'system';

interface SidebarProps {
  currentTab: AdminTab;
  onSelectTab: (tab: AdminTab) => void;
}

export const Sidebar: React.FC<SidebarProps> = ({ currentTab, onSelectTab }) => {
  const menuItems: { id: AdminTab; label: string; icon: React.ReactNode; badge?: string }[] = [
    { id: 'overview', label: 'Genel Bakış', icon: <LayoutDashboard size={18} /> },
    { id: 'wizard', label: 'Lig Sihirbazı', icon: <Wand2 size={18} />, badge: '7 Adım' },
    { id: 'leagues', label: 'Ligler & Takımlar', icon: <Trophy size={18} /> },
    { id: 'seasons', label: 'Sezon Yönetimi', icon: <Calendar size={18} /> },
    { id: 'map_editor', label: 'Harita ve Cepheler', icon: <MapPin size={18} /> },
    { id: 'battles', label: 'Savaş Merkezi', icon: <Swords size={18} />, badge: 'Canlı' },
    { id: 'rankings_audit', label: 'Sıralama ve Doğrulama', icon: <BarChart3 size={18} /> },
    { id: 'security', label: 'Güvenlik İnceleme', icon: <ShieldCheck size={18} />, badge: '1 Vaka' },
    { id: 'moderation', label: 'Moderasyon & Raporlar', icon: <AlertOctagon size={18} /> },
    { id: 'audit', label: 'Denetim Günlüğü', icon: <ScrollText size={18} /> },
    { id: 'system', label: 'Sistem & Parametreler', icon: <Sliders size={18} /> },
  ];

  return (
    <aside style={{
      width: 260,
      background: '#FFFFFF',
      borderRight: '1px solid #D9DEE6',
      display: 'flex',
      flexDirection: 'column',
      height: '100vh',
      position: 'sticky',
      top: 0,
    }}>
      {/* Brand logo header with designer icon */}
      <div style={{
        padding: '20px 20px',
        borderBottom: '1px solid #D9DEE6',
        display: 'flex',
        alignItems: 'center',
        gap: 12,
      }}>
        <img
          src="/icon.png"
          alt="Cepheland Icon"
          style={{ width: 40, height: 40, borderRadius: 8, objectFit: 'cover' }}
        />
        <div>
          <div style={{ fontSize: 18, fontWeight: 700, letterSpacing: '-0.02em', color: '#111827' }}>
            CEPHELAND
          </div>
          <div style={{ fontSize: 10, color: '#0F766E', fontWeight: 600 }}>
            Yönetim & Operasyon Paneli
          </div>
        </div>
      </div>

      {/* Nav items */}
      <nav style={{ flex: 1, padding: '16px 12px', overflowY: 'auto' }}>
        <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
          {menuItems.map((item) => {
            const isActive = currentTab === item.id;
            return (
              <button
                key={item.id}
                onClick={() => onSelectTab(item.id)}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  padding: '10px 12px',
                  borderRadius: 8,
                  border: 'none',
                  background: isActive ? '#0F766E' : 'transparent',
                  color: isActive ? '#FFFFFF' : '#586271',
                  cursor: 'pointer',
                  fontWeight: isActive ? 600 : 500,
                  fontSize: 13,
                  textAlign: 'left',
                  transition: 'background 0.15s ease',
                }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                  <span style={{ color: isActive ? '#FFFFFF' : '#0F766E' }}>
                    {item.icon}
                  </span>
                  <span>{item.label}</span>
                </div>
                {item.badge && (
                  <span style={{
                    fontSize: 10,
                    fontWeight: 600,
                    padding: '2px 6px',
                    borderRadius: 999,
                    background: isActive ? 'rgba(255,255,255,0.2)' : '#EFF6FF',
                    color: isActive ? '#FFFFFF' : '#1D4ED8',
                  }}>
                    {item.badge}
                  </span>
                )}
              </button>
            );
          })}
        </div>
      </nav>

      {/* Footer Info */}
      <div style={{
        padding: '16px 20px',
        borderTop: '1px solid #D9DEE6',
        fontSize: 11,
        color: '#8E98A8',
        display: 'flex',
        flexDirection: 'column',
        gap: 4,
      }}>
        <div style={{ fontWeight: 600, color: '#111827' }}>Pilot Bölge: Alanya / Mahmutlar</div>
        <div>Sürüm: v1.0.0 (Master Spec)</div>
      </div>
    </aside>
  );
};
