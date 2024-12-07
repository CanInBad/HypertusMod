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

static func getRequiredExperience(_level) -> int: # https://www.desmos.com/calculator/ux5ausxblm
	if _level < 300:
		return 100 + int(ceil(_level * _level * 0.005)) # parabola
	elif _level < 950:
		return 450 + int(ceil( sqrt(-275 + _level) ) * 21.16 ) # sqrt root
	return int(max(1000, ( _level * 10 ) + 8500)) # linear
		  #int is here because function max returns float

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
# 	GM.ES.triggerReact("HypertusNewDay")
# 	return
# 	if "HyperSizes" in GlobalRegistry.getSkills():
# 		GM.pc.getSkillsHolder().getSkill("HyperSizes").setLevel(getLevel())