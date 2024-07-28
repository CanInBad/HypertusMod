extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "dusklycan"
	
func getVisibleName():
	return "Dusk Lycanroc"

func getDefaultLegs(_gender):
	return "lycanroclegs"

func getDefaultTail(_gender):
	return "dusktail"

func isPlayable():
	return true

func getVisibleDescription():
	return "A derivative species of canines known for connected to earthy planets. Dusk-Type Subspecies. Has absolutely no connection to Pokemon."

func getDefaultHead(_gender):
	return "dusklycanhead"

func getDefaultArms(_gender):
	return "lycanrocarms"

func getDefaultEars(_gender):
	return "middayears"

func getDefaultBody(_gender):
	return "duskbody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "lycanrocmalebreastshyperable"
	
	return "lycanrocbreastshyperable"

func getDefaultHair(_gender):
	return "duskmohawk"

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
	]

func onDynamicNpcCreation(_npc, _args):
	_npc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("duskmohawk"))

func npcGenerationWeight():
	return 0.5
