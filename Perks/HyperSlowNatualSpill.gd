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
	return sayParser.processString("[say=pc]I notice my holes are leaking out less...[/say]\n...")

# func getRequiredPerks():
# 	return []

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
	return 1

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"
