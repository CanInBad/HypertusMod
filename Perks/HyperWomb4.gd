extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperWomb4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Instant Pregnancy"

func getVisibleDescription():
	return "Incredibly increased pregnancy speed\nNow has minimum number of egg cell of ~10\u2074"

func getMoreDescription():
	return sayParser.processString("[say=pc]I am not surprised anymore...[/say]\n...")

func getRequiredPerks():
	return ["HyperWomb3"]

func getSkillTier():
	return 4

func getCost():
	return 64

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperWomb4.png"

func getBuffs():
	return [
		buff(Buff.PregnancySpeedBuff, [60]),
		buff(Buff.MinOvulationEggsAmountBuff, [1e4]),
	]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true