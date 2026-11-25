import jwt from 'jsonwebtoken';
import { dbStore, UserRecord } from '../db/store.js';

const JWT_SECRET = process.env.JWT_SECRET || 'dev_jwt_signing_secret_do_not_use_in_prod_32_bytes_min!';

export interface TokenPayload {
  userId: string;
  handle: string;
  role?: string;
}

export class AuthService {
  private otpStore = new Map<string, { code: string; expiresAt: number }>();

  async startOtp(identifier: string, channel: 'phone' | 'email'): Promise<{ success: boolean; message: string }> {
    // In dev / demo mode, standard code is 123456
    const code = '123456';
    this.otpStore.set(identifier, {
      code,
      expiresAt: Date.now() + 5 * 60 * 1000, // 5 min TTL
    });
    return {
      success: true,
      message: 'Doğrulama kodu gönderildi (Geliştirici/Demo Kodu: 123456)',
    };
  }

  async verifyOtp(identifier: string, code: string): Promise<{
    accessToken: string;
    refreshToken: string;
    expiresIn: number;
    user: UserRecord;
  }> {
    const entry = this.otpStore.get(identifier);
    if (!entry || entry.code !== code || entry.expiresAt < Date.now()) {
      // Allow 123456 fallback in demo mode
      if (code !== '123456') {
        throw new Error('INVALID_OTP');
      }
    }

    // Find or create user
    let user: UserRecord | undefined;
    for (const u of dbStore.users.values()) {
      if (u.handle === identifier || u.id === identifier) {
        user = u;
        break;
      }
    }

    if (!user) {
      const newId = crypto.randomUUID();
      const handle = identifier.includes('@')
        ? identifier.split('@')[0].replace(/[^a-zA-Z0-9_]/g, '_')
        : `user_${Math.floor(1000 + Math.random() * 9000)}`;

      user = {
        id: newId,
        handle,
        displayName: handle,
        locale: 'tr',
        status: 'active',
        age18ConfirmedAt: new Date(),
        termsVersion: 'v1.0',
        privacyVersion: 'v1.0',
        createdAt: new Date(),
      };
      dbStore.users.set(newId, user);
    }

    const admin = dbStore.adminUsers.get(user.id);
    const tokenPayload: TokenPayload = {
      userId: user.id,
      handle: user.handle,
      role: admin ? admin.role : undefined,
    };

    const accessToken = jwt.sign(tokenPayload, JWT_SECRET, { expiresIn: '2h' });
    const refreshToken = jwt.sign({ userId: user.id }, JWT_SECRET, { expiresIn: '30d' });

    return {
      accessToken,
      refreshToken,
      expiresIn: 7200,
      user,
    };
  }

  verifyToken(token: string): TokenPayload {
    return jwt.verify(token, JWT_SECRET) as TokenPayload;
  }
}

export const authService = new AuthService();
