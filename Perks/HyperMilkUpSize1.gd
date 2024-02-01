extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperMilkUpSize1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Tera milk"

func getVisibleDescription():
	return "Your breasts can get bigger by four additional sizes when lactating."

func getMoreDescription():
	return sayParser.processString("[say=pc]Moo[/say]\n" \
	+ "Your milking potential is still not limited.")

func getRequiredPerks():
	return [Perk.MilkBiggerBreastsV3]

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperMilkUpSize1.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [4]),
	]

func hiddenWhenLocked() -> bool:
	var curNPC = npc
	var breastsPartHas:bool = false
	if npc!=null:
		breastsPartHas = curNPC.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
		if !(curNPC.getBodypart(BodypartSlot.Breasts).getBaseSize() < 0):
			if breastsPartHas:
				return false
	return true