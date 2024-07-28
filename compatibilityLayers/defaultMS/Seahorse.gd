extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "seahorse"
	
func getVisibleName():
	return "Seahorse"

func getDefaultLegs(_gender):
	return "sealegs"

func getDefaultTail(_gender):
	return "seatail2"

func isPlayable():
	return true

func getVisibleDescription():
	return "Horse Fish. Supposedly the genetic origin of the 'anus wombs' that cis men over the known universe dread. or dream of. Remember to be tested!"

func getDefaultHead(_gender):
	return "seahorsehead"

func getDefaultArms(_gender):
	return "seaarms"

func getDefaultEars(_gender):
	return "seaears2"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "dragonpenishyperable"
	else:
		return null

func getDefaultHorns(_gender):
	return "seahorsecrest1"

func getDefaultBody(_gender):
	return "seabody"

func getEggCellOvulationAmount():
	return [
		[1, 1.0],
		[2, 5.0],
		[3, 1.0],
		[4, 0.5],
	]

func onDynamicNpcCreation(_npc, _args):
	_npc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))

func getAllowedBodyparts():
	return ["dragonears", "dragonears2", "spinedragonpenishyperable"]

func getSkinType():
	return SkinType.Scales

#Im making a lot of these now so im pre-emptively lowering the spawn rate
func npcGenerationWeight():
	return 0.5
