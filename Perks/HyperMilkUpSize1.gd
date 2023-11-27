extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperMilkUpSize1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Tera milk"

func getVisibleDescription():
	return "Your breasts can get bigger by three additional sizes when lactating."

func getMoreDescription():
	return sayParser.processString("[say=pc]Moo[/say]\n" \
	+ "Your milking potential is still not limited.")

func getRequiredPerks():
	return [Perk.MilkBiggerBreastsV3]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [3]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")
	if !breastsPartHas and (GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize() == -1): 
		return true # get rid of forever flat
	return false