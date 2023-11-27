extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperVirility3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Planet Populator"

func getVisibleDescription():
	return "Your sperm quality improves 150%"

func getMoreDescription():
	return sayParser.processString("[say=pc]This is not normal...[/say]\n")

func getRequiredPerks():
	return ["HyperVirility2"]

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
		buff(Buff.VirilityBuff, [150]),
	]

