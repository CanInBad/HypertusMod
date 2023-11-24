extends BodypartAnus

func _init():
	visibleName = "hyperable anus"
	id = "anuswombhyperable"
	var hyperAssOrificeClass = load("res://Modules/Z_Hypertus/Bodyparts/Orifices/HyperAnusOrifice.gd")
	orifice = hyperAssOrificeClass.new()
	orifice.bodypart = weakref(self)

func getCompatibleSpecies():
	return [Species.Any]

func hasWomb():
	return true

func getCharacterCreatorName():
	return "Hyperable Anus (with womb)"

func getCharacterCreatorDesc():
	return "Unique kind of anus that also has a connection to the womb. By picking this you will be able to get pregnant from having anal sex\required to experience the hyper mod"

func getAttributesText():
	var curAttribute = .getAttributesText()
	var toAdd = [
		["Bluespace anomalies", "Yes"],
		["Has Womb", "Yes"]
	]
	for _i in toAdd:
		curAttribute.append(_i)
	return curAttribute

func getTraits():
	return {
		"PartTrait.Hyperable": true,
	}