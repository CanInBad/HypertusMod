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
			var textfromTextbox = getTextboxData("customSizePP")
			var fromTextbox = float(textfromTextbox)
			var regex = RegEx.new()
			regex.compile("[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)")
			if regex.search(textfromTextbox) != null:
				if fromTextbox>0.0:
					if fromTextbox>350.0:
						addMessage("Sorry to ruin the fun but the size will be limited to "+ Util.cmToString(350.0)\
						+" for gameplay reason (tbh 100 is already too big for the game to properly handle strech peneration)")
						fromTextbox = min(fromTextbox,350.0)
					addMessage("You have picked "+ Util.cmToString(Util.roundF(fromTextbox,1))+" but you have to confirm to pick it")
					setFlag("Hypertus.HyperPenisCustomSize",str(Util.roundF(fromTextbox,1)))
					endScene()
					return
				elif fromTextbox==0:
					addMessage("Must not be [b]zero![/b] (you inputted [b]\""+textfromTextbox+"\"[/b])")
					setState("invalidinput")
					return
				else:
					addMessage("Must not be negative (you inputted [b]\""+textfromTextbox+"\"[/b])")
					setState("invalidinput")
					return
			else:
				addMessage("Invalid input (you inputted [b]\""+textfromTextbox+"\"[/b])")
				setState("invalidinput")
				return
		"tryagain":
			setState("")
			return

		"decided":
			endScene()


	setState(_action)
