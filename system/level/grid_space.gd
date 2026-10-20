class_name GridSpace extends MarginContainer


signal select_state_changed(new_state: bool)



@export var default_stylebox: StyleBoxFlat

@export var hovered_stylebox: StyleBoxFlat

@export var selected_stylebox: StyleBoxFlat

@export var selected_and_hovered_stylebox: StyleBoxFlat

@export var panel: PanelContainer





var active:= false

var hovered:= false

var selected:= false



var tile: Tile





func _initialize() -> void:

	panel.add_theme_stylebox_override("panel", default_stylebox)





func _activate() -> void:

	active = true

	_connect_signals()





func _deactivate() -> void:

	_disconnect_signals()

	active = false





func _connect_signals() -> void:

	mouse_entered.connect(_on_mouse_entered)

	mouse_exited.connect(_on_mouse_exited)

	gui_input.connect(_on_gui_input)




func _disconnect_signals() -> void:

	mouse_entered.disconnect(_on_mouse_entered)

	mouse_exited.disconnect(_on_mouse_exited)

	gui_input.disconnect(_on_gui_input)





func select() -> void:

	selected = true

	_update_visuals()




func deselect() -> void:

	selected = false

	_update_visuals()




func set_tile(_tile: Tile) -> void:

	tile = _tile

	_update_visuals()




func _set_hover_state(state: bool) -> void:

	hovered = state

	_update_visuals()




func _set_selected_state(state: bool) -> void:

	selected = state

	_update_visuals()

	select_state_changed.emit(state)





func _update_visuals() -> void:

	var chosen_stylebox = default_stylebox

	if active:

		if hovered:
		
			if selected:
				
				chosen_stylebox = selected_and_hovered_stylebox

			else:

				chosen_stylebox = hovered_stylebox

		else:
	
			if selected:
				
				chosen_stylebox = selected_stylebox

	panel.add_theme_stylebox_override("panel", chosen_stylebox)

	

	







func _on_mouse_entered() -> void:

	if !active:

		return

	_set_hover_state(true)




func _on_mouse_exited() -> void:

	if !active:

		return

	_set_hover_state(false)




func _on_gui_input(event: InputEvent) -> void:

	if !active:

		return

	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():

		_set_selected_state(!selected)
