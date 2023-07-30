extends Node2D

var recipeCount = 0
var recipe = {}
var recipeValues = {}
var recipes = {}
var items = { 3 : "Stick",
			  1 : "Cobble",
			  2 : "Plank"}



func createRecipe(rec, nam):
	recipeValues[recipeCount] = rec
	recipeCount += 1
	recipes[rec] = nam
	print(recipes[rec], " : ", rec)
