extends "MiddayBreasts.gd"

func _init():
	visibleName = "hyperable lycanroc flat chest"
	id = "lycanrocmalebreastshyperable"
	size = breastSizeModClass.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["firm", "strong"])

func getLewdName():
	if(size <= breastSizeModClass.A):
		return "pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])

#Game logic is funky and requires a bit of a hack to get the breasts spawning on the correct genders
func npcGenerationWeight(_dynamicCharacter):
	if(_dynamicCharacter.getGender() == Gender.Male):
		return 100000.0
	return 0.0

