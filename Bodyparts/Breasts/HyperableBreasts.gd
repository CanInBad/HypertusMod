extends "res://Modules/Z_Hypertus/Misc/ModBodypartBreasts.gd"

func _init():
	visibleName = "hyperable breasts"
	id = "humanbreastshyperable"
	size = breastSizeModClass.G

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= breastSizeModClass.FLAT):
		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
	return "res://Player/Player3D/Parts/Breasts/BreastsScaleable/BreastsScaleable.tscn"

#func OLDgetDoll3DScene():
#	var thesize = getSize()
#	if(thesize <= breastSizeModClass.FLAT):
#		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
#	if(thesize <= breastSizeModClass.A):
#		return "res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn"
#	if(thesize <= breastSizeModClass.B):
#		return "res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn"
#	if(thesize <= breastSizeModClass.C):
#		return "res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn"
#	return "res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn"

# func getBreastsScale():
# 	var thesize = getSize()
# 	return breastSizeModClass.breastSizeToBoneScale(thesize)

func getTooltipInfo():
	var result = []
	result.append("size: " + breastSizeModClass.breastSizeToCupString(getSize()))
	if(getFluidProduction() != null):
		result.append("Capacity: " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml")
		result.append_array(getFluidProduction().getTooltipInfo())
	# result.append("is making bluespace anomalies")
	return Util.join(result, "\n")

func getTraits():
	return {
		"Hyperable": true,
	}

func getCharacterCreatorDesc():
	return "Required to experience the Hypertus mod"
