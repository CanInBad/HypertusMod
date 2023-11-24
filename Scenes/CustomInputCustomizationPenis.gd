extends SceneBase

func _init():
	sceneID = "CustomInputCustomizationHyperPenis"

func _run():
	match state:
		"":
			sayn("Enter the size of your character's hyper package in centimeters:")
			say("[i]Please note that it must be numbers only[/i]")			
			var textBox:LineEdit = addTextbox("customSizePP")
			var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")
			
			addButton("Confirm", "Choose size (in centimeters)", "setSizePP")
			addButton("Cancel", "Cancel", "decided")
		"invalidinput":
			# say("Invalid input (you inputted [b]\""+getTextboxData("customSizePP")+"\"[/b]")
			addButton("ok....", "I'll try harder", "tryagain")
			addButton("Nevermind", "Exit out", "decided")
		# "negative":
		# 	say("Must not be negative value (you inputted [b]\""+getTextboxData("customSizePP")+"\"[/b]")
		# 	addButton("ok....", "I'll try harder", "tryagain")
		# 	addButton("Nevermind", "Exit out", "decided")


func onTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setSizePP", [])

func _react(_action: String, _args):
	# if(_action == "setSizePP"):
	# 	setFlag("Hypertus.HyperPenisCustomSize",getTextboxData("setSizePP"))
	# 	setState("confirm")
	# 	return
	match _action:
		"setSizePP":
			var fromTextbox = getTextboxData("customSizePP")
			var regex = RegEx.new()
			regex.compile("^\\-?[0-9]+$")
			if regex.search(fromTextbox) != null:
				if int(fromTextbox)>0:
					addMessage("You have picked "+ Util.cmToString(int(fromTextbox))+" but you have to confirm to pick it")
					setFlag("Hypertus.HyperPenisCustomSize",int(fromTextbox))
					endScene()
					return
				elif int(fromTextbox)==0:
					addMessage("Must not be [b]zero![/b] (you inputted [b]\""+fromTextbox+"\"[/b])")
					setState("invalidinput")
					return
				else:
					addMessage("Must not be negative (you inputted [b]\""+fromTextbox+"\"[/b])")
					setState("invalidinput")
					return
			else:
				addMessage("Invalid input (you inputted [b]\""+fromTextbox+"\"[/b])")
				setState("invalidinput")
				return
		"tryagain":
			setState("")
			return

		"decided":
			endScene()


	setState(_action)
