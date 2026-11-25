# ADR-003: Three Simultaneous Electoral & Territorial Metrics

## Status
Accepted — 2 November 2026

## Context
If a game ranks teams solely by the number of streets captured, a team holding 8 quiet side alleys appears superior to a team holding 2 vital commercial avenues where thousands of supporters gather. Blending these into a single arbitrary percentage damages explainability.

## Decision
Compute and present three simultaneous metrics side-by-side:
1. **Front Control Share (`front_control_share`):**
   `COUNT(owned_fronts of team) / total_playable_fronts * 100`
2. **Verified Player Support Share (`verified_support_share`):**
   `COUNT(DISTINCT season_voter where team_id=team) / total_verified_voters * 100`
   Each player is recorded in the city of their FIRST physical contribution.
3. **Weighted Control Share (`weighted_control_share`):**
   `SUM(front_weight of owned fronts) / SUM(all playable front weights) * 100`
   Where weights are frozen at season start between 1.0 and 5.0.
