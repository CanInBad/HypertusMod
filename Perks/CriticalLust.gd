extends PerkBase

func _init():
	id = "Perk.CritLust"
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Random Critical Boner"

func getVisibleDescription():
	return "Rare high moments"

func getMoreDescription():
	return "Ability to do 300% lust damage with 3% chance"

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
		buff("Buff.LustDamageBuffRNG", [300,3])
	]