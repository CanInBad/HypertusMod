extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "crow"

func isPlayable():
	return true

func getVisibleName():
	return "Crow"

func getVisibleDescription():
	return "Black mischievous bird"

func getDefaultLegs(_gender):
	return "crowlegs2"

func getDefaultTail(_gender):
	return "crowtail"

func getDefaultHead(_gender):
	return "crowhead"

func getDefaultArms(_gender):
	return "crowarms"

func getDefaultEars(_gender):
	return "noears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "avianpenishyperable"
	else:
		return null

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
