extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperCum2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Excessive Cum Ⅱ"

func getVisibleDescription():
	return "Your balls refills and holds 125% more"

func getMoreDescription():
	return sayParser.processString("[say=pc]When I get out, they better give me an antinode for whatever this is.[/say]\nYour balls starts to resonate out more frequently. It starts to be a annoyance for you")

func getRequiredPerks():
	return [Perk.BreedCumProduction, Perk.BreedCumVolume, "HyperCum1"]

func getSkillTier():
	return 2

func getCost():
	return 16

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperCum2.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [125]),
		buff(Buff.PenisBallsVolumeBuff, [125])
	]

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false