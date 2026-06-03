# Production Roadmap

This roadmap separates what can be built now from what should wait for a stronger system.

## Phase 1: Lightweight Prototype

Target: Current machine.

Objective:

- Prove the core driving and delivery loop.

Features:

- One test truck.
- Small map.
- Job board.
- Fuel.
- Cargo condition.
- Money.
- Basic garage placeholder.

Success criteria:

- A player can complete repeated deliveries.
- Route difficulty is noticeable.
- The game has a clear reason to keep playing.

## Phase 2: Vertical Slice

Target: Better but not necessarily high-end machine.

Objective:

- Make a small section feel close to the final game.

Features:

- One polished corridor.
- Better truck model.
- Improved driving feel.
- Better road surfaces.
- Basic traffic.
- Weather placeholder.
- Audio pass.
- First real UI pass.
- Save/load.

Success criteria:

- A 20-minute play session feels coherent.
- The route has identity.
- Screenshots communicate the East African setting.

## Phase 3: Regional Alpha

Target: Strong laptop or desktop.

Objective:

- Build a playable East Africa region at reduced scale.

Features:

- Nairobi, Mombasa, Kampala, Kigali, Dar es Salaam as regional nodes.
- Multiple cargo categories.
- Multiple truck types.
- Fleet management.
- AI drivers.
- Maintenance.
- Time of day.
- Weather.
- Traffic.
- Basic border crossing gameplay.

Success criteria:

- The player can run a transport company for several hours.
- The economy supports progression.
- The world has enough variety to justify expansion.

## Phase 4: Production Beta

Target: Strong development workstation.

Objective:

- Prepare for public release.

Features:

- Performance optimization.
- Wheel and controller support.
- Graphics settings.
- Accessibility settings.
- Soundtrack and radio-style audio.
- Polished UI.
- Bug reporting.
- Mod loading.
- Steam store pipeline.
- Localization plan.

Success criteria:

- Stable builds.
- Good performance across target PC tiers.
- External testers understand the game without developer explanation.

## Phase 5: Launch And Expansion

Target: Release-ready team and infrastructure.

Objective:

- Launch the base game and expand through map DLC and cosmetics.

Base game:

- East Africa core.
- Single-player business progression.
- Mod support.

Post-launch expansions:

- West Africa map pack.
- Southeast Asia map pack.
- Special cargo pack.
- Interior customization pack.
- Community-made route support.

## Monetization Framework

Recommended model:

- Affordable base game.
- Paid regional map DLC.
- Cosmetic truck skins and interior decor.
- No pay-to-win.
- No gameplay advantage microtransactions.

## Multiplayer Roadmap

Do not build multiplayer first.

Add in this order:

1. Local ghost or replay data.
2. Async company events.
3. Convoy sessions.
4. Shared garage hubs.
5. Relay cargo economy.
6. Live seasonal events.

The standout multiplayer idea is relay trucking: one player carries cargo through their known region, hands it off at a hub, and another player continues the route.

## Modding Roadmap

Start mod-friendly early, but do not build a full SDK early.

Order:

1. Data files for trucks, cargo, and routes.
2. Local mod folder.
3. Skin loading.
4. Route pack loading.
5. External editor.
6. Steam Workshop.

Steam Workshop can later use Valve's official ISteamUGC flow, where the game or a separate editing tool creates workshop items, uploads content folders and preview images, and tracks upload progress through the Steamworks API.

