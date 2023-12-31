extends Node2D

@onready var crafting = $"../"
var table = [0,0,0,0,0,0,0,0,0]
var recipe = {}
var items = 0
var firstItem = 0
var record = false
	
func updateTable():
	if !record:
		$"../Recipe".text = "RECIPE:"
		items = 0
		recipe = {}
		firstItem = 0
		for n in range(get_child_count()):
			table[n] = int(get_child(n).num)
			if table[n] != 0:
				if items == 0:
					recipe[str(items)] = [crafting.items[table[n]],firstItem]
					items += 1
					firstItem = n
				else:
					recipe[str(items)] = [crafting.items[table[n]],n - firstItem]
					items += 1
		print(recipe)
		for n in crafting.recipeValues:
			if str(crafting.recipeValues[str(n)]) == str(recipe):
				print(str(recipe))
				$"../Recipe".text = str("RECIPE: \n", crafting.recipes[str(recipe)])
	else:
		items = 0
		recipe = {}
		firstItem = 0
		for n in range(get_child_count()):
			table[n] = int(get_child(n).num)
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
	
	if !record:
		print(recipe)
		print("NEW RECIPE SUBMITTED")
		crafting.createRecipe(recipe,$"../Name".text)
