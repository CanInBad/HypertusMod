extends PerkBase

var sayParser = SayParser.new()

func _init():
	id = "HyperPenisIncrease3"
	skillGroup = "Hyper"

func getVisibleName():
	return "Penis Extend-o"

func getVisibleDescription():
	return "Increase your penis length by 30%"

func getMoreDescription():
	var amount = GM.main.getFlag("Hypertus.HyperPenisExpansionAmount",0)
	var text = "Wha"
	if amount==0:
		text = "No change"
	elif amount>0:
		text = "Increasing: [color="+DamageType.getColorString(DamageType.Lust)+"]"+str(amount)+"%[/color]"
	else:
		text = "Decreasing: [color=red]"+str(amount)+"%[/color]"
	return sayParser.processString("[say=pc]Tsar Bomba[/say]\n" \
	+ "By the way, how\'s you back doing?\n"\
	+ "This will require sleeping. \nCurrent state, "+text)

# func getRequiredPerks():
# 	return ["HyperPenisIncrease1"]

func getSkillTier():
	return 3

func getCost():
	return 32

func hiddenWhenLocked() -> bool:
	var penisPartHas:bool = false
	if GM.pc != null:
		penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"Hyperable")
	if !penisPartHas:
		return true
	return false

func onPerkToggled(_isEnabledNow):
	if npc == GM.pc:
		if _isEnabledNow:
			GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",30)
		else:
			GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",-30)
	
func getPicture():
	return "res://Modules/Z_Hypertus/Images/Perks/ExpandDong.png"

func runOnceWhenLearned():
	if npc == GM.pc:
		GM.main.increaseModuleFlag("Hypertus","HyperPenisExpansionAmount",30)
	# var pc = GM.pc 
	# var penis = pc.getBodypart(BodypartSlot.Penis)
	# penis.setLength(int(ceil((penis.getLength()*3.0/100.0) * penis.getLength())))
	# pc.addLust(int(ceil((pc.lustThreshold()*3.0/100.0) * pc.getLust())))
	# GM.main.say("\""+RNG.pick(["Wha- What\'s happening down there", "Mmmm~, it feels so good", "Uhhh, this might be a problem later"])+"\"\nMaybe if you walk abit the feeling might go away")
	# ok fine im going to use scene to increase the thing
	# GM.main.runScene("HyperIncreasePPLength", [3])
