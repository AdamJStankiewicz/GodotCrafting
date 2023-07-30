extends Button

@onready var table = $"../"
var num = 0

func _on_pressed():
	if num < 3:
		num += 1
	else:
		num = 0
	text = str(num)
	
	table.updateTable()
