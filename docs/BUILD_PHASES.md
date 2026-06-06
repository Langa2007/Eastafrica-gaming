# Build Phases

This plan is based on the current laptop:

- RAM: 16 GB
- Storage: 512 GB SSD
- Best use: design, documentation, gameplay prototype, simple 3D scenes, lightweight systems, UI, data files, economy simulation, and early playtesting.
- Avoid for now: high-end open-world production, massive assets, Unreal Engine 5 heavy workflows, advanced traffic simulation, multiplayer backend, large terrain streaming, cinematic lighting, and full mod SDK tooling.

The goal is to build useful foundations now, then carry them into a stronger development environment later.

## Recommended Overall Stack

### Current Laptop Stack

- Engine: Godot 4.x
- Language: GDScript first, C# only if needed later
- Data format: JSON for trucks, cargo, routes, economy, and progression
- Version control: Git
- Art tools: Blender for simple placeholder models, Krita or GIMP for simple textures
- Audio: Audacity or similar lightweight editor
- Documentation: Markdown
- Target build: Windows desktop prototype

### Later Heavy Production Stack

- Engine option A: Unreal Engine 5.x for high-end visuals and large-world tooling
- Engine option B: Continue Godot if the prototype grows well and the team prefers full control
- Language: C++ and Blueprints for Unreal, or GDScript/C# for Godot
- DCC tools: Blender, Substance Painter or ArmorPaint, Houdini optional, World Machine or Gaea optional
- Source control: Git LFS for small teams, Perforce for serious large-asset production
- Backend: PlayFab, Nakama, custom Node.js/Go service, or Epic Online Services depending on multiplayer direction
- Distribution: Steam
- Modding: local mod folder first, Steam Workshop later

## Phase 0: Foundation And Planning

### Can Be Done On This Laptop

Yes.

### Goal

Create the project foundation before touching heavy assets or complex simulation.

### Deliverables

- Game design pillars.
- Build phases.
- Technical architecture.
- Route and cargo planning.
- First prototype backlog.
- Folder structure.
- Naming conventions.

### Tech Stack

- Markdown
- Git
- JSON

### Required Dependencies

- Git
- VS Code or any code editor
- Optional: Obsidian or another Markdown viewer

### Output

- Clear documentation.
- First playable milestone defined.
- No engine lock-in beyond prototype recommendation.

## Phase 1: Basic Driving Prototype

### Can Be Done On This Laptop

Yes.

### Goal

Make a truck move, steer, stop, reverse, and reset in a small test area.

### Scope

- One generic medium truck.
- One flat test road.
- Camera follow.
- Keyboard controls.
- Basic speed display.
- Reset vehicle button.

### Tech Stack

- Godot 4.x
- GDScript
- Placeholder 3D primitives or simple Blender model

### Required Dependencies

- Godot 4.x
- Git
- VS Code or Godot built-in script editor
- Optional: Blender

### Keep It Lightweight

- Use simple shapes before imported models.
- Use simple materials.
- Avoid large textures.
- Avoid realistic suspension at this stage.

### Done When

- [x] Godot 4.x is available for the prototype.
- [x] The prototype project exists.
- [x] One simple placeholder truck exists.
- [x] A flat road and test area exist.
- [x] Keyboard steering, throttle, brake, and reverse exist.
- [x] A reset vehicle control exists.
- [x] A follow camera exists.
- [x] A basic speed display exists.
- [ ] The truck can drive around a test area for five minutes without breaking the session.

## Phase 2: First Delivery Loop

### Can Be Done On This Laptop

Yes.

### Goal

Turn driving into a playable job.

### Scope

- Depot start point.
- Delivery destination.
- Cargo pickup trigger.
- Cargo delivery trigger.
- Job board UI.
- Payment after delivery.
- Delivery result screen.

### Tech Stack

- Godot 4.x
- GDScript
- JSON data files
- Godot UI system

### Required Dependencies

- Godot 4.x
- Git
- VS Code or Godot editor

### Data Files

Suggested files:

- `data/routes.json`
- `data/cargo.json`
- `data/economy.json`

### Done When

- [x] A player can choose a job, drive to the destination, deliver cargo, earn money, and return to the job board.

## Phase 3: Light Route Variety

### Can Be Done On This Laptop

Yes, if the map stays small.

### Goal

Make routes feel different without building a huge open world.

### Scope

- [x] Paved route.
- [x] Dirt route.
- [x] Hill section.
- [x] Tight city-style turn.
- [x] Simple roadside props.
- [x] Basic route arrow or minimap placeholder.

### Tech Stack

- Godot 4.x
- GDScript
- Blender for simple props
- Low-resolution textures

### Required Dependencies

- Godot 4.x
- Blender
- Git
- Optional: GIMP, Krita, or Paint.NET

### Asset Rules

- Keep models low-poly.
- Keep textures small, such as 512 px or 1024 px.
- Reuse props.
- Avoid dense city scenes.
- Avoid real-world map imports for now.

### Done When

- [x] The player can feel the difference between paved, rough, and hilly routes.

### Build Notes

- Added a small route-variety environment to the Godot prototype with paved, dirt, hill, and tight-turn sections.
- Added lightweight roadside props, curb markers, route labels, and ground arrows.
- Added HUD route guidance plus current surface feedback.
- Added basic handling differences for paved road, dirt route, hill climb, and tight city turn.

## Phase 4: Basic Trucking Pressure

### Can Be Done On This Laptop

Yes.

### Goal

Add decision pressure without advanced simulation.

### Scope

- Fuel meter.
- Fuel drain by distance or throttle.
- Fatigue meter.
- Cargo condition.
- Damage penalty.
- Late delivery penalty.
- Simple repair cost.

### Tech Stack

- Godot 4.x
- GDScript
- JSON tuning files

### Required Dependencies

- Godot 4.x
- Git

### Suggested Systems

- `FuelSystem`
- `FatigueSystem`
- `CargoConditionSystem`
- `DeliveryScoringSystem`
- `SimpleEconomySystem`

### Done When

- Bad driving and poor planning affect payout, but the game still feels fair.

## Phase 5: Basic Business Layer

### Can Be Done On This Laptop

Yes.

### Goal

Give the player a reason to keep playing beyond one delivery.

### Scope

- Player balance.
- Owned truck record.
- Garage placeholder.
- Maintenance placeholder.
- Contract list.
- Simple company progression.
- Save/load.

### Tech Stack

- Godot 4.x
- GDScript
- JSON save files

### Required Dependencies

- Godot 4.x
- Git

### Data Files

Suggested files:

- `data/trucks.json`
- `data/contracts.json`
- `data/player_profile.json`
- `data/garage.json`

### Done When

- A player can complete multiple jobs, earn money, and see persistent progress.

## Phase 6: Prototype Polish

### Can Be Done On This Laptop

Yes, with discipline.

### Goal

Make the prototype readable, stable, and pleasant enough for outside feedback.

### Scope

- Cleaner HUD.
- Better job board.
- Basic settings menu.
- Basic audio.
- Simple environment identity.
- Loading screen.
- Save slot.
- Playtest build.

### Tech Stack

- Godot 4.x
- GDScript
- Godot UI
- Audacity or similar for audio editing
- Blender for light prop cleanup

### Required Dependencies

- Godot 4.x
- Git
- Blender
- Audacity
- Optional: GIMP or Krita

### Performance Limits

- Keep the prototype under a few GB.
- Keep imported assets small.
- Avoid real-time global illumination experiments.
- Avoid heavy traffic simulation.
- Test on battery and plugged-in performance.

### Done When

- Someone else can play the prototype without you explaining every step.

## Phase 7: Vertical Slice Preparation

### Can Be Done On This Laptop

Partly.

### Goal

Prepare for the move from prototype to a more serious vertical slice.

### Can Do Here

- Clean up code structure.
- Improve data schemas.
- Document vehicle tuning.
- Document route requirements.
- Create asset lists.
- Create UI wireframes.
- Define the first polished corridor.
- Decide whether to stay in Godot or move to Unreal.

### Should Wait For Stronger System

- High-detail truck model.
- Large terrain.
- Dense traffic.
- Heavy lighting.
- Large imported map sections.
- Advanced physics.

### Tech Stack

- Godot 4.x for prototype cleanup
- Markdown
- JSON
- Blender for simple planning models

### Required Dependencies

- Godot 4.x
- Git
- Blender
- Optional: spreadsheet tool for route and economy balancing

### Done When

- The project has a clear handoff path into a stronger production environment.

## Phase 8: High-Quality Vertical Slice

### Can Be Done On This Laptop

Not recommended.

### Required Environment

Use a stronger laptop or desktop.

Recommended minimum:

- 32 GB RAM
- Dedicated GPU with 8 GB VRAM
- 1 TB SSD
- 8-core CPU

Preferred:

- 64 GB RAM
- Dedicated GPU with 12 GB to 16 GB VRAM
- 2 TB SSD
- 12-core or better CPU

### Goal

Create a polished 20-minute experience that shows the final promise of the game.

### Scope

- One beautiful East Africa-inspired corridor.
- Better truck model and trailer.
- Improved handling.
- Basic AI traffic.
- Better road surfaces.
- Weather placeholder.
- Time-of-day pass.
- Better audio.
- Polished UI.
- Save/load.

### Tech Stack

Option A:

- Unreal Engine 5.x
- Blueprints
- C++ where needed
- Blender
- Quixel Megascans where licensing and project direction allow

Option B:

- Godot 4.x
- GDScript/C#
- Blender
- Custom optimized asset pipeline

### Required Dependencies

If using Unreal:

- Epic Games Launcher
- Unreal Engine 5.x
- Visual Studio 2022
- Blender
- Git LFS or Perforce
- Optional: Rider
- Optional: Substance Painter or ArmorPaint

If staying with Godot:

- Godot 4.x
- Blender
- Git LFS if assets grow
- GIMP, Krita, or Substance/ArmorPaint

### Done When

- A tester can play for 20 minutes and immediately understand why this game is different from Euro Truck Simulator 2 or American Truck Simulator.

## Phase 9: Regional Alpha

### Can Be Done On This Laptop

No.

### Required Environment

Strong development machine plus better storage discipline.

Recommended:

- 64 GB RAM
- Dedicated GPU with 12 GB to 16 GB VRAM
- 2 TB SSD
- Reliable backup drive or cloud backup
- Git LFS or Perforce

### Goal

Build the first reduced-scale East Africa region.

### Scope

- Nairobi
- Mombasa
- Kampala
- Kigali
- Dar es Salaam
- Multiple cargo categories
- Multiple truck types
- Fleet management
- AI drivers
- Maintenance
- Weather
- Time of day
- Basic border crossings
- Basic traffic

### Tech Stack

- Unreal Engine 5.x or mature Godot production branch
- C++/Blueprints for Unreal or GDScript/C# for Godot
- Blender
- Terrain tool such as Gaea, World Machine, or engine-native landscape tools
- Git LFS or Perforce

### Required Dependencies

- Game engine
- IDE
- Blender
- Terrain tool
- Texture tool
- Audio tool
- Source control with large-file support
- Automated build scripts

### Done When

- The player can run a small trucking company for several hours across a believable regional network.

## Phase 10: Multiplayer And Online Economy

### Can Be Done On This Laptop

No, except for planning and small local experiments.

### Required Environment

Strong development machine plus server/testing setup.

### Goal

Add convoy play and shared trucking economy after single-player is already strong.

### Scope

- Convoy sessions.
- Shared garage hubs.
- CB radio-style communication.
- Relay cargo economy.
- Seasonal events.
- Server-authoritative contract validation.

### Tech Stack

Options:

- Epic Online Services
- Steam Networking
- Nakama
- PlayFab
- Custom Node.js, Go, or C# backend

### Required Dependencies

- Networking SDK
- Backend service or local server
- Database, such as PostgreSQL
- Redis optional for queues/session state
- Docker for local backend development
- Steamworks SDK if targeting Steam multiplayer features

### Done When

- Multiple players can complete a convoy delivery reliably without corrupting economy data.

## Phase 11: Modding And Steam Workshop

### Can Be Done On This Laptop

Only the early local mod-folder design can be done here.

### Goal

Let the community add trucks, skins, cargo, routes, and eventually map content.

### Scope

- Local mod folder.
- Data validation.
- Skin loading.
- Cargo packs.
- Route packs.
- External editor or in-game editor.
- Steam Workshop upload/download.

### Tech Stack

- Engine mod loader
- JSON or another structured manifest format
- Steamworks SDK
- ISteamUGC API
- Optional separate mod publishing tool

### Required Dependencies

- Steamworks partner access
- Steamworks SDK
- App ID
- Steam Cloud configuration
- ISteamUGC enabled
- Mod validation tools
- Build pipeline for packaging mods

### Done When

- A user can install a community-created truck skin or route pack without manually editing game files.

## Phase 12: Release Production

### Can Be Done On This Laptop

No.

### Required Environment

Production workstation, test machines, and release infrastructure.

### Goal

Prepare the game for public release.

### Scope

- Optimization.
- Graphics settings.
- Controller and wheel support.
- Accessibility settings.
- Localization.
- Crash reporting.
- QA builds.
- Steam store setup.
- Trailer capture.
- Demo build.
- Community testing.

### Tech Stack

- Final chosen engine
- Steamworks SDK
- Crash reporting tool
- Build automation
- Analytics tool
- Localization pipeline

### Required Dependencies

- Steamworks account and App ID
- Build machine
- Testing machines
- Controller and steering wheel hardware
- Capture software
- Backup and version-control storage

### Done When

- The game can be distributed, patched, tested, and supported reliably.

## Laptop Work Boundary

This laptop should focus on:

- Phases 0 to 6 fully.
- Phase 7 partly.
- Planning only for phases 8 to 12.

Do not force the laptop to become the final production machine. Its value is in building the brain and bones of the game: the loop, systems, data, design direction, and prototype feel.

## Immediate Next Phase

Start with Phase 1:

1. Install Godot 4.x.
2. Create the prototype project.
3. Add one simple truck.
4. Add a flat road.
5. Add steering, throttle, brake, reverse, and reset.
6. Add a follow camera.

Once the truck feels good enough, move to Phase 2 and build the first delivery loop.
