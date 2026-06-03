# Technical Architecture

This architecture is designed so the current lightweight prototype can grow into a larger simulator later.

## Architecture Principles

- Data-driven where practical.
- Prototype first, realism second.
- Keep gameplay systems independent from graphics quality.
- Keep route, cargo, truck, and economy data editable without rewriting code.
- Avoid licensed brands or real trademarks until the business side is ready.

## Core Modules

### 1. Vehicle Module

Responsibilities:

- Truck movement.
- Engine response.
- Braking.
- Steering.
- Suspension approximation.
- Damage events.
- Fuel consumption hooks.

Prototype version:

- One generic truck.
- Simple physics.
- Tunable values.

Production version:

- Multiple truck classes.
- Engine torque curves.
- Gearbox simulation.
- Suspension tuning.
- Tire behavior.
- Interior controls.
- Trailer coupling.

### 2. Cargo Module

Responsibilities:

- Cargo definition.
- Weight.
- Fragility.
- Payment rules.
- Damage penalties.
- Special handling rules.

Prototype version:

- A few cargo types with simple numbers.

Production version:

- Liquid slosh.
- Fragile load stability.
- Oversized cargo.
- Refrigerated cargo.
- Hazardous cargo rules.
- Border paperwork requirements.

### 3. Route Module

Responsibilities:

- Depot and destination data.
- Route difficulty.
- Distance estimate.
- Road surface.
- Weather risk.
- Border requirements.

Prototype version:

- Hand-authored small routes.

Production version:

- Region-scale route graph.
- Streaming map sections.
- Dynamic events.
- Road closures.
- Seasonal conditions.

### 4. Economy Module

Responsibilities:

- Player balance.
- Contract generation.
- Payout calculation.
- Fuel cost.
- Repair cost.
- Fleet ownership.
- Garage progression.

Prototype version:

- Static jobs and simple rewards.

Production version:

- Regional supply and demand.
- AI driver earnings.
- Fleet maintenance.
- Insurance.
- Loan system.
- Company reputation.

### 5. World Module

Responsibilities:

- Map loading.
- Time of day.
- Weather.
- Road conditions.
- Traffic spawning.
- Points of interest.

Prototype version:

- One small test map.
- Static lighting.
- No traffic or very simple traffic.

Production version:

- World partitioning or streaming.
- Dynamic weather.
- AI traffic.
- Pedestrian zones where appropriate.
- Border posts and weigh stations.

### 6. UI Module

Responsibilities:

- Menus.
- Job board.
- Driving HUD.
- Garage screens.
- Company screens.
- Settings.

Prototype version:

- Basic functional UI.

Production version:

- Controller support.
- Wheel support.
- Accessibility options.
- Full graphics settings.
- Mod browser.

### 7. Save Module

Responsibilities:

- Player profile.
- Money.
- Owned trucks.
- Completed jobs.
- Active route.
- Settings.

Prototype version:

- Local JSON save file.

Production version:

- Versioned save schema.
- Backup saves.
- Steam Cloud support.

## Data Files

Use plain readable data formats early.

Suggested prototype files:

- `data/trucks.json`
- `data/cargo.json`
- `data/routes.json`
- `data/economy.json`

Example truck fields:

```json
{
  "id": "generic_box_truck",
  "displayName": "Generic Box Truck",
  "massKg": 8200,
  "maxSpeedKph": 110,
  "fuelCapacityLiters": 280,
  "fuelUsePerKm": 0.32,
  "durability": 100
}
```

Example cargo fields:

```json
{
  "id": "fragile_goods",
  "displayName": "Fragile Goods",
  "weightKg": 4000,
  "basePayout": 1200,
  "fragility": 0.85,
  "latePenaltyRate": 0.2
}
```

Example route fields:

```json
{
  "id": "nairobi_industrial_short",
  "displayName": "Nairobi Industrial Delivery",
  "start": "nairobi_depot",
  "destination": "industrial_yard",
  "distanceKm": 14,
  "roadDifficulty": 0.25,
  "surface": "paved",
  "borderCrossing": false
}
```

## Repository Structure

Suggested structure:

```text
Gaming/
  README.md
  docs/
  prototype/
  data/
  assets/
    placeholder/
    source/
  research/
  builds/
```

## Later Production Architecture

When moving to a stronger machine, expect a more serious layout:

```text
GameProject/
  Source/
  Content/
  Config/
  Plugins/
  Tools/
  ModSDK/
  RawAssets/
  Documentation/
```

## Risk Controls

Biggest technical risks:

- Open-world scope grows too fast.
- Vehicle physics consumes months before the game is fun.
- Multiplayer starts too early.
- Real map accuracy becomes a blocker.
- Art quality expectations exceed available hardware.

Controls:

- One playable delivery loop before any large map.
- One truck before many trucks.
- One small route before a region.
- Data-driven definitions before mod SDK.
- Offline single-player before multiplayer.

