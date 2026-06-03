# East Africa Truck Simulator Build Framework

This workspace is for designing and building a trucking simulation game focused first on East Africa, with room to expand into West Africa and Southeast Asia later.

The core opportunity is simple: Euro Truck Simulator 2 and American Truck Simulator dominate Europe and North America, but Africa and much of Asia remain underserved. This project should start small and playable, then grow toward a serious simulation when stronger hardware is available.

## What We Build Now

The current phase is a lightweight foundation:

- A clear game concept and design pillars.
- A small playable prototype.
- A simple route loop, starting with Nairobi to nearby delivery points.
- Basic truck movement, cargo delivery, fuel, fatigue, money, and route selection.
- Placeholder vehicles, roads, cities, terrain, UI, and audio.
- Documentation that keeps the future heavy build aligned.

Recommended current-engine path: **Godot 4** for lightweight prototyping, unless the target laptop can already comfortably run Unreal Engine 5.

## What We Shelf For Later

The heavy production phase should wait for a stronger laptop or workstation:

- Large open-world terrain.
- High-detail truck models and interiors.
- Advanced cargo physics.
- Realistic traffic and pedestrian AI.
- Weather, mud, road degradation, flooding, and night lighting.
- Convoy multiplayer and shared economy.
- Mod SDK, map editor, Steam Workshop integration, and DLC packaging.
- Photogrammetry, scanned assets, high-resolution materials, Nanite/Lumen-style rendering, or equivalent high-end tech.

## Start Here

Read these files in order:

1. [Game Design Pillars](docs/GAME_DESIGN_PILLARS.md)
2. [Basic Prototype Plan](docs/BASIC_PROTOTYPE_PLAN.md)
3. [Technical Architecture](docs/TECHNICAL_ARCHITECTURE.md)
4. [Production Roadmap](docs/PRODUCTION_ROADMAP.md)
5. [Hardware And Engine Guidance](docs/HARDWARE_AND_ENGINE_GUIDANCE.md)
6. [Build Phases](docs/BUILD_PHASES.md)

## First Prototype Target

The first milestone is not a full simulator. It is a proof that the idea feels good:

> Drive a truck from a Nairobi depot to a delivery point, manage fuel and fatigue, deliver cargo, earn money, and return to the route board for the next job.

If that loop is enjoyable with placeholder assets, the project has a real foundation.
