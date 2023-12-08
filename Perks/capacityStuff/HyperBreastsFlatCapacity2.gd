extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperBreastsFlatCapacity2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Bags of holding Ⅱ"

func getVisibleDescription():
	return "Your breasts holds EVEN MORE without increasing size"

func getMoreDescription():
	return sayParser.processString("[say=pc]Why are there droning noises coming out of my "+GM.pc.getBodypartLewdName(BodypartSlot.Breasts)+"[/say]\n" \
	+ "Your breasts can hold 150% more")

func getRequiredPerks():
	return [Perk.MilkBiggerBreasts]

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperBreastsFlatCapacity21.png"

func getBuffs():
	return [
		buff("HyperBreastsFlatCapacityBuff", [150]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
	if !breastsPartHas: # I just realized that normal play can't get flat anyways so
		return true     # this is just for who cheats and get forever flat
	return false