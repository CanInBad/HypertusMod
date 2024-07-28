extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "sergal"
	
func getVisibleName():
	return "Sergal"

func getDefaultLegs(_gender):
	return "serglegs"

func getDefaultTail(_gender):
	return "sergaltail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Haha. Wedge."

func getDefaultArms(_gender):
	return "sergarms"

func getDefaultHead(_gender):
	return "sergalhead"

func getDefaultEars(_gender):
	return "sergalearsbig"

func getDefaultBody(_gender):
	return "sergalbody"
	
func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 4.0],
		[2, 0.5],
	]

func getSkinType():
	return SkinType.Fur

func onDynamicNpcCreation(_npc, _args):
	_npc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
