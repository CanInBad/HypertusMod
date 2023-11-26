extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "Perk.PenisDecrease2"
	skillGroup = "Hyper"

func getVisibleName():
	return "Small Dick Energy"

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
	return sayParser.processString("[say=pc]This might be a bad idea[/say]\nThis will require sleeping. Current state, "+text)

func getSkillTier():
	return 1

func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false

# func toggleable():
# 	return false
func onPerkToggled(_isEnabledNow):
	if _isEnabledNow:
		GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",-17)
	else:
		GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",17)
	
func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func runOnceWhenLearned():
	GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",-17)
	# var pc = GM.pc 
	# var penis = pc.getBodypart(BodypartSlot.Penis)
	# penis.setLength(int(ceil((penis.getLength()*3.0/100.0) * penis.getLength())))
	# pc.addLust(int(ceil((pc.lustThreshold()*3.0/100.0) * pc.getLust())))
	# GM.main.say("\""+RNG.pick(["Wha- What\'s happening down there", "Mmmm~, it feels so good", "Uhhh, this might be a problem later"])+"\"\nMaybe if you walk abit the feeling might go away")
	# ok fine im going to use scene to increase the thing
	# GM.main.runScene("HyperIncreasePPLength", [3])
