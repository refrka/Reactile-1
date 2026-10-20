class_name Tile extends Node2D




@export var panel: PanelContainer

@export var texture_rect: TextureRect

@export var base_layer: Layer



var coord: Vector2i




func _initialize() -> void:

	if base_layer:

		texture_rect.texture = base_layer.base_tile_texture