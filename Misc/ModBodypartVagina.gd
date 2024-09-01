extends BodypartVagina

func _init():
	limbSlot = null
	var hyperVagOrificeClass = load("res://Modules/Z_Hypertus/Bodyparts/Orifices/HyperVaginaOrifice.gd")
	orifice = hyperVagOrificeClass.new()
	orifice.bodypart = weakref(self)
	needsProcessing = true

func getTooltipInfo():
	var text = .getTooltipInfo()
	return text

func getOrificeName():
	return "hyperable pussy"

func getAttributesText():
	var curAttribute = .getAttributesText()
	curAttribute.append(["Bluespace anomalies", "Yes"])
	return curAttribute

func getTraits():
	return {
		"Hyperable": true,
	}

func supportsSkin():
	return false
