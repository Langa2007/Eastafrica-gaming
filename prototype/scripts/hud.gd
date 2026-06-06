extends CanvasLayer

@export var truck_path: NodePath
@export var delivery_marker_path: NodePath

@onready var speed_label: Label = $SpeedLabel
@onready var route_label: Label = $RouteLabel
@onready var surface_label: Label = $SurfaceLabel

var _truck: Node
var _delivery_marker: Node3D


func _ready() -> void:
	_truck = get_node_or_null(truck_path)
	_delivery_marker = get_node_or_null(delivery_marker_path) as Node3D


func _process(_delta: float) -> void:
	if _truck == null or not _truck.has_method("get_speed_kph"):
		speed_label.text = "Speed: -- km/h"
		route_label.text = "Route: --"
		surface_label.text = "Surface: --"
		return

	speed_label.text = "Speed: %03d km/h" % roundi(_truck.get_speed_kph())
	route_label.text = _get_route_guidance()
	surface_label.text = "Surface: %s" % _get_surface_name()


func _get_surface_name() -> String:
	if _truck.has_method("get_surface_name"):
		return _truck.call("get_surface_name")

	return "Paved road"


func _get_route_guidance() -> String:
	if _truck is not Node3D:
		return "Route: follow road"

	var pos: Vector3 = (_truck as Node3D).global_position

	if pos.z > 7.0:
		return "Route: continue south on paved road"

	if pos.x > -14.0 and pos.z > -3.0:
		return "Route: tight left turn to dirt bypass"

	if pos.x <= -14.0 and pos.z > -16.0:
		return "Route: dirt and hill section ahead"

	if pos.x < -6.0:
		return "Route: turn right to delivery yard"

	if _delivery_marker != null:
		var distance := pos.distance_to(_delivery_marker.global_position)
		return "Route: delivery yard %.0f m" % distance

	return "Route: delivery yard ahead"
