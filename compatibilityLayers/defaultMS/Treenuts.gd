extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "treenuts"

#I cant fucking type squrriel consistently so you get treenuts instead

func getVisibleName():
	return "Squirrel"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "treenutstail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Nut joke."

func getDefaultHead(_gender):
	return "treenutshead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "felineears"

#A lot of the refs I saw had human dick so we're gonna do both and see how it goes
# NO!!!!!!
func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getAllowedBodyparts():
	return ["shorttail", "felineears", "wolfears", "humanpenishyperable"]

#I actually gave this one a custom Ovulation count this time

func getEggCellOvulationAmount():
	return [
		[2, 6.0],
		[3, 8.0],
		[4, 6.0],
		[5, 1.0],
	]
