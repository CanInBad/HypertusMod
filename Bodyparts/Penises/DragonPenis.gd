extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "Obsolete hyperable dragon penis"
	id = "dragonpenismhyper"
	# lengthCM = 22
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return []

func getLewdAdjective():
	return RNG.pick(["knotted", "ribbed", "dragon"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/DragonPenis/DragonPenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
		PartTrait.PenisRidges: true,
		"Hyperable": true,
	}

func getCharacterCreatorName():
	return "OBSOLETE Dragon Hyperable"

func getCharacterCreatorDesc():
	return "OBSOLETE!!! Not Required to experience the Hypertus mod, Obsolete"

func getTooltipInfo():
	var old = .getTooltipInfo()
	return old + "\nOBSOLETE!!!, might conflit with newer penis"