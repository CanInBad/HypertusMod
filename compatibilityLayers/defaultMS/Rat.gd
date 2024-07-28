extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "rat"

func isPlayable():
	return true

func getVisibleName():
	return "Rat"

func getVisibleDescription():
	return "Cheeselovers"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "rattail"

func getDefaultHead(_gender):
	return "rathead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "ratears"

func getEggCellOvulationAmount():
	return [
		[1, 2.0],
		[2, 8.0],
		[3, 6.0],
		[4, 4.0],
		[5, 2.0],
		[6, 1.0],
		[7, 0.5],
	]
