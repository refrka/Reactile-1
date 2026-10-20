class_name Level extends Node2D


@export var tile_map: TileMapLayer

@export var tile_root: Node2D



func _ready() -> void:

	for tile in tile_root.get_children():

		tile.panel.visible = false

		var coord = tile_map.local_to_map(tile.global_position)

		tile.coord = coord

		Game.register_tile(tile)