import { mkdir, readFile, rename, writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { createHash, randomUUID } from 'node:crypto';

export type FrontNameSource = 'poi' | 'street' | 'locality' | 'coordinate';
export interface FrontNameProposal {
  frontId: string;
  candidates: string[];
  baseName: string;
  streetName: string | null;
  source: FrontNameSource;
  osmIds: string[];
  locality?: string;
}
export interface RegisteredFrontName extends Omit<FrontNameProposal, 'candidates'> {
  name: string;
}

const quality: Record<FrontNameSource, number> = { coordinate: 0, locality: 1, street: 2, poi: 3 };
const clean = (value: string) => value.normalize('NFKC').replace(/[\u0000-\u001f\u007f]/g, ' ').replace(/\s+/g, ' ').trim();
export const normalizeFrontName = (value: string) => clean(value).toLocaleLowerCase('tr');

/** One namespace for every loaded front, independent of viewport and season.
 * Names and their old aliases remain reserved across API restarts. */
export class FrontNameRegistry {
  private entries = new Map<string, RegisteredFrontName>();
  private claims = new Map<string, string>();
  private loaded = false;
  private queue: Promise<void> = Promise.resolve();

  constructor(private file?: string | null) {}

  private async load() {
    if (this.loaded) return;
    if (this.file === undefined) this.file = process.env.FRONT_NAMES_FILE
      || (process.env.NODE_ENV === 'test' ? null : join(__dirname, '..', '..', 'scratch', 'front-names', 'v1.json'));
    if (this.file) {
      try {
        const saved = JSON.parse(await readFile(this.file, 'utf8'));
        if (saved.version !== 1 || !Array.isArray(saved.entries) || !Array.isArray(saved.claims)) {
          throw new Error('Cephe adları kaydı okunamadı. Mevcut isim kaydını kontrol edin.');
        }
        for (const entry of saved.entries as RegisteredFrontName[]) {
          if (!entry.frontId || !entry.name || !(entry.source in quality)) throw new Error('Geçersiz cephe adı kaydı.');
          this.entries.set(entry.frontId, entry);
        }
        this.claims = new Map(saved.claims);
        for (const entry of this.entries.values()) {
          const key = normalizeFrontName(entry.name);
          const owner = this.claims.get(key);
          if (owner && owner !== entry.frontId) throw new Error('Çakışan kalıcı cephe adları bulundu.');
          this.claims.set(key, entry.frontId);
        }
      } catch (error) {
        if ((error as NodeJS.ErrnoException).code !== 'ENOENT') throw error;
      }
    }
    this.loaded = true;
  }

  assign(proposals: FrontNameProposal[]): Promise<Map<string, RegisteredFrontName>> {
    const operation = this.queue.then(async () => {
      await this.load();
      const entries = new Map(this.entries);
      const claims = new Map(this.claims);
      let changed = false;
      // Repeated tile overlap must not let a weaker proposal win for the same ID.
      const best = new Map<string, FrontNameProposal>();
      for (const proposal of proposals) {
        const previous = best.get(proposal.frontId);
        if (!previous || quality[proposal.source] > quality[previous.source]) best.set(proposal.frontId, proposal);
      }
      for (const proposal of [...best.values()].sort((a, b) => a.frontId.localeCompare(b.frontId))) {
        const previous = entries.get(proposal.frontId);
        if (previous && quality[previous.source] >= quality[proposal.source]) continue;
        const available = (name: string) => !claims.has(normalizeFrontName(name))
          || claims.get(normalizeFrontName(name)) === proposal.frontId;
        const candidates = [...new Set(proposal.candidates.map(clean).filter(Boolean))];
        let name = candidates.find(available);
        if (!name) {
          // Only identical real-world names need a short permanent disambiguator.
          // It is never the primary name and every proposed suffix is checked.
          const base = clean(proposal.baseName) || 'Adsız arazi';
          const token = createHash('sha256').update(proposal.frontId).digest('hex').toUpperCase();
          for (let length = 6; length <= token.length; length += 2) {
            const candidate = `${base} · ${token.slice(0, length)}`;
            if (available(candidate)) { name = candidate; break; }
          }
          if (!name) {
            let ordinal = 1;
            while (!available(`${base} · ${token}-${ordinal}`)) ordinal++;
            name = `${base} · ${token}-${ordinal}`;
          }
        }
        const { candidates: _, ...metadata } = proposal;
        entries.set(proposal.frontId, { ...metadata, name });
        claims.set(normalizeFrontName(name), proposal.frontId);
        changed = true;
      }
      if (changed && this.file) {
        await mkdir(dirname(this.file), { recursive: true });
        const temporary = `${this.file}.${randomUUID()}.tmp`;
        await writeFile(temporary, JSON.stringify({ version: 1, entries: [...entries.values()], claims: [...claims] }), 'utf8');
        await rename(temporary, this.file);
      }
      this.entries = entries;
      this.claims = claims;
      return new Map(proposals.map(proposal => [proposal.frontId, entries.get(proposal.frontId)!]));
    });
    this.queue = operation.then(() => undefined, () => undefined);
    return operation;
  }
}

export const frontNameRegistry = new FrontNameRegistry();
