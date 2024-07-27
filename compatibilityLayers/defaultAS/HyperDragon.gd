extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = Species.Dragon
	
func getVisibleName():
	return "Dragon"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "dragontail"

func isPlayable():
	return true

func getVisibleDescription():
	return "They roar and stuff"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultHorns(_gender):
	return "dragonhorns"

func getDefaultHead(_gender):
	return "dragonhead"

func getDefaultEars(_gender):
	return "dragonears"

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
		[1, 4.0],
		[2, 5.0],
		[3, 3.0],
		[4, 1.0],
		[5, 0.4],
	]

func getSkinType():
	return SkinType.Scales
