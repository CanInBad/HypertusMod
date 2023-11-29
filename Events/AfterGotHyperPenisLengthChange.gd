extends EventBase

func _init():
	id = "AfterGotHyperPenisLengthChange"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	var pc = GM.pc
	var add = GM.main.getFlag("Hypertus.HyperPenisExpansionAmount",0)
	var toRemove = [
		"HyperPenisIncrease1",
		"HyperPenisDecrease1",
		"HyperPenisIncrease2",
		"HyperPenisDecrease2",
		"HyperPenisIncrease3",
		"HyperPenisDecrease3",
	]
	for i in toRemove: # remove the perks even if they're disabled
		if (i in pc.getSkillsHolder().getPerks()):
			pc.getSkillsHolder().removePerk(i) 
	if add>0 or add<0:
		runScene("HyperChangePPLength")
	 

	# if(pc.hasPerk("PenisDecrease1")): # this will be moved to another event
	# 	var toRemove = [
	# 		""
	# 	]
	# 	for i in toRemove:
	# 		if i in pc.getSkillsHolder().getPerks():
	# 			pc.getSkillsHolder().removePerk(i)
	# 	if !(toRemove in pc.getSkillsHolder().getPerks()):
	# 		print("to be continue")
	# 	return