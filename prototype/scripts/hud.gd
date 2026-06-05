extends CanvasLayer

@export var truck_path: NodePath

@onready var speed_label: Label = $SpeedLabel

var _truck: Node


func _ready() -> void:
	_truck = get_node_or_null(truck_path)


func _process(_delta: float) -> void:
	if _truck == null or not _truck.has_method("get_speed_kph"):
		speed_label.text = "Speed: -- km/h"
		return

	speed_label.text = "Speed: %03d km/h" % roundi(_truck.get_speed_kph())
