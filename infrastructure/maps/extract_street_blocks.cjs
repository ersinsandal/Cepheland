const fs = require('fs');
const xml = fs.readFileSync('infrastructure/maps/mahmutlar_raw.osm', 'utf8');

// 1. Parse all nodes: id -> [lng, lat]
const nodeRegex = /<node id="(\d+)"[^>]*?lat="([^"]+)"[^>]*?lon="([^"]+)"/g;
const nodes = new Map();
let m;
while ((m = nodeRegex.exec(xml)) !== null) {
  nodes.set(m[1], [parseFloat(m[3]), parseFloat(m[2])]); // [lng, lat]
}

// 2. Parse all vehicular highway ways
const wayRegex = /<way id="(\d+)"[\s\S]*?<\/way>/g;
const highways = [];
while ((m = wayRegex.exec(xml)) !== null) {
  const wayXml = m[0];
  const wayId = m[1];
  if (!wayXml.includes('k="highway"')) continue;

  const nameMatch = wayXml.match(/<tag k="name" v="([^"]+)"/);
  const name = nameMatch ? nameMatch[1] : 'Sokak';

  const hwMatch = wayXml.match(/<tag k="highway" v="([^"]+)"/);
  const hwType = hwMatch ? hwMatch[1] : 'road';

  if (['footway', 'steps', 'path', 'pedestrian', 'corridor', 'cycleway'].includes(hwType)) continue;

  const ndMatches = [...wayXml.matchAll(/<nd ref="(\d+)"/g)].map(x => x[1]);
  if (ndMatches.length >= 2) {
    highways.push({ id: wayId, name, hwType, nodes: ndMatches });
  }
}

// 3. Find intersection nodes: endpoints of ways OR nodes shared by multiple ways
const nodeUsage = new Map();
highways.forEach(hw => {
  hw.nodes.forEach((nd, idx) => {
    // Endpoints are always topological junctions
    const isEnd = (idx === 0 || idx === hw.nodes.length - 1);
    nodeUsage.set(nd, (nodeUsage.get(nd) || 0) + (isEnd ? 2 : 1));
  });
});

const junctions = new Set();
for (const [nd, count] of nodeUsage.entries()) {
  if (count >= 2) junctions.add(nd);
}
console.log('Total junctions:', junctions.size);

// 4. Split highways into street segments between junctions
const directedEdges = [];

highways.forEach(hw => {
  let segNodes = [hw.nodes[0]];
  for (let i = 1; i < hw.nodes.length; i++) {
    const nd = hw.nodes[i];
    segNodes.push(nd);
    if (junctions.has(nd) || i === hw.nodes.length - 1) {
      if (segNodes.length >= 2 && segNodes[0] !== segNodes[segNodes.length - 1]) {
        const u = segNodes[0];
        const v = segNodes[segNodes.length - 1];
        const coordsFwd = segNodes.map(id => nodes.get(id)).filter(Boolean);
        const coordsRev = [...coordsFwd].reverse();

        if (coordsFwd.length >= 2) {
          // Angle of departure u -> v
          const p0 = coordsFwd[0];
          const p1 = coordsFwd[1];
          const angFwd = Math.atan2(p1[1] - p0[1], p1[0] - p0[0]);

          // Angle of departure v -> u
          const q0 = coordsRev[0];
          const q1 = coordsRev[1];
          const angRev = Math.atan2(q1[1] - q0[1], q1[0] - q0[0]);

          const edgeIdFwd = `${hw.id}_${u}_${v}`;
          const edgeIdRev = `${hw.id}_${v}_${u}`;

          directedEdges.push({
            id: edgeIdFwd,
            from: u,
            to: v,
            name: hw.name,
            hwType: hw.hwType,
            coords: coordsFwd,
            angOut: angFwd,
            twinId: edgeIdRev
          });

          directedEdges.push({
            id: edgeIdRev,
            from: v,
            to: u,
            name: hw.name,
            hwType: hw.hwType,
            coords: coordsRev,
            angOut: angRev,
            twinId: edgeIdFwd
          });
        }
      }
      segNodes = [nd];
    }
  }
});

console.log('Total directed street edges:', directedEdges.length);

// 5. Group outgoing edges by junction and sort cyclically by angle
const adj = new Map();
directedEdges.forEach(e => {
  if (!adj.has(e.from)) adj.set(e.from, []);
  adj.get(e.from).push(e);
});

adj.forEach((edges, junc) => {
  edges.sort((a, b) => a.angOut - b.angOut);
});

// For each directed edge arriving at v, find next edge outgoing from v in CCW order
// Arriving edge arrives at angle angIn = atan2(v.y - pPrev.y, v.x - pPrev.x)
// Angle coming INTO v from the world: back angle is angIn + PI
const edgeMap = new Map();
directedEdges.forEach(e => edgeMap.set(e.id, e));

const nextEdge = new Map();
directedEdges.forEach(e => {
  const v = e.to;
  const outEdges = adj.get(v) || [];
  if (outEdges.length === 0) return;

  // Arrival angle of e at v
  const pPrev = e.coords[e.coords.length - 2];
  const pLast = e.coords[e.coords.length - 1];
  const incomingAngle = Math.atan2(pLast[1] - pPrev[1], pLast[0] - pPrev[0]);
  // The direction from v back along e is incomingAngle + PI
  let backAngle = incomingAngle + Math.PI;
  while (backAngle > Math.PI) backAngle -= 2 * Math.PI;
  while (backAngle < -Math.PI) backAngle += 2 * Math.PI;

  // We want the edge outgoing from v that turns most CLOCKWISE (or next in cyclic order)
  // Let's find index of the first outEdge whose angOut > backAngle
  let best = null;
  let minDiff = Infinity;
  for (const out of outEdges) {
    if (out.id === e.twinId && outEdges.length > 1) {
      // Avoid immediate U-turn if other options exist
    }
    let diff = out.angOut - backAngle;
    while (diff <= 0) diff += 2 * Math.PI;
    if (diff < minDiff) {
      minDiff = diff;
      best = out;
    }
  }
  if (!best && outEdges.length > 0) best = outEdges[0];
  nextEdge.set(e.id, best);
});

// 6. Trace faces (cycles)
const visited = new Set();
const faces = [];

directedEdges.forEach(startEdge => {
  if (visited.has(startEdge.id)) return;

  const cycleEdges = [];
  let curr = startEdge;
  let steps = 0;

  while (curr && !visited.has(curr.id) && steps < 100) {
    visited.add(curr.id);
    cycleEdges.push(curr);
    curr = nextEdge.get(curr.id);
    steps++;
    if (curr && curr.id === startEdge.id) break;
  }

  if (curr && curr.id === startEdge.id && cycleEdges.length >= 3) {
    // Valid closed face!
    // Construct polygon ring
    const ring = [];
    cycleEdges.forEach(e => {
      // Add all except last point to avoid duplicate with next edge
      for (let i = 0; i < e.coords.length - 1; i++) {
        ring.push(e.coords[i]);
      }
    });
    ring.push(ring[0]); // close polygon

    // Calculate signed area (Shoelace)
    let area = 0;
    for (let i = 0; i < ring.length - 1; i++) {
      area += (ring[i][0] * ring[i+1][1] - ring[i+1][0] * ring[i][1]);
    }
    area = area / 2;

    // Positive area in standard lng/lat is counter-clockwise (interior face)
    // Negative area is outer boundary (the infinite exterior)
    const streetNames = [...new Set(cycleEdges.map(e => e.name).filter(n => n && n !== 'Sokak'))];

    // Rough approximate area in m^2 (1 deg lat ~= 111km, 1 deg lng ~= 89km at lat 36.48)
    const areaM2 = Math.abs(area) * 111000 * 89000;

    // Filter reasonable city blocks (e.g. 1,000 m^2 to 80,000 m^2)
    if (areaM2 >= 800 && areaM2 <= 150000 && area > 0) {
      faces.push({
        edgesCount: cycleEdges.length,
        pointsCount: ring.length,
        areaM2: Math.round(areaM2),
        streetNames,
        ring
      });
    }
  }
});

console.log('Extracted valid city block faces:', faces.length);
faces.slice(0, 15).forEach((f, idx) => {
  console.log(`Block ${idx+1}: Area ${f.areaM2} m2, Surrounding Streets: [${f.streetNames.join(' | ')}], pts: ${f.pointsCount}`);
});
