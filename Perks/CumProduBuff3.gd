extends PerkBase

func _init():
	id = "Perk.CumProduBuff3"
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Hyperspermia Ⅲ"

func getVisibleDescription():
	return "Your balls fills up faster by 120%"

func getMoreDescription():
	return "Damn, bet you can end the world hunger at this point."

func getRequiredPerks():
	return [Perk.CumStud, Perk.CumStudV2, "Perk.CumProduBuff1", "Perk.CumProduBuff2"]

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/CumProduBuff2.png"

func getBuffs():
	return [
		buff("Buff.CumPenisProductionBuff", [120]),
		buff("Buff.CumPenisCapacityBuff", [100]),
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false