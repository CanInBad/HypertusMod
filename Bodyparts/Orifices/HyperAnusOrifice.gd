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

func getElasticity() -> float:
	var ogValue = .getElasticity()
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("BuffAttribute.HyperAnusElasticity")
	return ogValue * multi

func getResistance() -> float:
	var ogValue = .getResistance()
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("BuffAttribute.HyperAnusResistance")
	return ogValue * multi

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

func isClosedOff():
	if(bodypart == null || bodypart.get_ref().character == null):
		return false
	var character = bodypart.get_ref().getCharacter()
	if(character.hasPerk("Perk.HyperStopSpill")):
		return true
	if(character.getOrificeBlocked(orificeType)):
		return true
	return false
 
# func getAttributesText(): 
# 	return .getAttributesText()

# func saveData(): # so i was thinking if 
# 	var data = .saveData()
# 	var toSave = {

# 	}
# 	data.append(toSave)
# 	return data