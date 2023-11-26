extends "res://Modules/Z_Hypertus/Bodyparts/Breasts/HyperableBreasts.gd"

func _init():
	visibleName = "hyperable male breasts"
	id = "malebreastshyperable"
	size = breastSizeModClass.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["firm", "strong"])

func getLewdName():
	if(size <= breastSizeModClass.A):
		return "pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])

func safeWhenExposed():
	if(size <= breastSizeModClass.A):
		return true
	
	return false

func generateDataFor(_dynamicCharacter):
	pass
