extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperWomb3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Infinitly Sized Baby Maker"

func getVisibleDescription():# 10^4
	return "Add 10\u2074 maximum egg cells\n" \
		    + "Make pregnancy goes 20% faster\n" \
	        + "Make you more fertile scaled with your sexiness"

func getMoreDescription():
	return sayParser.processString("[say=pc]I am not surprised anymore...[/say]\n..."\
	+ "You are the true broodmother.\n" \
	+ "\n[color=red]For low end players I recommend DON\'T GET THIS PERK! It may or may not crash your game when you give birth -CanInBad[/color]")

func getRequiredPerks():
	return ["HyperWomb2", Perk.FertilityBetterOvulationV3]

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperWomb3.png"

func getBuffs():
	return [
		buff(Buff.OvulationEggsAmountBuff, [1e4]),
		buff(Buff.PregnancySpeedBuff, [20]),
		buff(Buff.FertilityBuff, [25 * npc.getStat(Stat.Sexiness)]),
		buff(Buff.MinOvulationEggsAmountBuff, [100]),
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