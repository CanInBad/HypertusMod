extends PerkBase

func _init():
	id = "Perk.CumProduBuff4"
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Hyperspermia Final"

func getVisibleDescription():
	return "Your balls fills up faster by [b]1000%[/b]"

func getMoreDescription():
	return "I bet you're master of cumming by this point if you decided to grind this in actual game."

func getRequiredPerks():
	return [Perk.CumStud, Perk.CumStudV2, "Perk.CumProduBuff1", "Perk.CumProduBuff2", "Perk.CumProduBuff3"]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false

func getSkillTier():
	return 2

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/CumProduBuff2.png"

func getBuffs():
	return [
		buff("Buff.CumPenisProductionBuff", [1000]),
		buff("Buff.CumPenisCapacityBuff", [1000]),
	]