import dotenv from 'dotenv';
dotenv.config();

console.log('[CEPHELAND WORKER] Initializing background tasks and job queues...');

export class CephelandWorker {
  private intervalTimer: NodeJS.Timeout | null = null;

  start(intervalMs: number = 30000) {
    console.log(`[CEPHELAND WORKER] Running scheduled checks every ${intervalMs / 1000}s`);
    this.intervalTimer = setInterval(() => {
      this.runPeriodicSettlement();
      this.runPeriodicExpirations();
      this.runLocationEvidencePurge();
    }, intervalMs);
  }

  stop() {
    if (this.intervalTimer) {
      clearInterval(this.intervalTimer);
      this.intervalTimer = null;
    }
  }

  runPeriodicSettlement() {
    // In production with PostgreSQL/Redis, this queries DB through BullMQ.
    // For standalone execution, it monitors battles in store.
  }

  runPeriodicExpirations() {
    // Checks proposal timeouts and protection windows
  }

  runLocationEvidencePurge() {
    // Purges raw encrypted samples older than 72 hours
  }
}

export const worker = new CephelandWorker();

if (process.env.NODE_ENV !== 'test') {
  worker.start();
}
