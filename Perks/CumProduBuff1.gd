extends PerkBase

func _init():
	id = "Perk.CumProduBuff1"
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Hyperspermia Ⅰ"

func getVisibleDescription():
	return "Your balls fills up faster by 30%"

func getMoreDescription():
	return "You won't believe it, flat increase by 30%???? crazy."

func getRequiredPerks():
	return [Perk.CumStud, Perk.CumStudV2]

func getSkillTier():
	return 2

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/CumProduBuff1.png"

func getBuffs():
	return [
		buff("Buff.CumPenisProductionBuff", [30])
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false