extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperBreastsIncreaseTimer"
	skillGroup = "Hyper"

func getVisibleName():
	return "Longer Production"

func getVisibleDescription():
	return "Your breasts lactates longer"

func getMoreDescription():
	return sayParser.processString("[say=pc]I don't know what to type here[/say]\n" \
	+ "I haven\'t test this yet so idk if it works -CanInBad")

func getRequiredPerks():
	return [Perk.MilkFasterProduction]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff("HyperBreastsIncreaseTimerMultiplyer", [100]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")
	if !breastsPartHas and (GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize() == -1): 
		return true # get rid of forever flat
	return false