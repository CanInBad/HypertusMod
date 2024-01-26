extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable barbed penis"
	id = "felinepenishyperable"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["barbed", "feline-shaped", "feline"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/FelinePenis/FelinePenis.tscn"

func getTraits():
	return {
		PartTrait.PenisBarbs: true,
		"Hyperable": true,
	}

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"