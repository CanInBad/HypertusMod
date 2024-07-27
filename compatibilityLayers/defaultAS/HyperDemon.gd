extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = Species.Demon
	
func getVisibleName():
	return "Demon"

func getDefaultLegs(_gender):
	return "hoofs"

func getDefaultTail(_gender):
	return "demontail"

func getDefaultHorns(_gender):
	return "demonhorns"

func isPlayable():
	return true

func getVisibleDescription():
	return "Your non-friendly neighbors"

func getDefaultHead(_gender):
	return "humanhead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "humanears"

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreastshyperable"
	
	return "humanbreastshyperable"

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vaginahyperable"
	else:
		return null

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "equinepenishyperable"
	else:
		return null

func getAllowedBodyparts():
	return ["knottedequinepenishyperable", "barbedequinepenishyperable"]

func getEggCellOvulationAmount():
	return [
		[1, 0.1],
	]

func npcGenerationWeight():
	return 0.0

func getSkinType():
	return SkinType.SkinAndFur

func generateSkinColors():
	var humanColors = ColorUtils.generateGenericHumanSkinColors()
	#var furryColors = ColorUtils.generateGenericFurryColors()
	#humanColors[2] = RNG.pick(furryColors)
	#humanColors[2] = ColorUtils.generateRandomVibrantColor()
	humanColors[2].v = RNG.randf_rangeX2(0.2, 0.5)
	
	return humanColors
