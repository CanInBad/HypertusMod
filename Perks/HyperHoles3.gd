extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHoles3"
	skillGroup = "Hyper"

func getVisibleName():
	return "The Ultimate Fuck Toy"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes recovers near instant"
	return "Your hole recovers near instant"

func getMoreDescription():
	return sayParser.processString("[say=pc]CHANGE ME[/say]\n...")

func getRequiredPerks():
	return ["HyperHoles2"]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 2

# func getCost():
# 	return 1

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	var allBuffs = []
	if GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperVaginaElasticity", [430]))
		allBuffs.append(buff("HyperVaginaResistance", [30]))
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperAnusElasticity", [430]))
		allBuffs.append(buff("HyperAnusResistance", [30]))
	return allBuffs