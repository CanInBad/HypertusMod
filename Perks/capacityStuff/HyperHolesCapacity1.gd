extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperHolesCapacity1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Internal Volume Ⅰ"

func getVisibleDescription():
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
		assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes hold much more"
	return "Your hole holds much more"

func getMoreDescription():
	return sayParser.processString("[say=pc]CHANGE ME[/say]\nThis will add capacity before loosenss check")

func getRequiredPerks():
	return [Perk.SexLustPassion]

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

# func getCost():
# 	return 1

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	var allBuffs = []
	if GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperVaginaElasticity", [20]))
		allBuffs.append(buff("HyperVaginaResistance", [20]))
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperAnusElasticity", [20]))
		allBuffs.append(buff("HyperAnusResistance", [20]))
	return allBuffs

func onSexStarted(_context = {}):
	if !GM.pc.hasEffect(StatusEffect.LubedUp):
		GM.main.setModuleFlag("Hypertus","HyperHoleGainLubed",true)
		GM.pc.addEffect(StatusEffect.LubedUp, [10*60])

func onSexEnded(_context = {}):
	if GM.main.getModuleFlag("Hypertus","HyperHoleGainLubed",false):
		if GM.pc.hasEffect(StatusEffect.LubedUp):
			GM.main.setModuleFlag("Hypertus","HyperHoleGainLubed",false)
			GM.pc.removeEffect(StatusEffect.LubedUp)
