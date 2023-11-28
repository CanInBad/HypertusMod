extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperBreastsFlatCapacity4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Bags of holding Ⅲ"

func getVisibleDescription():
	return "Your breasts holds [b]**500% MORE**[/b] without increasing size"

# func getMoreDescription():
# 	return sayParser.processString("[say=pc]Why are there droning noises coming out of my "+GM.pc.getBodypartLewdName(BodypartSlot.Breasts)+"[/say]\n" \
# 	+ "")

func getRequiredPerks():
	return [Perk.MilkBiggerBreastsV2]

func getSkillTier():
	return 4

func getCost():
	return 64

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff("HyperBreastsFlatCapacityBuff", [500]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")
	if !breastsPartHas: # I just realized that normal play can't get flat anyways so
		return true     # this is just for who cheats and get forever flat
	return false