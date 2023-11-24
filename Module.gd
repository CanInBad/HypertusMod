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
	# "res://Modules/Z_Hypertus/Perks/CumProduBuff1.gd",
	# "res://Modules/Z_Hypertus/Perks/CumProduBuff2.gd",
	# "res://Modules/Z_Hypertus/Perks/CumProduBuff3.gd",
	# "res://Modules/Z_Hypertus/Perks/CumProduBuff4.gd",
	# "res://Modules/Z_Hypertus/Perks/CriticalCombat.gd",
	# "res://Modules/Z_Hypertus/Perks/CriticalLust.gd",

	buffs = [
	]
	# "res://Modules/Z_Hypertus/Buffs/PhysicalDamageBuffRNG.gd",
	# "res://Modules/Z_Hypertus/Buffs/LustDamageBuffRNG.gd",
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

	# var _a = knottedHorseCockCompactLayer(bodyparts)
	# var _b = synthCompactLayer(bodyparts)
	# var _c = fluffyPartsCompactLayer(bodyparts)

	var _a = universalBodyPartsCompactLayer(bodyparts,"Knotted Horse Cock",[
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/KnottedEquinePenis.gd",
		# "res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/KnottedEquinePenis.gd",
		# "res://Modules/Amongus/Bruh.gd"
	])
	var _b = universalBodyPartsCompactLayer(bodyparts,"SynthSpecies",[
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthEquinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenisHuman.gd",
	])
	var _c = universalBodyPartsCompactLayer(bodyparts,"Fluffy Bodyparts",[
		"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/FluffBreasts.gd",
		"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/FluffMaleBreasts.gd"
	])
	var _d = universalBodyPartsCompactLayer(bodyparts,"Avali Species",[
		"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/AvaliBreasts.gd",
		"res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/AvaliMaleBreasts.gd"
	]) # I was going to have a panic attack because I just remebered that there are 2 versions, glad they use the same ID
	# var _test = universalBodyPartsCompactLayer(bodyparts,"CellblockModule",[])
	var _listCompactLayers = {
		"Knotted Horse Cock": [_a,"AverageAce"],
		"Synth Species": [_b,"AverageAce"],
		"Fluffy Parts": [_c,"AverageAce & Max-Maxou"],
		"Avali Species (both version)": [_d, "AverageAce"],
		# "non test": _test,
	}
	if true in _listCompactLayers.values()[0]:
		Log.print("  ### "+id+": at least a compatibility layer is activated, in summary we have:")
		for item in _listCompactLayers:
			if _listCompactLayers[item][0]:
				Log.print("    - "+item+", by: "+_listCompactLayers[item][1])

var shouldLogPrint = true

func logPrintOnDemand(txt):
	if shouldLogPrint:
		Log.print(txt)

func logErrorOnDemand(txt):
	if shouldLogPrint:
		Log.error(txt)

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

		# match sum:
		# 	total:
		# 		logPrintOnDemand(id+": ## "+moduleName+" compatibility layer successfully activated! ##\n")
		# 		return true
		# 	0:
		# 		logErrorOnDemand(id+": ## "+moduleName+" compatibility layer fail to load ##\n")
		# 		return false
		# 	[range(total)]:
		# 		logErrorOnDemand(id+": ## "+moduleName+" compatibility layer partially loaded ##\n")
		# 		return false
		# 	_:
		# 		logErrorOnDemand(id+": ## "+moduleName+" compatibility layer ..... you know you shouldn't set supposeTotal right? its there for me to learn default value in function\n")
		# 		return false
	else:
		return false

# func knottedHorseCockCompactLayer(bodyparts):
# 	if "Knotted Horse Cock" in GlobalRegistry.getModules():
# 		var tempArrys = [
# 			"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/KnottedEquinePenis.gd"
# 		]
# 		var sum = 0
# 		for i in tempArrys:
# 			var tempStr = i.get_file()
# 			if fileClass.file_exists(i):
# 				bodyparts.append(i)
# 				if i in bodyparts:
					
# 					logPrintOnDemand("[b]"+id+":[/b] "+"## Knotted Equine Penis: "+tempStr+" compatibility layer activated! ##")
# 					sum += 1
# 			else:
# 				logErrorOnDemand("[b]"+id+":[/b] "+"ERROR! File:"+tempStr+" do not exist! please check in again")
# 		match sum:
# 			1:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Knotted Equine Penis compatibility layer successfully activated! ##\n")
# 				return true
# 			0:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Knotted Equine Penis compatibility layer **Failed** to load ##\n")
# 				return false
# 			_:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Knotted Equine Penis compatibility layer fucked up!???? ## (PLEASE TELL THE DEV)\n")
# 				return false
# 	else:
# 		return false

# func synthCompactLayer(bodyparts):
# 	if "SynthSpecies" in GlobalRegistry.getModules():
# 		var tempArrays = [
			# "res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthEquinePenis.gd",
			# "res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenis.gd",
			# "res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenisHuman.gd",
# 		] 
# 		var sum = 0 # I really want to make this an int but editor complains that match can only use array????
# 		for i in tempArrays:
# 			if fileClass.file_exists(i):
# 				var tempStr = i.get_file()
# 				bodyparts.append(i)
# 				if i in bodyparts:	
# 					logPrintOnDemand("[b]"+id+":[/b] "+"## Synth Species: "+tempStr+", compatibility layer activated! ##")
# 					sum += 1

# 		match sum:
# 			[4, ..]:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Synth Species compatibility layer fucked up!????? ## (PLEASE TELL THE DEV)\n")
# 				return false
# 			3:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Synth Species compatibility layer successfully activated! ##\n")
# 				return true
# 			0:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Synth Species compatibility layer **Failed** to load ##\n")
# 				return false
# 			_:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Synth Species compatibility layer **partially** activated ##\n")
# 				return false
# 	else:
# 		return false

# func fluffyPartsCompactLayer(bodyparts):
# 	if "Fluffy Bodyparts" in GlobalRegistry.getModules():
# 		var tempArrays = [
			# "res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/FluffBreasts.gd",
			# "res://Modules/Z_Hypertus/Bodyparts/bob/CompactLayer/FluffMaleBreasts.gd"
# 		]
# 		var sum = 0
# 		for i in tempArrays:
# 			if fileClass.file_exists(i):
# 				bodyparts.append(i)
# 				if i in bodyparts:
# 					var tempStr = i.get_file()
# 					logPrintOnDemand("[b]"+id+":[/b] "+"## Fluffy Bodyparts: "+tempStr+", compatibility layer activated! ##")
# 					sum += 1
			

# 		match sum:
# 			[3, ..]:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Fluffy Bodyparts compatibility layer fucked up!????? ## (PLEASE TELL THE DEV)\n")
# 				return false
# 			2:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Fluffy Bodyparts compatibility layer successfully activated! ##\n")
# 				return true
# 			0:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Fluffy Bodyparts compatibility layer **Failed** to load ##\n")
# 				return false
# 			_:
# 				logPrintOnDemand("[b]"+id+":[/b] "+"## Fluffy Bodyparts compatibility layer **partially** activated ##\n")
# 				return false
