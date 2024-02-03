extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHolesCapacity3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Blackhole"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes hold SO MUCH that it creates a blackhole?????"
	return "Your hole holds SO MUCH that it creates a blackhole?????"

func getMoreDescription():
	return sayParser.processString("[say=pc]Never doubt anything.[/say]\n" \
	+ "This will add capacity after loosenss check (thus grant more space)")

func getRequiredPerks():
	return ["HyperHolesCapacity2"]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoleCap3.png"

func getBuffs():
	var allBuffs = []
	if npc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable"):
		allBuffs.append(buff("HyperVaginaCapacity", [9000]))
	if npc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		allBuffs.append(buff("HyperAnusCapacity", [9000]))
	return allBuffs
