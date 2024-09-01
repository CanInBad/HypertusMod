extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperNoParts"
	skillGroup = "Hyper"

func getVisibleName():
	return "Ablity to read"

func getVisibleDescription():
	return "Read the description of the mod or this perk\'s before continuing"

func getMoreDescription():
	return sayParser.processString("[say=pc]I am the dirty cheater?[/say]\n") \
	+ "\nYou decided to install the mod without reading the mod\'s description and get the consequence by seeing this perk. "\
	+ "But again, you can try again :D\n\n" \
	+ "If you don\'t have access to the internet right now, its just telling you that while yes this mods has perks but they\'re hidden by lack of hyperable parts.\n" \
	+ "Since you already see this message, use the debug mode to add those so called [b]Hyperable[/b] bodyparts"

func getSkillTier():
	return 0

func getCost():
	return 1001

func getPicture():
	return "res://Images/Perks/badge.png"

func checkHas(bodyslot):
	if GM.pc != null:
		if GM.pc.hasBodypart(bodyslot):
			if GM.pc.bodypartHasTrait(bodyslot,"Hyperable"):
				return true
	return false

func hiddenWhenLocked() -> bool:
	for i in [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Anus, BodypartSlot.Vagina]:
		if checkHas(i):
			return true

	return false