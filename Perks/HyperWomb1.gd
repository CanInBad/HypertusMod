extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "Perk.HyperWomb1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Hyper Womb Ⅰ"

func getVisibleDescription():
	return "Add 50 maximum egg cells\n" \
		    + "Make pregnancy goes 5% faster\n" \
	        + "Make you a little more fertile"
			# yooo imagine if I knew this sooner, the string split multiple lines

func getMoreDescription():
	return sayParser.processString("[say=pc]Is it just me or do I give birth much more?[/say]\n")

func getRequiredPerks():
	return [Perk.FertilityBetterOvulationV2]

func getSkillTier():
	return 0

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():

	return [
		buff(Buff.OvulationEggsAmountBuff, [50]),
		buff(Buff.PregnancySpeedBuff, [5]),
		buff(Buff.FertilityBuff, [10]),
		buff(Buff.MinOvulationEggsAmountBuff, [17]),
	]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true