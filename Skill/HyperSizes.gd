extends "Hyper.gd"

func _init():
	id = "HyperSizes" # aughhhhh

func getShortName():
	return "Hyper Sizes"

func getVisibleName():
	return "Hyper Sizes"

func getVisibleDescription():
	return "Customize your sizes here"

func getLevelCap():
	return 250

func getPerkTiers():
	return [
		[5],
		[15],
		[30],
		[50]
	]

func onNewDay():
	setLevel(.getLevel()) # hopefully set the same level as the base hyper
	