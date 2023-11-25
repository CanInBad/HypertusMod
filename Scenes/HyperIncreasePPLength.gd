extends SceneBase

var amtToAddPPSize:int

func _init():
	sceneID = "HyperIncreasePPLength"

func _initScene(_args = []):
	if(_args.size() > 0):
		amtToAddPPSize = _args[0]
	else:
		amtToAddPPSize = 0

func _run():
	print(state)
	var penis = GM.pc.getBodypart(BodypartSlot.Penis)
	match state:
		"afterResize":
			if !GM.main.getFlag("Hypertus.HyperPenisExperiencedExpansion", false):
				addButton("Ok...?","That was weird...","end")
			else:
				addButton("Ok!","I wish I could experience it again","end")

		_:#this includes "" state
			print(amtToAddPPSize)
			playAnimation(StageScene.Solo, "stand")
			if amtToAddPPSize == 0:
				addMessage("Hmmm... looks like the devloper forgot to set agrument for this scene or they're trying to add/remove 0 pp length")
				addButton("Ok...?","That was weird...","end")

			else:
				addButton("Continue","Continue","resize")
				var adjTexts = ["stretching","expand","increasing in size"]
				if amtToAddPPSize<0:
					adjTexts = ["low-pitch","shrink","decreasing in size"]
				if !GM.main.getFlag("Hypertus.HyperPenisExperiencedExpansion", false): # Never experienced expansion

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
					for i in len(possibleSayTexts):
						if not (possibleSayTexts[i].begins_with("\"") and possibleSayTexts[i].ends_with("\"")):
							possibleSayTexts[i] = possibleSayTexts[i].insert(0,"\"")
							# possibleSayTexts[i] += "\""
							possibleSayTexts[i] = possibleSayTexts[i].insert(len(possibleSayTexts[i]),"\"")

					var sel = RNG.pick([1,2]) # pick between 2 type of messages, general vibe and you say something
					match sel:
						1:addMessage(RNG.pick(possibleInnerTexts))
						2:sayn(RNG.pick(possibleSayTexts))
						_:addMessage("How is this possible")

				# addMessage(RNG.pick(text1)),
				# sayn(RNG.pick(text2))
				else: # already experienced it
					var possibleSayTexts   = [
						"Oh boy, this better feel good!",
						"I sure hope it doesn\'t hurt like last time...",
						"Here it comes!"
					]
					# since the player had experience they don't have involuntary feelings
					for i in possibleSayTexts:
						if not (i.begins_with("\"") and i.ends_with("\"")):
							i.insert(1,"\"")
							# i += "\""
							i.append("\"") # I don't know if it works like python or not
					
					sayn(RNG.pick(possibleSayTexts)) 
					# the addbutton is near else that check amtToAddPPSize
					

func _react(_action: String, _args):
	var penis = GM.pc.getBodypart(BodypartSlot.Penis)
	match _action:
		"resize":
			var text = "what???"
			penis.setLength(int(ceil((penis.getLength()*amtToAddPPSize/100.0) + penis.getLength())))
			GM.pc.addLust(int(ceil((GM.pc.lustThreshold()*amtToAddPPSize/100.0) + GM.pc.getLust())))
			playAnimation(StageScene.Solo, "stand")
			if amtToAddPPSize>0:
				text = "larger"
			elif amtToAddPPSize<0:
				text = "smaller"
			else:
				text = "this shouldn't happen.... (please tell the dev)"
			addMessage("You feels like your "+penis.getLewdName()+" just got "+text)
			setState("afterResize")
		"end":
			endScene()
	setState(_action)

func saveData():
	var data = .saveData()

	data["amtToAddPPSize"] = amtToAddPPSize

	return data

func loadData(data):
	.loadData(data)

	amtToAddPPSize = SAVE.loadVar(data, "amtToAddPPSize", 0)
