extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperBreastsFlatCapacity3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Bags of holding Ⅲ"

func getVisibleDescription():
	return "Your breasts holds [b]300% MORE[/b] without increasing size"

func getMoreDescription():
	return sayParser.processString("[say=pc]My "+GM.pc.getBodypartLewdName(BodypartSlot.Breasts)+" just shined light last night.[/say]\n" \
	+ "Your breasts can hold [b]300% more[/b]")

func getRequiredPerks():
	return ["HyperBreastsFlatCapacity2"]

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperBreastsFlatCapacity31.png"

func getBuffs():
	return [
		buff("HyperBreastsFlatCapacityBuff", [300]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
	if !breastsPartHas: # I just realized that normal play can't get flat anyways so
		return true     # this is just for who cheats and get forever flat
	return false