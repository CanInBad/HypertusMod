extends EventBase

func _init():
	id = "AfterGotHyperPenisLengthChange"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	var pc = GM.pc
	var add = GM.main.getFlag("Hypertus.HyperPenisExpansionAmount",0)
	var toRemove = [
		"Perk.PenisIncrease1",
		"Perk.PenisDecrease1"
	]
	for i in toRemove: # remove the perks even if they're disabled
		if (i in pc.getSkillsHolder().getPerks()):
			pc.getSkillsHolder().removePerk(i) 
	if add>0 and add<0:
		runScene("HyperChangePPLength")
	 

	# if(pc.hasPerk("Perk.PenisDecrease1")): # this will be moved to another event
	# 	var toRemove = [
	# 		""
	# 	]
	# 	for i in toRemove:
	# 		if i in pc.getSkillsHolder().getPerks():
	# 			pc.getSkillsHolder().removePerk(i)
	# 	if !(toRemove in pc.getSkillsHolder().getPerks()):
	# 		print("to be continue")
	# 	return