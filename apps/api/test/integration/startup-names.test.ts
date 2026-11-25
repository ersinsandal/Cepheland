import { mkdtemp, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { basename, dirname, join, resolve } from 'node:path';
import request from 'supertest';
import { describe, expect, it, vi } from 'vitest';
import { FrontNameRegistry } from '../../src/services/front-name-registry.js';

describe('Restoring front names before the first API read', () => {
  it('restores a saved POI name for direct front and battle requests without loading a viewport', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-startup-names-'));
    const file = join(directory, 'names.json');
    const frontId = 'f0000000-0000-0000-0000-000000000003';
    const battleId = 'bb000000-0000-0000-0000-000000000001';
    const savedName = 'Test Kitabevi · Barbaros Caddesi';
    try {
      // This represents the previous process's persisted naming enrichment.
      await new FrontNameRegistry(file).assign([{
        frontId, candidates: [savedName], baseName: savedName,
        streetName: 'Barbaros Caddesi', source: 'poi', osmIds: ['node/123456'],
      }]);
      vi.stubEnv('FRONT_NAMES_FILE', file);
      vi.resetModules();
      const { mapService } = await import('../../src/services/map.service.js');
      const viewport = vi.spyOn(mapService, 'getViewportFronts');
      const { app, appReady } = await import('../../src/index.js');
      // Do not await readiness here: imported Express apps must gate first reads.
      const [front, battle] = await Promise.all([
        request(app).get(`/fronts/${frontId}`),
        request(app).get(`/battles/${battleId}`),
      ]);
      expect(front.status).toBe(200);
      expect(battle.status).toBe(200);
      expect(front.body.displayNameI18n.tr).toBe(savedName);
      expect(battle.body.frontNameI18n.tr).toBe(savedName);
      expect(front.body.playZones.every((zone: { labelI18n: { tr: string } }) => zone.labelI18n.tr === `${savedName} Katılım Alanı`)).toBe(true);
      expect(front.body.naming).toMatchObject({ source: 'poi', osmIds: ['node/123456'] });
      expect(viewport).not.toHaveBeenCalled();
      await expect(appReady).resolves.toBeUndefined();
    } finally {
      vi.restoreAllMocks();
      vi.unstubAllEnvs();
      vi.resetModules();
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-startup-names-')) {
        throw new Error('Unexpected temporary path');
      }
      await rm(directory, { recursive: true, force: true });
    }
  });
});
