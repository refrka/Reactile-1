extends Node


signal tile_hovered(coord: Vector2)


var tile_cursor: TileCursor





func _ready() -> void:

	tile_cursor = get_tree().get_first_node_in_group("tile_cursor")

	tile_cursor.tile_hovered.connect(tile_hovered.emit)






func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.button_index == 1 and !event.is_pressed():

		Game.select_tile(tile_cursor.hovered_tile_coords)
