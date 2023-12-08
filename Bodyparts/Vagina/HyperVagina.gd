extends "res://Modules/Z_Hypertus/Misc/ModBodypartVagina.gd"

func _init():
	visibleName = "hyperable vagina"
	id = "vaginahyperable"

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
	var text = getLewdSizeAdjective() + " " + getLewdAdjective() + " " + getLewdName()
	return text
	# return "hyper dimensional vagina"

func getTraits():
	return {
		"Hyperable": true,
	}