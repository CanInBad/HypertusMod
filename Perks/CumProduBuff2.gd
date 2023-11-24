extends PerkBase

func _init():
	id = "Perk.CumProduBuff2"
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Hyperspermia Ⅱ"

func getVisibleDescription():
	return "Your balls fills up faster by 50%\nYour balls feels heaiver too...."

func getMoreDescription():
	return "Even more unbelieveable.\nYou feels something more heavier after that panties experiment...."

func getRequiredPerks():
	return [Perk.CumStud, Perk.CumStudV2, "Perk.CumProduBuff1"]

func getSkillTier():
	return 2

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/CumProduBuff2.png"

func getBuffs():
	return [
		buff("Buff.CumPenisProductionBuff", [50]),
		buff("Buff.CumPenisCapacityBuff", [50])
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false