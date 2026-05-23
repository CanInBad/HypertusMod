extends "res://Modules/Z_Hypertus/Misc/ModBodypartVagina.gd"

func _init():
	visibleName = "vagina"
	id = "vaginaEggshyperable"

func getCompatibleSpecies():
	return [Species.Any]

func shouldOvulateWithBigEggs() -> bool:
	return true

func getCharacterCreatorName():
	return "Vagina (lays eggs)"

func getCharacterCreatorDesc():
	return "A vagina that will lay eggs instead of doing live birth"

func getTraits() -> Dictionary:
	var toReturn:Dictionary = .getTraits()
	toReturn[PartTrait.LaysEggs] = true
	return toReturn

func getTransformGrowMessage(_context:Dictionary) -> String:
	return .getTransformGrowMessage(_context)+" This one is special too.. in some way.."

func getTransformMorphMessage(_context:Dictionary) -> String:
	return .getTransformMorphMessage(_context)+" This one is special too.. in some way.."
