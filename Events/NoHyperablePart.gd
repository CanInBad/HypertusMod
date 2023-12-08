extends EventBase

var alreadySeen:bool = false

func _init():
	id = "NoHyperablePart"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["IntroScene","donecreating"])

func checkHas(bodyslot):
	if GM.pc != null:
		if GM.pc.hasBodypart(bodyslot):
			if GM.pc.bodypartHasTrait(bodyslot,"Hyperable"):
				return true
	return false

func run(_triggerID, _args):
	var amt:int = 0
	if GM.pc != null:
		for i in [
			BodypartSlot.Breasts,
			BodypartSlot.Penis,
			BodypartSlot.Anus,
			BodypartSlot.Vagina
		]:
			if checkHas(i):
				amt += 1

	if amt<=0:
		if !alreadySeen:
			alreadySeen = true
			addMessage("Hey, its the hypertus mod telling you that you forgot hyperable parts. If you wish to play this mod, its a requirement here...")
		addButton("Second Chance","[HYPERTUS] Go back to Character Creator","backoutcharcreate")

func onButton(_method, _args):
	if(_method == "backoutcharcreate"):
		runScene("CharacterCreatorScene", [], "character_creator")
		alreadySeen = false
