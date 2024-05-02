extends Module
var fileClass = File.new()
var dirClass = Directory.new()

func getFlags():
	return {
		"HyperPenisCustomSize": flag(FlagType.Text),
		"HyperPenisExperiencedExpansion": flag(FlagType.Bool),
		"HyperPenisExpansionAmount": flag(FlagType.Number),
		"HyperLevelMaxed": flag(FlagType.Bool),
		"HyperLevelMaxedSeenMessage": flag(FlagType.Bool),
		# "HyperHoleGainLubed": flag(FlagType.Bool),
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
		"res://Modules/Z_Hypertus/Scenes/RayGunScene.gd"
	]
	events = [
		"res://Modules/Z_Hypertus/Events/CustomizationButton.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainHyperXP.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainBackXP.gd",
		"res://Modules/Z_Hypertus/Events/NoHyperablePart.gd",
		"res://Modules/Z_Hypertus/Events/ConvertOldToNew.gd",
		
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

	moduleRegisterPartSkins()

	var _listBodyPartsCompactLayers = {
		"Knotted Horse Cock": {
			"moduleid": "Knotted Horse Cock",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/KnottedEquinePenis.gd",
			],
		},
		"Synth Species": {
			"moduleid": "SynthSpecies",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthEquinePenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenisHuman.gd",
			],
		},
		"Fluffy Bodyparts": {
			"moduleid": "Fluffy Bodyparts",
			"author":   "AverageAce & Max-Maxou",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/FluffBreasts.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/FluffMaleBreasts.gd"
			],
		},
		"Avali Species (both version)": {
			"moduleid": "Avali Species",
			"author":   "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/AvaliBreasts.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/AvaliMaleBreasts.gd"
			],
		},
		"Ace's Aviary Addon": {
			"moduleid": "AcesAvairyAddon",
			"author": "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/BirdPenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/BirdPenis2.gd"
			],
		},
		"Trans Scar Chest": {
			"moduleid": "Trans Scar Chest",
			"author": "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Breasts/CompactLayer/TransBreasts.gd"
			],
		},
		"Barbed Equine Penis": {
			"moduleid": "Barbed Horse Cock",
			"author": "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/BarbedEquinePenis.gd"
			],
		},
		"Crow Species": {
			"moduleid": "CrowSpeciesModule",
			"author": "AverageAce",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/CrowPenis.gd",
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/CrowPenisSlit.gd",
			],
		},
		"Deer Species": {
			"moduleid": "CrowSpeciesModule",
			"author": "AverageAce/Fantos/Max-Maxou",
			"files": [
				"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/DeerPenis.gd",
			],
		},
		# "non test": _test,
	}
	# addEnableValue(_listBodyPartsCompactLayers)
	universalBodyPartsCompactLayer(bodyparts,_listBodyPartsCompactLayers)
	announceCurrentEnabledCompactLayer(_listBodyPartsCompactLayers)
	# showingDialog()
	

# func showingDialog() -> void:
# 	yield(GM.get_tree().current_scene, "tree_exited")
# 	yield(GM.get_tree().create_timer(0.2), "timeout")
# 	if GlobalRegistry.get_node("/root/MainMenu") != null:
# 		theDialog()

# func theDialog() -> void:
# 	var text = "this\nis\na\ntest"
# 	var dialog = AcceptDialog.new()
# 	dialog.window_title = id + " by: "+author
# 	dialog.dialog_text = text
# 	dialog.connect('modal_closed', dialog, 'queue_free')
# 	dialog.theme = load("res://GlobalTheme.tres")
# 	dialog.rect_scale = Vector2(1.25, 1.25)
# 	# dialog.anchor_top = 0.01
# 	# dialog.anchor_right = 0.99
# 	# dialog.anchor_bottom = 0.97
# 	dialog.popup_exclusive = true
# 	GlobalRegistry.get_node("/root/MainMenu/HBoxContainer/").add_child(dialog)
# 	dialog.popup_centered_ratio(0.5)
# 	dialog.popup_centered()
# 	dialog.show()

var outdatedBodyparts:Dictionary = {
	"dragonpenismhyper": "dragonpenishyperable",
	"breastshyperable": "humanbreastshyperable"
	}

var shouldLogPrint = false

func logPrintOnDemand(txt):
	if shouldLogPrint:
		Log.print(txt)

func logErrorOnDemand(txt):
	if shouldLogPrint:
		Log.error(txt)

# func addEnableValue(theDict:Dictionary):
# 	for i in theDict.keys():
# 		theDict[i]["enabled"] = false

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
			if theDict[modindex]["moduleid"] in GlobalRegistry.getModules():
				var curIndex = theDict[modindex]
				var moduleName = modindex
				var moduleID = theDict[modindex]["moduleid"]
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
						logErrorOnDemand(id+": ## "+moduleName+" ("+moduleID+"): bodypart(s) compatibility layer fail to load ##\n")
						continue
					if sum < total and sum > 0:
						logErrorOnDemand(id+": ## "+moduleName+" ("+moduleID+"): bodypart(s) compatibility layer partially loaded ##\n")
						continue
					logErrorOnDemand(id+": ## "+moduleName+" ("+moduleID+"): bodypart(s) compatibility layer ..... you know you shouldn't set supposeTotal right? its there for me to learn default value in function\n")
					continue
				else:
					if total == 1:
						logPrintOnDemand(id+": ## "+moduleName+" ("+moduleID+"): a bodypart compatibility layer successfully activated! ##\n")
					else:
						logPrintOnDemand(id+": ## "+moduleName+" ("+moduleID+"): bodyparts compatibility layer successfully activated! ##\n")
					curIndex["enabled"] = true
		else:
			logErrorOnDemand(id+": ## the index "+modindex+" ("+theDict[modindex]+") has no moduleid key")

func moduleRegisterPartSkins():

	var paths = [
		"res://Modules/Z_Hypertus/Partskins/HumanPenisHyperable",
		"res://Modules/Z_Hypertus/Partskins/FelinePenisHyperable",
		"res://Modules/Z_Hypertus/Partskins/EquinePenisHyperable",
		"res://Modules/Z_Hypertus/Partskins/DragonPenisHyperable",
		"res://Modules/Z_Hypertus/Partskins/CaninePenisHyperable",
		"res://Modules/Z_Hypertus/Partskins/BarbedEquinePenis",
		"res://Modules/Z_Hypertus/Partskins/DeerPenis",
		]

	var skins = []
	for path in paths:
		if dirClass.open(path) == OK:
			dirClass.list_dir_begin()
			var fileName = dirClass.get_next()
			while fileName != "":
				if !dirClass.current_is_dir():
					skins.append(path+"/"+fileName)
					logPrintOnDemand(id+": [SKINS] Added "+fileName+" to skins")
				fileName = dirClass.get_next()
		else:
			logErrorOnDemand(id+": [SKINS] "+path+" does not exist!")

	for i in skins: # I don't want to search recursively
		GlobalRegistry.registerPartSkin(i,"AverageAce")