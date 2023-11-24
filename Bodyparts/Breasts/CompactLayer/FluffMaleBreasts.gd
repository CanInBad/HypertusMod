extends "res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/FluffBreasts.gd"

func _init():
	visibleName = "hyperable fluffy flat chest"
	id = "fluffmalebreastshyperable"
	size = BreastsSize.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["firm", "strong", "fluffy", "furry"])

func getLewdName():
	if(size <= BreastsSize.A):
		return "fluffy pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])

func safeWhenExposed():
	if(size <= BreastsSize.A):
		return true
	
	return false

func generateDataFor(_dynamicCharacter):
	pass
