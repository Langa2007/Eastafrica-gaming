extends Node3D

@export var truck_path: NodePath
@export var pickup_marker_path: NodePath
@export var delivery_marker_path: NodePath
@export var trigger_radius := 4.5
@export var delivery_speed_limit_kph := 8.0

@onready var _truck := get_node_or_null(truck_path) as Node3D
@onready var _pickup_marker := get_node_or_null(pickup_marker_path) as Node3D
@onready var _delivery_marker := get_node_or_null(delivery_marker_path) as Node3D
@onready var _job_board := get_node_or_null("HUD/JobBoard") as Control
@onready var _job_title_label := get_node_or_null("HUD/JobBoard/VBox/JobTitleLabel") as Label
@onready var _job_detail_label := get_node_or_null("HUD/JobBoard/VBox/JobDetailLabel") as Label
@onready var _objective_label := get_node_or_null("HUD/ObjectiveLabel") as Label
@onready var _money_label := get_node_or_null("HUD/MoneyLabel") as Label
@onready var _accept_button := get_node_or_null("HUD/JobBoard/VBox/AcceptButton") as Button
@onready var _result_panel := get_node_or_null("HUD/ResultPanel") as Control
@onready var _result_title_label := get_node_or_null("HUD/ResultPanel/VBox/ResultTitleLabel") as Label
@onready var _result_detail_label := get_node_or_null("HUD/ResultPanel/VBox/ResultDetailLabel") as Label
@onready var _return_button := get_node_or_null("HUD/ResultPanel/VBox/ReturnButton") as Button

var _route: Dictionary = {}
var _cargo: Dictionary = {}
var _money := 0
var _payout := 0
var _job_active := false
var _cargo_loaded := false
var _job_completed := false
var _status_message := ""


func _ready() -> void:
	_load_delivery_data()
	_wire_buttons()
	_update_ui()


func _process(_delta: float) -> void:
	if not _job_active or _truck == null:
		return

	if not _cargo_loaded and _is_truck_near(_pickup_marker):
		_cargo_loaded = true
		_status_message = "Cargo loaded. Drive to %s." % _route.get("destination", "the destination")
		_update_ui()
		return

	if _cargo_loaded and _is_truck_near(_delivery_marker):
		var speed_kph := _get_truck_speed_kph()
		if speed_kph <= delivery_speed_limit_kph:
			_complete_delivery()
		else:
			_status_message = "Slow below %d km/h inside the delivery zone." % roundi(delivery_speed_limit_kph)
			_update_ui()


func _load_delivery_data() -> void:
	var routes_data := _read_json_dictionary("res://data/routes.json")
	var cargo_data := _read_json_dictionary("res://data/cargo.json")
	var economy_data := _read_json_dictionary("res://data/economy.json")

	var routes: Array = routes_data.get("routes", [])
	var cargo_list: Array = cargo_data.get("cargo", [])

	if not routes.is_empty():
		_route = routes[0]
	else:
		_route = {
			"name": "Depot Delivery",
			"origin": "Depot",
			"destination": "Delivery Yard",
			"distance_km": 3.0,
			"payout": 500
		}

	if not cargo_list.is_empty():
		_cargo = cargo_list[0]
	else:
		_cargo = {
			"name": "General Cargo",
			"weight_tons": 5.0,
			"fragility": "Low"
		}

	_money = int(economy_data.get("starting_money", 0))
	_payout = int(_route.get("payout", 0)) + int(economy_data.get("completion_bonus", 0))


func _read_json_dictionary(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}

	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {}

	var data: Variant = JSON.parse_string(file.get_as_text())
	if typeof(data) != TYPE_DICTIONARY:
		return {}

	return data


func _wire_buttons() -> void:
	if _accept_button != null:
		_accept_button.pressed.connect(_on_accept_button_pressed)

	if _return_button != null:
		_return_button.pressed.connect(_on_return_button_pressed)


func _on_accept_button_pressed() -> void:
	if _job_active or _job_completed:
		return

	_job_active = true
	_cargo_loaded = false
	_status_message = "Collect cargo at %s." % _route.get("origin", "the depot")
	_update_ui()

	if _is_truck_near(_pickup_marker):
		_cargo_loaded = true
		_status_message = "Cargo loaded. Drive to %s." % _route.get("destination", "the destination")
		_update_ui()


func _complete_delivery() -> void:
	_job_active = false
	_cargo_loaded = false
	_job_completed = true
	_money += _payout
	_status_message = "Delivery complete."

	if _result_panel != null:
		_result_panel.visible = true
	if _result_title_label != null:
		_result_title_label.text = "Delivery Complete"
	if _result_detail_label != null:
		_result_detail_label.text = "%s delivered to %s.\nPaid %s." % [
			_cargo.get("name", "Cargo"),
			_route.get("destination", "the destination"),
			_format_money(_payout)
		]

	_update_ui()


func _on_return_button_pressed() -> void:
	_job_completed = false
	if _result_panel != null:
		_result_panel.visible = false
	_status_message = "Choose a job from the board."
	_update_ui()


func _update_ui() -> void:
	if _job_board != null:
		_job_board.visible = not _job_active or not _cargo_loaded

	if _job_title_label != null:
		_job_title_label.text = _route.get("name", "Delivery Job")

	if _job_detail_label != null:
		_job_detail_label.text = "%s to %s\nCargo: %s, %.1f t\nDistance: %.1f km\nPayout: %s" % [
			_route.get("origin", "Depot"),
			_route.get("destination", "Destination"),
			_cargo.get("name", "Cargo"),
			float(_cargo.get("weight_tons", 0.0)),
			float(_route.get("distance_km", 0.0)),
			_format_money(_payout)
		]

	if _money_label != null:
		_money_label.text = "Money: %s" % _format_money(_money)

	if _objective_label != null:
		_objective_label.text = _get_objective_text()

	if _accept_button != null:
		_accept_button.disabled = _job_active or _job_completed
		_accept_button.text = "Job Active" if _job_active else "Accept Job"


func _get_objective_text() -> String:
	if _status_message != "":
		return _status_message

	if _job_completed:
		return "Return to the job board."

	if _job_active and _cargo_loaded:
		return "Deliver cargo to %s." % _route.get("destination", "the destination")

	if _job_active:
		return "Collect cargo at %s." % _route.get("origin", "the depot")

	return "Choose a job from the board."


func _is_truck_near(marker: Node3D) -> bool:
	if _truck == null or marker == null:
		return false

	return _truck.global_position.distance_to(marker.global_position) <= trigger_radius


func _get_truck_speed_kph() -> float:
	if _truck != null and _truck.has_method("get_speed_kph"):
		return _truck.call("get_speed_kph")

	return 0.0


func _format_money(value: int) -> String:
	return "KES %d" % value
