import React from 'react';
export const BrandMark: React.FC<{ size?: number }> = ({ size = 32 }) => <svg width={size} height={size}
  viewBox="0 0 36 36" fill="none" aria-hidden="true">
  <path d="M29 5H12L5 12V24L12 31H29V23H15L13 21V15L15 13H29V5Z" fill="currentColor" />
  <path d="M29 16H20V20H29V16Z" fill="currentColor" />
</svg>;
