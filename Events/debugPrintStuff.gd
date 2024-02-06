extends EventBase

var moduleName = "Hypertus"

func _init():
    id = "debugPrintHyper"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
    if OS.has_feature("editor"):
        addButton("Print stats","print bodypart stats", "printStats")

func onButton(_method, _args):
    if _method == "printStats":
        var text:String = "\n ----------"
        var prefix:String = "\n /// HypertusDebug: "
        text += prefix + "Penis Lenght | " + str(GM.pc.getBodypart(BodypartSlot.Penis).getLength())
        text += prefix + " ↳ Hyperable | " + str(GM.pc.getBodypart(BodypartSlot.Penis).hasTrait("Hyperable"))

        text += prefix + "Breast Size  | " + str(GM.pc.getBodypart(BodypartSlot.Breasts).getSize())
        text += prefix + " ↳ Hyperable | " + str(GM.pc.getBodypart(BodypartSlot.Breasts).hasTrait("Hyperable"))

        print(text)