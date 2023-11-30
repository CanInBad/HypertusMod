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

static func getRequiredExperience(_level) -> int:
	if _level>81:
		return 1000
	return 100 + _level * 10 + int(sqrt(max(0,_level))) * 10

func getPerkTiers():
	return [
		[0], # 1 | 0
		[5], # 2 | 1
		[15],# 3 | 2
		[30],# 4 | 3
		[50] # 5 | 4
	]

# func onNewDay():
# 	.onNewDay()
# 	if "HyperSizes" in GlobalRegistry.getSkills():
# 		GM.pc.getSkillsHolder().getSkill("HyperSizes").setLevel(getLevel())