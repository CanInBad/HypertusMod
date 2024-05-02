extends BodypartVagina
# class_name BodypartVagina

func _init():
	limbSlot = null
	var hyperVagOrificeClass = load("res://Modules/Z_Hypertus/Bodyparts/Orifices/HyperVaginaOrifice.gd")
	orifice = hyperVagOrificeClass.new()
	orifice.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Vagina

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

func getOrificeName():
	return "hyperable pussy"

func safeWhenExposed():
	return false

func hasWomb():
	return true

func getAttributesText():
	var curAttribute = .getAttributesText()
	curAttribute.append(["Bluespace anomalies", "Yes"])
	return curAttribute

func getRevealMessage():
	if(orifice == null):
		return .getRevealMessage()
	
	return Util.capitalizeFirstLetter(orifice.getLoosenessString()) + " pussy got revealed."

func getTraits():
	return {
		"Hyperable": true,
	}

func supportsSkin():
	return false
