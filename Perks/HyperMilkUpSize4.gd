extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "Perk.HyperMilkUpSize4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Exta milk"

func getVisibleDescription():
	return "Your breasts can get bigger by five additional sizes when lactating."

func getMoreDescription():
	return sayParser.processString("[say=pc]*turns into a cow*[/say]\n" \
	+ "\n ----------------------------"
	+ "\n< Damn, guess we're cows now >"
	+ "\n ----------------------------"
	+ "\n      \\   ^__^"
	+ "\n        \\  (oo)\\_______"
	+ "\n           (__)\\       )\\/\\"
	+ "\n               ||----w |"
	+ "\n               ||     ||"
	)

func getRequiredPerks():
	return ["Perk.HyperMilkUpSize3"]

func getSkillTier():
	return 3

func getCost():
	return 32

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [5]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")
	if !breastsPartHas and !(GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize() == -1): # get rid of forever flat
		return true
	return false