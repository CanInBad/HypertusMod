extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "deer"

func isPlayable():
	return true

func getVisibleName():
	return "Deer"

func getVisibleDescription():
	return "Cheeselovers"

func getDefaultLegs(_gender):
	return "deerlegs"

func getDefaultTail(_gender):
	return "deertail"

func getDefaultHorns(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "deerhorns"
	else:
		return null

func getDefaultHead(_gender):
	return "deerhead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "deerears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "deerpenishyperable"
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

func getAllowedBodyparts():
	return ["knottedequinepenishyperable", "barbedequinepenishyperable", "equinepenishyperable"]