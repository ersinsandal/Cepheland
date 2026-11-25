/**
 * Cepheland UI Tokens
 * Single source of truth for design parameters as specified in Blueprint Section 11.
 */

export const brand = {
  name: 'Cepheland',
  slogan_tr: 'Tarafını seç. Cepheni kazan.',
  slogan_en: 'Choose your side. Conquer your front.',
  version: '1.0.0',
};

export const colors = {
  light: {
    bg: '#F8FAFB',
    surface: '#FFFFFF',
    textPrimary: '#111827',
    textSecondary: '#586271',
    textTertiary: '#8E98A8',
    border: '#D9DEE6',
    borderSubtle: '#EDF0F3',
    accent: '#0F766E', // Teal 700
    accentHover: '#115E59',
    accentLight: '#CCFBF1',
    error: '#B42318',
    errorBg: '#FEF3F2',
    warning: '#B54708',
    warningBg: '#FFFAEB',
    success: '#027A48',
    successBg: '#ECFDF3',
    neutralFront: '#94A3B8',
    contestedFront: '#F59E0B',
    protectedFront: '#6366F1',
  },
  dark: {
    bg: '#101419',
    surface: '#1B2129',
    textPrimary: '#F4F6F8',
    textSecondary: '#9AA6B5',
    textTertiary: '#64748B',
    border: '#2C3542',
    borderSubtle: '#222A35',
    accent: '#2DD4BF', // Teal 400
    accentHover: '#14B8A6',
    accentLight: '#134E4A',
    error: '#F04438',
    errorBg: '#55160C',
    warning: '#F79009',
    warningBg: '#4E1D09',
    success: '#12B76A',
    successBg: '#053321',
    neutralFront: '#64748B',
    contestedFront: '#D97706',
    protectedFront: '#818CF8',
  },
};

export const typography = {
  fontFamily: 'Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
  fontSize: {
    xs: 12,
    sm: 14,
    md: 16,
    lg: 18,
    xl: 22,
    '2xl': 28,
    '3xl': 34,
  },
  lineHeight: {
    xs: 16,
    sm: 20,
    md: 24,
    lg: 28,
    xl: 30,
    '2xl': 36,
    '3xl': 42,
  },
  fontWeight: {
    regular: '400',
    medium: '500',
    semibold: '600',
    bold: '700',
  },
};

export const spacing = {
  xs: 4,
  sm: 8,
  md: 12,
  lg: 16,
  xl: 24,
  '2xl': 32,
  '3xl': 48,
};

export const radius = {
  input: 8,
  card: 12,
  sheet: 16,
  pill: 9999,
};

export const teamPalettes: Record<string, { primary: string; secondary: string; lightBg: string; text: string }> = {
  'galatasaray': {
    primary: '#A90432',
    secondary: '#FDB913',
    lightBg: '#FDF2F4',
    text: '#FFFFFF',
  },
  'fenerbahce': {
    primary: '#002D72',
    secondary: '#FFED02',
    lightBg: '#EFF5FF',
    text: '#FFFFFF',
  },
  'besiktas': {
    primary: '#111827',
    secondary: '#FFFFFF',
    lightBg: '#F3F4F6',
    text: '#FFFFFF',
  },
  'trabzonspor': {
    primary: '#800020',
    secondary: '#00BFFF',
    lightBg: '#FDF2F4',
    text: '#FFFFFF',
  },
  'pc-master-race': {
    primary: '#107C41',
    secondary: '#00A4EF',
    lightBg: '#ECFDF5',
    text: '#FFFFFF',
  },
  'playstation': {
    primary: '#003791',
    secondary: '#0070D1',
    lightBg: '#EFF6FF',
    text: '#FFFFFF',
  },
  'xbox': {
    primary: '#107C10',
    secondary: '#52B435',
    lightBg: '#F0FDF4',
    text: '#FFFFFF',
  },
};
