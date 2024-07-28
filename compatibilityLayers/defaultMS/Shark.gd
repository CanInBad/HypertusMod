extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "shark"
	
func getVisibleName():
	return "Shark"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "sharktail"

func isPlayable():
	return true

func getVisibleDescription():
	return "f i s h"

func getDefaultHead(_gender):
	return "sharkhead"

func getDefaultArms(_gender):
	return "sharkarms"

func getDefaultEars(_gender):
	return "sharkearless"

func getDefaultBody(_gender):
	return "sharkbody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "dragonpenishyperable"
	else:
		return null

func getAllowedBodyparts():
	return ["spinedragonpenishyperable"]

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]
