extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperMilkUpSize3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Peta milk"

func getVisibleDescription():
	return "Your breasts can get bigger by six additional sizes when lactating." \
	+ "\nAlso produce milk faster 200%"

func getMoreDescription():
	return sayParser.processString("[say=pc]Moooo!![/say]\n" \
	+ "You\'re walking milk jugs")

func getRequiredPerks():
	return ["HyperMilkUpSize2"]

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperMilkUpSize3.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [6]),
		buff(Buff.BreastsMilkProductionBuff, [200]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")

	if !breastsPartHas or (GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize() == -1\
		and GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")): # get rid of flat chest

		return true

	return false