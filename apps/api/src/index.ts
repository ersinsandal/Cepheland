import 'dotenv/config';
import express, { Request, Response, NextFunction } from 'express';
import cors from 'cors';
import { authService } from './services/auth.service.js';
import { leagueService } from './services/league.service.js';
import { mapService } from './services/map.service.js';
import { claimService } from './services/claim.service.js';
import { battleService } from './services/battle.service.js';
import { rankingService } from './services/ranking.service.js';
import { adminService } from './services/admin.service.js';
import { dbStore } from './db/store.js';
import { createPlaceSearch } from './services/place-search.js';

export const app: express.Express = express();
// Express is also imported directly by tests and other hosts. Gate those first
// requests as well as the production listener on the same local restoration.
export const appReady: Promise<void> = mapService.restoreCoreNames();
// A host may import the app before sending a request; retain the rejection for
// appReady/request middleware without emitting an unhandled rejection meanwhile.
void appReady.catch(() => undefined);
app.use(cors({ maxAge: 600 }));
app.use(express.json());
app.use((_req, _res, next) => {
  void appReady.then(() => next(), next);
});

// Request logging middleware
app.use((req, res, next) => {
  res.setHeader('X-Request-Id', crypto.randomUUID());
  next();
});

// Authentication middleware helper
const requireAuth = (req: Request, res: Response, next: NextFunction) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({
      status: 401,
      code: 'AUTH_REQUIRED',
      title: 'Authentication Required',
      detail: 'Katkı vermek ve işlem yapmak için giriş yapmalısın.',
      requestId: req.headers['x-request-id'] || crypto.randomUUID(),
    });
  }

  try {
    const token = authHeader.split(' ')[1];
    const payload = authService.verifyToken(token);
    (req as any).user = payload;
    next();
  } catch (err) {
    return res.status(401).json({
      status: 401,
      code: 'AUTH_TOKEN_INVALID',
      title: 'Invalid or Expired Token',
      detail: 'Oturum süresi dolmuş veya geçersiz. Lütfen tekrar giriş yapın.',
      requestId: req.headers['x-request-id'] || crypto.randomUUID(),
    });
  }
};

// Health Check
app.get('/health/public', (req, res) => {
  res.json({
    status: 'ok',
    app: 'Cepheland API',
    version: '1.0.0',
    mode: 'investor_demo_ready',
    timestamp: new Date().toISOString(),
  });
});

// ---------------- AUTH ROUTES ----------------
app.post('/auth/start', async (req, res, next) => {
  try {
    const { identifier, channel } = req.body;
    if (!identifier) return res.status(400).json({ error: 'identifier required' });
    const result = await authService.startOtp(identifier, channel || 'phone');
    res.json(result);
  } catch (err) {
    next(err);
  }
});

app.post('/auth/verify', async (req, res, next) => {
  try {
    const { identifier, code } = req.body;
    const session = await authService.verifyOtp(identifier, code);
    res.json(session);
  } catch (err: any) {
    if (err.message === 'INVALID_OTP') {
      return res.status(400).json({
        status: 400,
        code: 'INVALID_OTP',
        title: 'Doğrulama Kodu Hatalı',
        detail: 'Girdiğin 6 haneli kod doğrulanamadı.',
      });
    }
    next(err);
  }
});

app.get('/me', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  const user = dbStore.users.get(userId);
  if (!user) return res.status(404).json({ error: 'User not found' });
  res.json(user);
});

// ---------------- LEAGUES & SEASONS ----------------
app.get('/leagues', (req, res) => {
  const leagues = leagueService.getLeagues();
  res.json(leagues);
});

app.get('/leagues/:id', (req, res) => {
  const league = leagueService.getLeagueById(req.params.id);
  if (!league) return res.status(404).json({ error: 'League not found' });
  res.json(league);
});

app.get('/leagues/:id/teams', (req, res) => {
  const teams = Array.from(dbStore.teams.values()).filter((t) => t.leagueId === req.params.id);
  res.json(teams);
});

app.post('/seasons/:id/join', requireAuth, (req, res, next) => {
  try {
    const userId = (req as any).user.userId;
    const { teamId } = req.body;
    if (!teamId) return res.status(400).json({ error: 'teamId required' });
    const membership = leagueService.joinSeasonTeam(userId, req.params.id, teamId);
    res.json(membership);
  } catch (err: any) {
    if (err.message === 'SEASON_TEAM_CHANGE_LOCKED') {
      return res.status(409).json({
        status: 409,
        code: 'SEASON_TEAM_CHANGE_LOCKED',
        title: 'Takım Değişimi Kapalı',
        detail: 'Sezon devam ederken takım değişikliği yapılamaz.',
      });
    }
    next(err);
  }
});

app.get('/seasons/:id/me', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  const membership = leagueService.getUserMembership(userId, req.params.id);
  res.json({ membership: membership || null });
});

// ---------------- MAP & FRONTS ----------------
const placeSearch = createPlaceSearch({ localSearch: query => mapService.searchLocations(query) });
app.get('/maps/places', async (req, res, next) => {
  try {
    if (typeof req.query.q !== 'string') return res.status(400).json({ code: 'INVALID_SEARCH', detail: 'Aranacak konumu yazın.' });
    res.json(await placeSearch.search(req.query.q));
  } catch (error) { next(error); }
});

app.get('/maps/regions', (req, res) => {
  const regions = mapService.getWorldRegions();
  res.json(regions);
});

app.get('/maps/search', (req, res) => {
  const q = (req.query.q as string) || '';
  const results = mapService.searchLocations(q);
  res.json(results);
});

app.get('/maps/viewport', async (req, res, next) => {
  try {
    const seasonId = (req.query.season_id as string) || 'e0000000-0000-0000-0000-000000000001';
    const keys = ['minLat', 'maxLat', 'minLng', 'maxLng'] as const;
    const supplied = keys.filter(key => req.query[key] !== undefined);
    if (supplied.length > 0 && (supplied.length !== 4 || keys.some(key =>
      typeof req.query[key] !== 'string' || !(req.query[key] as string).trim()
      || !Number.isFinite(Number(req.query[key]))))) {
      return res.status(400).json({ status: 400, code: 'INVALID_VIEWPORT', detail: 'Dört geçerli harita sınırı belirtin.' });
    }
    const minLat = supplied.length ? Number(req.query.minLat) : undefined;
    const maxLat = supplied.length ? Number(req.query.maxLat) : undefined;
    const minLng = supplied.length ? Number(req.query.minLng) : undefined;
    const maxLng = supplied.length ? Number(req.query.maxLng) : undefined;

    const bbox = minLat !== undefined && maxLat !== undefined && minLng !== undefined && maxLng !== undefined
      ? { minLat, maxLat, minLng, maxLng }
      : undefined;

    // Interactive clients use bounded, progressive reads; legacy callers may
    // still explicitly wait for a fully prepared viewport.
    if (req.query.progressive === '1') {
      const snapshot = await mapService.getViewportSnapshot(seasonId, bbox);
      res.setHeader('Cache-Control', 'no-store');
      return res.json({ ...snapshot, seasonId, serverTime: new Date().toISOString() });
    }
    const fronts = await mapService.getViewportFronts(seasonId, bbox);
    res.json({ fronts, seasonId, serverTime: new Date().toISOString() });
  } catch (err) {
    next(err);
  }
});

app.get('/fronts/:id', (req, res) => {
  const seasonId = (req.query.season_id as string) || 'e0000000-0000-0000-0000-000000000001';
  const front = mapService.getFrontDetails(req.params.id, seasonId);
  if (!front) return res.status(404).json({ error: 'Front not found' });
  res.json(front);
});

// ---------------- CLAIMS & CHALLENGES ----------------
app.get('/claims/eligibility', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  const frontId = req.query.front_id as string;
  const seasonId = req.query.season_id as string;

  if (!frontId || !seasonId) {
    return res.status(400).json({ error: 'front_id and season_id required' });
  }

  const eligibility = claimService.checkEligibility(userId, seasonId, frontId);
  res.json(eligibility);
});

app.post('/claims/challenge', requireAuth, (req, res, next) => {
  try {
    const userId = (req as any).user.userId;
    const { frontId, seasonId, action, deviceId } = req.body;
    if (!frontId || !seasonId || !action) {
      return res.status(400).json({ error: 'frontId, seasonId, action required' });
    }
    const challenge = claimService.createChallenge(userId, seasonId, frontId, action, deviceId);
    res.json(challenge);
  } catch (err: any) {
    res.status(409).json({
      status: 409,
      code: err.message || 'ELIGIBILITY_FAILED',
      title: 'İşlem Başlatılamadı',
      detail: err.message,
    });
  }
});

app.post('/claims', requireAuth, (req, res, next) => {
  try {
    const userId = (req as any).user.userId;
    const { challengeId, idempotencyKey, locationSamples, integrity } = req.body;

    if (!challengeId || !idempotencyKey || !locationSamples || !locationSamples.length) {
      return res.status(400).json({ error: 'Missing required claim parameters' });
    }

    const receipt = claimService.submitClaim({
      userId,
      challengeId,
      idempotencyKey,
      locationSamples,
      integrity: integrity || { platform: 'web' },
    });

    const statusCode = receipt.status === 'approved' ? 201 : 202;
    res.status(statusCode).json(receipt);
  } catch (err: any) {
    const code = err.message || 'CLAIM_FAILED';
    const statusMap: Record<string, number> = {
      LOCATION_UNRELIABLE: 422,
      OUTSIDE_PLAY_ZONE: 422,
      DAILY_QUOTA_REACHED: 409,
      ALREADY_CONTRIBUTED: 409,
      BATTLE_PROTECTED: 409,
      FRONT_SUSPENDED: 423,
      CHALLENGE_EXPIRED: 409,
    };
    const httpStatus = statusMap[code] || 400;

    res.status(httpStatus).json({
      status: httpStatus,
      code,
      title: 'İşaretleme Başarısız',
      detail: err.message,
      requestId: req.headers['x-request-id'] || crypto.randomUUID(),
    });
  }
});

// ---------------- BATTLES ----------------
app.get('/battles/:id', (req, res) => {
  const viewerUserId = (req.query.user_id as string) || undefined;
  const battle = battleService.getBattleDetails(req.params.id, viewerUserId);
  if (!battle) return res.status(404).json({ error: 'Battle not found' });
  res.json(battle);
});

// ---------------- RANKINGS (3 ELECTORAL METRICS) ----------------
app.get('/rankings', (req, res) => {
  const seasonId = (req.query.season_id as string) || 'e0000000-0000-0000-0000-000000000001';
  const regionId = (req.query.region_id as string) || 'a0000000-0000-0000-0000-000000000003'; // Alanya

  try {
    const rankings = rankingService.getRankings(seasonId, regionId);
    res.json(rankings);
  } catch (err: any) {
    res.status(400).json({ error: err.message });
  }
});

// ---------------- NOTIFICATIONS ----------------
app.get('/notifications', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  const list = Array.from(dbStore.notifications.values()).filter((n) => n.userId === userId);
  res.json({ notifications: list });
});

app.get('/me/activity', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  const seasonId = (req.query.season_id as string) || 'e0000000-0000-0000-0000-000000000001';
  const contributions = [...dbStore.battleContributions.values()]
    .filter(c => c.userId === userId && c.seasonId === seasonId)
    .sort((a, b) => b.submittedAt.getTime() - a.submittedAt.getTime());
  // Match the existing claim service's daily quota calculation.
  const today = new Date().toDateString();
  const distinct = new Set(contributions.filter(c => c.submittedAt.toDateString() === today).map(c => c.frontId));
  res.json({
    claims: contributions.slice(0, 50).map(c => ({
      id: c.id, frontId: c.frontId, battleId: c.battleId, status: c.status,
      frontNameI18n: dbStore.fronts.get(c.frontId)?.displayNameI18n ?? { tr: 'Cephe', en: 'Front' },
      createdAt: c.submittedAt.toISOString(),
    })),
    remainingDailyFronts: Math.max(0, 3 - distinct.size), dailyLimit: 3,
  });
});

// ---------------- PRIVACY ----------------
app.post('/privacy/export', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  res.json({
    requestId: crypto.randomUUID(),
    status: 'completed',
    message: 'Kişisel veri paketiniz hazırlandı.',
    data: {
      profile: dbStore.users.get(userId),
      memberships: Array.from(dbStore.leagueMemberships.values()).filter((m) => m.userId === userId),
      contributionsCount: Array.from(dbStore.battleContributions.values()).filter((c) => c.userId === userId).length,
    },
  });
});

app.post('/privacy/delete', requireAuth, (req, res) => {
  const userId = (req as any).user.userId;
  const user = dbStore.users.get(userId);
  if (user) {
    user.status = 'deleted';
    user.displayName = 'Anonim Kullanıcı';
    user.handle = `deleted_${userId.slice(0, 8)}`;
  }
  res.json({ success: true, message: 'Hesabınız ve kişisel verileriniz anonimleştirildi.' });
});

// ---------------- ADMIN ROUTES ----------------
app.get('/admin/overview', (req, res) => {
  const overview = adminService.getOverviewKpis();
  res.json(overview);
});

app.post('/admin/leagues', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const league = adminService.createLeague({
      ...req.body,
      adminUserId,
    });
    res.status(201).json(league);
  } catch (err) {
    next(err);
  }
});

app.post('/admin/leagues/:id/publish', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const league = adminService.publishLeague(req.params.id, adminUserId);
    res.json(league);
  } catch (err) {
    next(err);
  }
});

app.post('/admin/leagues/:id/pause', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const league = adminService.pauseLeague(req.params.id, adminUserId, req.body.reason || 'Admin pause');
    res.json(league);
  } catch (err) {
    next(err);
  }
});

app.post('/admin/fronts/:id/suspend', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const seasonId = req.body.seasonId || 'e0000000-0000-0000-0000-000000000001';
    const state = adminService.suspendFront(req.params.id, seasonId, adminUserId, req.body.reason || 'Safety issue');
    res.json(state);
  } catch (err) {
    next(err);
  }
});

app.post('/admin/fronts/:id/restore', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const seasonId = req.body.seasonId || 'e0000000-0000-0000-0000-000000000001';
    const state = adminService.restoreFront(req.params.id, seasonId, adminUserId);
    res.json(state);
  } catch (err) {
    next(err);
  }
});

app.post('/admin/battles/:id/settle', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const result = adminService.triggerSettlement(req.params.id, adminUserId);
    res.json(result);
  } catch (err) {
    next(err);
  }
});

app.get('/admin/reviews', (req, res) => {
  res.json({ cases: Array.from(dbStore.reviewCases.values()) });
});

app.post('/admin/reviews/:id/decision', requireAuth, (req, res, next) => {
  try {
    const adminUserId = (req as any).user.userId;
    const { decision, notes } = req.body;
    const updated = adminService.resolveReviewCase(req.params.id, decision, adminUserId, notes || 'Resolved');
    res.json(updated);
  } catch (err) {
    next(err);
  }
});

app.get('/admin/audit', (req, res) => {
  res.json({ logs: adminService.getAuditLogs() });
});

app.post('/admin/kill-switch', requireAuth, (req, res) => {
  const adminUserId = (req as any).user.userId;
  const { scope, reason } = req.body;
  const result = adminService.triggerKillSwitch(scope || 'all_claims', adminUserId, reason || 'Emergency stop');
  res.json(result);
});

// Error handling middleware
app.use((err: any, req: Request, res: Response, next: NextFunction) => {
  console.error('[API ERROR]', err);
  const status = err.statusCode || err.status || 500;
  res.status(status).json({
    status,
    code: err.code || 'INTERNAL_SERVER_ERROR',
    title: 'Sunucu Hatası',
    detail: err.message || 'Beklenmedik bir hata oluştu.',
    requestId: req.headers['x-request-id'] || crypto.randomUUID(),
  });
});

const PORT = process.env.PORT || 3001;
if (process.env.NODE_ENV !== 'test') {
  appReady.then(() => {
    app.listen(PORT, () => {
      console.log(`[CEPHELAND API] Server running on http://localhost:${PORT}`);
    });
  }).catch(error => {
    console.error('[CEPHELAND API] Başlangıçta cephe adları yüklenemedi:', error);
    process.exitCode = 1;
  });
}
