extends EventBase

func _init():
	id = "NewDayGainBackXP"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	var player = GM.pc
	if player.getBodypart(BodypartSlot.Penis).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Penis).getTraits():
			var sum:int = 0
			# hadParts += 1
			var toCheckPlus = [
				"HyperCum1",
				"HyperCum2",
				"HyperCum3",  # no size change perks here
				"HyperCum4",  # because they're removed before this
				"HyperVirility1",
				"HyperVirility2",
				"HyperVirility3",
				"HyperVirility4",
			]

			for i in toCheckPlus:
				if player.hasPerk(i):
					sum += 1
					
			player.addSkillExperience(Skill.Breeder, sum * sum * 2)
			if sum * sum * 2 <= 0:
				addMessage("You have been granted " + str(sum * sum * 2) + " XP in the breeder tree")
		
					
	if player.getBodypart(BodypartSlot.Breasts).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Breasts).getTraits():
			# hadParts += 1
			var sum:int = 0
			var toCheckPlus = [ # be added
				"HyperBreastsIncreaseTimer",
				"HyperBreastsShouldContinueLactate",
				"HyperMilkUpSize1",
				"HyperMilkUpSize2",
				"HyperMilkUpSize3",
				"HyperMilkUpSize4",
				"HyperBreastsFlatCapacity1",
				"HyperBreastsFlatCapacity2",
				"HyperBreastsFlatCapacity3",
				"HyperBreastsFlatCapacity4",
			]
			for i in toCheckPlus:
				if player.getSkillsHolder().hasPerk(i):
					sum += 1

			player.addSkillExperience(Skill.Milking, sum * sum * 2)
			if sum * sum * 2 <= 0:
				addMessage("You have been granted " + str(sum * sum * 2) + " XP in the milking tree")
			
	if player.getBodypart(BodypartSlot.Vagina).getTraits() != null \
	or player.getBodypart(BodypartSlot.Anus).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits() or \
		("PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits()): #and player.hasWombIn(OrificeType.Anus)):
			# hadParts += 1
			var sum:int = 0
			var toCheckPlus = [ 
				"HyperHoles1",
				"HyperHoles2",
				"HyperHoles3",
				"HyperHoles4",
				"HyperHolesCapacity1",
				"HyperHolesCapacity2",
				"HyperHolesCapacity3",
			]
			for i in toCheckPlus:
				if player.hasPerk(i):
					sum += 1

			player.addSkillExperience(Skill.CumLover, sum * sum * 2)
			if sum * sum * 2 <= 0:
				addMessage("You have been granted " + str(sum * sum * 2) + " XP in the cum lover tree")

	if player.getBodypart(BodypartSlot.Vagina).getTraits() != null \
	or player.getBodypart(BodypartSlot.Anus).getTraits() != null:
		if "PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits() or \
		("PartTrait.Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits() and player.hasWombIn(OrificeType.Anus)):

			var sum:int = 0
			var toCheckPlus = [ 
				"HyperWomb1",
				"HyperWomb2",
				"HyperWomb3",
				"HyperWomb4",
			]
			for i in toCheckPlus:
				if player.hasPerk(i):
					sum += 1
			player.addSkillExperience(Skill.Fertility, sum * sum * 3)
			if sum * sum * 3 <= 0:
				addMessage("You have been granted " + str(sum * sum * 3) + " XP in the fertility tree")

