extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable knotted penis"
	id = "caninepenishyperable"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "canine-shaped", "canine"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
		"Hyperable": true,
	}


func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"