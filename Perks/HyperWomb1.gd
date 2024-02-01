extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperWomb1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Hyper Womb Ⅰ"

func getVisibleDescription():
	return "Add 50 maximum egg cells\n" \
		    + "Make pregnancy goes 5% faster\n" \
	        + "Make you a little more fertile"
			# yooo imagine if I knew this sooner, the string split multiple lines

func getMoreDescription():
	return sayParser.processString("[say=pc]Is it just me or do I give birth much more?[/say]\n" \
		+ "Just like the hoe next road.")

func getRequiredPerks():
	return [Perk.FertilityBetterOvulationV2]

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperWomb1.png"

func getBuffs():

	return [
		buff(Buff.OvulationEggsAmountBuff, [50]),
		buff(Buff.PregnancySpeedBuff, [5]),
		buff(Buff.FertilityBuff, [10]),
		buff(Buff.MinOvulationEggsAmountBuff, [17]),
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