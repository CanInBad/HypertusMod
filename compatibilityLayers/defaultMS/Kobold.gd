extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "kobold"
	
func getVisibleName():
	return "Kobold"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "snaketail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Funny little lizard gremlins"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultHorns(_gender):
	return "dragonhorns"

func getDefaultHead(_gender):
	return "koboldhead"

func getDefaultEars(_gender):
	return "scalieearless"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "dragonpenishyperable"
	else:
		return null

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreastshyperable"
	
	return "humanbreastshyperable"

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

func getSkinType():
	return SkinType.Scales

func getAllowedBodyparts():
	return ["spinedragonpenishyperable"]