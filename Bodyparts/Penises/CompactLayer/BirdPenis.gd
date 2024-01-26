extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable avian penis"
	id = "ACEavianpenishyperable"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "avian"])

func getDoll3DScene():
	return "res://Modules/Ace'sAvairyMod/Bodyparts/BirdDick/BirdPenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
		"Hyperable": true,
	}
