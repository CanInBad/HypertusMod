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
	return sayParser.processString("[say=pc]I still can't believe that I gave birth to entire a small town\'s population[/say]\n" \
	+ "Oop, here comes the baby tank.")


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
	var curNPC = npc
	var pussyPartHas:bool = false
	var assPartHas:bool = false
	var assPartWomb:bool = false
	if curNPC!=null:
		pussyPartHas = curNPC.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
		assPartHas = curNPC.bodypartHasTrait(BodypartSlot.Anus,"Hyperable")
		assPartWomb = curNPC.getBodypart(BodypartSlot.Anus).hasWomb()
	if pussyPartHas or (assPartHas && assPartWomb):
		return false
	return true