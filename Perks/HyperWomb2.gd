extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperWomb2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Hyper Womb Ⅱ"

func getVisibleDescription():
	return "Add 120 maximum egg cells\n" \
		    + "Make pregnancy goes 10% faster\n" \
	        + "Make you more fertile"

func getMoreDescription():
	return sayParser.processString("[say=pc]I still can't believe that I gave birth to entire a small town\'s population[/say]\n")


func getRequiredPerks():
	return ["HyperWomb1"]

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperWomb2.png"

func getBuffs():
	return [
		buff(Buff.OvulationEggsAmountBuff, [70]),
		buff(Buff.PregnancySpeedBuff, [10]),
		buff(Buff.FertilityBuff, [50]),
		buff(Buff.MinOvulationEggsAmountBuff, [20]),
	]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool = false
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true