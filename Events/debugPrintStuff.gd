extends EventBase

var moduleName = "Hypertus"

func _init():
    id = "debugPrintHyper"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
    if OS.has_feature("debug"):
        addButton("Print stats","print bodypart stats", "printStats")
        addButton("Print fluid productions","print fluid productions", "printFluidProduction")
        # addButton("Print bodyparts","print bodyparts", "printParts")

func onButton(_method, _args):
    if _method == "printStats":
        var nl = "\n"
        var text:String = "\n ---------- " + str(Time.get_time_string_from_system())
        var prefix:String = "\n /// HypertusDebug: "
        if GM.pc.getBodypart(BodypartSlot.Penis) != null:
            text += prefix + "Penis Lenght | " + Util.cmToString(GM.pc.getBodypart(BodypartSlot.Penis).getLength())
            text += prefix + " ↳ Hyperable | " + str(GM.pc.getBodypart(BodypartSlot.Penis).hasTrait("Hyperable"))
            text += prefix + " ↳ ID        | " + str(GM.pc.getBodypart(BodypartSlot.Penis).id)
        else: text += prefix + "No Penis, skipped printing penis info"

        text += nl
        # I am sure that the game enforces breast at all times
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
        if GM.pc.getBodypart(BodypartSlot.Vagina) != null:
            text += prefix + "Vagina ID    | " + str(GM.pc.getBodypart(BodypartSlot.Vagina).id)
        else: text += prefix + "No Vagina, skipped printing vagina info"
        if GM.pc.getBodypart(BodypartSlot.Anus) != null:
            text += prefix + "Anus ID      | " + str(GM.pc.getBodypart(BodypartSlot.Anus).id)
        else: text += prefix + "No Anus, skipped printing anus info"

        print(text)
    if _method == "printParts":
        # print(GM.pc.bodyparts)
        for i in GM.pc.bodyparts.values():
            print(str(i.id))
            # print(i.Node)
            print(i.script.get_property_list())
            # print(i.Inherit)
    if _method == "printFluidProduction":
        for i in GM.pc.bodyparts:
            if GM.pc.bodyparts[i] == null: continue
            if GM.pc.bodyparts[i].get("fluidProduction") != null:
                print(GM.pc.bodyparts[i].id+" | "+str(GM.pc.bodyparts[i].get("fluidProduction"))+"\n"+str(GM.pc.bodyparts[i].get("fluidProduction").get("fluids").get("contents")) )
                for j in range(GM.pc.bodyparts[i].fluidProduction.fluids.contents.size()):
                    for k in GM.pc.bodyparts[i].fluidProduction.fluids.contents[j].fluidDNA.get_property_list():
                        if !(k["name"] in filter):
                            print(k["name"]+" | "+str(GM.pc.bodyparts[i].fluidProduction.fluids.contents[j].fluidDNA.get(k["name"])))
                    # print(GM.pc.bodyparts[i].fluidProduction.fluids.contents[j].fluidDNA.get_property_list())

var filter = [ 
        "Reference", "script", "Script Variables", 
        "Node", "editor_description", "_import_path", 
        "pause_mode", "physics_interpolation_mode", "name", 
        "unique_name_in_owner", "filename", "owner", 
        "multiplayer", "custom_multiplayer", "process_priority",
        "character", "needsProcessing", "limbSlot",
        "id", "visibleName", "orifice",
        "breastSizeModClass"
        ]

func checkHasHyperable(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false