extends "res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/FluffBreasts.gd"

func _init():
	visibleName = "hyperable fluffy flat chest"
	id = "fluffmalebreastshyperable"
	size = BreastsSize.FOREVER_FLAT

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

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
	return RNG.pick([breastSizeModClass.FOREVER_FLAT, breastSizeModClass.FLAT])	

func getPickableAttributes():
	# var result = .getPickableAttributes() # idk when this will be use in the base bodypart, until then this is real
	var result = {}
	var breastVariants = [
		[breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"],
		[breastSizeModClass.FLAT, "Flat", "Flat breasts (hard mode)"],
	]
	for breastSize in breastSizeModClass.getAll():
		if(GM.main.getCurrentScene().saveData()["debugMode"] == false):
			if(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.T):
				continue
			if not breastSize in breastVariants:
				breastVariants.append([breastSize, breastSizeModClass.breastSizeToString(breastSize), breastSizeModClass.breastSizeToCupString(breastSize)])
		else: #(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.OMEGA): 
			# if not [breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"] in breastVariants:
				# breastVariants.insert(0,[breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"])
			if(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.OMEGA):
				continue
			if not breastSize in breastVariants:
				breastVariants.append([breastSize, breastSizeModClass.breastSizeToString(breastSize), breastSizeModClass.breastSizeToCupString(breastSize)])
			# continue # bruh
	result["breastsize"]= {
		"text": "Change the breast size",
		"textButton": "Breast size",
		"buttonDesc": "Pick the breast size",
		"options": breastVariants,
	}
	return result