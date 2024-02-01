extends "res://Modules/Z_Hypertus/Misc/ModBodypartBreasts.gd"

func _init():
	visibleName = "hyperable fluffy breasts"
	id = "fluffbreastshyperable"
	size = breastSizeModClass.G

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

func getCompatibleSpecies():
	return [Species.Any]

func getBreastsScale():
	var thesize = getSize()
	return breastSizeModClass.breastSizeToBoneScale(thesize)

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= breastSizeModClass.FLAT):
		return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffFlat/FluffBreastsFlat.tscn"
	return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffBreasts/FluffBreasts.tscn"
