extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "bird"
	
func getVisibleName():
	return "Bird"

func getDefaultLegs(_gender):
	return "birddigilegs"

func getDefaultTail(_gender):
	return "birdtail"

func isPlayable():
	return true

func getVisibleDescription():
	return "all the various flying guys in one"

func getDefaultHead(_gender):
	return "birdhead1"

func getDefaultArms(_gender):
	return "birdarms"

func getDefaultEars(_gender):
	return "noears"

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
		return "birdpenishyperable"
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
