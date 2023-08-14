extends Area2D

@onready var table = $"../"
var num = 0

var occupied = false

func _on_area_entered(area):
	if !occupied:
		num = area.id
		print(num)
		table.updateTable()
		occupied = true
	

func _on_area_exited(area):
	if occupied:
		num = 0
		table.updateTable()
		occupied = false
