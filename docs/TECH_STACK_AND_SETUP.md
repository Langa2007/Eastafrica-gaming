# Tech Stack And Setup

This file records what the project needs now, what should wait for stronger hardware, and how to clone the repository on another machine.

## Current Prototype Goal

The current machine should be used for Phases 1 to 6:

- Basic driving prototype.
- First delivery loop.
- Light route variety.
- Fuel, fatigue, cargo condition, and simple damage pressure.
- Basic business layer.
- Prototype polish and playtesting.

The priority is a playable loop, not final graphics.

## Languages

### Required Now

- GDScript: gameplay logic in Godot.
- JSON: truck, cargo, route, economy, profile, and save data.
- Markdown: design, planning, and technical documentation.

### Optional Later

- C#: optional Godot systems if a feature becomes easier to maintain in C#.
- C++: only if the project later moves to Unreal Engine or needs engine-level production systems.
- Blueprints: only if the project later moves to Unreal Engine.

## Lightweight Prototype Stack

Install these on the current machine:

- Git.
- Visual Studio Code.
- Godot 4.x.
- Blender.
- GIMP or Krita.
- Audacity.

Recommended prototype engine:

- Godot 4.x using GDScript.

Recommended data format:

- JSON files under `data/`.

Recommended target build:

- Windows desktop prototype.

## Current Machine Install Status

- Git is installed.
- Visual Studio Code is installed.
- Godot 4.6.3 is installed portably at `tools/godot-4.6.3/`.
- Blender 5.1.2 is installed through Windows Package Manager.
- Krita 5.3.2.1 is installed through Windows Package Manager.

Godot CLI check:

```powershell
tools\godot-4.6.3\Godot_v4.6.3-stable_win64_console.exe --version
```

Expected output:

```text
4.6.3.stable.official.7d41c59c4
```

## Manual Retry Items On This Machine

These are useful, but not blocking Phase 1:

- GIMP 3.2.4: download timed out during install.
- Audacity 3.7.7: download timed out during install.

Krita already covers the required lightweight image/texture editing role, so GIMP can wait. Audacity can also wait until the prototype needs audio work.

## Heavy Production Stack To Install Later

Install these only on a stronger development machine:

- Unreal Engine 5.x, if the team chooses Unreal after the prototype.
- Visual Studio 2022 or Rider, if using Unreal C++.
- Git LFS or Perforce for large assets.
- Substance Painter or ArmorPaint for production textures.
- Gaea or World Machine for large terrain work.
- Steamworks SDK after Steam partner setup.
- Backend tools such as Docker, PostgreSQL, Redis, Nakama, PlayFab, or custom services after single-player is strong.

Recommended serious production machine:

- 32 GB RAM minimum, 64 GB preferred.
- Dedicated GPU with 8 GB VRAM minimum, 12 GB to 16 GB preferred.
- 1 TB SSD minimum, 2 TB preferred.
- 8-core CPU minimum, 12-core or better preferred.

## Clone Instructions For Another Machine

1. Install Git.
2. Open a terminal in the folder where the project should live.
3. Clone the repository:

```powershell
git clone https://github.com/Langa2007/Eastafrica-gaming.git
```

4. Enter the project folder:

```powershell
cd Eastafrica-gaming
```

5. Check the branch:

```powershell
git status --short --branch
```

Expected branch:

```text
main
```

6. Install the prototype tools:

```powershell
winget install --exact --id Git.Git --accept-package-agreements --accept-source-agreements
winget install --exact --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
winget install --exact --id GodotEngine.GodotEngine --accept-package-agreements --accept-source-agreements
winget install --exact --id BlenderFoundation.Blender --accept-package-agreements --accept-source-agreements
winget install --exact --id KDE.Krita --accept-package-agreements --accept-source-agreements
winget install --exact --id Audacity.Audacity --accept-package-agreements --accept-source-agreements
```

Optional image editor alternative:

```powershell
winget install --exact --id GIMP.GIMP --accept-package-agreements --accept-source-agreements
```

7. If `winget` cannot install Godot, use the official ZIP release and extract it under a local `tools/` folder.

8. Open the repository in VS Code:

```powershell
code .
```

9. Open the Godot project after `prototype/` has been created.

## Development Rules

- Build Phase 1 first.
- Keep systems data-driven where practical.
- Keep truck, cargo, route, and economy values in JSON files.
- Use placeholder models and textures until the gameplay loop is fun.
- Avoid licensed truck brands and real trademarks.
- Avoid huge maps, advanced traffic, multiplayer, Steam integration, and high-end graphics during the prototype.

## First Build Target

Start with:

- One generic box truck.
- One flat test road.
- Follow camera.
- Keyboard driving controls.
- Speed display.
- Reset button.

The first success condition is simple: the truck can drive, turn, stop, reverse, and recover from mistakes for five minutes without breaking the session.
