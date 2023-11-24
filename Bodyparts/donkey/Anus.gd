extends BodypartAnus

func _init():
	visibleName = "hyperable anus"
	id = "anushyperable"
	var hyperAssOrificeClass = load("res://Modules/Z_Hypertus/Bodyparts/Orifices/HyperAnusOrifice.gd")
	orifice = hyperAssOrificeClass.new()
	orifice.bodypart = weakref(self)

func getCompatibleSpecies():
	return [Species.Any]

# func hasWomb():
# 	return true

func getCharacterCreatorName():
	return "Hyperable Anus" #THIS EXISTED????? if i know this faster i would 🥰

func getCharacterCreatorDesc():
	return "required to experience the hyper mod"

func getAttributesText():
	var curAttribute = .getAttributesText()
	var toAdd = [
		["Bluespace anomalies", "Yes"],
		# ["Has Womb", "Yes"]
	]
	for _i in toAdd:
		curAttribute.append(_i)
	return curAttribute

func getTraits():
	return {
		"PartTrait.Hyperable": true,
	}