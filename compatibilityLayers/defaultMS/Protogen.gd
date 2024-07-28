extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = "protogen"
	
func getVisibleName():
	return "Protogen"

func getDefaultLegs(_gender):
	return "protolegs"

func getDefaultTail(_gender):
	return "prototail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Fluffy cyborgs made by some unknown entity"

func getDefaultHead(_gender):
	return "protogenhead"

func getDefaultArms(_gender):
	return "protoarms"

func getDefaultEars(_gender):
	return "ProtoEars"

func getDefaultBody(_gender):
	return "protobody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]

#remember to add/remove anus and anus womb depending on breed edition 
# Yes sir!!!!! -CIB
func getAllowedBodyparts():
	return ["wolfears", "caninetail", "huskytail"]
