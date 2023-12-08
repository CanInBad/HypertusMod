extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHoles4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Nuh uh"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes recover instantly"
	return "Your hole recovers instantly"

func getMoreDescription():
	return sayParser.processString("[say=pc]hehe stretchy hole[/say]\n...")

func getRequiredPerks():
	return ["HyperHoles3"]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 4

func getCost():
	return 64

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoles4.png"

func getBuffs():
	var allBuffs = []
	if GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable"):
		allBuffs.append(buff("HyperVaginaElasticity", [500]))
		allBuffs.append(buff("HyperVaginaResistance", [70]))
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		allBuffs.append(buff("HyperAnusElasticity", [500]))
		allBuffs.append(buff("HyperAnusResistance", [70]))
	return allBuffs