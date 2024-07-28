extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "houndoom"
	
func getVisibleName():
	return "Houndoom"

func getDefaultLegs(_gender):
	return "doomlegs"

func getDefaultTail(_gender):
	return "doomtail"

func getDefaultHorns(_gender):
	return "doomhorns"

func isPlayable():
	return true

func getVisibleDescription():
	return "The Devilish Pokemon"

func getDefaultHead(_gender):
	return "caninehead"

func getDefaultBody(_gender):
	return "doombody1alt"

func getDefaultArms(_gender):
	return "doomarms"

func getDefaultEars(_gender):
	return "canineears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 0.0],
		[5, 0.0],
		[6, 0.0],
		[7, 1.0],
	]

func getAllowedBodyparts():
	return ["felinetail", "canineears", "wolfears", "caninehead", "wolfhead"]
