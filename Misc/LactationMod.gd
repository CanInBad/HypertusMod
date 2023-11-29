extends FluidProduction
# class_name Lactation
var breastSizeModClass = load("res://Modules/Z_Hypertus/Misc/BreastsSizeModi.gd")

var lactationTimer = 0
var lactationProgress = 0.0

func induceLactation():
	var pc = getCharacter()
	var multi = 1
	if pc != null:
		multi += pc.getCustomAttribute("HyperBreastsIncreaseTimerMultiplyer")
	lactationTimer = Util.maxi(lactationTimer * multi, 60*60*24*7 * multi)

func afterMilked():
	var pc = getCharacter()
	if(!shouldProduce()):
		if(RNG.chance(90)): # if we're not lactating milking will make us lactate with 10% chance
			if !pc.hasPerk("HyperBreastsShouldContinueLactate" and RNG.chance(3)): 
				return # if we have the perk only fail to lactate 3% of the time so basically most of the time you will lactate
			return
	
	lactationTimer = Util.maxi(lactationTimer, 60*60*24*2)

func stimulate():
	lactationProgress += RNG.randf_range(0.03, 0.10)
	if(lactationProgress > 0.3 && RNG.chance(lactationProgress * 10.0)):
		if(!shouldProduce()):
			induceLactation()
			return true
		else:
			afterMilked()
	return false

func shouldProduce():
	return lactationTimer > 0 # or isPregnant()

func getCapacity() -> float:
	var breasts = getBodypart()
	var size = breasts.getSize()
	
	return getCapacityForSize(size)

func getCapacityForSize(size):
	if(size == breastSizeModClass.FOREVER_FLAT):
		return 0.0
	var pc = getCharacter()
	var flatCapIncrease = 1
	if pc !=null:
		flatCapIncrease += pc.getCustomAttribute("HyperBreastsFlatCapacityBuff")
	
	return breastSizeModClass.breastSizeToMilkAmount(size)*100.0 * flatCapIncrease #round(0.0 + size*size*100.0)

func getOptimalBreastsSize():
	var baseSize = getBodypart().getBaseSize()
	if(baseSize == breastSizeModClass.FOREVER_FLAT):
		return baseSize
	var fluidAmount = getFluidAmount()
	
	var maxAdditionalSize = 0
	if(shouldProduce()):
		maxAdditionalSize += 1
	
	var pc = getCharacter()
	if(pc != null):
		baseSize += pc.getCustomAttribute(BuffAttribute.BreastsSize)
		maxAdditionalSize += pc.getCustomAttribute(BuffAttribute.BreastsMaxLactatingSize)
	
	if(maxAdditionalSize <= 0):
		return Util.maxi(baseSize + maxAdditionalSize, breastSizeModClass.FLAT)
		
	for _i in range(0, maxAdditionalSize):
		var capacity = getCapacityForSize(baseSize + _i)
		if(capacity <= 0.0):
			continue
		var level = clamp(fluidAmount/capacity, 0.0, 1.0)
		if(level < 0.9):
			return baseSize + _i
	return baseSize + maxAdditionalSize

func getFluidLevelForOptimalSize() -> float:
	var maxSize = getBodypart().getBaseSize()
	if(maxSize != breastSizeModClass.FOREVER_FLAT):
		var pc = getCharacter()
		if(pc != null):
			maxSize += pc.getCustomAttribute(BuffAttribute.BreastsSize)
			maxSize += pc.getCustomAttribute(BuffAttribute.BreastsMaxLactatingSize)
			maxSize += 1
	
		
	var capacity:float = getCapacityForSize(maxSize)
	if(capacity < 0.01):
		return 0.0
	
	return clamp(getFluidAmount() / capacity, 0.0, 1.0)

func processTime(seconds: int):
	.processTime(seconds)
	
	var pc = getCharacter()
	if(pc != null):
		if(pc.getPregnancyProgress() >= 0.33 && lactationTimer < 60*60*24*10):
			lactationTimer += seconds * 3 * (1+pc.getCustomAttribute("HyperBreastsIncreaseTimerMultiplyer"))
	
	if(lactationTimer > 0):
		lactationTimer -= seconds
	if(lactationTimer < 0):
		lactationTimer = 0
	if(lactationProgress > 0.0):
		lactationProgress -= float(seconds)/float(60*60*24*5)
		if(lactationProgress <= 0.0):
			lactationProgress = 0.0
		
func getProductionSpeedPerHour() -> float:
	var pc = getCharacter()
	if !shouldProduce():
		if pc.hasPerk("MilkStopNonProdDrain"):
			return 0.0
		return -5.0
		
	var mult = 1.0
		
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.BreastsMilkProduction)
		
	return getCapacity() / 30.0 * mult

func getFluidSource():
	return FluidSource.Breasts

func saveData():
	var data = .saveData()
	data["lactationTimer"] = lactationTimer
	data["lactationProgress"] = lactationProgress
	
	return data

func loadData(_data):
	lactationTimer = SAVE.loadVar(_data, "lactationTimer", 0)
	lactationProgress = SAVE.loadVar(_data, "lactationProgress", 0.0)
	
	.loadData(_data)
