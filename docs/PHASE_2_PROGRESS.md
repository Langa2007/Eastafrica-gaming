# Phase 2 Progress

Phase 2 goal: turn the driving test into a playable delivery job.

## Checklist

- [x] Add JSON route data.
- [x] Add JSON cargo data.
- [x] Add JSON economy tuning.
- [x] Add a visible depot pickup zone.
- [x] Add a visible delivery destination zone.
- [x] Add a job board UI.
- [x] Add cargo pickup detection.
- [x] Add delivery completion detection.
- [x] Add payout and money display.
- [x] Add delivery result screen.
- [ ] Run a hands-on loop test in the Godot editor.

## Current Loop

1. Accept the Nairobi Depot to Industrial Yard job from the job board.
2. Pick up Dry Goods at the green depot marker.
3. Drive to the blue delivery marker.
4. Slow below 8 km/h inside the delivery zone.
5. Receive payment and return to the job board.

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
