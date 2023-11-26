extends BodypartAnus
# class_name BodypartAnus

func _init():
	limbSlot = null
	var hyperAssOrificeClass = load("res://Modules/Z_Hypertus/Bodyparts/Orifices/HyperAnusOrifice.gd")
	orifice = hyperAssOrificeClass.new()
	orifice.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Anus

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	var text = ""
	if(orifice != null):
		text += orifice.getTooltipInfo()
	var theChar = getCharacter()
	if(GM.pc != null && GM.pc.hasPerk(Perk.BreedExtraTooltipInfo) && theChar != null && theChar.hasWombIn(getSlot())):
		var menstrualCycle = theChar.getMenstrualCycle()
		if(menstrualCycle != null):
			if(text != ""):
				text += "\n"
			text += "Cycle phase: "+str(CycleStage.getVisibleActionName(menstrualCycle.getCurrentStage()))
			text += "\nBreed chance: "+str(Util.roundF(menstrualCycle.getRoughChanceOfBecomingPregnant(), 1))+"%"
			text += "\nFertility: "+str(Util.roundF(theChar.getFertility()*100.0, 1))+"%"
	return text
# 
func getAttributesText():
	var curAttribute = .getAttributesText()
	var toAdd = [
		["Bluespace anomalies", "Yes"]
	]
	for i in toAdd:
		curAttribute.append(i)
	return curAttribute

func getOrificeName():
	return "hyperable anus"

func safeWhenExposed():
	return false

func getRevealMessage():
	if(orifice == null):
		return .getRevealMessage()
	
	return Util.capitalizeFirstLetter(orifice.getLoosenessString()) + " anus got revealed."

func supportsSkin():
	return false
