extends "res://Modules/Z_Hypertus/Misc/SpeciesExtend.gd"

func _init():
	id = Species.Human
	
func getVisibleName():
	return "Human"

func getDefaultLegs(_gender):
	return "plantilegs"

func isPlayable():
	return true

func getVisibleDescription():
	return "Your ordinary human"

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
		return "humanpenishyperable"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 10.0],
		[2, 1.0],
		[3, 0.3],
	]

func getSkinType():
	return SkinType.SkinHuman

func generateSkinColors():
	return ColorUtils.generateGenericHumanSkinColors()
