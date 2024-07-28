extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "gryphon"
	
func getVisibleName():
	return "Gryphon"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "felinetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "The feline-bird hybrids"

func getDefaultHead(_gender):
	return "hippogriffhead"

func getDefaultArms(_gender):
	return "birdarms"

func getDefaultEars(_gender):
	return "felineears"

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreastshyperable"
	
	return "humanbreastshyperable"

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vaginahyperable"
	else:
		return null

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "dragonpenishyperable"
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

func getAllowedBodyparts():
	return ["felineears", "felinetail", "canineears", "noears", "spinedragonpenishyperable"]
