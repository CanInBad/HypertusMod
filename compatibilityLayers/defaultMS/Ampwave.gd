extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "ampwave"
	
func getVisibleName():
	return "Ampwave"

func getDefaultLegs(_gender):
	return "amplegs"

func getDefaultTail(_gender):
	return "amptail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Sound-based cybernetic organism"

func getDefaultHead(_gender):
	return "amphead"

func getDefaultArms(_gender):
	return "amparms2"

func getDefaultEars(_gender):
	return "ampears"

func getDefaultBody(_gender):
	return "ampbodyalt"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

#nuke fertility because cyborgs, which I should probably go back and do to synths if I ever update that one.
func getEggCellOvulationAmount():
	return [
		[1, 5.0],
		[2, 2.0],
	]
