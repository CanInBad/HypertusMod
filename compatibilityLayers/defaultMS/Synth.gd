extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "synth"
	
func getVisibleName():
	return "Synth"

func getDefaultLegs(_gender):
	return "synthlegs"

func getDefaultTail(_gender):
	return "synthtail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Robot Lizards"

func getDefaultHead(_gender):
	return "synthhead"

func getDefaultArms(_gender):
	return "syntharms"

func getDefaultEars(_gender):
	return "Synthears"

func getDefaultBody(_gender):
	return "synthbody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "synthpenishyperable"
	else:
		return null

func getAllowedBodypart():
	return ["synthequinepenishyperable", "synthpenishumanhyperable"]

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]

func onDynamicNpcCreation(_npc, _args):
	if RNG.chance(66):
		_npc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
