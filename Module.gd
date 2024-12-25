extends Module
var fileClass = File.new()
var dirClass = Directory.new()
var shouldLogPrint = false
var forceBreedEdition = false

func getFlags():
	return {
		"HyperPenisCustomSize": flag(FlagType.Text),
		"HyperPenisExperiencedExpansion": flag(FlagType.Bool),
		"HyperPenisExpansionAmount": flag(FlagType.Number),
		"HyperLevelMaxed": flag(FlagType.Bool),
		"HyperLevelMaxedSeenMessage": flag(FlagType.Bool),
		"DayInstall": flag(FlagType.Number),
		# "ForceBreedEdition": flag(FlagType.Bool)
		# "HyperHoleGainLubed": flag(FlagType.Bool),
		# "HyperIntroPrompt": flag(FlagType.Bool),
	}

func registerEventTriggers():
	GM.ES.registerEventTrigger("HypertusNewDay", EventTriggerWeighted.new())

# func resetFlagsOnNewDay(): # so it turns out that sleeping always set to the new day
# 	if GM.main.getModuleFlag(id,"HyperPenisExpansionAmount",0)!=0: # I kinda want to just if GM.main.getModuleFlag(id,"HyperPenisExpansionAmount",0): but idk if it is true or not
# 		GM.main.setModuleFlag(id, "HyperPenisExpansionAmount", 0)

func resetFlagsOnNewDay():
	GM.ES.triggerReact("HypertusNewDay")
	return

func _init():
	id = "Hypertus"
	author = "CanInBad"
	
	perks = [
		"res://Modules/Z_Hypertus/Perks/HyperNoParts.gd",

		"res://Modules/Z_Hypertus/Perks/HyperCum1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperCum2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperCum3.gd",
		"res://Modules/Z_Hypertus/Perks/HyperCum4.gd",
		"res://Modules/Z_Hypertus/Perks/HyperVirility1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperVirility2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperVirility3.gd",
		"res://Modules/Z_Hypertus/Perks/HyperVirility4.gd",

		# "res://Modules/Z_Hypertus/Perks/HyperPenisIncrease1.gd",
		# "res://Modules/Z_Hypertus/Perks/HyperPenisIncrease2.gd",
		# "res://Modules/Z_Hypertus/Perks/HyperPenisIncrease3.gd",
		# "res://Modules/Z_Hypertus/Perks/HyperPenisDecrease1.gd",
		# "res://Modules/Z_Hypertus/Perks/HyperPenisDecrease2.gd",
		# "res://Modules/Z_Hypertus/Perks/HyperPenisDecrease3.gd",

		"res://Modules/Z_Hypertus/Perks/HyperMilkUpSize1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperMilkUpSize2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperMilkUpSize3.gd",
		"res://Modules/Z_Hypertus/Perks/HyperMilkUpSize4.gd",
		"res://Modules/Z_Hypertus/Perks/HyperBreastsIncreaseTimer.gd",
		"res://Modules/Z_Hypertus/Perks/HyperBreastsShouldContinueLactate.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperBreastsFlatCapacity1.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperBreastsFlatCapacity2.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperBreastsFlatCapacity3.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperBreastsFlatCapacity4.gd",
		
		"res://Modules/Z_Hypertus/Perks/HyperWomb1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperWomb2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperWomb3.gd",
		"res://Modules/Z_Hypertus/Perks/HyperWomb4.gd",

		"res://Modules/Z_Hypertus/Perks/HyperHoles1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperHoles2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperHoles3.gd",
		"res://Modules/Z_Hypertus/Perks/HyperHoles4.gd",
		"res://Modules/Z_Hypertus/Perks/HyperSlowNatualSpill.gd",
		"res://Modules/Z_Hypertus/Perks/HyperStopSpill.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperHolesCapacity1.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperHolesCapacity2.gd",
		"res://Modules/Z_Hypertus/Perks/capacityStuff/HyperHolesCapacity3.gd",

	]
	skills = [
		"res://Modules/Z_Hypertus/Skill/Hyper.gd",
	]

	buffs = [
		"res://Modules/Z_Hypertus/Buffs/HyperVaginaCapacityBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/HyperVaginaElasticityBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/HyperVaginaResistanceBuff.gd",

		"res://Modules/Z_Hypertus/Buffs/HyperAnusCapacityBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/HyperAnusElasticityBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/HyperAnusResistanceBuff.gd",

		"res://Modules/Z_Hypertus/Buffs/HyperBreastsFlatCapacityBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/HyperBreastsIncreaseTimerMultiplyer.gd",
		]

	bodyparts = [
		"res://Modules/Z_Hypertus/Bodyparts/Penises/EquinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/DragonPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CaninePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/FelinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/HumanPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Breasts/HyperableBreasts.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Breasts/HyperableMaleBreasts.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Vagina/HyperVagina.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Anus/HyperAnus.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Anus/HyperAnusWomb.gd",

		"res://Modules/Z_Hypertus/Bodyparts/Penises/DragonPenisLegacy.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Breasts/HyperableBreastsLegacy.gd",
	]
	scenes = [
		"res://Modules/Z_Hypertus/Scenes/CustomInputCustomizationPenis.gd",
		"res://Modules/Z_Hypertus/Scenes/RayGunScene.gd",
		"res://Modules/Z_Hypertus/Scenes/BreedEditionConfigScene.gd"
	]
	events = [
		"res://Modules/Z_Hypertus/Events/CustomizationButton.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainHyperXP.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainBackXP.gd",
		"res://Modules/Z_Hypertus/Events/NoHyperablePart.gd",
		"res://Modules/Z_Hypertus/Events/ConvertOldToNew.gd",
		# "res://Modules/Z_Hypertus/Events/BreedEditionUpdateEvent.gd",
		# "res://Modules/Z_Hypertus/Events/BreedEditionConfigEvent.gd"		
	]
	items = [
		"res://Modules/Z_Hypertus/Item/Raygun.gd"
	]
	sexActivities = [
		"res://Modules/Z_Hypertus/SexActivity/DomRayGunUseOnSubPenis.gd",
		"res://Modules/Z_Hypertus/SexActivity/DomRayGunUseOnSelfPenis.gd",
		"res://Modules/Z_Hypertus/SexActivity/DomRayGunUseOnSubBreast.gd",
		"res://Modules/Z_Hypertus/SexActivity/DomRayGunUseOnSelfBreast.gd",
	]

	if OS.has_feature("debug"):
		Log.print("\t/// "+id+": detect that we're in debug")
		shouldLogPrint = true
		events.append("res://Modules/Z_Hypertus/Events/debugPrintStuff.gd")
		# events.append("res://Modules/Z_Hypertus/Events/ConvertOldToNew.gd")
		items.append("res://Modules/Z_Hypertus/Item/HyperPenisPump.gd")
		items.append("res://Modules/Z_Hypertus/Item/HyperBreastPump.gd")

		# Engine.get_main_loop().get_root().add_child(load("res://Modules/Z_Hypertus/_popup/popup.gd"))
		# GlobalRegistry.get_tree().quit()
		# return

var _listBodyPartsCompactLayers = {
		# "non test": _test,
	}

func register():
	var toMerge:Array = readJsons()
	if toMerge[0].size() > 0:
		_listBodyPartsCompactLayers.merge(toMerge[0], true)
		var text:String = id+": [JSON] There are at least a compatibility json file\n"
		for i in toMerge[1]:
			text += "\t- "+i+"\n"
		text = text.trim_suffix("\n")
		logPrintOnDemand(text)

	universalBodyPartsCompactLayer(bodyparts,_listBodyPartsCompactLayers)
	.register()

func postInit():
	registerCompatSpecies()
	moduleRegisterPartSkins()
	announceCurrentEnabledCompactLayer(_listBodyPartsCompactLayers)

func freeMem():
	skinPathsDir.clear()
	skinPaths.clear()
	_species.clear()

var outdatedBodyparts:Dictionary = {
	"dragonpenismhyper": "dragonpenishyperable",
	"breastshyperable": "humanbreastshyperable"
	}

func logPrintOnDemand(txt):
	if shouldLogPrint:
		Log.print(txt)

func logErrorOnDemand(txt):
	if shouldLogPrint:
		Log.error(txt)

const compatibilityDir = "res://Modules/Z_Hypertus/compatibilityLayers"

func readJsons():
	var toReturn:Array = []
	var dictToReturn:Dictionary = {}
	var filesContributed:Array = []
	var _ok1 = dirClass.open(compatibilityDir)
	if _ok1 == OK:
		dirClass.list_dir_begin()
		var fileName = dirClass.get_next()
		while fileName != "":
			var fullPath = compatibilityDir.plus_file(fileName)
			if !dirClass.current_is_dir():
				if fileName.get_extension() == "json":
					var _ok2 = fileClass.open(fullPath,File.READ)
					if _ok2 != OK:
						logErrorOnDemand("Something is wrong while opening file " + fileName + "!\nError code: " + String(_ok2.error))
						fileName = dirClass.get_next()
						continue
					filesContributed.append(fileName)
					var _jsonResult = JSON.parse(fileClass.get_as_text())
					if _jsonResult.error != OK:
						logErrorOnDemand("Parsing " + fullPath.get_file() + " encountered an error!\nError code: " + String(_jsonResult.error))
						fileName = dirClass.get_next()
						continue
					dictToReturn.merge(_jsonResult.result, true)
				elif fileName.matchn("CONF_*"):
					var _name = fileName.trim_prefix("CONF_")
					match _name:
						"speciesForceBreed":
							if !forceBreedEdition:
								forceBreedEdition = true
								logPrintOnDemand("\t ENABLING FORCE BREED EDITION FROM CONFIG")
						"shouldPrint":
							if !shouldLogPrint:
								shouldLogPrint = true
								logPrintOnDemand("\t ENABLING PRINT TO CONSOLE NO MATTER WHAT FROM CONFIG")
			fileName = dirClass.get_next()
		toReturn = [dictToReturn,filesContributed]
	else:
		logErrorOnDemand("Something is wrong while opening directory "+compatibilityDir+"!\nError code: " + String(_ok1))
		return []

	return toReturn

func announceCurrentEnabledCompactLayer(theDict:Dictionary):
	var isAnyEnabled:bool = false
	for modindex in theDict.keys():
		if theDict[modindex].get("enabled") != null:
			if theDict[modindex]["enabled"]:
				isAnyEnabled = true
				break
	if isAnyEnabled:
		var text:String = ""
		text += "  ### "+id+": at least a compatibility layer is activated, in summary we have:\n"
		for modindex in theDict.keys():
			if theDict[modindex].get("enabled") != null:
				if theDict[modindex]["enabled"]:
					var modauthor = theDict[modindex]["author"]
					text += "    - "+modindex+", by: "+modauthor+ "\n"
		text = text.trim_suffix("\n")
		Log.print(text)
		return true
	return false

func universalBodyPartsCompactLayer(bodyparts:Array, theDict:Dictionary):
	for modindex in theDict.keys():
		if theDict[modindex].has("moduleid"):
			if theDict[modindex]["moduleid"] in GlobalRegistry.getModules() or theDict[modindex]["moduleid"] == "*": # the * is always
				var curIndex = theDict[modindex]
				var moduleName = modindex
				var moduleAuthor = curIndex.get("author")
				var moduleID = curIndex["moduleid"]
				if moduleID == '*':
					moduleID = "Vanilla"
				var files = []
				if curIndex.has("files"):
					files = curIndex.get("files")
				var sum = 0
				var total:int
				curIndex["enabled"] = false # no cheating

				var _literallyEverythingElse = (curIndex.has("skinPathDir") || curIndex.has("skinPaths") || curIndex.has("species") || curIndex.has("speciesDir"))
				if len(files)>0:
					total = len(files)
				elif _literallyEverythingElse:
					total = 0
				else:
					logErrorOnDemand(id+": "+moduleName+": |BODYCOMPACT| there aren\'t any file paths in files array, will assume total -1")
					total = -1

				if curIndex.has("skinPathDir"): # Skins
					if dirClass.dir_exists(curIndex.get("skinPathDir")):
						skinPathsDir.append([curIndex.get("skinPathDir"),String(moduleAuthor)])
				
				if curIndex.has("skinPaths"):
					var skinPathsCompat:Array = curIndex.get("skinPaths")
					for path in skinPathsCompat:
						if fileClass.file_exists(path):
							skinPaths.append([path,String(moduleAuthor)])

				# Those are used to checksum. Unfortunatly I made skins a sperate function. I guess I will try to rewrite that later.
				var _processedSpecies11:int = 0 # Total - species
				var _processedSpecies12:int = 0 # Sum - species
				var _processedSpecies21:int = 0 # Total - speciesDir
				var _processedSpecies22:int = 0 # Sum - speciesDir

				if curIndex.has("species"):
					if curIndex.get("species") is Dictionary:
						_processedSpecies11 = curIndex.get("species").size()
						_processedSpecies12 = processSpeciesDict(curIndex.get("species").duplicate(true), moduleName, moduleID)
					elif curIndex.get("species") is Array:
						_processedSpecies11 = curIndex.get("species").size()
						_processedSpecies12 = processSpeciesArray(curIndex.get("species").duplicate(true), moduleName, moduleID)
					else:
						logErrorOnDemand(id+": "+moduleName+" ("+moduleID+"): key \"species\" has other types than Dictionary or Array!")
				
				if curIndex.has("speciesDir"):
					var _dirClass = Directory.new()
					var _dictOfSpeciesPath = {}
					for path in curIndex.get("speciesDir"):
						var _ok1 = _dirClass.open(path)
						if _ok1 == OK:
							_dirClass.list_dir_begin(true)
							var file_name = _dirClass.get_next()
							while file_name != "":
								if !_dirClass.current_is_dir():
									if file_name.get_extension() == "gd":
										var tempSpe = load(path.plus_file(file_name))
										var speciesObject = tempSpe.new()
										var speciesID = speciesObject.id
										_dictOfSpeciesPath[speciesID] = path.plus_file(file_name)
										_processedSpecies21 += 1
								file_name = _dirClass.get_next()
					if _dictOfSpeciesPath.size() > 0:
						_processedSpecies22 += processSpeciesDict(_dictOfSpeciesPath, moduleName, moduleID)
				
				total += _processedSpecies11 + _processedSpecies21
				sum += _processedSpecies12 + _processedSpecies22



				if (_processedSpecies11 == _processedSpecies12) && (_processedSpecies11 != 0):
					curIndex["enabled"] = true
				if (_processedSpecies21 == _processedSpecies22) && (_processedSpecies21 != 0):
					curIndex["enabled"]= true

				if total > 0: # bodyparts
					for item in files:
						var fileName = item.get_file()
						if fileClass.file_exists(item):
							if not(item in bodyparts):
								bodyparts.append(item)
								if item in bodyparts:
									logPrintOnDemand(id+": "+moduleName+" ("+moduleID+"): "+fileName+" bodypart compatibility layer activated!")
									sum += 1
							else:
								logErrorOnDemand(id+": "+moduleName+" ("+moduleID+"): "+fileName+" already exists in the bodyparts array!")
								total -= 1
						else:
							logErrorOnDemand(id+": ERROR! "+moduleName+"\'s ("+moduleID+") file: \""+item+"\" do not exist!")
							total -= 1
			
				if sum != total:
					if sum == 0:
						logErrorOnDemand(id+": ## "+moduleName+" ("+moduleID+"): compatibility layer fail to load ##\n")
						continue
					if sum < total and sum > 0:
						logErrorOnDemand(id+": ## "+moduleName+" ("+moduleID+"): compatibility layer partially loaded ##\n")
						continue
					logErrorOnDemand(id+": ## "+moduleName+" ("+moduleID+"): compatibility layer ..... you know you shouldn't set supposeTotal right? its there for me to learn default value in function\n")
					continue
				else:
					logPrintOnDemand(id+": ## "+moduleName+" ("+moduleID+"): compatibility layer successfully activated! ##\n")
					curIndex["enabled"] = true
				
		else:
			logErrorOnDemand(id+": ## the index "+modindex+" ("+theDict[modindex]+") has no moduleid key")

var skinPathsDir = [
	["res://Modules/Z_Hypertus/Partskins/HumanPenisHyperableAce", "AverageAce"],
	["res://Modules/Z_Hypertus/Partskins/FelinePenisHyperableAce", "AverageAce"],
	["res://Modules/Z_Hypertus/Partskins/EquinePenisHyperableAce", "AverageAce"],
	["res://Modules/Z_Hypertus/Partskins/DragonPenisHyperableAce", "AverageAce"],
	["res://Modules/Z_Hypertus/Partskins/CaninePenisHyperableAce", "AverageAce"],
]
var skinPaths = []

func moduleRegisterPartSkins():

	var paths = skinPathsDir # directory

	var skins = skinPaths # stright to the gd file

	for pair in paths: # resolve directory to path for skin files
		if pair is Array:
			var path = pair[0]
			var skinAuthor = pair[1]
			if dirClass.open(path) == OK:
				dirClass.list_dir_begin()
				var fileName = dirClass.get_next()
				while fileName != "":
					if !dirClass.current_is_dir():
						var tempArray:Array = []
						tempArray.append(path+"/"+fileName)
						tempArray.append(skinAuthor)
						skins.append(tempArray)
						logPrintOnDemand(id+": [SKINS] Added "+fileName+" (by: "+skinAuthor+") to skins")
					fileName = dirClass.get_next()
			else:
				logErrorOnDemand(id+": [SKINS] "+path+" does not exist!")
		else:
			logErrorOnDemand(id+": [SKINS] "+ String(pair) + " is still in old format")

	for pair in skins: # actually the part that register skins
		if pair is Array:
			var path:String = String(pair[0])
			var skinAuthor = pair[1]
			if skinAuthor == null || skinAuthor.empty():
				skinAuthor = "Unknown"
			if fileClass.file_exists(path):
				GlobalRegistry.registerPartSkin(path,skinAuthor)
			else: logErrorOnDemand(id+": [SKINS] "+ String(path) + " does not exist")
		else:
			logErrorOnDemand(id+": [SKINS] "+ String(pair) + " is still in old format")

var _species = {}

func processSpeciesDict(path:Dictionary = {}, moduleName:String = "", moduleID:String = "") -> int:
	if path.size() < 1:
		logErrorOnDemand("processSpeciesDict is called but first argument is empty...."+" {0} ({1})".format([moduleName, moduleID]))
		return 0
	var toReturn:int = 0
	var species:Dictionary = path
	for idS in species:
		if idS in GlobalRegistry.allSpecies:
			if fileClass.file_exists(species[idS]):
				if idS in _species:
					logPrintOnDemand(id+": "+moduleName+" ("+moduleID+"): Overwritting species "+idS+" with "+ species[idS])
				_species[idS] = [species[idS], false] # make them overwrite. we wil be processing this data later.
				if GlobalRegistry.getSpecies(idS).getDefaultAnus(Gender.Male) == "anuswomb" || forceBreedEdition:
					if !forceBreedEdition:
						logPrintOnDemand(id+": "+moduleName+" ("+moduleID+"): Marking "+idS+" with "+ species[idS])
					_species[idS][1] = true
				logPrintOnDemand(id+": "+moduleName+" ("+moduleID+"): species "+ idS + " has been put up to processing")
				toReturn += 1
			else:
				logErrorOnDemand(id+": "+moduleName+" ("+moduleID+"): species "+ idS + " does not have valid path. ("+species[idS]+")")
		else:
			logPrintOnDemand(id+": "+moduleName+" ("+moduleID+"): species "+ idS + " has not been registered, skipping....")
	return toReturn

func processSpeciesArray(path:Array = [], moduleName:String = "", moduleID:String = "") -> int:
	if path.size() < 0:
		logErrorOnDemand("processSpeciesArray is called but first argument is empty...."+" {0} ({1})".format([moduleName, moduleID]))
		return 0
	var species:Array = path
	var speciesPass:Dictionary = {}
	for specie in species: # bad naming scheme but whatever
		if fileClass.file_exists(specie):
			var tempSpecies = load(specie)
			var speciesObject = tempSpecies.new()
			speciesPass[speciesObject.id] = specie

	return processSpeciesDict(speciesPass, moduleName, moduleID)

func registerCompatSpecies():
	if _species.empty():
		logPrintOnDemand(id+": [SPECIES] == NO SPECIES IN LIST! SKIPPING === ")
	else:
		logPrintOnDemand(id+": [SPECIES]"+"\tBegain registering species.. this will break stuff for sure...")
		if forceBreedEdition:
			logPrintOnDemand(id+": [SPECIES]"+"\tFORCING ANUS WOMB AS DEFAULT FOR EVERY SPECIES THAT IS RE-REGISTERED")

		for specie in _species: # R stands for RAW!!!!!, I sure hope people don't review my code....
			if specie in GlobalRegistry.allSpecies:
				if fileClass.file_exists(_species[specie][0]):
					var _ok = GlobalRegistry.allSpecies.erase(specie)
					logPrintOnDemand(id+": [SPECIES] Deleted "+specie+" from GlobalRegistry")
					var _ok2 = GlobalRegistry.registerSpecies(_species[specie][0])
					logPrintOnDemand(id+": [SPECIES] Registered "+specie+" to GlobalRegistry")
					if _species[specie][1]:
						if GlobalRegistry.getSpecies(specie).get("anus") != null:
							GlobalRegistry.getSpecies(specie).set("anus", "anuswombhyperable")
							if !(forceBreedEdition):
								logPrintOnDemand(id+": [SPECIES] Set "+specie+" to have anuswomb")
				else:
					logErrorOnDemand(id+": [SPECIES] Filepath "+_species[specie]+" does not exist.")