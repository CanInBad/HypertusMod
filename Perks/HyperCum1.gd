extends PerkBase

func _init():
	id = "Perk.HyperCum1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Excessive Cum Ⅰ"

func getVisibleDescription():
	return "Your balls fills up faster by 30%"

func getMoreDescription():
	return "You won't believe it, flat increase by 30%???? crazy."

func getRequiredPerks():
	return [Perk.BreedCumProduction]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [30])
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false