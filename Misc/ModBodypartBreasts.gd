extends BodypartBreasts
# class_name BodypartBreasts
var breastSizeModClass = load("res://Modules/Z_Hypertus/Misc/BreastsSizeModi.gd")

func _init():
	limbSlot = LimbTypes.Breasts
	var lactationModClass = load("res://Modules/Z_Hypertus/Misc/LactationMod.gd")
	fluidProduction = lactationModClass.new()
	fluidProduction.bodypart = weakref(self)
	needsProcessing = true
	
func saveData():
	var data = .saveData()
	data["size"] = size
	
	return data

func loadData(_data):
	size = SAVE.loadVar(_data, "size", 0)
	
	.loadData(_data)
	cached_size = getSize()

func loadDataNPC(_data):
	.loadDataNPC(_data)
	cached_size = getSize()

func getSlot():
	return BodypartSlot.Breasts

func getTooltipInfo():
	var result = []
	result.append("size: " + breastSizeModClass.breastSizeToCupString(getSize()))
	if(getFluidProduction() != null):
		result.append("Capacity: " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml")
		result.append_array(getFluidProduction().getTooltipInfo())
	
	return Util.join(result, "\n")

func getLewdSizeAdjective():
	if(size <= breastSizeModClass.FLAT):
		return "flat"
	if(size <= breastSizeModClass.A):
		return RNG.pick(["tiny", "miniature", "little", "petite", "delicate"])
	if(size <= breastSizeModClass.C):
		return RNG.pick(["small", "modest", "cute", "average", "natural", "bouncy"])
	if(size <= breastSizeModClass.DD):
		return RNG.pick(["perky", "generous", "ample", "rounded", "plump", "curvy"])
	if(size <= breastSizeModClass.G):
		return RNG.pick(["curvy", "rounded", "huge", "big", "generous", "alluring"])
	if(size <= breastSizeModClass.H):
		return RNG.pick(["curvy", "rounded", "huge", "big", "lavish", "voluminous", "heavy"])
	if(size <= breastSizeModClass.J):
		return RNG.pick(["large", "weighty", "curvy", "heavy", "impressive", "voluminous"])
	if(size <= breastSizeModClass.M):
		return RNG.pick(["massive", "heavy", "enormous"]) 
	return RNG.pick(["gigantic", "ginormous", "colossal"])
		
func getLewdAdjective():
	return RNG.pick(["soft", "squishy", "nice"])
	
func getLewdName():
	if(size <= breastSizeModClass.FLAT):
		return "breasts"
	
	if(size <= breastSizeModClass.D):
		return RNG.pick(["breasts", "boobs", "tits"])
	if(size <= breastSizeModClass.H):
		return RNG.pick(["breasts", "boobs", "tits", "funbags"])
	
	return RNG.pick(["breasts", "boobs", "tits", "melons", "jugs", "milkies", "milkers", "globes"])

func getLewdDescriptionAndName():
	var text = getLewdAdjective() + " " + getLewdSizeAdjective() + " " + getLewdName()
	return text

func getPickableAttributes():
	# var result = .getPickableAttributes() # idk when this will be use in the base bodypart, until then this is real
	var result = {}
	var breastVariants = [
		# [breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"],
		[breastSizeModClass.FLAT, "Flat", "Flat breasts (hard mode)"],
	]
	for breastSize in breastSizeModClass.getAll():
		if GM.main != null:
			if(GM.main.getCurrentScene().saveData()["debugMode"] == false):
				if(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.T):
					continue
				if not breastSize in breastVariants:
					breastVariants.append([breastSize, breastSizeModClass.breastSizeToString(breastSize), breastSizeModClass.breastSizeToCupString(breastSize)])
		else: #(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.OMEGA): 
			if not [breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"] in breastVariants:
				breastVariants.insert(0,[breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"])
			if(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.OMEGA):
				continue
			if not breastSize in breastVariants:
				breastVariants.append([breastSize, breastSizeModClass.breastSizeToString(breastSize), breastSizeModClass.breastSizeToCupString(breastSize)])
			# continue # bruh
	result["breastsize"]= {
		"text": "Change the breast size",
		"textButton": "Breast size",
		"buttonDesc": "Pick the breast size",
		"options": breastVariants,
	}
	return result
	
func applyAttribute(_attrID: String, _attrValue):
	.applyAttribute(_attrID, _attrValue)
	if(_attrID == "breastsize"):
		size = _attrValue

func getAttributesText():
	return [
		["Breast size", breastSizeModClass.breastSizeToString(getSize())],
		["Bluespace anomalies", "Yes"],
	]

func getCharCreatorData():
	return [
		["size", size],
	]

func getTraits():
	return {
		"Hyperable": true,
	}

func getBaseSize():
	return size

func getSize():
	var resultSize = getBaseSize()
	
	if(size != breastSizeModClass.FOREVER_FLAT && fluidProduction != null):
		resultSize = fluidProduction.getOptimalBreastsSize()
	return resultSize

func safeWhenExposed():
	return false

func induceLactation():
	if(fluidProduction != null && fluidProduction.has_method("induceLactation")):
		fluidProduction.induceLactation()

func processTime(_seconds: int):
	.processTime(_seconds)
	
	var newSize = getSize()
	if(cached_size != newSize):
		cached_size = newSize
		updateAppearance()

func getBreastsScale():
	var thesize = getSize()
	return breastSizeModClass.breastSizeToBoneScale(thesize)

# For animations
func getBreastsAdjustScale():
	var theSize = getSize()
	if(theSize <= breastSizeModClass.FLAT):
		return 0.0
	if(theSize >= breastSizeModClass.L):
		return 1.0
	var aScale = breastSizeModClass.breastSizeToBoneScale(breastSizeModClass.A)
	return (breastSizeModClass.breastSizeToBoneScale(theSize) - aScale) / (breastSizeModClass.breastSizeToBoneScale(breastSizeModClass.L) - aScale)

func getRevealMessage():
	return Util.capitalizeFirstLetter(getLewdDescriptionAndName()) + " got revealed."

func generateDataFor(_dynamicCharacter):
	size = RNG.pick([
	RNG.pick([
		breastSizeModClass.A, breastSizeModClass.B, breastSizeModClass.C, breastSizeModClass.D, breastSizeModClass.DD, breastSizeModClass.DDD,
	]),
	RNG.pick([
		breastSizeModClass.G, breastSizeModClass.H, breastSizeModClass.I, breastSizeModClass.J, breastSizeModClass.L, breastSizeModClass.M
	]),
	RNG.pick([
		breastSizeModClass.N, breastSizeModClass.O, breastSizeModClass.P, breastSizeModClass.Q, breastSizeModClass.R, breastSizeModClass.S, breastSizeModClass.T
	])
	])
