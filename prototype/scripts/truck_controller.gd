extends CharacterBody3D

@export var max_forward_speed := 30.0
@export var max_reverse_speed := 9.0
@export var acceleration := 11.0
@export var brake_deceleration := 34.0
@export var coast_deceleration := 6.5
@export var steering_rate := 3.2
@export var low_speed_steering_boost := 0.55
@export var gravity := 24.8

var _speed := 0.0
var _spawn_transform: Transform3D
var _surface_name := "Paved road"


func _ready() -> void:
	_spawn_transform = global_transform


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_vehicle"):
		reset_vehicle()

	var drive_input := _get_drive_input()
	var steer_input := _get_steer_input()
	var surface := _get_surface_profile()
	_surface_name = surface.name
	var forward_limit: float = max_forward_speed * surface.speed_scale
	var reverse_limit: float = max_reverse_speed * surface.speed_scale
	var active_acceleration: float = acceleration * surface.acceleration_scale
	var active_coast: float = coast_deceleration * surface.coast_scale

	if drive_input > 0.0:
		_speed = move_toward(_speed, forward_limit, active_acceleration * delta)
	elif drive_input < 0.0:
		if _speed > 0.5:
			_speed = move_toward(_speed, 0.0, brake_deceleration * delta)
		else:
			_speed = move_toward(_speed, -reverse_limit, active_acceleration * 0.7 * delta)
	else:
		_speed = move_toward(_speed, 0.0, active_coast * delta)

	var steering_speed := maxf(absf(_speed), max_forward_speed * low_speed_steering_boost)
	if absf(_speed) > 0.2 or absf(drive_input) > 0.0:
		var reverse_factor: float = -1.0 if _speed < 0.0 else 1.0
		var speed_factor: float = clamp(steering_speed / maxf(forward_limit, 0.1), 0.35, 1.0)
		rotate_y(-steer_input * steering_rate * speed_factor * reverse_factor * delta)

	var basis := global_transform.basis
	var forward: Vector3 = -basis.z.normalized()
	var ground_velocity: Vector3 = forward * _speed
	velocity.x = ground_velocity.x
	velocity.z = ground_velocity.z

	if is_on_floor():
		velocity.y = 0.0
	else:
		velocity.y -= gravity * delta

	move_and_slide()


func reset_vehicle() -> void:
	global_transform = _spawn_transform
	velocity = Vector3.ZERO
	_speed = 0.0


func get_speed_kph() -> float:
	return absf(_speed) * 3.6


func get_surface_name() -> String:
	return _surface_name


func _get_drive_input() -> float:
	var input := Input.get_axis("drive_reverse", "drive_forward")

	if Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP):
		input += 1.0
	if Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN):
		input -= 1.0

	return clampf(input, -1.0, 1.0)


func _get_steer_input() -> float:
	var input := Input.get_axis("steer_left", "steer_right")

	if Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT):
		input += 1.0
	if Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT):
		input -= 1.0

	return clampf(input, -1.0, 1.0)


func _get_surface_profile() -> Dictionary:
	var pos := global_position

	if pos.x < -15.0 and pos.z > -16.0:
		if pos.z < -3.0:
			return {
				"name": "Hill climb",
				"speed_scale": 0.5,
				"acceleration_scale": 0.55,
				"coast_scale": 1.65,
			}

		return {
			"name": "Dirt route",
			"speed_scale": 0.65,
			"acceleration_scale": 0.72,
			"coast_scale": 1.25,
		}

	if pos.x < -6.0 and pos.z > -4.0:
		return {
			"name": "Tight city turn",
			"speed_scale": 0.78,
			"acceleration_scale": 0.9,
			"coast_scale": 1.05,
		}

	return {
		"name": "Paved road",
		"speed_scale": 1.0,
		"acceleration_scale": 1.0,
		"coast_scale": 1.0,
	}
