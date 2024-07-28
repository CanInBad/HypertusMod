extends "res://Modules/Z_Hypertus/Misc/ModBodypartBreasts.gd"

func _init():
	visibleName = "hyperable lycanroc breasts"
	id = "lycanrocbreastshyperable"
	size = breastSizeModClass.G

func getCompatibleSpecies():
	var speciesList = ["dusklycan", "middaylycan", "midnightlycan"]
	for i in speciesList.duplicate():
		if i+"hyperable" in GlobalRegistry.getAllSpecies():
			speciesList.append(i+"hyperable")
	return speciesList

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "res://Modules/LycanrocSpecies/PortedOverParts/LycanFlatBreats/MiddayBreastsFlat.tscn"
	return "res://Modules/LycanrocSpecies/PortedOverParts/LycanBreasts/MiddayFluffyBreast.tscn"

#Game logic is funky and requires a bit of a hack to get the breasts spawning on the correct genders
func npcGenerationWeight(_dynamicCharacter):
	if(_dynamicCharacter.getGender() in [Gender.Male]):
		return 0.0
	return 1000.0
