extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperMilkUpSize4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Exta milk"

func getVisibleDescription():
	return "Your breasts can get bigger by 12 additional sizes when lactating." \
	+ "\nAlso produce milk faster 300%"

func getMoreDescription():
	return sayParser.processString("[say=pc]*turns into a cow*[/say]\n" \
	+ "[code]"
	+ "\n ----------------------------"
	+ "\n< Damn, guess we're cows now >"
	+ "\n ----------------------------"
	+ "\n      \\   ^__^"
	+ "\n        \\  (oo)\\___"
	+ "\n           (__)\\       )\\/\\"
	+ "\n               ||----w |"
	+ "\n               ||           ||"
	+ "[/code]"
	)

func getRequiredPerks():
	return ["HyperMilkUpSize3"]

func getSkillTier():
	return 4

func getCost():
	return 64

func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/HyperMilkUpSize4.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [12]),
		buff(Buff.BreastsMilkProductionBuff, [300]),
	]

func hiddenWhenLocked() -> bool:
	var curNPC = GM.pc
	var breastsPartHas:bool = false
	if curNPC!=null:
		breastsPartHas = curNPC.bodypartHasTrait(BodypartSlot.Breasts,"Hyperable")
		if !(curNPC.getBodypart(BodypartSlot.Breasts).getBaseSize() < 0):
			if breastsPartHas:
				return false
	return true