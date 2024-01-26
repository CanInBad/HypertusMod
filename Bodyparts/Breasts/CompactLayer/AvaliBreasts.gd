extends "res://Modules/Z_Hypertus/Misc/ModBodypartBreasts.gd"

func _init():
	visibleName = "hyperable Avali breasts"
	id = "avalibreastshyperable"
	size = breastSizeModClass.G

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return ["avali"]	

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

func getBreastsScale():
	var thesize = getSize()
	return breastSizeModClass.breastSizeToBoneScale(thesize)

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= breastSizeModClass.FLAT):
		return "res://Modules/Avali Species/BodyParts/AvaliBreastsFlat/AvaliBreastsFlat.tscn"
	return "res://Modules/Avali Species/BodyParts/AvaliBreastsScaleable/AvaliBreastsScaleable.tscn"

func generateDataFor(_dynamicCharacter): # does this even work?
	size = RNG.pick([
		breastSizeModClass.A, breastSizeModClass.B, breastSizeModClass.C, breastSizeModClass.D, breastSizeModClass.DD, breastSizeModClass.DDD,
	])
