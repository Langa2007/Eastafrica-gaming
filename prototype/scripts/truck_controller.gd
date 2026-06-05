extends CharacterBody3D

@export var max_forward_speed := 30.0
@export var max_reverse_speed := 9.0
@export var acceleration := 11.0
@export var brake_deceleration := 34.0
@export var coast_deceleration := 6.5
@export var steering_rate := 1.85
@export var sideways_response := 9.0
@export var gravity := 24.8

var _speed := 0.0
var _spawn_transform: Transform3D


func _ready() -> void:
	_spawn_transform = global_transform


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_vehicle"):
		reset_vehicle()

	var drive_input: float = Input.get_axis("drive_reverse", "drive_forward")
	var steer_input: float = Input.get_axis("steer_left", "steer_right")

	if drive_input > 0.0:
		_speed = move_toward(_speed, max_forward_speed, acceleration * delta)
	elif drive_input < 0.0:
		if _speed > 0.5:
			_speed = move_toward(_speed, 0.0, brake_deceleration * delta)
		else:
			_speed = move_toward(_speed, -max_reverse_speed, acceleration * 0.7 * delta)
	else:
		_speed = move_toward(_speed, 0.0, coast_deceleration * delta)

	if absf(_speed) > 0.2:
		var reverse_factor: float = -1.0 if _speed < 0.0 else 1.0
		var speed_factor: float = clamp(absf(_speed) / max_forward_speed, 0.25, 1.0)
		rotate_y(-steer_input * steering_rate * speed_factor * reverse_factor * delta)

	var basis := global_transform.basis
	var forward: Vector3 = -basis.z.normalized()
	var right: Vector3 = basis.x.normalized()
	var sideways_speed: float = steer_input * sideways_response * minf(absf(_speed) / max_forward_speed, 1.0)
	var ground_velocity: Vector3 = (forward * _speed) + (right * sideways_speed)
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
