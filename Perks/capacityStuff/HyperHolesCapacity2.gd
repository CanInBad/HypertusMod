extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHolesCapacity2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Internal Volume Ⅱ"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes hold SO much more"
	return "Your hole holds SO much more"

func getMoreDescription():
	return sayParser.processString("[say=pc]But that\'s impossible![/say]\n"\
	+ "This will add capacity after loosenss check (thus grant more space)")

func getRequiredPerks():
	return ["HyperHolesCapacity1"]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoleCap2.png"

func getBuffs():
	var allBuffs = []
	if npc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable"):
		allBuffs.append(buff("HyperVaginaCapacity", [900]))
	if npc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		allBuffs.append(buff("HyperAnusCapacity", [900]))
	return allBuffs

