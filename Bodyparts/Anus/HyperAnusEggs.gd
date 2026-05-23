extends "res://Modules/Z_Hypertus/Misc/ModBodypartAnus.gd"

func _init():
	visibleName = "hyperable cloaca"
	id = "anusEggshyperable"

func getCompatibleSpecies():
	return [Species.Any]

func hasWomb():
	return true

func shouldOvulateWithBigEggs() -> bool:
	return true

func getCharacterCreatorName():
	return "Hyperable Cloaca (lays eggs)"

func getCharacterCreatorDesc():
	return "Unique kind of anus that can lay fertilized eggs\nRequired to experience the Hypertus mod"

func getTraits():
	return {
		PartTrait.AnusWomb: true,
		PartTrait.LaysEggs: true,
	}

func getTransformGrowMessage(_context:Dictionary) -> String:
	return .getTransformGrowMessage(_context)+" This one is special too.. in some way.."

func getTransformMorphMessage(_context:Dictionary) -> String:
	return .getTransformMorphMessage(_context)+" This one is special too.. in some way.."
