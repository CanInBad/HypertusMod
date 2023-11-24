extends PerkBase

func _init():
	id = "Perk.CritCombat"
	skillGroup = Skill.Combat

func getVisibleName():
	return "Random Critical Hits"

func getVisibleDescription():
	return "Rare high moments"

func getMoreDescription():
	return "Ability to do 300% physical damage with 3% chance"

# func getRequiredPerks():
# 	return []

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/crit.png"

func getBuffs():
	return [
		buff("Buff.PhysicalDamageBuffRNG", [300,3])
	]