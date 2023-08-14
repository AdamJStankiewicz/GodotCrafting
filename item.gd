extends Area2D

@export var id = 1

var dragging = false
var of = Vector2(0,0)

var inSlot = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var newPos = get_global_mouse_position() - of
		position = newPos
	else:
		if inSlot != null:
			position = inSlot
			inSlot = null
		
func _on_button_button_down():
	dragging = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up():
	dragging = false


func _on_area_entered(area):
	inSlot = area.get_child(1).global_position
