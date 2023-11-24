extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "Hyperable Synth penis"
	id = "synthpenishyperable"
	pickedGColor = Color.cyan
	pickedBColor = Color.gray

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["knotted", "ribbed", "synthetic"])

func getDoll3DScene():
	return "res://Modules/SynthSpecies/Bodyparts/SynthPenis/SynthPenis.tscn"

func getTraits():
	return {
		PartTrait.PenisKnot: true,
		PartTrait.PenisRidges: true,
		"PartTrait.Hyperable": true,
	}

func getCharacterCreatorDesc():
	return "The latest and greatest of synth penis. Standard issue.\nrequired to experience the hyper mod"
