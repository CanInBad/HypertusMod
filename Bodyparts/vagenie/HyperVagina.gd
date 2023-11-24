extends BodypartVagina

func _init():
	visibleName = "hyperable vagina"
	id = "vaginahyperable"
	var hyperVagOrificeClass = load("res://Modules/Z_Hypertus/Bodyparts/Orifices/HyperVaginaOrifice.gd")
	orifice = hyperVagOrificeClass.new()
	orifice.bodypart = weakref(self)

func getCompatibleSpecies():
	return [Species.Any]

# currently does nothing, will have interaction with perks later

func getCharacterCreatorDesc():
	return "required to experience the hyper mod"

func getLewdSizeAdjective():
	return ""

func getLewdAdjective():
	return ""

func getLewdDescriptionAndName():
	# var text = getLewdSizeAdjective() + " " + getLewdAdjective() + " " + getLewdName()
	# return text
	return "hyper dimensional vagina"

func getAttributesText():
	var curAttribute = .getAttributesText()
	curAttribute.append(["Bluespace anomalies", "Yes"])
	return curAttribute

func getTraits():
	return {
		"PartTrait.Hyperable": true,
	}