extends EventBase

func _init():
	id = "NewDayGainBackXP"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	var player = GM.pc
	var sum:int = 0
	var hadParts:int = 0
	if player.getBodypart(BodypartSlot.Penis).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Penis).getTraits():
			hadParts += 1
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
				"Perk.BreederStudV3", # RNGperks 😁
				"Perk.HyperCumStud",
				"Perk.HyperCumStudV2",
				"Perk.HyperCumStudV3",
				"Perk.HyperCumStudV4",
			]
			# var nperkHad = 0 # i love the fact that type casting doesn't want to work here
			for i in toCheckPlus:
				if player.hasPerk(i):
				# if i in player.getSkillsHolder().getPerks():
					# nperkHad += 1
					sum += 1
					if i == Perk.BreedCumProductionV3 and (not player.getStat(Stat.Strength) == 0):
						sum = sum + player.getStat(Stat.Strength)/3
						print("BreedCumProductionV3 strength bonus: "+ player.getStat(Stat.Strength)/3)
	
			var toCheckMinus = [
				Perk.StartMaleInfertility,
				Perk.StartMaleChastity,
			]

			for i in toCheckMinus:
				if player.hasPerk(i):
					sum -= 3 
					# sum -= sum/nperkHad # I tried doing something complex 
										  # but it backfires hard.
			
					
	if player.getBodypart(BodypartSlot.Breasts).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Breasts).getTraits():
			hadParts += 1
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
			
	if player.getBodypart(BodypartSlot.Vagina).getTraits() != null \
	or player.getBodypart(BodypartSlot.Anus).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits() or \
		("PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits() and player.hasWombIn(OrificeType.Anus)):
			hadParts += 1
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
			

	if hadParts>=1:
		addMessage("Granted Hyper XP: "+ str((sum*sum*5 * hadParts))+"\n")
		player.addSkillExperience("Hyper", sum * sum * 5 * hadParts)
