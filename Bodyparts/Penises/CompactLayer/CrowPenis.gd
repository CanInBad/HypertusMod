extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable avian penis"
	id = "avianpenishyperable"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["avian", "tapered"])

func getDoll3DScene():
	return "res://Modules/CrowSpeciesModule/Bodyparts/AvianPenis/CrowPenis.tscn"

func getCharacterCreatorDesc():
	return "(Crow Mod Version)\nRequired to experience the Hypertus mod"

func getTraits():
	return {
		"Hyperable": true,
	}