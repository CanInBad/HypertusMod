extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperMilkUpSize2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Peta milk"

func getVisibleDescription():
	return "Your breasts can get bigger by five additional sizes when lactating."

func getMoreDescription():
	return sayParser.processString("[say=pc]Mooo![/say]\n" \
	+ "Milking is love, milking is life")

func getRequiredPerks():
	return ["HyperMilkUpSize1", Perk.MilkBiggerBreastsV2]

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperMilkUpSize2.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [5]),
	]

func hiddenWhenLocked() -> bool:
	var curNPC = GM.pc
	var breastsPartHas:bool = false
	if curNPC!=null:
		breastsPartHas = curNPC.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
		if !(curNPC.getBodypart(BodypartSlot.Breasts).getBaseSize() < 0):
			if breastsPartHas:
				return false
	return true