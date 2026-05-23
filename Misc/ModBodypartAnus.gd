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
	
func getTraits():
	return {
		"Hyperable": true,
	}

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

func supportsSkin():
	return false
