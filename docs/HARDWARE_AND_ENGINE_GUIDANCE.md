# Hardware And Engine Guidance

This file separates what should run on a modest laptop from what needs a stronger system.

## Current-System Strategy

Use the current machine for:

- Design docs.
- Simple prototypes.
- Small test maps.
- Data-driven systems.
- UI flows.
- Economy simulation.
- Basic save/load.
- Placeholder vehicle handling.

Avoid:

- Large open worlds.
- High-resolution terrain.
- Heavy lighting.
- Large texture libraries.
- Complex traffic.
- Multiplayer networking.
- Cinematic-quality asset imports.

## Strong-System Strategy

Use a stronger laptop or desktop for:

- Unreal Engine 5 production builds.
- Large-world editing.
- Advanced lighting.
- High-detail truck interiors.
- Complex physics.
- Traffic and AI simulation.
- Multiplayer testing.
- Asset baking.
- Build packaging.

## Engine Options

### Godot 4

Best for:

- Lightweight prototype.
- Fast iteration.
- Simple data-driven gameplay.
- Lower-spec development.
- Clean ownership of the codebase.

Tradeoffs:

- Less ready-made support for high-end vehicle simulation.
- Smaller ecosystem for AAA-scale open-world tools.
- More custom work for advanced mod pipelines and big streaming worlds.

### Unreal Engine 5

Best for:

- High-end production.
- Large landscapes.
- Realistic lighting.
- Marketplace assets.
- Vehicle and physics tooling.
- Better visual ceiling.

Tradeoffs:

- Heavier editor.
- Larger install and build footprint.
- Stronger hardware required for comfortable work.
- More complex project management.

Epic's current UE5 documentation recommends 32 GB RAM and at least 8 GB graphics RAM for development, with DirectX 12 recommended for most games. That makes UE5 a better target for the later heavy phase if the current laptop is modest.

### Unity

Best for:

- Broad platform support.
- Large asset ecosystem.
- Many vehicle-controller assets.
- Familiar C# workflow.

Tradeoffs:

- Licensing and ecosystem decisions should be reviewed before committing.
- Open-world trucking simulation still requires substantial custom engineering.

## Recommended Path

Use this sequence:

1. Prototype in Godot 4 or another lightweight setup.
2. Keep all core design and gameplay data portable.
3. Prove the loop with placeholders.
4. When stronger hardware is available, decide whether to stay in Godot or move to Unreal Engine 5.
5. Rebuild the world and asset pipeline only after the core game is fun.

## Suggested Later Hardware

Minimum comfortable heavy-production target:

- Windows 11 or modern Linux workstation.
- 8-core CPU or better.
- 32 GB RAM minimum.
- 64 GB RAM preferred.
- Dedicated GPU with 8 GB VRAM minimum.
- 12 GB to 16 GB VRAM preferred.
- 1 TB SSD minimum.
- 2 TB SSD preferred.

For serious UE5 production, more CPU cores, more RAM, and more VRAM will directly improve compile times, editor responsiveness, shader work, and asset handling.

## Source Notes

- Unreal Engine 5.7 hardware guidance lists 32 GB RAM and 8 GB or more graphics RAM as recommended development specs, and notes DirectX 12 is recommended for most games.
- Godot's documentation notes exported project requirements vary heavily by scope and renderer, and recommends testing on low-end hardware plus offering graphics options.
- Steam Workshop's official implementation flow depends on Steamworks configuration, ISteamUGC, workshop item creation, content folder upload, preview images, metadata, and progress tracking.

