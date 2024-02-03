extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHolesCapacity1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Internal Volume Ⅰ"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes hold much more"
	return "Your hole holds much more"

func getMoreDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		assPartHas = true
	var text:String = "hole is"
	if pussyPartHas and assPartHas:
		text = "holes are"
	return sayParser.processString("[say=pc]Is it just me or my "+text+" deeper than it should be?[/say]\n" \
	+ "This will add capacity after loosenss check (thus grant more space)")

func getRequiredPerks():
	return [Perk.CumSloppySeconds]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoleCap1.png"

func getBuffs():
	var allBuffs = []
	if npc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable"):
		allBuffs.append(buff("HyperVaginaCapacity", [100]))
	if npc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		allBuffs.append(buff("HyperAnusCapacity", [100]))
	return allBuffs
