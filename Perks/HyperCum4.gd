extends PerkBase

func _init():
	id = "Perk.HyperCum4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Cum Cannon"

func getVisibleDescription():
	return "Your balls fills up faster by [b]1000%[/b]"

func getMoreDescription():
	return "I bet you're master of cumming by this point if you decided to grind this in actual game."

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumProductionV2, Perk.BreedCumProductionV3, "Perk.HyperCum1", "Perk.HyperCum2", "Perk.HyperCum3"]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [1000]),
		buff(Buff.PenisBallsVolumeBuff, [1000]),
	]