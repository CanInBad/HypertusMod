extends Orifice
# class_name VaginaOrifice

func _init():
	orificeType = OrificeType.Vagina
	
func getCapacity() -> float:
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("HyperVaginaCapacity")
	return round((100.0 + 50.0 * looseness * looseness) * multi)

func getElasticity() -> float:
	var ogValue = .getElasticity()
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("HyperVaginaElasticity")
	return ogValue*multi

func getResistance() -> float:
	var ogValue = .getResistance()
	var multi = 1.0
	var pc = bodypart.get_ref().getCharacter()
	if(pc != null):
		multi += pc.getCustomAttribute("HyperVaginaResistance")
	return ogValue*multi

func getComfortableInsertion() -> float: 
	# var multi = 1.0
	# var pc = bodypart.get_ref().getCharacter() 
	# if(pc != null): # I don't think this is necessary but ill think about it
	# 	multi += pc.getCustomAttribute("HyperVaginaComfortableInsertion")
	return 10.0 + pow(looseness, 2.0) #* multi

# func hoursPassed(_howmuch): #recovery is defined by elasticity
# 	var minLoose = getMinLooseness()
	
# 	if(abs(looseness - minLoose) <= 0.001):
# 		looseness = minLoose
# 		return
	
# 	var elast = getElasticity()
# 	for _i in range(_howmuch):
# 		var rem = pow(abs(looseness - minLoose), 0.1) / 50.0
# 		if(rem < 0.005):
# 			rem = 0.005
# 		if(rem > abs(looseness - minLoose)):
# 			rem = abs(looseness - minLoose)
			
# 		if(looseness > minLoose):
# 			if(!isOrificeBlockedFromRecovering()):
# 				looseness -= rem * elast
# 		elif(looseness < minLoose):
# 			looseness += rem / elast
# 	if(looseness < 0.0):
# 		looseness = 0.0

func getNaturalDrain() -> float:
	var pc = bodypart.get_ref().getCharacter()
	if pc.hasPerk("HyperSlowNatualSpill"):
		return 5.0/3.0
	return 5.0

func getNaturalSpill() -> float:
	var pc = bodypart.get_ref().getCharacter()
	if pc.hasPerk("HyperSlowNatualSpill"):
		return 0.33
	return 1.0

func isClosedOff():
	if(bodypart == null || bodypart.get_ref().character == null):
		return false
	var character = bodypart.get_ref().getCharacter()
	if(character.hasPerk("HyperStopSpill")):
		return true
	if(character.getOrificeBlocked(orificeType)):
		return true
	return false

# func getAttributesText():
# 	var currAttributes = .getAttributesText()
# 	currAttributes.append(["Bluespace anomalies", "Yes"])
# 	return currAttributes
