extends "./DragonPenis.gd"

func _init():
	visibleName = "Obsolete hyperable dragon penis"
	id = "dragonpenismhyper"
	# lengthCM = 22

func getCompatibleSpecies():
	return []

func getCharacterCreatorName():
	return "OBSOLETE " + .getCharacterCreatorName()

func getCharacterCreatorDesc():
	return "OBSOLETE!!! Not Required to experience the Hypertus mod, Obsolete"

func getTooltipInfo():
	return "THIS IS A LEGACY CONTENT!\n" + .getTooltipInfo()

func getTraits():
	var old = .getTraits()
	old["old"] = true
	return old