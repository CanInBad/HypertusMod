extends "res://Modules/Z_Hypertus/Misc/ModBodypartAnus.gd"

func _init():
	visibleName = "hyperable anus"
	id = "anuswombhyperable"

func getCompatibleSpecies():
	return [Species.Any]

func hasWomb():
	return true

func getCharacterCreatorName():
	return "Hyperable Anus (with womb)"

func getCharacterCreatorDesc():
	return "Unique kind of anus that also has a connection to the womb. By picking this you will be able to get pregnant from having anal sex\nrequired to experience the hyper mod"

func getAttributesText():
	var curAttribute = .getAttributesText()
	var toAdd = [
		["Has Womb", "Yes"]
	]
	for _i in toAdd:
		curAttribute.append(_i)
	return curAttribute

func getTraits():
	return {
		"PartTrait.Hyperable": true,
	}