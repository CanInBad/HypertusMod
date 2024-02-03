extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperSlowNatualSpill"
	skillGroup = "Hyper"

func getVisibleName():
	return "Slow Natual Spill"

func getVisibleDescription():
	return "Slows natual spill of your hyper holes"

func getMoreDescription():
	return sayParser.processString("[say=pc]I notice my holes are leaking out less...[/say]\n" \
	+ "...")

# func getRequiredPerks():
# 	return []

func hiddenWhenLocked() -> bool:
	var curNPC = GM.pc
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
	return "res://Modules/Z_Hypertus/Images/Perks/HyperSlowNatualSpill.png"
