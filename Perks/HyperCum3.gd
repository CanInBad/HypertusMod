extends PerkBase

func _init():
	id = "Perk.HyperCum3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Hyper Cum"

func getVisibleDescription():
	return "Your balls refills and holds 175% more"

func getMoreDescription():
	return "\"After a while, I kinda liked this...\"\nYour balls vibrates violently when they're empty."

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumProductionV2, Perk.BreedCumVolume, Perk.BreedCumVolumeV2, "Perk.HyperCum1", "Perk.HyperCum2"]

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
		buff(Buff.PenisCumProductionBuff, [175]),
		buff(Buff.PenisBallsVolumeBuff, [175]),
	]

