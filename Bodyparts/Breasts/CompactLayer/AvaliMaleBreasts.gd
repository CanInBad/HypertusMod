extends "res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/AvaliBreasts.gd"

func _init():
	visibleName = "Hyperable Avali Male breasts"
	id = "avaliMalebreastshyperable"
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