extends EventBase

var alreadySeen:bool = false

func _init():
	id = "NoHyperablePart"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["IntroScene","donecreating"])

func checkHas(bodyslot):
	if GM.pc != null:
		if GM.pc.hasBodypart(bodyslot):
			if GM.pc.bodypartHasTrait(bodyslot,"Hyperable"):
				return true
	return false

func run(_triggerID, _args):
	var amt:int = 0
	if GM.pc != null:
		for i in [
			BodypartSlot.Breasts,
			BodypartSlot.Penis,
			BodypartSlot.Anus,
			BodypartSlot.Vagina
		]:
			if checkHas(i):
				amt += 1

	if amt<=0:
		if !alreadySeen:
			alreadySeen = true
			# showingDialog("You forgot hyperable parts. If you wish to play this mod, please press OK and press \"Second Chance\"")
			addMessage("Hey, its the hypertus mod telling you that you forgot hyperable parts. If you wish to play this mod, its a requirement here...")
		addButton("Second Chance","[HYPERTUS] Go back to Character Creator","backoutcharcreate")

func onButton(_method, _args):
	if(_method == "backoutcharcreate"):
		runScene("CharacterCreatorScene", [], "character_creator")
		alreadySeen = false

func showingDialog(_text) -> void:
	yield(GM.get_tree().create_timer(0.2), "timeout")
	if GM.get_node("/root/MainScene") != null:
		theDialog(_text)

func theDialog(_text) -> void:
	var dialog = AcceptDialog.new()
	dialog.window_title = "Hypertus"
	dialog.dialog_text = _text
	dialog.get_label().align = 1
	dialog.get_label().valign = 1
	dialog.connect('modal_closed', dialog, 'queue_free')
	dialog.theme = load("res://GlobalTheme.tres")
	dialog.rect_scale = Vector2(1.25, 1.25)
	# dialog.anchor_top = 0.01
	# dialog.anchor_right = 0.99
	# dialog.anchor_bottom = 0.97
	dialog.popup_exclusive = true
	GlobalRegistry.get_node("/root/MainScene/GameUI/").add_child(dialog)
	dialog.popup_centered_ratio(0.5)
	dialog.popup_centered()
	dialog.show()