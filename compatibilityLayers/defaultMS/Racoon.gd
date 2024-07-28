extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "racoon"

func isPlayable():
	return true

func getVisibleName():
	return "Racoon"

func getVisibleDescription():
	return "Trash pandas"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "racoontail2"

func getDefaultHead(_gender):
	return "racoonhead2"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "racoonears"

func getEggCellOvulationAmount():
	return [
		[1, 1.0],
		[2, 6.0],
		[3, 8.0],
		[4, 5.0],
		[5, 4.0],
	]
