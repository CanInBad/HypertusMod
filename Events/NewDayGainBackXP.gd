extends EventBase

func _init():
	id = "NewDayGainBackXP"

func registerTriggers(es):
	es.addTrigger(self, "HypertusNewDay")

func react(_triggerID, _args):
	var player = GM.pc
	var alreadyHad = []
	var toGrant:int
	if player.hasBodypart(BodypartSlot.Penis):
		if player.getBodypart(BodypartSlot.Penis).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Penis).getTraits():
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
						
				if sum * sum * 2 > 0:
					toGrant = sum * sum * 2
					player.addSkillExperience(Skill.Breeder, toGrant)
					addMessage("You have been granted " + str(toGrant) + " XP in the breeder tree")
			
	if player.hasBodypart(BodypartSlot.Breasts):
		if player.getBodypart(BodypartSlot.Breasts).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Breasts).getTraits():
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

				if sum * sum * 2 > 0:
					toGrant = sum * sum * 2
					player.addSkillExperience(Skill.Milking, toGrant)
					addMessage("You have been granted " + str(toGrant) + " XP in the milking tree")

	var sumHole:int = 0

	if player.hasBodypart(BodypartSlot.Vagina):
		if player.getBodypart(BodypartSlot.Vagina).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits():
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
						alreadyHad.append(i)
						sumHole += 1

	if player.hasBodypart(BodypartSlot.Anus):
		if player.getBodypart(BodypartSlot.Anus).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits():
				
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
						if not i in alreadyHad:
							sumHole += 1
	
	if sumHole * sumHole * 2 > 0:
		toGrant = sumHole * sumHole * 2
		player.addSkillExperience(Skill.CumLover, toGrant)
		addMessage("You have been granted " + str(toGrant) + " XP in the cum lover tree")

	alreadyHad.clear()
	var sumWomb:int = 0

	if player.hasBodypart(BodypartSlot.Vagina):
		if player.getBodypart(BodypartSlot.Vagina).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Vagina).getTraits():
				var toCheckPlus = [ 
					"HyperWomb1",
					"HyperWomb2",
					"HyperWomb3",
					"HyperWomb4",
				]
				for i in toCheckPlus:
					if player.hasPerk(i):
						alreadyHad.append(i)
						sumWomb += 1

	if player.hasBodypart(BodypartSlot.Anus):
		if player.getBodypart(BodypartSlot.Anus).getTraits() != null:
			if "Hyperable" in player.getBodypart(BodypartSlot.Anus).getTraits():
				var toCheckPlus = [ 
					"HyperWomb1",
					"HyperWomb2",
					"HyperWomb3",
					"HyperWomb4",
				]
				for i in toCheckPlus:
					if player.hasPerk(i):
						if not i in alreadyHad:
							sumWomb += 1

	if sumWomb * sumWomb * 3 > 0:
		toGrant = sumWomb * sumWomb * 3
		player.addSkillExperience(Skill.Fertility, toGrant)
		addMessage("You have been granted " + str(toGrant) + " XP in the fertility tree")
