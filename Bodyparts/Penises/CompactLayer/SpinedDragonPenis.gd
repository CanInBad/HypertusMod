extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable spiney dragon penis"
	id = "spinedragonpenishyperable"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any, "dragon"]

func getLewdAdjective():
	return RNG.pick(["knotted", "spined", "dragon", "barbed"])

func getDoll3DScene():
	return "res://Modules/SpinedDragonPenis/Bodyparts/SpineDragonPenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
		PartTrait.PenisRidges: true,
		PartTrait.PenisBarbs: true,
		"Hyperable": true,
	}

func npcGenerationWeight(_dynamicCharacter):
	return 0.1
