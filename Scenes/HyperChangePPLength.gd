extends SceneBase

var amtToAddPPSize:int

func _init():
	sceneID = "HyperChangePPLength"

func _initScene(_args = []):
		amtToAddPPSize = GM.main.getFlag("Hypertus.HyperPenisExpansionAmount",0)

func playAnimationNoFade(sceneID, actionID, args = {}):
	if(GM.ui != null):
		GM.ui.getStage3d().play(sceneID, actionID, args, true, false)

func _run():
	var penis = GM.pc.getBodypart(BodypartSlot.Penis)
	match state:
		"afterResize":
			sayn("After that, you can finally sleep")
			if !GM.main.getFlag("Hypertus.HyperPenisExperiencedExpansion", false):
				setModuleFlag("Hypertus","HyperPenisExperiencedExpansion",true)
				addButton("Ok...?","That was weird...","endScene")
			else:
				addButton("Ok!","I wish I could experience it again","endScene")

		_: #this includes "" state
			playAnimationNoFade(StageScene.Sleeping, "sleep", {bodyState={naked=true}})
			if amtToAddPPSize == 0:
				addMessage("Hmmm... looks like the devloper forgot to set agrument for this scene or they're trying to add/remove 0 pp length")
				addButton("Ok...?","That was weird...","end")

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

				# addMessage(RNG.pick(text1)),
				# sayn(RNG.pick(text2))
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
			var text = "what???"
			penis.setLength(int(ceil((penis.getLength()*amtToAddPPSize/100.0) + penis.getLength())))
			GM.pc.addLust(int(ceil((GM.pc.lustThreshold()*amtToAddPPSize/100.0) + GM.pc.getLust())))
			if amtToAddPPSize>0:
				text = "larger"
			elif amtToAddPPSize<0:
				text = "smaller"
			else:
				text = "this shouldn't happen.... (please tell the dev)"
			addMessage("You feels like your "+penis.getLewdName()+" just got "+text)
			setState("afterResize")
			return
		"endScene":
			setModuleFlag("Hypertus","HyperPenisExpansionAmount",0)
			endScene()
	setState(_action)

func saveData():
	var data = .saveData()

	data["amtToAddPPSize"] = amtToAddPPSize

	return data

func loadData(data):
	.loadData(data)

	amtToAddPPSize = SAVE.loadVar(data, "amtToAddPPSize", 0)
