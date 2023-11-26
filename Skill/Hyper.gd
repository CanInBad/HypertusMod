extends SkillBase

func _init():
	id = "Hyper" # aughhhhh

func getShortName():
	return "Hyper"

func getVisibleName():
	return "Hyper Barer"

func getVisibleDescription():
	return "Shows how much you are honed to using bluespace anomalies"

func getLevelCap():
	return 1e3

func getPerkTiers():
	return [
		[5],
		[15],
		[30],
		[50]
	]

# func onNewDay():
# 	.onNewDay()
# 	if "HyperSizes" in GlobalRegistry.getSkills():
# 		GM.pc.getSkillsHolder().getSkill("HyperSizes").setLevel(getLevel())