extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "skulldog"
	
func getVisibleName():
	return "Skullwolf"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "caninetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Spooky scary"

func getDefaultHead(_gender):
	return "skullhead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "fluffears"

func getDefaultBody(_gender):
	return "Witheredbody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getAllowedBodyparts():
	return ["caninetail", "huskytail", "canineears", "wolfears"]

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vaginahyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]
