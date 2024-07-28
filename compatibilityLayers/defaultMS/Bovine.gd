extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "bovine"

func isPlayable():
	return true

func getVisibleName():
	return "Bovine"

func getVisibleDescription():
	return "Bovines"

func getDefaultLegs(_gender):
	return "hoofs"

func getDefaultTail(_gender):
	return "bovinetail"

func getDefaultHead(_gender):
	return "bovinehead"

func getDefaultHorns(_gender):
	if(_gender in [Gender.Male]):
		return "bullhorns"
	else:
		return "cowhorns"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "bovineears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "equinepenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 1.0],
		[2, 3.0],
		[3, 2.0],
	]

func getAllowedBodyparts():
	return ["knottedequinepenishyperable"]
