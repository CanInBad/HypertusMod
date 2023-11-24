extends Module
var fileClass = File.new()

func getFlags():
	return {
		"HyperPenisCustomSize": flag(FlagType.Number),
	}

func _init():
	id = "Hypertus"
	author = "CanInBad"
	
	perks = [
	]

	buffs = [
		"Modules/Z_Hypertus/Buffs/HyperVaginaCapacityBuff.gd",
		"Modules/Z_Hypertus/Buffs/HyperVaginaElasticityBuff.gd",
		"Modules/Z_Hypertus/Buffs/HyperVaginaResistanceBuff.gd",

		"Modules/Z_Hypertus/Buffs/HyperAnusCapacityBuff.gd",
		"Modules/Z_Hypertus/Buffs/HyperAnusElasticityBuff.gd",
		"Modules/Z_Hypertus/Buffs/HyperAnusResistanceBuff.gd",

		"Modules/Z_Hypertus/Buffs/HyperBreastsFlatCapacityBuff.gd",
		"Modules/Z_Hypertus/Buffs/HyperBreastsIncreaseTimerMultiplyer.gd",
		]

	bodyparts = [
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CaninePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/DragonPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/EquinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/FelinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/HumanPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/bob/HyperableBreasts.gd",
		"res://Modules/Z_Hypertus/Bodyparts/vagenie/HyperVagina.gd",
		"res://Modules/Z_Hypertus/Bodyparts/donkey/Anus.gd",
		"res://Modules/Z_Hypertus/Bodyparts/donkey/AnusWomb.gd",
	]
	scenes = [
		"res://Modules/Z_Hypertus/Scenes/CustomInputCustomizationPenis.gd",
	]
	events = [
		"res://Modules/Z_Hypertus/Events/CustomizationButton.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainHyperXP.gd",
	]
	skills = [
		"res://Modules/Z_Hypertus/Skill/Hyper.gd",
	]

	var _listCompactLayers = {
		"Knotted Horse Cock": {
			"moduleid": "Knotted Horse Cock",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/KnottedEquinePenis.gd",
			],
			"enabled": false,
		},
		"Synth Species": {
			"moduleid": "SynthSpecies",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthEquinePenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenisHuman.gd",
			],
			"enabled": false,
		},
		"Fluffy Bodyparts": {
			"moduleid": "Fluffy Bodyparts",
			"author":   "AverageAce & Max-Maxou",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/FluffBreasts.gd",
				"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/FluffMaleBreasts.gd"
			],
			"enabled": false,
		},
		"Avali Species (both version)": {
			"moduleid": "Avali Species",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/AvaliBreasts.gd",
				"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/AvaliMaleBreasts.gd"
			],
			"enabled": false,
		},
		# "non test": _test,
	}
	universalBodyPartsCompactLayerNew(bodyparts,_listCompactLayers)
	announceCurrentEnabledCompactLayer(_listCompactLayers)

var shouldLogPrint = true

func logPrintOnDemand(txt):
	if shouldLogPrint:
		Log.print(txt)

func logErrorOnDemand(txt):
	if shouldLogPrint:
		Log.error(txt)

func announceCurrentEnabledCompactLayer(theDict:Dictionary):
	var numberOfMods = 0
	for modindex in theDict.keys():
		if theDict[modindex]["enabled"]:
			numberOfMods += 1
	if numberOfMods>0:
		Log.print("  ### "+id+": at least a compatibility layer is activated, in summary we have:")
		for modindex in theDict.keys():
			if theDict[modindex]["enabled"]:
				var modauthor = theDict[modindex]["author"]
				Log.print("    - "+modindex+", by: "+modauthor)
		return true
	return false

func universalBodyPartsCompactLayerNew(bodyparts:Array, theDict:Dictionary):
	for modindex in theDict.keys():
		if theDict[modindex]["moduleid"] in GlobalRegistry.getModules():
			var curIndex = theDict[modindex]
			var moduleName = curIndex["moduleid"]
			var files = curIndex["files"]
			var sum = 0
			var total:int

			if len(files)>0:
				total = len(files)
			else:
				logErrorOnDemand(id+": "+moduleName+": |BODYCOMPACT| there aren\'t any file paths in files array, will assume total -1")

			if total > 0:
				for item in files:
					var fileName = item.get_file()
					if fileClass.file_exists(item):
						if not(item in bodyparts):
							bodyparts.append(item)
							if item in bodyparts:
								logPrintOnDemand(id+": "+moduleName+": "+fileName+" bodypart compatibility layer activated!")
								sum += 1
						else:
							logErrorOnDemand(id+": "+moduleName+": "+fileName+" already exists in the bodyparts array!")
							total -= 1
					else:
						logErrorOnDemand(id+": ERROR! "+moduleName+"\'s file: \""+item+"\" do not exist!")
						total -= 1
		
		
			if sum != total:
				if sum == 0:
					logErrorOnDemand(id+": ## "+moduleName+" bodypart(s) compatibility layer fail to load ##\n")
					continue
				if sum < total and sum > 0:
					logErrorOnDemand(id+": ## "+moduleName+" bodypart(s) compatibility layer partially loaded ##\n")
					continue
				logErrorOnDemand(id+": ## "+moduleName+" bodypart(s) compatibility layer ..... you know you shouldn't set supposeTotal right? its there for me to learn default value in function\n")
				continue
			else:
				if total == 1:
					logPrintOnDemand(id+": ## "+moduleName+" a bodypart compatibility layer successfully activated! ##\n")
				else:
					logPrintOnDemand(id+": ## "+moduleName+" bodyparts compatibility layer successfully activated! ##\n")
				curIndex["enabled"] = true


func universalBodyPartsCompactLayer(bodyparts:Array, moduleName:String, files:Array, supposeTotal := 0):
	if moduleName in GlobalRegistry.getModules():
		var sum = 0
		var total:int

		if supposeTotal != 0:
			total = int(supposeTotal)
		else:
			if len(files) > 0: 
				total = len(files)
			else: # hopefully includes 0
				logErrorOnDemand(id+": "+moduleName+": |BODYCOMPACT| there aren\'t any file paths in files array, will assume total -1")
				total = -1
		
		if total > 0:
			for i in files:
				var fileName = i.get_file()
				if fileClass.file_exists(i):
					if not(i in bodyparts):
						bodyparts.append(i)
						if i in bodyparts:
							logPrintOnDemand(id+": "+moduleName+": "+fileName+" bodypart compatibility layer activated!")
							sum += 1
					else:
						logErrorOnDemand(id+": "+moduleName+": "+fileName+" already exists in the bodyparts array!")
						total -= 1
				else:
					logErrorOnDemand(id+": ERROR! "+moduleName+"\'s file: \""+i+"\" do not exist!")
					total -= 1
		
		# i love the fact that ranges cannot be inside of switch statment
		
		if sum != total:
			if sum == 0:
				logErrorOnDemand(id+": ## "+moduleName+" bodypart(s) compatibility layer fail to load ##\n")
				return false
			if sum < total and sum > 0:
				logErrorOnDemand(id+": ## "+moduleName+" bodypart(s) compatibility layer partially loaded ##\n")
				return false
			logErrorOnDemand(id+": ## "+moduleName+" bodypart(s) compatibility layer ..... you know you shouldn't set supposeTotal right? its there for me to learn default value in function\n")
			return false
		else:
			if total == 1:
				logPrintOnDemand(id+": ## "+moduleName+" a bodypart compatibility layer successfully activated! ##\n")
			else:
				logPrintOnDemand(id+": ## "+moduleName+" bodyparts compatibility layer successfully activated! ##\n")
			return true
	return false
