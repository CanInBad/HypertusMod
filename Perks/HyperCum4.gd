extends PerkBase

func _init():
	id = "Perk.HyperCum4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Cum Cannon"

func getVisibleDescription():
	return "Your balls refills and holds 1800% more"

func getMoreDescription():
	return "\"Test successful, I guess?\"\n..."

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumProductionV2, Perk.BreedCumProductionV3, Perk.BreedCumVolume, Perk.BreedCumVolumeV2, Perk.BreedCumVolumeV3, "Perk.HyperCum1", "Perk.HyperCum2", "Perk.HyperCum3"]

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
		buff(Buff.PenisCumProductionBuff, [1800]),
		buff(Buff.PenisBallsVolumeBuff, [1800]),
	]