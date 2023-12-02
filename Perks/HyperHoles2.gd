extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHoles2"
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
	return sayParser.processString("[say=pc]Those recovered faster than it used to...[/say]\n...")

func getRequiredPerks():
	return ["HyperHoles1"]

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

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoles2.png"

func getBuffs():
	var allBuffs = []
	if GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperVaginaElasticity", [50]))
		allBuffs.append(buff("HyperVaginaResistance", [50]))
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperAnusElasticity", [50]))
		allBuffs.append(buff("HyperAnusResistance", [50]))
	return allBuffs