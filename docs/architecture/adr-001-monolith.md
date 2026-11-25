# ADR-001: Modular Monolith Architecture

## Status
Accepted — 2 November 2026

## Context
Cepheland requires low-latency geospatial queries, atomic battle settlements, state machine consistency, and rate-limiting for claims across multiple leagues. Premature microservices distribution would introduce distributed transaction overhead (two-phase commit) and latency risks during high-contention street battles.

## Decision
Adopt a modular monolith architecture built around a single monorepo (`pnpm` workspaces + Turborepo):
- Shared pure rule engine (`packages/game-rules`)
- Shared contracts & OpenAPI schema (`packages/contracts`)
- Shared geospatial utilities (`packages/geo`)
- Shared design tokens & brand assets (`packages/ui-tokens`)
- Express/NestJS API service (`apps/api`)
- Asynchronous settlement & purge worker (`apps/worker`)
- Admin Operations Web Application (`apps/admin`)
- Mobile Application (`apps/mobile`)
- Investor Presentation Suite (`apps/showcase`)

## Consequences
- Single atomic database transaction boundary for settlements and voter registration.
- Instant local and test execution without distributed network bottlenecks.
