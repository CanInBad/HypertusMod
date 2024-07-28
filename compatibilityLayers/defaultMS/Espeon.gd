extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "Espeon"
	
func getVisibleName():
	return "Espeon"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "espeontail"

func isPlayable():
	return true

func getVisibleDescription():
	return "The quiet psychic types"

func getDefaultHead(_gender):
	return "espeonhead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "espeonears"

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vaginahyperable"
	else:
		return null

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
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
