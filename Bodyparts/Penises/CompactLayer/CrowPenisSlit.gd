extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable penis slit"
	id = "avianpenisslithyperable"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["slitted", "tapered"])

func getDoll3DScene():
	return "res://Modules/CrowSpeciesModule/Bodyparts/AvianPenis/CrowPenis_slit.tscn"

func getCharacterCreatorDesc():
	return "A tapered penis with a genital slit and no balls (visually, the game will still act like you have balls). Also the chastity cage variant is up to your intereptation.\nRequired to experience the Hypertus mod"

func getTraits():
	return {
		"Hyperable": true,
	}