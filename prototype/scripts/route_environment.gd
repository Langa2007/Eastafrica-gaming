extends Node3D

const ROAD_HEIGHT := 0.055

var _materials := {}


func _ready() -> void:
	_create_materials()
	_build_route()
	_build_props()
	_build_route_labels()


func _create_materials() -> void:
	_materials.paved = _make_material(Color(0.09, 0.1, 0.1, 1.0), 0.9)
	_materials.dirt = _make_material(Color(0.45, 0.31, 0.16, 1.0), 0.95)
	_materials.hill = _make_material(Color(0.38, 0.28, 0.18, 1.0), 0.92)
	_materials.curb = _make_material(Color(0.9, 0.88, 0.76, 1.0), 0.65)
	_materials.prop = _make_material(Color(0.42, 0.45, 0.38, 1.0), 0.75)
	_materials.sign = _make_material(Color(0.95, 0.78, 0.2, 1.0), 0.45)
	_materials.arrow = _make_material(Color(0.94, 0.86, 0.28, 1.0), 0.5)


func _make_material(color: Color, roughness: float) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = roughness
	return material


func _build_route() -> void:
	_add_box("PavedDepotRun", Vector3(0, ROAD_HEIGHT, 13), Vector3(10, 0.08, 26), _materials.paved)
	_add_box("TightTurnPaved", Vector3(-10, ROAD_HEIGHT + 0.01, 3), Vector3(28, 0.08, 8), _materials.paved)
	_add_box("DirtBypass", Vector3(-22, ROAD_HEIGHT + 0.02, -5), Vector3(8, 0.08, 25), _materials.dirt)
	_add_box("HillSection", Vector3(-22, ROAD_HEIGHT + 0.08, -10), Vector3(8.5, 0.18, 10), _materials.hill)
	_add_box("FinalPavedApproach", Vector3(-10, ROAD_HEIGHT + 0.01, -22), Vector3(30, 0.08, 8), _materials.paved)

	_add_box("TurnInnerCurb", Vector3(-9, 0.16, 7.6), Vector3(16, 0.24, 0.35), _materials.curb)
	_add_box("TurnOuterCurb", Vector3(-9, 0.16, -1.6), Vector3(18, 0.24, 0.35), _materials.curb)
	_add_box("YardCurb", Vector3(-10, 0.16, -17.6), Vector3(24, 0.24, 0.35), _materials.curb)

	_add_arrow("ArrowDepot", Vector3(-4, 0.14, 7), 0.0)
	_add_arrow("ArrowTurn", Vector3(-11, 0.14, 3), 1.5708)
	_add_arrow("ArrowDirt", Vector3(-22, 0.14, -2), 0.0)
	_add_arrow("ArrowFinalTurn", Vector3(-16, 0.14, -22), -1.5708)


func _build_props() -> void:
	for z in [16.0, 10.0, 4.0, -2.0, -8.0, -14.0]:
		_add_post(Vector3(7.0, 0.55, z))

	for z in [4.0, -2.0, -8.0, -14.0]:
		_add_post(Vector3(-16.0, 0.55, z))
		_add_post(Vector3(-28.0, 0.55, z))

	_add_box("RoadsideWarehouseA", Vector3(12, 0.8, 18), Vector3(4, 1.6, 6), _materials.prop)
	_add_box("RoadsideWarehouseB", Vector3(-31, 0.65, -20), Vector3(4, 1.3, 5), _materials.prop)
	_add_box("LowBarrierA", Vector3(-29, 0.25, 4), Vector3(0.45, 0.5, 7), _materials.curb)
	_add_box("LowBarrierB", Vector3(-15, 0.25, -15), Vector3(0.45, 0.5, 5), _materials.curb)
	_add_sign("TightTurnSign", Vector3(-6, 1.15, 7.2), "TIGHT TURN")
	_add_sign("DirtSign", Vector3(-16, 1.15, 1.8), "DIRT ROUTE")
	_add_sign("HillSign", Vector3(-17, 1.15, -9.0), "HILL")


func _build_route_labels() -> void:
	_add_label("PAVED", Vector3(4.5, 1.0, 8))
	_add_label("TIGHT TURN", Vector3(-10, 1.0, 3))
	_add_label("DIRT", Vector3(-22, 1.0, -1))
	_add_label("HILL", Vector3(-22, 1.0, -10))


func _add_box(node_name: String, position: Vector3, size: Vector3, material: Material) -> MeshInstance3D:
	var mesh := BoxMesh.new()
	mesh.size = size

	var instance := MeshInstance3D.new()
	instance.name = node_name
	instance.position = position
	instance.mesh = mesh
	instance.material_override = material
	add_child(instance)
	return instance


func _add_post(position: Vector3) -> void:
	var mesh := CylinderMesh.new()
	mesh.height = 1.1
	mesh.top_radius = 0.08
	mesh.bottom_radius = 0.08

	var post := MeshInstance3D.new()
	post.name = "RoadsidePost"
	post.position = position
	post.mesh = mesh
	post.material_override = _materials.sign
	add_child(post)


func _add_sign(node_name: String, position: Vector3, text: String) -> void:
	_add_post(position - Vector3(0, 0.55, 0))

	var sign := _add_box(node_name, position + Vector3(0, 0.35, 0), Vector3(2.2, 0.7, 0.12), _materials.sign)
	sign.rotation_degrees.y = 0

	var label := _make_label(text, 0.34)
	label.position = position + Vector3(0, 0.38, -0.08)
	add_child(label)


func _add_label(text: String, position: Vector3) -> void:
	var label := _make_label(text, 0.55)
	label.position = position
	add_child(label)


func _make_label(text: String, size: float) -> Label3D:
	var label := Label3D.new()
	label.name = "%sLabel" % text.capitalize().replace(" ", "")
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.font_size = 48
	label.pixel_size = 0.01
	label.modulate = Color(1, 1, 1, 1)
	label.outline_modulate = Color(0, 0, 0, 1)
	label.outline_size = 8
	label.text = text
	label.scale = Vector3.ONE * size
	return label


func _add_arrow(node_name: String, position: Vector3, y_rotation: float) -> void:
	var arrow := Node3D.new()
	arrow.name = node_name
	arrow.position = position
	arrow.rotation.y = y_rotation
	add_child(arrow)

	var shaft := BoxMesh.new()
	shaft.size = Vector3(0.6, 0.08, 3.0)
	var shaft_instance := MeshInstance3D.new()
	shaft_instance.name = "Shaft"
	shaft_instance.mesh = shaft
	shaft_instance.material_override = _materials.arrow
	arrow.add_child(shaft_instance)

	var head := BoxMesh.new()
	head.size = Vector3(1.6, 0.08, 1.2)
	var head_instance := MeshInstance3D.new()
	head_instance.name = "Head"
	head_instance.position.z = -1.6
	head_instance.rotation_degrees.y = 45.0
	head_instance.mesh = head
	head_instance.material_override = _materials.arrow
	arrow.add_child(head_instance)
