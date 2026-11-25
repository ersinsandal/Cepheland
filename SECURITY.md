# Security

Cepheland currently provides a local demonstration environment. It is not a hardened public game service. Keep the API and administrative application on a trusted development machine until the controls below have been implemented and reviewed.

## Current implementation

- Authenticated player routes use signed JWTs. The signing key can be supplied through `JWT_SECRET`; the code includes a development fallback.
- Contributions require a server-issued challenge with an expiry, a user-scoped idempotency key, season membership and server-side quota checks.
- The geographic check uses the selected play-zone geometry, including excluded rings where present.
- Game rules and battle outcomes are evaluated by the API. Client-provided scores are not accepted as the result of a battle.
- Map queries and place searches have bounded concurrency, request deadlines and retry cooldowns. These controls protect external providers from unbounded work; they do not constitute general API abuse protection.

## Demonstration boundaries

The OTP flow accepts the demonstration code `123456`. The mobile exploration flow signs in as the seeded `ahmet_gs` account. The web contribution flow submits the selected front's center as a simulated location sample; it does not establish that a person visited the place. Device integrity fields are demonstration inputs, not verified Play Integrity or App Attest attestations.

Administrative endpoints do not consistently enforce authentication and role checks. CORS is permissive. There is no production-grade rate limiter, credential recovery system, refresh-token rotation or persistent token revocation. The in-memory store is shared only within the API process. The worker's scheduled methods are scaffolding; they do not enforce retention or settlement in the background.

Setting `NODE_ENV=production`, supplying database credentials or changing `DEMO_MODE` does not enable missing controls. `DEMO_MODE` is not a security boundary in this implementation.

## Reporting a vulnerability

Use the repository's **Security > Report a vulnerability** option if it is available. Otherwise open a minimal issue requesting a private reporting channel from [@ersinsandal](https://github.com/ersinsandal). Do not include tokens, personal data, exploit credentials or a working attack against a live system in a public issue.

Include the affected revision, reproduction conditions, expected impact and a minimal demonstration once a private channel has been agreed. No response-time commitment or bug-bounty program is currently published.

## Before a public deployment

Replace demonstration authentication and location inputs, enforce authorization on every administrative operation, add durable storage and transaction boundaries, validate device evidence, restrict network exposure and CORS, and establish operational monitoring and abuse limits. Verify retention, account deletion and token invalidation against the deployed data store. Review dependency updates and service-provider limits before exposing the application to real players.

Keep secrets outside the repository. `.env.example` is a configuration template; `.env` files, key files, generated caches and local handover notes are excluded from publication.
