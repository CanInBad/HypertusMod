extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperMilkUpSize4"
	skillGroup = "Hyper"

func getVisibleName():
	return "Exta milk"

func getVisibleDescription():
	return "Your breasts can get bigger by 10 additional sizes when lactating." \
	+ "\nAlso produce milk faster 300%"

func getMoreDescription():
	return sayParser.processString("[say=pc]*turns into a cow*[/say]\n" \
	+ "\n ----------------------------"
	+ "\n< Damn, guess we're cows now >"
	+ "\n ----------------------------"
	+ "\n      \\   ^__^"
	+ "\n        \\  (oo)\\___"
	+ "\n           (__)\\       )\\/\\"
	+ "\n               ||----w |"
	+ "\n               ||           ||"
	)

func getRequiredPerks():
	return ["HyperMilkUpSize3"]

func getSkillTier():
	return 4

func getCost():
	return 64

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [10]),
		buff(Buff.BreastsMilkProductionBuff, [300]),
	]

func hiddenWhenLocked() -> bool:
	var breastsPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")

	if !breastsPartHas or (GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize() == -1\
		and GM.pc.bodypartHasTrait(BodypartSlot.Breasts,"PartTrait.Hyperable")): # get rid of flat chest

		return true

	return false