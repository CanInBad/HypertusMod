extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "lopunny"
	
func getVisibleName():
	return "Lopunny"

func isPlayable():
	return true

func getVisibleDescription():
	return "Elegant bunny"

func getDefaultHead(_gender):
	return "lopunnyheadeyes"

func getDefaultHorns(_gender):
	return "lopunnyhorns"

func getDefaultTail(_gender):
	return "lopunnytail"

func getDefaultEars(_gender):
	return "lopunnyears"

func getDefaultLegs(_gender):
	return "lopunnylegs"

func getDefaultArms(_gender):
	return "lopunnyarms"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "humanpenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 1.0],
		[2, 7.0],
		[3, 6.0],
		[4, 4.0],
		[5, 3.0],
		[6, 2.0],
		[7, 1.5],
	]
