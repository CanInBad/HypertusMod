extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "laquine"

func isPlayable():
	return true

func getVisibleName():
	return "Laquine"

func getVisibleDescription():
	return "Bunneigh"

func getDefaultLegs(_gender):
	return "rabbitlegs"

func getDefaultTail(_gender):
	return "rabbittail1"

func getDefaultHead(_gender):
	return "rabbithead"
	
func getDefaultEars(_gender):
	return "rabbitears1"

func getDefaultArms(_gender):
	if ("Fluffy Bodyparts" in GlobalRegistry.getModules()):
		return "fluffarms"

	return "anthroarms"

func getDefaultBody(_gender):
	if ("Fluffy Bodyparts" in GlobalRegistry.getModules()):
		return "fluffbody"

	return "anthrobody"

func getDefaultBreasts(_gender):
	if ("Fluffy Bodyparts" in GlobalRegistry.getModules()):
		if(_gender in [Gender.Male]):
			return "fluffmalebreastshyperable"
			
		return "fluffbreastshyperable"

	return .getDefaultBreasts(_gender)

func getAllowedBodyparts():
	return ["horsetail","shorttail","demonhorns3","unicornhorn","rabbitears2","rabbitears3","rabbittail2","rabbitlegs","rabbithead","hoofs", "knottedequinepenishyperable", "barbedequinepenishyperable"]
	
func getDefaultPenis(_gender):
	if(_gender in [Gender.Female]):
		return null

	return "equinepenishyperable"
		
func getEggCellOvulationAmount():
	return [
		[1, 3.5],
		[2, 7.0],
		[3, 15.0],
		[4, 16.0],
		[5, 15.0],
		[6, 12.0],
		[7, 10.0],
		[8, 8.0],
		[9, 6.0],
		[10, 4.0],
		[11, 2.0],
		[12, 1.0],
		[24, 0.5],
	]
