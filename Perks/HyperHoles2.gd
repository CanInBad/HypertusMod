extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "Perk.HyperHoles2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Fuck Toy Ⅱ"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes recovers even faster and strech even less"
	return "Your hole recovers even faster and strech even less"

func getMoreDescription():
	return sayParser.processString("[say=pc]CHANGE ME[/say]\n...")

func getRequiredPerks():
	return ["Perk.HyperHoles1"]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 1

# func getCost():
# 	return 1

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	var allBuffs = []
	if GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable"):
		allBuffs.append(buff("Buff.HyperVaginaElasticity", [50]))
		allBuffs.append(buff("Buff.HyperVaginaResistance", [50]))
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
		allBuffs.append(buff("Buff.HyperAnusElasticity", [50]))
		allBuffs.append(buff("Buff.HyperAnusResistance", [50]))
	return allBuffs