extends PerkBase

func _init():
	id = "Perk.HyperCum3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Hyper Cum"

func getVisibleDescription():
	return "Your balls fills up faster by 120%"

func getMoreDescription():
	return "Damn, bet you can end the world hunger at this point."

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumProductionV2, "Perk.HyperCum1", "Perk.HyperCum2"]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false
	
func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [120]),
		buff(Buff.PenisBallsVolumeBuff, [100]),
	]

