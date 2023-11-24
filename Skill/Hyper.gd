extends SkillBase

func _init():
	id = "Skill.Hyper"

func getShortName():
	return "Hyper"

func getVisibleName():
	return "Hyper Barer"

func getVisibleDescription():
	return "Shows how much you are honed to using bluespace anomalies"

func getLevelCap():
	return 250

func getPerkTiers():
	return [
		[5],
		[15],
		[30],
		[50]
	]
