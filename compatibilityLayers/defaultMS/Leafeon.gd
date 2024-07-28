extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "Leafeon"
	
func getVisibleName():
	return "Leafeon"

func getDefaultLegs(_gender):
	return "Leaflegs"

func getDefaultTail(_gender):
	return "leafeontail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Some seedy individuals..."

func getDefaultHead(_gender):
	return "leafeonhead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "leafeonears"

func getDefaultAnus(_gender):
	return "anushyperable"

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
