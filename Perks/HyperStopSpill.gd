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
	var curNPC = npc
	var pussyPartHas:bool = false
	var assPartHas:bool = false
	if curNPC!=null:
		pussyPartHas = curNPC.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
		assPartHas = curNPC.bodypartHasTrait(BodypartSlot.Anus,"Hyperable")
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 0

func getCost():
	return 4

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperStopSpill.png"
