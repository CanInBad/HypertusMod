extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperStopSpill"
	skillGroup = "Hyper"

func getVisibleName():
	return "Stop Leaky Holes"

func getVisibleDescription():
	return "Stop the leak (Works like a plug)"

func getMoreDescription():
	return sayParser.processString("[say=pc]How is my hole holding up?![/say]\n...")

func getRequiredPerks():
	return ["HyperSlowNatualSpill"]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"
