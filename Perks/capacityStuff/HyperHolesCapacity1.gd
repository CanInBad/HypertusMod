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
	return sayParser.processString("[say=pc]CHANGE ME[/say]\n" \
	+ "This will add capacity after loosenss check (thus grant more space)")

func getRequiredPerks():
	return [Perk.CumSloppySeconds]

func hiddenWhenLocked() -> bool:
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
			assPartHas = true
	if pussyPartHas or assPartHas:
		return false
	return true

func getSkillTier():
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoleCap1.png"

func getBuffs():
	var allBuffs = []
	if GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperVaginaCapacity", [100]))
		# allBuffs.append(buff("HyperVaginaResistance", [20]))
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"PartTrait.Hyperable"):
		allBuffs.append(buff("HyperAnusCapacity", [100]))
		# allBuffs.append(buff("HyperAnusResistance", [20]))
	return allBuffs

# func onSexStarted(_context = {}):
# 	if !GM.pc.hasEffect(StatusEffect.LubedUp):
# 		GM.main.setModuleFlag("Hypertus","HyperHoleGainLubed",true)
# 		GM.pc.addEffect(StatusEffect.LubedUp, [10*60])

# func onSexEnded(_context = {}):
# 	if GM.main.getModuleFlag("Hypertus","HyperHoleGainLubed",false):
# 		if GM.pc.hasEffect(StatusEffect.LubedUp):
# 			GM.main.setModuleFlag("Hypertus","HyperHoleGainLubed",false)
# 			GM.pc.removeEffect(StatusEffect.LubedUp)
