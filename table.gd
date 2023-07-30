extends Node2D

@onready var crafting = $"../"
var table = [0,0,0,0,0,0,0,0,0]
var recipe = {}
var items = 0
var firstItem = 0
var record = false
	
func updateTable():
	if !record:
		items = 0
		recipe = {}
		firstItem = 0
		for n in range(get_child_count()):
			table[n] = int(get_child(n).text)
			if table[n] != 0:
				if items == 0:
					recipe[items] = [crafting.items[table[n]],firstItem]
					items += 1
					firstItem = n
				else:
					recipe[items] = [crafting.items[table[n]],n - firstItem]
					items += 1
					
		for n in crafting.recipeValues:
			if crafting.recipeValues[n] == recipe:
				$"../Recipe".text = str("RECIPE: \n", crafting.recipes[recipe])
	else:
		items = 0
		recipe = {}
		firstItem = 0
		for n in range(get_child_count()):
			table[n] = int(get_child(n).text)
			if table[n] != 0:
				if items == 0:
					recipe[items] = [crafting.items[table[n]],firstItem]
					items += 1
					firstItem = n
				else:
					recipe[items] = [crafting.items[table[n]],n - firstItem]
					items += 1
		
func _on_record_pressed():
	record = !record
	
	if record:
		$"../Record".text = "1"
		$"../Recipe".text = str("RECIPE: \n", "RECORDING")
	else:
		$"../Recipe".text = "RECIPE:"
		print(recipe)
		print("NEW RECIPE SUBMITTED")
		crafting.createRecipe(recipe,$"../Name".text)
		$"../Record".text = "0"
