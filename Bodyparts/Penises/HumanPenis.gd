extends "res://Modules/Z_Hypertus/Misc/ModBodypartPenis.gd"

func _init():
	visibleName = "hyperable human penis"
	id = "humanpenishyperable"
	pickedRColor = null
	pickedGColor = null
	pickedBColor = null

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/HumanPenis/HumanPenis.tscn"

func generateRandomColors(_dynamicCharacter):
	pass

func getTraits():
	return {
		"PartTrait.Hyperable": true,
	}

func getCharacterCreatorDesc():
	return "required to experience the hyper mod"