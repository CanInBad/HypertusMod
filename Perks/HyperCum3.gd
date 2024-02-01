extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperCum3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Hyper Cum"

func getVisibleDescription():
	return "Your balls refills and holds 175% more"

func getMoreDescription():
	return sayParser.processString("[say=pc]After a while, I kinda liked this...[/say]\n"\
	+ "Your balls vibrates violently when they're empty.")

func getRequiredPerks():
	return [Perk.BreedCumProductionV2, Perk.BreedCumVolumeV2, "HyperCum2"]

func hiddenWhenLocked() -> bool:
	if npc!=null:
		var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"Hyperable")
		if penisPartHas:
			return false
	return true
	
func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperCum3.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [175]),
		buff(Buff.PenisBallsVolumeBuff, [175]),
	]

