extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "felkin"
	
func getVisibleName():
	return "Felkin"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "horsetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "huge dragon-equines"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultHorns(_gender):
	return "backspiralfull"

func getDefaultHead(_gender):
	return "felkinhead2"

func getDefaultEars(_gender):
	return "felkinears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "equinepenishyperable"
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
	return SkinType.Fur

func getAllowedBodyparts():
	return ["horsetail", "demonhorns2", "dragonhorns", "dragonears2", "knottedequinepenishyperable", "barbedequinepenishyperable"]
