extends SceneBase

var amtToAddPPSize:int = 0
# var oldLenght:int = 1 # defaults to 1 cm if not found, imagine the complains about this, I don't want to store it as flag anymore :(

func _init():
	sceneID = "HyperChangePPLength"

func _initScene(_args = []):
	if(_args.size() > 0):
		amtToAddPPSize = _args[0]

func playAnimationNoFade(sceneID, actionID, args = {}):
	if(GM.ui != null):
		GM.ui.getStage3d().play(sceneID, actionID, args, true, false)

func _run():
	var penis = GM.pc.getBodypart(BodypartSlot.Penis)
	match state:
		"afterResize":
			addMessage("[b]This is a legacy feature, currently left in for compatiblity reasons.[/b]")
			sayn("After that, you can finally sleep")
			if !GM.main.getFlag("Hypertus.HyperPenisExperiencedExpansion", false):
				setModuleFlag("Hypertus","HyperPenisExperiencedExpansion",true)
				addButton("Ok...?","That was weird...","endScene")
			else:
				addButton("Ok!","I wish I could experience it again","endScene")

		_: #this includes "" state
			addMessage("[b]This is a legacy feature, currently left in for compatiblity reasons.[/b]")
			playAnimationNoFade(StageScene.Sleeping, "sleep", {bodyState={naked=true}})
			if amtToAddPPSize == 0:
				addMessage("Hmmm... looks like the devloper forgot to set agrument for this scene or they're trying to add/remove 0 pp length")
				addButton("Ok...?","That was weird...","endScene")

			else:
				sayn("Before you go to bed, there is something keeping you awake")
				var adjTexts = ["stretching","expand","increasing in size"]
				if amtToAddPPSize<0:
					adjTexts = ["low-pitch","shrink","decreasing in size"]
				if !GM.main.getFlag("Hypertus.HyperPenisExperiencedExpansion", false): # Never experienced expansion
					addButton("Continue","Continue","resize")
					var possibleInnerTexts = [
						"You feels some air moving around your "+ penis.getLewdName() +"...",
						"You heard some "+adjTexts[0]+" noise from down there...",
						"It\'s getting hot in here...",
					]
					if amtToAddPPSize>=1.0:
						possibleInnerTexts.append("Is that rubber "+adjTexts[0]+" noises?")

					var possibleSayTexts   = [
						"What\'s going on down there...",
						"... Did my "+ penis.getLewdName() +" just "+adjTexts[1]+"?",
						"What is this feeling....",
						"Is my "+penis.getLewdName()+" "+adjTexts[1]+"ing?",
						"Is my "+penis.getLewdName()+" "+adjTexts[2]+"?",
					]
					var sel = RNG.pick([1,2]) # pick between 2 type of messages, general vibe and you say something
					match sel:
						1:addMessage(RNG.pick(possibleInnerTexts))
						2:sayn("[say=pc]"+RNG.pick(possibleSayTexts)+"[/say]")
						_:addMessage("How is this possible")

				else: # already experienced it
					addButton("Continue","Continue","resize")
					var possibleSayTexts   = [
						"Oh boy, this better feel good!",
						"I sure hope it doesn\'t hurt like last time...",
						"Here it comes!"
					]
					# since the player had experience they don't have involuntary feelings
					sayn("[say=pc]"+RNG.pick(possibleSayTexts)+"[/say]")
					# the addbutton is near else that check amtToAddPPSize
					

func _react(_action: String, _args):
	var penis = GM.pc.getBodypart(BodypartSlot.Penis)
	match _action:
		"resize":
			playAnimation(StageScene.Sleeping, "sleep", {bodyState={naked=true}})
			var text:String = "[b]This is an error![/b] please tell CanInBad about this, also provide save too if possibe" # defaults to this

			if int(round((penis.getLength()*amtToAddPPSize/100.0) + penis.getLength())) in range(max(penis.getLength()-2,-5),min(6,penis.getLength()+2)): # this forces you to not get the same size when getting bigger, imagine if that happens.
				if amtToAddPPSize < 0: # check if we're decreasing the package size
					if penis.getLength() <= 1:
						penis.lengthCM = (1) # this assumes that you went 0 or negative penis length!!!! (how)
						text = "Your "+penis.getLewdAdjective() + " " + penis.getLewdName() + " can't get any smaller!"
					else: # if we're not 1 or less, we decrease by 1 cm
						penis.lengthCM = (penis.getLength() - 1)
						text = "Your "+ penis.getLewdAdjective() + " " + penis.getLewdName() + " felt abit smaller...."
				elif amtToAddPPSize > 0: # make it not a high climb after you get to like 1 cm
					penis.lengthCM = (int(round((penis.getLength()*amtToAddPPSize/100.0)*3 + penis.getLength())+(2*amtToAddPPSize)))
					text = "Your "+ penis.getLewdAdjective() + " " + penis.getLewdName() + " felt abit bigger...."
				else: # just in case, lol
					text = "How did we get here! (send this screenshot to CanInBad) res://Modules/Z_Hypertus/Scenes/HyperChangePPLength.gd:92"
			else:
				if amtToAddPPSize > 0:
					if penis.getLength() < 10: # make it not a climb as much
						penis.lengthCM = (int(round((penis.getLength()*amtToAddPPSize/100.0)*3 + penis.getLength()))+1)
					else:
						penis.lengthCM = (int(round((penis.getLength()*amtToAddPPSize/100.0) + penis.getLength())))
					text = "Your "+ penis.getLewdAdjective() + " " + penis.getLewdName() +" just got "+RNG.pick(["more hyper","expanded","amassed","mightier","bigger","heavier","bulkier","more massive","more gigatic","more magnificent"])+"!"
				elif amtToAddPPSize < 0:
					penis.lengthCM = (int(round((penis.getLength()*amtToAddPPSize/100.0) + penis.getLength())))
					text = "Your "+ penis.getLewdAdjective() + " " + penis.getLewdName() +" just got "+RNG.pick(["smaller","miniaturized","miniaturised","runty","smallish","sawed-off","stubby","undersized","more minuscule"])+"!"
				else:
					text = "This goes horribly bad, how did we get here (send this screenshot to CanInBad) res://Modules/Z_Hypertus/Scenes/HyperChangePPLength.gd:101"

			if amtToAddPPSize < 0: # will give lust even if you decrease in size
				GM.pc.addLust(int(round((GM.pc.lustThreshold()*(-amtToAddPPSize)/100.0) + GM.pc.getLust())))
			elif amtToAddPPSize > 0: # this assumes that you can't get amtToAddPPSize 0 in here
				GM.pc.addLust(int(round((GM.pc.lustThreshold()*(amtToAddPPSize)/100.0) + GM.pc.getLust())))

			addMessage(text)
			setState("afterResize")
			return
		"endScene":
			setModuleFlag("Hypertus","HyperPenisExpansionAmount",0)
			endScene()
			addMessage("[b]This is a legacy feature, currently left in for compatiblity reasons.[/b]")
			return # just in case
	setState(_action)

func saveData():
	var data = .saveData()

	data["amtToAddPPSize"] = amtToAddPPSize
	# data["oldLenght"] = oldLenght

	return data

func loadData(data):
	.loadData(data)

	amtToAddPPSize = SAVE.loadVar(data, "amtToAddPPSize", 0)
	# oldLenght = SAVE.loadVar(data, "oldLenght", 1)
