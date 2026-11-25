import { mkdtemp, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { basename, dirname, join, resolve } from 'node:path';
import { describe, expect, it } from 'vitest';
import { FrontNameRegistry, normalizeFrontName, type FrontNameProposal } from '../../src/services/front-name-registry.js';

const proposal = (frontId: string, extra: Partial<FrontNameProposal> = {}): FrontNameProposal => ({
  frontId, candidates: ['Moda Caddesi', 'Moda Caddesi · Şifa Sokak'], baseName: 'Moda Caddesi',
  streetName: 'Moda Caddesi', source: 'street', osmIds: ['way/1'], ...extra,
});

describe('Persistent, unique real front names', () => {
  it('resolves repeated real names with genuine alternatives, then a checked stable suffix', async () => {
    const registry = new FrontNameRegistry(null);
    const names = await registry.assign([proposal('3'), proposal('1'), proposal('2')]);
    expect(names.get('1')?.name).toBe('Moda Caddesi');
    expect(names.get('2')?.name).toBe('Moda Caddesi · Şifa Sokak');
    expect(names.get('3')?.name).toMatch(/^Moda Caddesi · [A-F0-9]{6,}$/);
    expect(new Set([...names.values()].map(v => normalizeFrontName(v.name))).size).toBe(3);
    const moved = await registry.assign([proposal('3')]);
    expect(moved.get('3')).toEqual(names.get('3'));
  });

  it('serializes overlapping requests and compares Turkish case and whitespace', async () => {
    const registry = new FrontNameRegistry(null);
    const [a, b] = await Promise.all([
      registry.assign([proposal('a', { candidates: [' İNCİ   KAFE '], baseName: 'İnci Kafe' })]),
      registry.assign([proposal('b', { candidates: ['inci kafe'], baseName: 'İnci Kafe' })]),
    ]);
    expect(normalizeFrontName(a.get('a')!.name)).not.toBe(normalizeFrontName(b.get('b')!.name));
  });

  it('can enrich a street name with a verified POI without downgrading it on a later outage', async () => {
    const registry = new FrontNameRegistry(null);
    await registry.assign([proposal('a')]);
    const enriched = proposal('a', { candidates: ['Gerçek Kafe · Moda Caddesi'], baseName: 'Gerçek Kafe · Moda Caddesi', source: 'poi', osmIds: ['node/7', 'way/1'] });
    const updated = await registry.assign([enriched]);
    expect(updated.get('a')?.name).toBe(enriched.baseName);
    const outage = await registry.assign([proposal('a')]);
    expect(outage.get('a')).toEqual(updated.get('a'));
    const reusedAlias = await registry.assign([proposal('b')]);
    expect(reusedAlias.get('b')?.name).not.toBe('Moda Caddesi');
  });

  it('preserves names and uniqueness after a process restart', async () => {
    const directory = await mkdtemp(join(tmpdir(), 'cepheland-names-'));
    try {
      const file = join(directory, 'names.json');
      const first = await new FrontNameRegistry(file).assign([proposal('a'), proposal('b')]);
      const reopened = new FrontNameRegistry(file);
      const second = await reopened.assign([proposal('b'), proposal('a'), proposal('c')]);
      expect(second.get('a')).toEqual(first.get('a'));
      expect(second.get('b')).toEqual(first.get('b'));
      expect(new Set([...second.values()].map(v => normalizeFrontName(v.name))).size).toBe(3);
    } finally {
      if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-names-')) throw new Error('Unexpected temporary path');
      await rm(directory, { recursive: true, force: true });
    }
  });
});
