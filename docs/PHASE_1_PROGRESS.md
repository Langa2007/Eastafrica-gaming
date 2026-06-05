# Phase 1 Progress

Phase 1 goal: make a truck move, steer, stop, reverse, and reset in a small test area.

## Checklist

- [x] Install or provide Godot 4.x.
- [x] Create the Godot prototype project.
- [x] Add one simple placeholder truck.
- [x] Add a flat road and test area.
- [x] Add keyboard steering, throttle, brake, and reverse.
- [x] Add reset vehicle control.
- [x] Add a follow camera.
- [x] Add a basic speed display.
- [ ] Run a five-minute hands-on driving test without breaking the session.

## Current Controls

- `W` or Up Arrow: throttle.
- `S` or Down Arrow: brake, then reverse.
- `A` or Left Arrow: steer left.
- `D` or Right Arrow: steer right.
- `R`: reset truck to spawn point.

## Prototype Entry Point

Open this project in Godot:

```text
prototype/project.godot
```

Main scene:

```text
res://scenes/phase_1_driving_test.tscn
```

Godot CLI check:

```powershell
tools\godot-4.6.3\Godot_v4.6.3-stable_win64_console.exe --path prototype --headless --quit
```
