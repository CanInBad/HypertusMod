extends EventBase

func _init():
	id = "NewDayGainHyperXP"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
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
			if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Penis).getTraits():
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
			if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Breasts).getTraits():
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
			if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits():
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
			if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits():
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

	if player.getSkillLevel("Hyper") == player.getSkillsHolder().getSkill("Hyper").getLevelCap():
		GM.main.setModuleFlag("Hypertus","HyperLevelMaxed",true)
		
	if not GM.main.getFlag("Hypertus.HyperLevelMaxed",false):
		var hadPartsN = 0
		for i in hadParts.keys():
			if hadParts[i] == true:
				hadPartsN += 1
				if i == "anuswomb":
					addMessage("Your hyper anus (with womb) "+RNG.pick(["vibrates","shakes","rumbles"])+",")
				else:
					addMessage("Your hyper "+i+" "+RNG.pick(["vibrates","shakes","rumbles"])+",")
					# addMessage("+x1 Extra hyper gain for total: x"+str(hadPartsN))
		
		if   hadPartsN >= 1 and sum >= 1:
			addMessage("Received Hyper XP: "+ str((sum * sum * 3 * hadPartsN))+"\n")
			player.addSkillExperience("Hyper", sum * sum * 3 * hadPartsN)
			# player.addSkillExperience("HyperSize", sum * sum * 3 * hadPartsN)
		elif hadPartsN >= 1 and sum == 0:
			addMessage("You have the potential to get Hyper XP, you get them by spending points in various skills then waking up.\nThe more perks you have the more XP you gain each day")
	else:
		GM.main.setModuleFlag("Hypertus","HyperLevelMaxedSeenMessage",true)
		sayn("Wow! You actually got this far? I mean its pretty easy to gain experience for the skill trees but how long did you do it?" \
			+ "\nCan you send the screenshot of the skills menu and send it to mod discussion?")
