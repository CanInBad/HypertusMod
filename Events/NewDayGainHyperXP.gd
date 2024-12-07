extends EventBase

func _init():
	id = "NewDayGainHyperXP"

func registerTriggers(es):
	es.addTrigger(self, "HypertusNewDay")

var jiggleStr = RNG.pick(["vibrates","shakes","rumbles"])

func react(_triggerID, _args):
	if getFlag("Hypertus.DayInstall",-1) == -1:
		setFlag("Hypertus.DayInstall", GM.main.getDays())
	var daySince:int = GM.main.getDays() - min(getFlag("Hypertus.DayInstall",0) ,0) # if by logic, the if statement should set the value anything higher than -1 anyways but this is here because ¯\_(ツ)_/¯
																					# its here because of the message notifing player WITHOUT hyperable parts that they need it for the mod.

	var module = getModule("Hypertus")
	var penis = null
	var player = GM.pc
	var sum:int = 0
	var hadParts = {
		"penis"   : false,
		"breasts" : false,
		"vagina"  : false,
		"anus"    : false,
		"anuswomb": false,
	}
	if player.hasBodypart(BodypartSlot.Penis):
		if player.getBodypart(BodypartSlot.Penis).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Penis).getTraits():
				penis = GM.pc.getBodypart(BodypartSlot.Penis)
				hadParts["penis"] = true
				var toCheckPlus = [
					Perk.BreedStud,
					Perk.BreedStudV2,
					Perk.BreedRapidConception,
					Perk.BreedCumProduction,
					Perk.BreedCumProductionV2,
					Perk.BreedCumProductionV3,
					Perk.BreedCumVolume,
					Perk.BreedCumVolumeV2,
					Perk.BreedCumVolumeV3,
					"Perk.BreedStudV3", # RNGperks 😁
				]
				# var nperkHad = 0 # i love the fact that type casting doesn't want to work here
				for i in toCheckPlus:
					if player.hasPerk(i):

						sum += 1
						# if i == Perk.BreedCumProductionV3 and (not player.getStat(Stat.Strength) == 0):
						# 	sum = sum + player.getStat(Stat.Strength)/3 
						# 	print("BreedCumProductionV3 strength bonus: "+ player.getStat(Stat.Strength)/3)
						# this is removed with infinite scaling of this mod's perks

				var toCheckMinus = [
					Perk.StartMaleInfertility,
					Perk.StartMaleChastity,
				]

				for i in toCheckMinus:
					if player.hasPerk(i):
						sum -= 3 
						# sum -= sum/nperkHad # I tried doing something complex 
											# but it backfires hard.
			
	if player.hasBodypart(BodypartSlot.Breasts):
		if player.getBodypart(BodypartSlot.Breasts).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Breasts).getTraits():
				hadParts["breasts"] = true
				var toCheckPlus = [
					Perk.MilkBiggerBreasts,
					Perk.MilkBiggerBreastsV2,
					Perk.MilkBiggerBreastsV3,
					Perk.MilkFasterProduction,
					Perk.MilkFasterProductionV2,
					Perk.MilkFasterProductionV3,
					Perk.MilkNoSoreNipples,
				]
				for i in toCheckPlus:
					if player.getSkillsHolder().hasPerk(i):
						sum += 1
				var toCheckMinus = [
					
				]
				for i in toCheckMinus:
					if player.hasPerk(i):
						sum -= 3
			
	if player.hasBodypart(BodypartSlot.Vagina):
		if player.getBodypart(BodypartSlot.Vagina).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits():
				hadParts["vagina"] = true
				var toCheckPlus = [
					Perk.FertilityBetterOvulation,
					Perk.FertilityBetterOvulationV2,
					Perk.FertilityBetterOvulationV3,
					Perk.FertilitySubmissiveAndBreedable,
					Perk.FertilityBroodmother,
					Perk.CumSloppySeconds,
					Perk.CumUniqueBiology,
					Perk.CumBreath,
					Perk.CumBreathV2
				]
				for i in toCheckPlus:
					if player.hasPerk(i):
						sum += 1

				var toCheckMinus = [
					Perk.StartInfertile,
				]			
				for i in toCheckMinus:
					if player.hasPerk(i):
						sum -= 3
	
	if player.hasBodypart(BodypartSlot.Anus):
		if player.getBodypart(BodypartSlot.Anus).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits():
				hadParts["anus"] = true
				var toCheckPlus = [
					Perk.CumSloppySeconds,
					Perk.CumUniqueBiology,
					Perk.CumBreath,
					Perk.CumBreathV2
				]			
				if player.hasWombIn(OrificeType.Anus):
					hadParts["anus"] = false
					hadParts["anuswomb"] = true
					var toAddCheckPlus = [
						Perk.FertilityBetterOvulation,
						Perk.FertilityBetterOvulationV2,
						Perk.FertilityBetterOvulationV3,
						Perk.FertilitySubmissiveAndBreedable,
						Perk.FertilityBroodmother
					]
					for i in toAddCheckPlus:
						toCheckPlus.append(i)

				for i in toCheckPlus:
					if player.hasPerk(i):
						sum += 1

				var toCheckMinus = [
					Perk.StartInfertile,
				]			
				for i in toCheckMinus:
					if player.hasPerk(i) and player.hasWombIn(OrificeType.Anus):
						sum -= 3

	if player.getSkillsHolder().getSkill("Hyper") != null:
		if player.getSkillLevel("Hyper") == player.getSkillsHolder().getSkill("Hyper").getLevelCap():
			setModuleFlag("Hypertus","HyperLevelMaxed",true)
	else:
		Log.printerr("Hyper tree is null???? send save file to the dev -CanInBad")
		
	if not GM.main.getFlag("Hypertus.HyperLevelMaxed",false):
		var hadPartsN = 0
		for i in hadParts.keys():
			if hadParts[i] == true:
				hadPartsN += 1

				if i == "anuswomb":
					addMessage("Your hyper anus (with womb) "+jiggleStr+",")
				elif i == "penis":
					addMessage("Your "+penis.getLewdSizeAdjective()+" "+penis.getLewdAdjective()+" "+penis.getLewdName()+" "+jiggleStr+".")
				else:
					addMessage("Your hyper "+i+" "+jiggleStr+".")
					# addMessage("+x1 Extra hyper gain for total: x"+str(hadPartsN))
		
		if daySince<5 and hadPartsN>0:
			addMessage("You have the potential to get Hyper XP, you get them by spending points in various skills then waking up.\nThe more perks you have the more XP you gain each day")
		
		if hadPartsN == 0 && player.getSkillLevel("Hyper")<0:
			if (getModuleFlag("PortalPantiesModule", "Panties_PcDenied") || getModuleFlag("PortalPantiesModule", "Panties_FleshlightsReturnedToAlex")):
				addMessage("You don't have any hyperable bodyparts equipped. please get the BPAE from Alex near engineering on mining floor.")
			else: addMessage("You don't have any hyperable bodyparts equipped. Please do so next playthrough.")
			setFlag("Hypertus.DayInstall",-1)

		module.logPrintOnDemand(module.id+"\thadPartsN: "+str(hadPartsN)+"\tsum: "+str(sum)+"\tPotentialGain: "+str(sum*sum*3*hadPartsN))

		if   hadPartsN >= 1 and sum >= 1:
			addMessage("Received Hyper XP: "+ str((sum * sum * 3 * hadPartsN))+"\n")
			player.addSkillExperience("Hyper", sum * sum * 3 * hadPartsN)
	else:
		if !GM.main.getModuleFlag("Hypertus","HyperLevelMaxedSeenMessage",false):
			sayn("Wow! You actually got this far? I mean its pretty easy to gain experience for the skill trees but how long did you do it?" \
				+ "\nCan you send the screenshot of the skills menu and send it to mod discussion?")
		setModuleFlag("Hypertus","HyperLevelMaxedSeenMessage",true)
