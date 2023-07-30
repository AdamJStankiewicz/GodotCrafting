extends Area2D

@onready var table = $"../"
var num = 0

func _on_body_entered(body):
	num = body.id
	table.updateTable()
	body.dragging = false
	body.position = get_child(1).global_position
	
func _on_body_exited(body):
	num = 0
	table.updateTable()
