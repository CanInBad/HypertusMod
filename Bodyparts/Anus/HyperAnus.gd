extends "res://Modules/Z_Hypertus/Misc/ModBodypartAnus.gd"

func _init():
	visibleName = "hyperable anus"
	id = "anushyperable"

func getCompatibleSpecies():
	return [Species.Any]

# func hasWomb():
# 	return true

func getCharacterCreatorName():
	return "Hyperable Anus" #THIS EXISTED????? if i know this faster i would 🥰

func getCharacterCreatorDesc():
	return "required to experience the hyper mod"

func getTraits():
	return {
		"Hyperable": true,
	}