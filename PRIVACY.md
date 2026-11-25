# Privacy and data handling

This document describes the current demonstration code. It is not a published service privacy notice or a certification of regulatory compliance. Deployment-specific notices, retention schedules and legal review remain necessary before collecting real player data.

## Application data

The API keeps demonstration profiles, season memberships, front ownership, contribution records, battles and administrative audit entries in memory. Restarting the process rebuilds the seeded game state. Geographic source caches and assigned front names are stored separately on disk; they are not a persistence layer for player accounts or battle progress.

The mobile demonstration does not continuously collect GPS data. Its contribution flow submits a simulated sample at the selected front's center. The intended verified-presence game requires a separate implementation of permission handling, real location sampling, evidence validation and suitable retention controls.

## External map and search services

Street tiles are requested by the browser from OpenStreetMap's tile service. The optional imagery layer requests tiles from Esri. These providers receive ordinary network request information and tile coordinates associated with the viewed area.

An explicit place search is sent to the API and then to the configured Photon-compatible service. Query results are cached in memory. Road and place data for areas outside the prepared bundle may be requested from the configured Overpass-compatible services. Their requests describe map areas, not player identity. Configure the providers and review their terms before operating a public service.

The source datasets contain public geographic features and business/place names. A place appearing on the game map does not imply its participation in the game or a player's physical presence there.

## Account controls in the demonstration

`POST /privacy/export` returns the authenticated profile, memberships and a contribution count. It is not a complete production portability archive.

`POST /privacy/delete` marks the in-memory account as deleted and replaces its display name and handle. This route is a demonstration of the user flow. It does not establish comprehensive erasure, invalidate every issued token, or remove every related historical record. The worker does not currently perform an automated location-evidence purge.

## Deployment requirements

A deployed service must define which records it actually stores, why it needs them, who can access them, how long they are kept and how deletion propagates to databases, backups and third-party systems. Avoid collecting location evidence until those controls and the accompanying user-facing notice are implemented.

For implementation questions, use the repository issue tracker without posting personal data. For sensitive reports, follow [SECURITY.md](SECURITY.md).
