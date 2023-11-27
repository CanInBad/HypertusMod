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
	return sayParser.processString("[say=pc]I sure hope the contract I signed before coming here covered this[/say]\nThe balls, they're rumbling occasionally.")

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumVolume]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [50]),
		buff(Buff.PenisBallsVolumeBuff,   [50]),
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false