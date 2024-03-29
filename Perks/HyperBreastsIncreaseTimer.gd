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
	return sayParser.processString("[say=pc]I seem to be lactating longer...[/say]\n" \
	+ "I haven\'t test this yet so idk if it works -CanInBad")

func getRequiredPerks():
	return [Perk.MilkFasterProduction]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperBreastsIncreaseTimer.png"

func getBuffs():
	return [
		buff("HyperBreastsIncreaseTimerMultiplyer", [100]),
	]

func hiddenWhenLocked() -> bool:
	if GM.pc != null:
		var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
		if GM.pc.getBodypart(BodypartSlot.Breasts).getSize() < 0:
			return true
		if breastsPartHas: 
			return false 
	return true
