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