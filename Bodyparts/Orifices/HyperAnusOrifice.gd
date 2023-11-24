extends Orifice
# class_name AnusOrifice

func _init():
	orificeType = OrificeType.Anus

func getCapacity() -> float:
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("BuffAttribute.HyperAnusCapacity")
	return round(500.0 + 50.0 * looseness * looseness * multi)

func getBaseElasticity() -> float:
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("BuffAttribute.HyperAnusElasticity")
	return 1.5 * multi

func getBaseResistance() -> float:
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("BuffAttribute.HyperAnusResistance")
	return 0.8 * multi

func getNaturalDrain() -> float:
	var pc = bodypart.get_ref().getCharacter()
	if pc.hasPerk("Perk.HyperSlowNatualSpill"):
		return 5.0/3.0
	return 5.0

func getNaturalSpill() -> float:
	var pc = bodypart.get_ref().getCharacter()
	if pc.hasPerk("Perk.HyperSlowNatualSpill"):
		return 1.0/3.0
	return 1.0

func getOverstuffedSpill() -> float:
	var pc = bodypart.get_ref().getCharacter()
	if pc.hasPerk("Perk.HyperStopOverfill"):
		return 0.0
	return 20.0
 
# func getAttributesText(): 
# 	return .getAttributesText()

# func saveData(): # so i was thinking if 
# 	var data = .saveData()
# 	var toSave = {

# 	}
# 	data.append(toSave)
# 	return data