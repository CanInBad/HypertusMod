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
	return ["HyperWomb2", Perk.FertilityBetterOvulationV2]

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
	var curNPC = GM.pc
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