extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperCum1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Excessive Cum Ⅰ"

func getVisibleDescription():
	return "Your balls refills and holds 50% more"

func getMoreDescription():
	return sayParser.processString("[say=pc]I sure hope the contract I signed before coming here covered this[/say]\n" \
	+ "The balls, they're rumbling occasionally.")

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumVolume]

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperCum1.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [50]),
		buff(Buff.PenisBallsVolumeBuff,   [50]),
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"Hyperable")
	if !penisPartHas:
		return true
	return false