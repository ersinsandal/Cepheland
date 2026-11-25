/**
 * Front & Battle State Machines
 * Specified in Blueprint Section 05.1 and Section 05.7
 */

export type FrontStatus = 'neutral' | 'owned' | 'contested' | 'protected' | 'suspended' | 'archived';

export type BattleStatus =
  | 'proposed'
  | 'active'
  | 'paused'
  | 'settling'
  | 'under_review'
  | 'finalized'
  | 'cancelled'
  | 'expired';

export interface FrontTransitionContext {
  currentStatus: FrontStatus;
  protectionUntil?: Date | string | null;
  hasActiveBattle: boolean;
  isSuspendedSafety: boolean;
}

export function canStartAttack(front: {
  status: FrontStatus;
  ownerTeamId: string | null;
  protectionUntil?: Date | string | null;
  cooldownUntil?: Date | string | null;
  now?: Date;
}): { allowed: boolean; reason?: string } {
  const currentTime = front.now ? front.now.getTime() : Date.now();

  if (front.status === 'suspended') {
    return { allowed: false, reason: 'FRONT_SUSPENDED' };
  }

  if (front.status === 'contested') {
    return { allowed: false, reason: 'BATTLE_ALREADY_ACTIVE' };
  }

  if (front.protectionUntil) {
    const protTime = new Date(front.protectionUntil).getTime();
    if (protTime > currentTime) {
      return { allowed: false, reason: 'BATTLE_PROTECTED' };
    }
  }

  if (front.cooldownUntil) {
    const coolTime = new Date(front.cooldownUntil).getTime();
    if (coolTime > currentTime) {
      return { allowed: false, reason: 'ATTACK_COOLDOWN_ACTIVE' };
    }
  }

  return { allowed: true };
}

export function validateDailyContributionLimit(
  distinctFrontCountToday: number,
  maxDailyFronts: number = 3
): { allowed: boolean; remaining: number } {
  if (distinctFrontCountToday >= maxDailyFronts) {
    return { allowed: false, remaining: 0 };
  }
  return { allowed: true, remaining: maxDailyFronts - distinctFrontCountToday };
}

export function isAccountAgeEligible(
  accountCreatedAt: Date | string,
  minAgeHours: number = 24,
  now?: Date
): boolean {
  const currentTime = now ? now.getTime() : Date.now();
  const createdTime = new Date(accountCreatedAt).getTime();
  const diffHours = (currentTime - createdTime) / (1000 * 60 * 60);
  return diffHours >= minAgeHours;
}
