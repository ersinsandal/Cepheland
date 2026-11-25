import type { BoundingBox } from '@cepheland/geo';

export interface PlaceResult {
  id: string; title: string; subtitle: string;
  center: { latitude: number; longitude: number };
  bbox: BoundingBox; kind: string; source: 'photon' | 'local';
}
export interface PlaceSearchResponse { results: PlaceResult[]; source: 'online' | 'local'; message?: string }
interface Options {
  fetcher?: typeof fetch; endpoint?: string; timeoutMs?: number; intervalMs?: number;
  localSearch?: (query: string) => any[];
}

const normalized = (text: string) => text.normalize('NFKC').replace(/[\u0000-\u001f]/g, ' ').replace(/\s+/g, ' ').trim();
const around = (latitude: number, longitude: number): BoundingBox => ({
  minLat: Math.max(-85, latitude-.005), maxLat: Math.min(85, latitude+.005),
  minLng: Math.max(-180, longitude-.005), maxLng: Math.min(180, longitude+.005),
});

/** Explicit user searches only. One upstream request at a time, at most one per
 * second, shared/deduplicated results, bounded queues and a replaceable provider. */
export function createPlaceSearch(options: Options = {}) {
  const fetcher = options.fetcher ?? fetch;
  const cache = new Map<string, { expires: number; value: PlaceSearchResponse }>();
  const pending = new Map<string, Promise<PlaceSearchResponse>>();
  let queue: Promise<unknown> = Promise.resolve();
  let lastRequest = 0;
  let unavailableUntil = 0;

  function local(query: string): PlaceSearchResponse {
    const results: PlaceResult[] = (options.localSearch?.(query) ?? []).slice(0, 8).map(item => ({
      id: `local:${item.id}`, title: item.title, subtitle: item.subtitle || '',
      center: item.center, bbox: item.bbox ?? around(item.center.latitude, item.center.longitude),
      kind: item.type || 'place', source: 'local',
    }));
    return { results, source: 'local', message: results.length
      ? 'Kayıtlı konumlar gösteriliyor. Çevrimiçi arama şu anda kullanılamıyor.'
      : 'Konum aramasına şu anda ulaşılamıyor. Biraz sonra yeniden deneyin.' };
  }

  return {
    search(rawQuery: string): Promise<PlaceSearchResponse> {
      const query = normalized(rawQuery);
      if (query.length < 2 || query.length > 120) return Promise.reject(Object.assign(new Error('2–120 karakterlik bir konum adı yazın.'), { statusCode: 400, code: 'INVALID_SEARCH' }));
      const key = query.toLocaleLowerCase('tr');
      const cached = cache.get(key);
      if (cached && cached.expires > Date.now()) return Promise.resolve(cached.value);
      if (pending.has(key)) return pending.get(key)!;
      // Avoid an ever-growing upstream queue when users type/retry rapidly.
      if (unavailableUntil > Date.now() || pending.size >= 3) return Promise.resolve(local(query));
      // The browser gives the entire HTTP request ten seconds. Start our budget
      // before joining the queue, so waiting never consumes an extra timeout.
      const deadline = Date.now() + 8000;
      const controller = new AbortController();
      let expired = false;
      let deadlineTimer: ReturnType<typeof setTimeout>;
      const deadlineResult = new Promise<PlaceSearchResponse>(resolve => {
        deadlineTimer = setTimeout(() => {
          expired = true;
          controller.abort();
          resolve(local(query));
        }, 8000);
      });
      const work = queue.then(async (): Promise<PlaceSearchResponse> => {
        if (expired || Date.now() >= deadline || unavailableUntil > Date.now()) return local(query);
        const wait = Math.max(0, lastRequest + (options.intervalMs ?? 1000) - Date.now());
        if (Date.now() + wait >= deadline) return local(query);
        if (wait) await new Promise(resolve => setTimeout(resolve, wait));
        if (expired || Date.now() >= deadline || unavailableUntil > Date.now()) return local(query);
        lastRequest = Date.now();
        let requestTimer: ReturnType<typeof setTimeout> | undefined;
        try {
          const url = new URL(options.endpoint || process.env.PLACE_SEARCH_URL || 'https://photon.komoot.io/api/');
          url.searchParams.set('q', query); url.searchParams.set('limit', '8');
          // Bound the body as well as headers, even if a provider ignores abort.
          // Promise.race observes late rejections; late responses cannot fill cache.
          const body = await Promise.race([
            (async () => {
              // Omitting lang keeps the local OSM name, including Turkish characters.
              const response = await fetcher(url, {
                headers: { Accept: 'application/json', 'User-Agent': 'Cepheland/1.0 (user initiated place search)' },
                signal: controller.signal,
              });
              if (!response.ok) throw new Error(`Place search HTTP ${response.status}`);
              return await response.json() as { features?: any[] };
            })(),
            new Promise<never>((_resolve, reject) => {
              requestTimer = setTimeout(() => {
                controller.abort();
                reject(new Error('Place search timed out'));
              }, Math.min(options.timeoutMs ?? 6000, Math.max(0, deadline - Date.now())));
            }),
          ]);
          if (expired || Date.now() >= deadline) return local(query);
          if (!Array.isArray(body.features)) throw new Error('Invalid place search response');
          const results: PlaceResult[] = [];
          const seen = new Set<string>();
          for (const feature of body.features) {
            const coordinates = feature.geometry?.coordinates;
            const p = feature.properties ?? {};
            if (feature.geometry?.type !== 'Point' || !Array.isArray(coordinates)) continue;
            const [longitude, latitude] = coordinates;
            if (![longitude, latitude].every(Number.isFinite) || Math.abs(latitude) > 85 || Math.abs(longitude) > 180) continue;
            const title = normalized(String(p.name || p.street || p.city || ''));
            if (!title) continue;
            const id = `osm:${p.osm_type || 'place'}:${p.osm_id || `${longitude},${latitude}`}`;
            if (seen.has(id)) continue;
            seen.add(id);
            const subtitle = [...new Set([p.street, p.district, p.city, p.county, p.state, p.country]
              .filter((part): part is string => typeof part === 'string' && part !== title))].join(', ');
            results.push({ id, title, subtitle, center: { latitude, longitude }, bbox: around(latitude, longitude), kind: p.type || p.osm_value || 'place', source: 'photon' });
          }
          // A same-named business should not precede the actual neighborhood.
          // Keep provider order within each class, and keep address searches intact.
          const placeRank = (result: PlaceResult) => result.title.toLocaleLowerCase('tr') === key
            && ['city', 'district', 'locality', 'village', 'town', 'suburb', 'neighbourhood'].includes(result.kind) ? 0 : 1;
          results.sort((a, b) => placeRank(a)-placeRank(b));
          const value: PlaceSearchResponse = { results, source: 'online' };
          cache.delete(key); cache.set(key, { expires: Date.now()+24*60*60_000, value });
          if (cache.size > 256) cache.delete(cache.keys().next().value!);
          return value;
        } catch {
          // A queued request exhausting its own budget is not a provider outage.
          if (!expired && Date.now() < deadline) unavailableUntil = Date.now()+30_000;
          return local(query);
        } finally {
          clearTimeout(requestTimer);
        }
      });
      const operation = Promise.race([work, deadlineResult]).finally(() => {
        clearTimeout(deadlineTimer);
        pending.delete(key);
      });
      // Preserve upstream order even when a caller's queued deadline expires.
      queue = work.catch(() => undefined);
      pending.set(key, operation);
      return operation;
    },
  };
}
