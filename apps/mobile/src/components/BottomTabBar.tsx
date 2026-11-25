import React from 'react';
import { Map, Trophy, History, User } from 'lucide-react';
import { BrandMark } from './BrandMark.js';
export type MobileTab = 'map' | 'leagues' | 'activity' | 'profile';
interface BottomTabBarProps { currentTab: MobileTab; onSelectTab: (tab: MobileTab) => void }
export const BottomTabBar: React.FC<BottomTabBarProps> = ({ currentTab, onSelectTab }) => {
  const tabs = [
    { id: 'map' as MobileTab, label: 'Harita', Icon: Map },
    { id: 'leagues' as MobileTab, label: 'Ligler', Icon: Trophy },
    { id: 'activity' as MobileTab, label: 'Aktivite', Icon: History },
    { id: 'profile' as MobileTab, label: 'Oyuncu', Icon: User },
  ];
  return <nav className="game-nav" aria-label="Ana gezinme">
    <button className="nav-brand" aria-label="Cepheland haritası" onClick={() => onSelectTab('map')}><BrandMark /></button>
    {tabs.map(({ id, label, Icon }) => <button key={id} type="button" title={label}
      className={`nav-item ${currentTab === id ? 'is-active' : ''} ${id === 'profile' ? 'nav-profile' : ''}`}
      aria-current={currentTab === id ? 'page' : undefined} onClick={() => onSelectTab(id)}>
      <Icon size={21} strokeWidth={1.7} /><span>{label}</span>
    </button>)}
    <span className="nav-edition" aria-hidden="true">CL / 01</span>
  </nav>;
};
