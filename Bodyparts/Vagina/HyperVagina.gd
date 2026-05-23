extends "res://Modules/Z_Hypertus/Misc/ModBodypartVagina.gd"

func _init():
	visibleName = "hyperable vagina"
	id = "vaginahyperable"

func getCompatibleSpecies():
	return [Species.Any]

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

func getTraits():
	return .getTraits()