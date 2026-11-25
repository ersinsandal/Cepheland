import React, { useState, useEffect } from 'react';
import { ScrollText, RefreshCw, Clock } from 'lucide-react';
import { fetchApi } from '../api.js';

export const AuditLogView: React.FC = () => {
  const [logs, setLogs] = useState<any[]>([]);

  const loadAudit = async () => {
    try {
      const data = await fetchApi<any>('/admin/audit');
      setLogs(data.logs || []);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    loadAudit();
  }, []);

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, color: '#111827' }}>Değişmez Denetim Günlüğü (A14 Audit Log)</h2>
          <p style={{ fontSize: 13, color: '#586271' }}>Sistemdeki tüm yönetici müdahaleleri, lig yayınları ve güvenlik kararları kayıt altındadır.</p>
        </div>
        <button
          onClick={loadAudit}
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: 6,
            padding: '8px 14px',
            borderRadius: 8,
            border: '1px solid #D9DEE6',
            background: '#FFFFFF',
            fontSize: 13,
            fontWeight: 600,
            cursor: 'pointer',
          }}
        >
          <RefreshCw size={14} /> Yenile
        </button>
      </div>

      <div style={{ background: '#FFFFFF', borderRadius: 12, border: '1px solid #D9DEE6', overflow: 'hidden' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left', fontSize: 13 }}>
          <thead style={{ background: '#F8FAFB', borderBottom: '1px solid #D9DEE6', color: '#586271' }}>
            <tr>
              <th style={{ padding: '12px 16px' }}>Zaman</th>
              <th style={{ padding: '12px 16px' }}>Eylem</th>
              <th style={{ padding: '12px 16px' }}>Hedef</th>
              <th style={{ padding: '12px 16px' }}>Gerekçe / Açıklama</th>
            </tr>
          </thead>
          <tbody>
            {logs.map((l) => (
              <tr key={l.id} style={{ borderBottom: '1px solid #EDF0F3' }}>
                <td style={{ padding: '12px 16px', color: '#8E98A8', whiteSpace: 'nowrap' }}>
                  {new Date(l.createdAt).toLocaleTimeString('tr-TR')}
                </td>
                <td style={{ padding: '12px 16px', fontWeight: 600, color: '#111827' }}>
                  <code>{l.action}</code>
                </td>
                <td style={{ padding: '12px 16px', color: '#586271' }}>
                  {l.targetType}: <code>{l.targetId}</code>
                </td>
                <td style={{ padding: '12px 16px', color: '#111827' }}>
                  {l.reason || 'Sistem kaydı'}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};
