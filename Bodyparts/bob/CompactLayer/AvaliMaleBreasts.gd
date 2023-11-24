extends "res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/AvaliBreasts.gd"

func _init():
	visibleName = "Avali Male breasts"
	id = "avaliMalebreasts"
	size = breastSizeModClass.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["fluffy", "strong"])

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
