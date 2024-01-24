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
			addButton("ok....", "I'll try harder", "tryagain")
			addButton("Nevermind", "Exit out", "decided")


func onTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setSizePP", [])

func _react(_action: String, _args):
	match _action:
		"setSizePP":
			var fromTextbox = getTextboxData("customSizePP")
			var regex = RegEx.new()
			regex.compile("^\\-?[0-9]+$")
			if regex.search(fromTextbox) != null:
				if int(fromTextbox)>0:
					var sanitisedValue = int(fromTextbox)
					if sanitisedValue>350:
						addMessage("Sorry to ruin the fun but the size will be limited to "+ Util.cmToString(350)\
						+" for gameplay reason (tbh 100 is already too big for the game to properly handle strech peneration)")
						sanitisedValue = min(sanitisedValue,350)
					addMessage("You have picked "+ Util.cmToString(sanitisedValue)+" but you have to confirm to pick it")
					setFlag("Hypertus.HyperPenisCustomSize",sanitisedValue)
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
