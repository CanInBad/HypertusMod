extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable deer penis"
	id = "deerpenishyperable"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["deer", "tapered", "flared"])

func getDoll3DScene():
	return "res://Modules/DeerSpeciesModule/Bodyparts/DeerPenis/DeerPenis.tscn"

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"