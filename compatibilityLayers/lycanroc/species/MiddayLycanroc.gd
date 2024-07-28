extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "middaylycan"
	
func getVisibleName():
	return "Midday Lycanroc"

func getDefaultLegs(_gender):
	return "lycanroclegs"

func getDefaultTail(_gender):
	return "middaytail"

func isPlayable():
	return true

func getVisibleDescription():
	return "A derivative species of canines known for being strong and connected to earthy planets. Has absolutely no connection to Pokemon."

func getDefaultHead(_gender):
	return "middayhead"

func getDefaultArms(_gender):
	return "lycanrocarms"

func getDefaultEars(_gender):
	return "middayears"

func getDefaultBody(_gender):
	return "middaybody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "lycanrocmalebreastshyperable"
	
	return "lycanrocbreastshyperable"

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
	]

func onDynamicNpcCreation(_npc, _args):
	_npc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
