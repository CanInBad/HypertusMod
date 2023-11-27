extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperVirility4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Galaxy Repopulator"

func getVisibleDescription():
	return "Your sperm quality improves 750%"

func getMoreDescription():
	return sayParser.processString("[say=pc]I sure hope AlphaCorp handle them well...[/say]\n...")

func getRequiredPerks():
	return ["HyperVirility3"]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.VirilityBuff, [750]),
	]