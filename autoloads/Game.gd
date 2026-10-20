extends Node


signal tile_selected(coord: Vector2i)



var level_root: Node2D

var tile_outline: PanelContainer

var current_level: Level

var tiles: Dictionary[Vector2i, Tile]

var selected_tiles: Array[Tile]





func _ready() -> void:

	level_root = get_tree().get_first_node_in_group("level_root")

	current_level = level_root.get_child(0)

	tile_outline = get_tree().get_first_node_in_group("tile_outline")

	tile_outline.visible = false






func register_tile(tile: Tile) -> void:

	tiles[tile.coord] = tile

	tile._initialize()





func select_tile(coord: Vector2i, deselect_others:= true) -> void:

	if tiles.has(coord):

		var tile = get_tile(coord)
		
		if deselect_others:

			for i in range(selected_tiles.size()):

				var selected_tile = selected_tiles[i]

				deselect_tile(selected_tile.coord)

			selected_tiles.clear()

		selected_tiles.append(tile)

		set_tile_outline(coord, true)

		tile_selected.emit(coord)

		






func deselect_tile(coord: Vector2i) -> void:

	var tile = get_tile(coord)

	if selected_tiles.has(tile):

		selected_tiles.erase(tile)

		set_tile_outline(coord, false)







func set_tile_outline(coord: Vector2i, state: bool) -> void:

	tile_outline.visible = state

	if state == true:

		tile_outline.global_position = Game.current_level.tile_map.map_to_local(coord) - Vector2(8.0, 8.0)






func get_tile(coord: Vector2i) -> Tile:

	if tiles.has(coord):

		return tiles[coord]
	
	return null