extends Node3D

@export var target_path: NodePath
@export var follow_distance := 9.0
@export var follow_height := 4.2
@export var look_height := 1.2
@export var smoothing := 8.0

var _target: Node3D


func _ready() -> void:
	_target = get_node_or_null(target_path)


func _process(delta: float) -> void:
	if _target == null:
		return

	var target_basis := _target.global_transform.basis
	var desired_position := _target.global_position + target_basis.z * follow_distance + Vector3.UP * follow_height
	var blend := 1.0 - exp(-smoothing * delta)
	global_position = global_position.lerp(desired_position, blend)
	look_at(_target.global_position + Vector3.UP * look_height, Vector3.UP)
