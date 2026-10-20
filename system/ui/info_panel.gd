class_name InfoPanel extends PanelContainer



@export var hovered_tile_label: Label

@export var selected_tile_label: Label

@export var base_layer_label: Label



func _ready() -> void:

	Cursor.tile_hovered.connect(_on_tile_hovered)

	Game.tile_selected.connect(_on_tile_selected)





func _on_tile_hovered(coord: Vector2i) -> void:

	hovered_tile_label.text = "< %s, %s >" % [coord.x, coord.y]



func _on_tile_selected(coord: Vector2i) -> void:

	selected_tile_label.text = "< %s, %s >" % [coord.x, coord.y]

	var tile = Game.get_tile(coord)

	if tile and tile.base_layer:

		base_layer_label.text = tile.base_layer.display_name

	else:

		base_layer_label.text = "-"