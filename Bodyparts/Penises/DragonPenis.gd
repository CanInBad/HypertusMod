extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable dragon penis"
	id = "dragonpenismhyper"
	lengthCM = 22
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "ribbed", "dragon"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/DragonPenis/DragonPenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
		PartTrait.PenisRidges: true,
		"PartTrait.Hyperable": true,
	}


func getCharacterCreatorDesc():
	return "required to experience the hyper mod"