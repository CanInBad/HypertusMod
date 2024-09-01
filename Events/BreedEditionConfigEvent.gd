extends EventBase

func _init(): 
    id = "HypertusBreedEditionConfigEvent"

func registerTriggers(es):
    es.addTrigger(self, Trigger.SceneAndStateHook, ["ModsOptionsScene", ""])

func run(_triggerID, _args):
    sayn("→ Hypertus: Force Breed")
    addButton("Force Breed","Hypertus: Make every species modified by Hypertus have anus womb.", "runOptionScene")

func onButton(_method, _args):
    if _method == "runOptionScene":
            runScene("HypertusBreedEditionConfigScene")

func getPriority(): return 0