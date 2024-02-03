extends PerkBase

var sayParser = SayParser.new()
var gainLube:bool = false

func _init():
	id = "HyperHoles1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Fuck Toy Ⅰ"

func getVisibleDescription(): # boy I sure hope npc wont crash you with this
	var pussyPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable")
	var assPartHas:bool
	if GM.pc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable") and \
	   	GM.pc.getBodypart(BodypartSlot.Anus).hasWomb():
			assPartHas = true
	if pussyPartHas and assPartHas:
		return "Your holes recovers faster and strech less, Has natural lube on sex"
	return "Your hole recovers faster and strech less, Has natural lube on sex"

func getMoreDescription():
	return sayParser.processString("[say=pc]I have a built in lube?[/say]\n" \
	+ "They will update every in game hour")

# func getRequiredPerks():
# 	return [Perk.CumUniqueBiology]

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
	return 1

func getCost():
	return 8

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperHoles1.png"

func getBuffs():
	var allBuffs = []
	if npc.bodypartHasTrait(BodypartSlot.Vagina,"Hyperable"):
		allBuffs.append(buff("HyperVaginaElasticity", [20]))
		allBuffs.append(buff("HyperVaginaResistance", [20]))
	if npc.bodypartHasTrait(BodypartSlot.Anus,"Hyperable"):
		allBuffs.append(buff("HyperAnusElasticity", [20]))
		allBuffs.append(buff("HyperAnusResistance", [20]))
	return allBuffs

func onSexStarted(_context = {}):
	if !npc.hasEffect(StatusEffect.LubedUp):
		gainLube = true
		npc.addEffect(StatusEffect.LubedUp, [10*60])

func onSexEnded(_context = {}):
	if gainLube:
		if npc.hasEffect(StatusEffect.LubedUp):
			npc.removeEffect(StatusEffect.LubedUp)
		gainLube = false