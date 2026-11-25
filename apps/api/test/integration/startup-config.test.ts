import { mkdtemp, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { basename, dirname, join, resolve } from 'node:path';
import jwt from 'jsonwebtoken';
import request from 'supertest';
import { expect, it, vi } from 'vitest';

it('loads the configured signing key before authentication services initialize', async () => {
  const directory = await mkdtemp(join(tmpdir(), 'cepheland-startup-config-'));
  const file = join(directory, '.env');
  const signingKey = 'test-only-startup-configuration-signing-key';
  try {
    await writeFile(file, `JWT_SECRET=${signingKey}\n`);
    vi.stubEnv('JWT_SECRET', undefined);
    vi.stubEnv('DOTENV_CONFIG_PATH', file);
    vi.resetModules();
    const { app } = await import('../../src/index.js');
    const response = await request(app).post('/auth/verify').send({ identifier: 'ahmet_gs', code: '123456' });
    expect(response.status).toBe(200);
    expect(jwt.verify(response.body.accessToken, signingKey)).toMatchObject({ handle: 'ahmet_gs' });
  } finally {
    vi.unstubAllEnvs();
    vi.resetModules();
    if (dirname(directory) !== resolve(tmpdir()) || !basename(directory).startsWith('cepheland-startup-config-')) {
      throw new Error('Unexpected temporary path');
    }
    await rm(directory, { recursive: true, force: true });
  }
});
