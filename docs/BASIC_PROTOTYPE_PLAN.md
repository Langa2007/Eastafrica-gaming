# Basic Prototype Plan

This is the part we can build now on a modest machine.

## Goal

Create a small playable trucking loop that proves the game idea works before investing in expensive assets, high-end rendering, or large-world systems.

## Recommended Prototype Scope

Build one compact map inspired by Nairobi and nearby logistics routes.

Prototype route examples:

- Nairobi depot to industrial delivery point.
- Nairobi depot to hilly outskirts.
- Nairobi depot to rough-road farm pickup.
- Short urban delivery with tight turning.

Use fictionalized layouts first. Real-world accuracy comes later.

## Engine Choice For Prototype

Use **Godot 4** if the current computer is modest. Godot has lower baseline exported-project requirements than a high-end Unreal workflow, and it is suitable for proving mechanics quickly.

Use **Unreal Engine 5** only if the current system has enough RAM, GPU memory, and storage to work comfortably.

The prototype should be engine-portable in design:

- Keep vehicle tuning data in readable config files.
- Keep cargo data separate from code.
- Keep route data separate from code.
- Keep business logic simple and documented.
- Avoid engine-specific assumptions in design docs.

## Prototype Milestones

### Milestone 0: Project Foundation

Deliverables:

- Project repository structure.
- Game design docs.
- Prototype backlog.
- Basic naming conventions.
- Placeholder asset policy.

Done when:

- A new contributor can understand the game in 15 minutes.
- The first implementation task is clear.

### Milestone 1: Driving Box

Deliverables:

- One test truck.
- Flat test road.
- Basic acceleration, braking, steering, reverse.
- Camera follow.
- Reset vehicle button.

Done when:

- The truck can drive, turn, stop, reverse, and recover from mistakes.

### Milestone 2: Delivery Loop

Deliverables:

- Depot start point.
- Delivery destination.
- Cargo pickup trigger.
- Cargo delivery trigger.
- Payment calculation.
- Simple job board UI.

Done when:

- The player can accept a job, complete it, and receive money.

### Milestone 3: Route Feel

Deliverables:

- A short paved route.
- A rough dirt route.
- A hill or slope section.
- Basic road signs.
- Basic minimap or route arrow.

Done when:

- Route choice affects driving feel.

### Milestone 4: Trucking Pressure

Deliverables:

- Fuel meter.
- Fatigue meter.
- Cargo condition.
- Repair cost after damage.
- Delivery rating.

Done when:

- Bad driving has consequences, but the game remains playable.

### Milestone 5: Business Layer Skeleton

Deliverables:

- Player balance.
- Truck ownership.
- Garage screen placeholder.
- Maintenance screen placeholder.
- Contract list with rewards and risk.

Done when:

- The player has a reason to complete multiple deliveries.

## Prototype Systems

### Vehicle Controller

Start simple:

- Acceleration.
- Braking.
- Steering.
- Reverse.
- Wheel friction approximation.
- Speed limit.
- Damage on hard impacts.

Do not begin with full physics realism. First make the truck feel readable and controllable.

### Cargo System

Initial cargo types:

- General goods.
- Fragile goods.
- Heavy load.
- Fuel tanker placeholder.

Initial cargo variables:

- Weight.
- Fragility.
- Base payment.
- Time pressure.
- Damage sensitivity.

### Route System

Each route should define:

- Start depot.
- Destination.
- Distance score.
- Road difficulty.
- Fuel cost estimate.
- Weather risk placeholder.
- Border requirement placeholder.

### Economy System

Initial economy variables:

- Player money.
- Contract payout.
- Fuel cost.
- Repair cost.
- Cargo damage penalty.
- Late delivery penalty.

Keep the economy readable first. Balance can come later.

### UI Screens

Prototype UI:

- Main menu.
- Job board.
- Driving HUD.
- Delivery result screen.
- Garage placeholder.

HUD should show:

- Speed.
- Fuel.
- Fatigue.
- Cargo condition.
- Current objective.

## What Not To Build Yet

Do not spend early time on:

- Real brands.
- Licensed trucks.
- High-detail city art.
- Multiplayer.
- Real border systems.
- Photorealistic lighting.
- Complex AI traffic.
- Huge maps.
- Steam integration.
- Advanced mod tools.

These can wait until the core loop feels good.

## First Two-Week Sprint

Week 1:

- Create the engine project.
- Build the driving box.
- Add placeholder truck and road.
- Add camera follow.
- Add reset button.

Week 2:

- Add depot and destination triggers.
- Add job selection.
- Add payment.
- Add fuel drain.
- Add delivery result screen.

End-of-sprint test:

- Can a player complete three deliveries in a row without developer help?

