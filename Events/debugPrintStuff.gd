extends EventBase

var moduleName = "Hypertus"

func _init():
    id = "debugPrintHyper"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
    if OS.has_feature("editor"):
        addButton("Print stats","print bodypart stats", "printStats")
        addButton("Print bodyparts","print bodyparts", "printParts")

func onButton(_method, _args):
    if _method == "printStats":
        var nl = "\n"
        var text:String = "\n ---------- " + str(OS.get_time())
        var prefix:String = "\n /// HypertusDebug: "
        text += prefix + "Penis Lenght | " + Util.cmToString(GM.pc.getBodypart(BodypartSlot.Penis).getLength())
        text += prefix + " ↳ Hyperable | " + str(GM.pc.getBodypart(BodypartSlot.Penis).hasTrait("Hyperable"))
        text += prefix + " ↳ ID        | " + str(GM.pc.getBodypart(BodypartSlot.Penis).id)

        text += nl

        text += prefix + "B Breast Size| " + str(GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize())
        if checkHasHyperable(BodypartSlot.Breasts, GM.pc): text += "\t" + GM.pc.getBodypart(BodypartSlot.Breasts).breastSizeModClass.breastSizeToCupString(GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize())
        else: text += "\t" + BreastsSize.breastSizeToCupString(GM.pc.getBodypart(BodypartSlot.Breasts).getBaseSize())
        text += prefix + " ↳ Current S | " + str(GM.pc.getBodypart(BodypartSlot.Breasts).getSize())
        if checkHasHyperable(BodypartSlot.Breasts, GM.pc): text += "\t" + GM.pc.getBodypart(BodypartSlot.Breasts).breastSizeModClass.breastSizeToCupString(GM.pc.getBodypart(BodypartSlot.Breasts).getSize())
        else: text += "\t" + BreastsSize.breastSizeToCupString(GM.pc.getBodypart(BodypartSlot.Breasts).getSize())
        text += prefix + " ↳ Hyperable | " + str(GM.pc.getBodypart(BodypartSlot.Breasts).hasTrait("Hyperable"))
        text += prefix + " ↳ Lacation T| " + str(GM.pc.getBodypart(BodypartSlot.Breasts).fluidProduction.lactationTimer)
        text += prefix + " ↳ ID        | " + str(GM.pc.getBodypart(BodypartSlot.Breasts).id)

        text += nl

        text += prefix + "Vagina ID    | " + str(GM.pc.getBodypart(BodypartSlot.Vagina).id)
        # text += prefix + "Vagina Compac| " + str(GM.pc.getBodypart(BodypartSlot.Vagina).)
        text += prefix + "Anus ID      | " + str(GM.pc.getBodypart(BodypartSlot.Anus).id)
    

        print(text)
    if _method == "printParts":
        # print(GM.pc.bodyparts)
        for i in GM.pc.bodyparts.values():
            print(str(i.id))
            # print(i.Node)
            print(i.script.get_property_list())
            # print(i.Inherit)

func checkHasHyperable(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false