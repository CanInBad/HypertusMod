extends PerkBase

func _init():
	id = "Perk.PenisIncrease1"
	skillGroup = "Hyper"

func getVisibleName():
	return "Penis Extend-o"

func getVisibleDescription():
	return "Increase your penis length by 3%"

func getMoreDescription():
	return "\"This might be a bad idea\"\n"


func hiddenWhenLocked() -> bool:
	var penisPartHas = GM.pc.bodypartHasTrait(BodypartSlot.Penis,"PartTrait.Hyperable")
	if !penisPartHas:
		return true
	return false

func toggleable():
	return false

func getPicture():
	return "res://Modules/Z_Hypertus/Images/PLACEHOLDER.png"

func runOnceWhenLearned():
	# var pc = GM.pc 
	# var penis = pc.getBodypart(BodypartSlot.Penis)
	# penis.setLength(int(ceil((penis.getLength()*3.0/100.0) * penis.getLength())))
	# pc.addLust(int(ceil((pc.lustThreshold()*3.0/100.0) * pc.getLust())))
	# GM.main.say("\""+RNG.pick(["Wha- What\'s happening down there", "Mmmm~, it feels so good", "Uhhh, this might be a problem later"])+"\"\nMaybe if you walk abit the feeling might go away")
	# ok fine im going to use scene to increase the thing
	GM.main.runScene("HyperIncreasePPLength", [3])
