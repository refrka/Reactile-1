class_name TileCursor extends PanelContainer


signal tile_hovered(coord: Vector2i)


@export var tile_outline_stylebox: StyleBoxFlat



var active:= true

var hovered_tile_coords: Vector2i






func _process(_delta: float) -> void:

	if !active:

		return

	var mouse_position = get_global_mouse_position()

	var tile_coords = Game.current_level.tile_map.local_to_map(mouse_position)

	if tile_coords != hovered_tile_coords:

		hovered_tile_coords = tile_coords

		var tile_position = Game.current_level.tile_map.map_to_local(tile_coords)

		global_position = tile_position - Vector2(8.0, 8.0)

		tile_hovered.emit(tile_coords)
