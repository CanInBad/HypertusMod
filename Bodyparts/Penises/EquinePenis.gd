extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable flared penis"
	id = "equinepenishyperable"
	lengthCM = 26
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["flared", "horse-shaped", "horse"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/EquinePenis/EquinePenis.tscn"

func getPenisScale():
	return max(0.1 + (lengthCM - 5.0) / 21.0, 0.3)
	# return 0.1 + (lengthCM - 5.0) / 21.0

func getTraits():
	return {
		PartTrait.PenisFlare: true,
		"PartTrait.Hyperable": true,
	}

func getCharacterCreatorDesc():
	return "required to experience the hyper mod"