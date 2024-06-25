extends "res://Modules/Z_Hypertus/Misc/ModBodypartVagina.gd"

func _init():
	visibleName = "hyperable vagina"
	id = "vaginahyperable"

func getCompatibleSpecies():
	return [Species.Any]

# currently does nothing, will have interaction with perks later

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

func getLewdDescriptionAndName():
	var text = getLewdSizeAdjective() + " " + getLewdAdjective() + " " + getLewdName()
	return text
	# return "hyper dimensional vagina"

func getTraits():
	return {
		"Hyperable": true,
	}