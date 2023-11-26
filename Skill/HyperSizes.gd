extends SkillBase
# var hyperSync: SkillBase = GM.pc.getSkillsHolder().getSkill("Hyper")

func _init(): # I tried making them in sync but you, im new to this
	id = "HyperSizes"
	# hyperSync.connect("levelChanged", self, "hyperSyncFunc")

func getShortName():
	return "Hyper Sizes"

func getVisibleName():
	return "Hyper Sizes"

func getVisibleDescription():
	return "Customize your sizes here, you will sync up to the hyper perk as long as you have appropriate perks"

func getLevelCap():
	return 1e3

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
		[15]
	]

# func hyperSyncFunc():
# 	setLevel(hyperSync.getLevel())