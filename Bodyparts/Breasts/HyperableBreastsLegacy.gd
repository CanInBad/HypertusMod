extends "./HyperableBreasts.gd"

func _init():
	visibleName = "legacy hyperable breasts"
	id = "breastshyperable"
	size = breastSizeModClass.G

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return []

func getTooltipInfo():
	var result = "THIS IS A LEGACY CONTENT!\n"
	result += .getTooltipInfo()
	return result

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

func getTraits():
	var old = .getTraits()
	old["old"] = true
	return old