extends Module
var fileClass = File.new()

func getFlags():
	return {
		"HyperPenisCustomSize": flag(FlagType.Number),
		"HyperPenisExperiencedExpansion": flag(FlagType.Bool),
		"HyperPenisExpansionAmount": flag(FlagType.Number),
		"HyperLevelMaxed": flag(FlagType.Bool),
		"HyperLevelMaxedSeenMessage": flag(FlagType.Bool),
		"HyperHoleGainLubed": flag(FlagType.Bool),
		# "HyperIntroPrompt": flag(FlagType.Bool),
	}

# func resetFlagsOnNewDay(): # so it turns out that sleeping always set to the new day
# 	if GM.main.getModuleFlag(id,"HyperPenisExpansionAmount",0)!=0: # I kinda want to just if GM.main.getModuleFlag(id,"HyperPenisExpansionAmount",0): but idk if it is true or not
# 		GM.main.setModuleFlag(id, "HyperPenisExpansionAmount", 0)

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

		"res://Modules/Z_Hypertus/Perks/HyperPenisIncrease1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperPenisIncrease2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperPenisIncrease3.gd",
		"res://Modules/Z_Hypertus/Perks/HyperPenisDecrease1.gd",
		"res://Modules/Z_Hypertus/Perks/HyperPenisDecrease2.gd",
		"res://Modules/Z_Hypertus/Perks/HyperPenisDecrease3.gd",

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
		# "res://Modules/Z_Hypertus/Skill/HyperSizes.gd",
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
	]
	scenes = [
		"res://Modules/Z_Hypertus/Scenes/CustomInputCustomizationPenis.gd",
		"res://Modules/Z_Hypertus/Scenes/HyperChangePPLength.gd",
	]
	events = [
		"res://Modules/Z_Hypertus/Events/CustomizationButton.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainHyperXP.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainBackXP.gd",
		"res://Modules/Z_Hypertus/Events/AfterGotHyperPenisLengthChange.gd",
		"res://Modules/Z_Hypertus/Events/NoHyperablePart.gd",
	]

	var _listBodyPartsCompactLayers = {
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
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/FluffBreasts.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/FluffMaleBreasts.gd"
			],
			"enabled": false,
		},
		"Avali Species (both version)": {
			"moduleid": "Avali Species",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/AvaliBreasts.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/AvaliMaleBreasts.gd"
			],
			"enabled": false,
		},
		"Ace's Aviary Addon": {
			"moduleid": "AcesAvairyAddon",
			"author": "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/BirdPenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/BirdPenis2.gd"
			],
			"enabled": false,
		},
		"Trans Scar Chest": {
			"moduleid": "Trans Scar Chest",
			"author": "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/TransBreasts.gd"
			],
			"enabled": false,
		}
		# "non test": _test,
	}
	universalBodyPartsCompactLayer(bodyparts,_listBodyPartsCompactLayers)
	announceCurrentEnabledCompactLayer(_listBodyPartsCompactLayers)

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

func universalBodyPartsCompactLayer(bodyparts:Array, theDict:Dictionary):
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
				total = -1

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
