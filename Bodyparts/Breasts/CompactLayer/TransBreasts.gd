extends "res://Modules/Z_Hypertus/Misc/ModBodypartBreasts.gd"

func _init():
	visibleName = "Hyperable Flat Chest (Trans Scar)"
	id = "transbreastshyperable"
	size = breastSizeModClass.FOREVER_FLAT

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= breastSizeModClass.FLAT):
		return "res://Modules/Misc. Bodyparts/Bodyparts/TransBreasts/TransFlat.tscn"
	return "res://Modules/Misc. Bodyparts/Bodyparts/TransBreasts/TransFlat.tscn"

func safeWhenExposed():
	if(size <= breastSizeModClass.A):
		return true

func generateDataFor(_dynamicCharacter):
	pass

func getCharacterCreatorDesc():
	return "Npcs wont generate with this sadly" \
	+ "\nRequired to experience the Hypertus mod"

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

#func npcGenerationWeight(_dynamicCharacter):
#	return 3.0
