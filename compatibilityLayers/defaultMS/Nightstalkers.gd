extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "nightstalker"
	
func getVisibleName():
	return "Nightstalker"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "snaketail3"

func isPlayable():
	return true

func getVisibleDescription():
	return "Snake Puppies. Snuppies."

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultHead(_gender):
	return "snuppyhead"

func getDefaultEars(_gender):
	return "wolfears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 0.5],
		[2, 5.0],
		[3, 4.0],
		[4, 3.0],
		[5, 1.0],
	]

func getSkinType():
	return SkinType.Scales

func getAllowedBodyparts():
	return ["canineears","wolfears"]
