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
	for i in toRemove: # remove the perks even if they're disabled, this was a lie because I did not read how the function works
		if pc.getSkillsHolder().isPerkDisabled(i):
			pc.getSkillsHolder().togglePerk(i)
		pc.getSkillsHolder().removePerk(i) 
	if add>0 or add<0: # less words
		runScene("HyperChangePPLength",[add])
