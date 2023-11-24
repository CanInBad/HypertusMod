extends EventBase

func _init():
	id = "CustomInputCustomizationEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["CharacterCreatorScene","attributeMenu"])

func run(_triggerID, _args):
	var curCustomSize = Util.cmToString(GM.main.getFlag("Hypertus.HyperPenisCustomSize", 60))
	if (GM.pc.getBodypart(BodypartSlot.Penis).getTraits() != null) and ("PartTrait.Hyperable" in GM.pc.getBodypart(BodypartSlot.Penis).getTraits()) and (GM.main.getCurrentScene().saveData()["pickedAttribID"] == "cocksize"):
		# if "PartTrait.Hyperable" in GM.pc.getBodypart(BodypartSlot.Penis).getTraits():
		# 	if GM.main.getCurrentScene().saveData()["pickedAttribID"] == "cocksize":
		addButton("Custom size", "Last customized size: "+curCustomSize, "CustomInputCustomizationScene")

func onButton(_method, _args):
	if(_method == "CustomInputCustomizationScene"):
		runScene("CustomInputCustomizationHyperPenis")
