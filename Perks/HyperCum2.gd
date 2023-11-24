extends PerkBase

func _init():
	id = "Perk.HyperCum2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Excessive Cum Ⅱ"

func getVisibleDescription():
	return "Your balls fills up faster by 50%\nYour balls feels heaiver too...."

func getMoreDescription():
	return "Even more unbelieveable.\nYou feels something more heavier after that panties experiment...."

func getRequiredPerks():
	return [Perk.BreedCumProduction, "Perk.HyperCum1"]

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [50]),
		buff(Buff.PenisBallsVolumeBuff, [50])
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false