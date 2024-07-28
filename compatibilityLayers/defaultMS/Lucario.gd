extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "lucario"
	
func getVisibleName():
	return "Lucario"

func getDefaultLegs(_gender):
	return "lucariolegs"

func getDefaultTail(_gender):
	return "lucariotail"

func isPlayable():
	return true

func getVisibleDescription():
	return "The most sexualized pokemon"

func getDefaultHead(_gender):
	return "Lucariohead2"

func getDefaultArms(_gender):
	return "lucarioarms"

func getDefaultEars(_gender):
	return "lucarioears"

func getDefaultBody(_gender):
	return "lucariobody"

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
