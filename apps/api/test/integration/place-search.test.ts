import { afterEach, describe, expect, it, vi } from 'vitest';
import { createPlaceSearch } from '../../src/services/place-search.js';

const feature = (name: string, id: number, lng = 32.099, lat = 36.49, kind = 'district') => ({
  type: 'Feature', geometry: { type: 'Point', coordinates: [lng, lat] },
  properties: { name, osm_type: 'N', osm_id: id, type: kind, city: 'Alanya', state: 'Antalya', country: 'Türkiye' },
});

afterEach(() => vi.useRealTimers());

describe('Free-form place search', () => {
  it('returns real coordinates, distinguishes same-named places, and rejects malformed results', async () => {
    const fetcher = vi.fn(async () => ({ ok: true, json: async () => ({ features: [
      feature('Mahmutlar', 1, 33.6, 39.8, 'house'), feature('Mahmutlar', 2),
      feature('Mahmutlar', 2), feature('Broken', 3, 200), feature('Equator', 4, 0, 0),
    ] }) })) as unknown as typeof fetch;
    const response = await createPlaceSearch({ fetcher, intervalMs: 0 }).search('Mahmutlar');
    expect(response.source).toBe('online');
    expect(response.results.map(r => r.id)).toEqual(['osm:N:2', 'osm:N:1', 'osm:N:4']);
    expect(response.results[0]).toMatchObject({ title: 'Mahmutlar', subtitle: 'Alanya, Antalya, Türkiye', center: { latitude: 36.49, longitude: 32.099 } });
    expect(response.results[2].center.latitude).toBe(0);
    expect(new URL((vi.mocked(fetcher).mock.calls[0][0] as URL).toString()).searchParams.get('q')).toBe('Mahmutlar');
  });

  it('deduplicates simultaneous searches and reuses normalized cached results', async () => {
    const fetcher = vi.fn(async () => ({ ok: true, json: async () => ({ features: [feature('Mahmutlar', 2)] }) })) as unknown as typeof fetch;
    const service = createPlaceSearch({ fetcher, intervalMs: 0 });
    const [first, second] = await Promise.all([service.search('  Mahmutlar  '), service.search('mahmutlar')]);
    expect(second).toEqual(first);
    await service.search('MAHMUTLAR');
    expect(fetcher).toHaveBeenCalledTimes(1);
  });

  it('uses honest local fallback and cooldown during an upstream outage', async () => {
    const fetcher = vi.fn(async () => { throw new Error('offline'); }) as unknown as typeof fetch;
    const localSearch = vi.fn(() => [{ id: 'known', title: 'Mahmutlar', center: { latitude: 36.49, longitude: 32.099 } }]);
    const service = createPlaceSearch({ fetcher, localSearch, intervalMs: 0 });
    expect(await service.search('Mahmutlar')).toMatchObject({ source: 'local', results: [{ source: 'local', title: 'Mahmutlar' }] });
    await service.search('Moda');
    expect(fetcher).toHaveBeenCalledTimes(1);
    expect(localSearch).toHaveBeenCalledTimes(2);
  });

  it('does not call the provider for invalid queries and distinguishes no matches from outages', async () => {
    const fetcher = vi.fn(async () => ({ ok: true, json: async () => ({ features: [] }) })) as unknown as typeof fetch;
    const service = createPlaceSearch({ fetcher, intervalMs: 0 });
    await expect(service.search(' ')).rejects.toMatchObject({ statusCode: 400 });
    await expect(service.search('x'.repeat(121))).rejects.toMatchObject({ code: 'INVALID_SEARCH' });
    expect(fetcher).not.toHaveBeenCalled();
    expect(await service.search('No matching place')).toEqual({ results: [], source: 'online' });
  });

  it('includes queue wait in the eight-second budget and skips expired queued searches', async () => {
    vi.useFakeTimers();
    vi.setSystemTime(new Date('2026-01-01T00:00:00Z'));
    const started: number[] = [];
    const signals: AbortSignal[] = [];
    const fetcher = vi.fn((_url: unknown, init?: RequestInit) => {
      started.push(Date.now()); signals.push(init!.signal as AbortSignal);
      const call = started.length;
      // Deliberately ignore abort. A late failure must remain observed and must
      // not hold the next queue slot or turn a budget expiry into an outage.
      return new Promise((resolve, reject) => setTimeout(() => {
        if (call === 2) reject(new Error('late provider failure'));
        else resolve({ ok: true, json: async () => ({ features: [feature('Mahmutlar', call)] }) });
      }, 5500));
    }) as unknown as typeof fetch;
    const service = createPlaceSearch({ fetcher });
    const first = service.search('Mahmutlar');
    const second = service.search('Moda');
    expect(service.search('moda')).toBe(second);
    const third = service.search('Konya');

    await vi.advanceTimersByTimeAsync(5500);
    expect(await first).toMatchObject({ source: 'online' });
    expect(fetcher).toHaveBeenCalledTimes(2);
    expect(started[1] - started[0]).toBeGreaterThanOrEqual(1000);
    await vi.advanceTimersByTimeAsync(2500);
    expect(await second).toMatchObject({ source: 'local' });
    expect(await third).toMatchObject({ source: 'local' });
    expect(signals[1].aborted).toBe(true);
    expect(fetcher).toHaveBeenCalledTimes(2);

    await vi.advanceTimersByTimeAsync(3000); // The ignored-abort failure arrives.
    const retry = service.search('Moda');
    await vi.advanceTimersByTimeAsync(5500);
    expect(await retry).toMatchObject({ source: 'online' });
    expect(fetcher).toHaveBeenCalledTimes(3);
  });
});
