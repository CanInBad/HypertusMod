extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "avali"
	

func getDefaultBreasts(_gender):
	if(_gender == Gender.Male):
		return "avaliMalebreastshyperable"
	
	return "avalibreastshyperable"

func getVisibleName():
	return "Avali"

func getDefaultLegs(_gender):
	return "avalilegs"

func getDefaultTail(_gender):
	return "avalitail"

func isPlayable():
	return true

func getVisibleDescription():
	return "The sci-fi birbs"

func getDefaultHead(_gender):
	return "avalihead"

func getDefaultArms(_gender):
	return "avaliarms"

func getDefaultEars(_gender):
	return "avaliears"

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
		
# breed edition - allow npcs to gen w/ ass womb
# func getAllowedBodyparts():
# 	return ["anus", "anuswomb"]

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]
