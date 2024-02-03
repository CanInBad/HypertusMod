extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperBreastsShouldContinueLactate"
	skillGroup = "Hyper"

func getVisibleName():
	return "Perpetual Milking"

func getVisibleDescription():
	return "Your breasts will never stop producing milk after being milked"

func getMoreDescription():
	return sayParser.processString("[say=pc]Keep em comin\'[/say]\n" \
	+ "Though there is a 3% chance that it will be stopped")

func getRequiredPerks():
	return [Perk.MilkFasterProduction]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperBreastsShouldContinueLactate.png"

func hiddenWhenLocked() -> bool:
	if GM.pc != null:
		var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
		if GM.pc.getBodypart(BodypartSlot.Breasts).getSize() < 0:
			return true
		if breastsPartHas: 
			return false 
	return true