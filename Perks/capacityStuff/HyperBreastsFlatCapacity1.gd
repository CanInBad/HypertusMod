extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperBreastsFlatCapacity1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Bags of holding Ⅰ"

func getVisibleDescription():
	return "Your breasts holds more without increasing size"

func getMoreDescription():
	return sayParser.processString("[say=pc]I don't know what to type here[/say]\n" \
	+ "")

func getRequiredPerks():
	return [Perk.MilkBiggerBreasts]

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff("HyperBreastsFlatCapacityBuff", [50]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")
	if !breastsPartHas: # I just realized that normal play can't get flat anyways so
		return true     # this is just for who cheats and get forever flat
	return false