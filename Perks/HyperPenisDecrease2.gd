extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperPenisDecrease2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Small Dick Energy Ⅱ"

func getVisibleDescription():
	return "Decrease your penis length by 17%"

func getMoreDescription():
	var amount = GM.main.getFlag("Hypertus.HyperPenisExpansionAmount",0)
	var text = "Wha"
	if amount==0:
		text = "No change"
	elif amount>0:
		text = "Increasing: [color="+DamageType.getColorString(DamageType.Lust)+"]"+str(amount)+"%[/color]"
	else:
		text = "Decreasing: [color=red]"+str(amount)+"%[/color]"
	return sayParser.processString("[say=pc]I guess something did change.[/say]\n" \
	+ "You "+GM.pc.getBodypartLewdName(BodypartSlot.Penis)+" becomes even smaller." \
	+ "This will require sleeping. \nCurrent state, "+text)

# func getRequiredPerks():
# 	return ["HyperPenisDecrease1"]

func getSkillTier():
	return 2

func getCost():
	return 16

func hiddenWhenLocked() -> bool:
	return true

# func toggleable():
# 	return false
func onPerkToggled(_isEnabledNow):
	if npc == GM.pc:
		if _isEnabledNow:
			GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",-17)
		else:
			GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",17)
	
func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/SmallerDong.png"

func runOnceWhenLearned():
	# if npc == GM.pc:
		GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",-17)