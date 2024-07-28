extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "snake"
	
func getVisibleName():
	return "Snake"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "snaketail"

func isPlayable():
	return true

func getVisibleDescription():
	return "noodle"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultHead(_gender):
	return "snakehead"

func getDefaultEars(_gender):
	return "scalieearless"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "dragonpenishyperable"
	else:
		return null

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vaginahyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 4.0],
		[2, 5.0],
		[3, 3.0],
		[4, 1.0],
		[5, 0.4],
	]

func getAllowedBodyparts():
	return ["spinedragonpenishyperable"]

func getSkinType():
	return SkinType.Scales
