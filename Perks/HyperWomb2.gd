extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "Perk.HyperWomb2"
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
	return ["Perk.HyperWomb1"]

func getSkillTier():
	return 1

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

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