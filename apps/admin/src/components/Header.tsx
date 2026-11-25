import React from 'react';
import { ShieldAlert, Bell, User, CheckCircle2, AlertTriangle } from 'lucide-react';

interface HeaderProps {
  currentTab: string;
  isKillSwitchActive: boolean;
  onOpenKillSwitch: () => void;
}

export const Header: React.FC<HeaderProps> = ({ currentTab, isKillSwitchActive, onOpenKillSwitch }) => {
  return (
    <header style={{
      height: 64,
      background: '#FFFFFF',
      borderBottom: '1px solid #D9DEE6',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      padding: '0 24px',
      position: 'sticky',
      top: 0,
      zIndex: 40,
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
        <span style={{
          fontSize: 12,
          fontWeight: 600,
          background: '#EFF6FF',
          color: '#1D4ED8',
          padding: '4px 8px',
          borderRadius: 6,
          border: '1px solid #BFDBFE',
          letterSpacing: '0.05em',
        }}>
          INVESTOR DEMO / STAGING
        </span>
        <span style={{ color: '#8E98A8' }}>/</span>
        <span style={{ fontSize: 14, fontWeight: 600, color: '#111827' }}>
          {currentTab}
        </span>
      </div>

      <div style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
        {isKillSwitchActive && (
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: 6,
            background: '#FEF3F2',
            color: '#B42318',
            padding: '4px 10px',
            borderRadius: 6,
            border: '1px solid #FECDCA',
            fontSize: 13,
            fontWeight: 600,
          }}>
            <AlertTriangle size={16} />
            ACİL DURDURMA DEVREDE
          </div>
        )}

        <button
          onClick={onOpenKillSwitch}
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: 6,
            background: isKillSwitchActive ? '#B42318' : '#FEF3F2',
            color: isKillSwitchActive ? '#FFFFFF' : '#B42318',
            border: '1px solid #FECDCA',
            padding: '6px 12px',
            borderRadius: 6,
            fontSize: 13,
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          <ShieldAlert size={16} />
          Acil Durdurma (Kill Switch)
        </button>

        <div style={{ width: 1, height: 24, background: '#D9DEE6' }} />

        <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
          <div style={{
            width: 34,
            height: 34,
            borderRadius: '50%',
            background: '#0F766E',
            color: '#FFFFFF',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            fontWeight: 700,
            fontSize: 13,
          }}>
            SA
          </div>
          <div>
            <div style={{ fontSize: 13, fontWeight: 600, color: '#111827' }}>Super Admin</div>
            <div style={{ fontSize: 11, color: '#027A48', display: 'flex', alignItems: 'center', gap: 4 }}>
              <CheckCircle2 size={10} /> MFA Doğrulandı
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};
