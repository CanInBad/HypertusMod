extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "Perk.HyperVirility1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Prime Breeder"

func getVisibleDescription():
	return "Your sperm quality improves 30%"

func getMoreDescription():
	return sayParser.processString("[say=pc]Why are my balls feels itchy[/say]")

func getRequiredPerks():
	return [Perk.BreedCumProductionV3]

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.VirilityBuff, [30]),
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false