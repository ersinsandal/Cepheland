# ADR-002: Geospatial Storage & Safe Play Zone Architecture

## Status
Accepted — 2 November 2026

## Context
Raw GPS coordinates fluctuate indoors and in high-density urban street corridors. Requiring players to physically stand in the middle of vehicular traffic is hazardous. Furthermore, continuous background GPS tracking violates KVKK / GDPR data minimization requirements.

## Decision
1. Spatial geometries are stored as EPSG:4326 PostGIS MultiPolygons.
2. Front polygons define virtual territory ownership, while separate designated `play_zones` represent safe, walkable public pedestrian areas (sidewalks, parks, public squares).
3. Foreground location sampling is only triggered during explicit "Takımım İçin İşaretle" action (maximum 30 seconds).
4. Raw GPS coordinates are never broadcast to competitors. They are verified against the play zone + 40m tolerance and purged within 24–72 hours.
