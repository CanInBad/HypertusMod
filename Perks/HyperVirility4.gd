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
	return sayParser.processString("[say=pc]I sure hope AlphaCorp handle them well...[/say]\n"\
	+"But you're still the same")

func getRequiredPerks():
	return ["HyperVirility3"]

func hiddenWhenLocked() -> bool:
	var penisPartHas:bool = false
	if GM.pc != null:
		penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"Hyperable")
	if !penisPartHas:
		return true
	return false

func getSkillTier():
	return 4

func getCost():
	return 64

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperVirility4.png"

func getBuffs():
	return [
		buff(Buff.VirilityBuff, [750]),
	]