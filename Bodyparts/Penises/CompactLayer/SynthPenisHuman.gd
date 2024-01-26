extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "Hyperable Synth Human Penis"
	id = "synthpenishumanhyperable"
	pickedGColor = Color.gray
	pickedBColor = RNG.pick([Color.blue, Color.cyan, Color.red])

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["ridged", "synthetic"])

func getDoll3DScene():
	return "res://Modules/SynthSpecies/Bodyparts/SynthPenisHuman/SynthPenisHuman.tscn"

func getCharacterCreatorDesc():
	return "the oldest model of Synth penis. Sheath and human dick combined into one.\nRequired to experience the Hypertus mod"

func getTraits():
	return {
		"Hyperable": true,
	}
