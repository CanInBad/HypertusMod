extends EventBase

func _init():
    id = "convertOldToNew"
    if OS.has_feature("debug"):
        debug = true

func registerTriggers(es):
    es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
    var _a:bool = false
    var _b:bool = false
    if GM.pc.hasBodypart(BodypartSlot.Penis):
        if GM.pc.getBodypart(BodypartSlot.Penis).id == "dragonpenismhyper":
            _a = true
    
    if GM.pc.hasBodypart(BodypartSlot.Breasts):
        if GM.pc.getBodypart(BodypartSlot.Breasts).id == "breastshyperable":
            _b = true
    
    if _a or _b:
        addButton("Convert bodypart", "[Hypertus] Convert player's bodyparts from legacy bodypart to new.", "convertBodyPart")


var debug:bool = false

const filter = [ 
        "Reference", "script", "Script Variables", 
        "Node", "editor_description", "_import_path", 
        "pause_mode", "physics_interpolation_mode", "name", 
        "unique_name_in_owner", "filename", "owner", 
        "multiplayer", "custom_multiplayer", "process_priority",
        "character", "needsProcessing", "limbSlot",
        "id", "visibleName", "breastSizeModClass"
        ]

func onButton(_method, _args):
    if(_method == "convertBodyPart"):
        var pc = GM.pc
        var storedBodyparts = pc.bodyparts.duplicate(true)
        print(storedBodyparts)
        for i in storedBodyparts:
            if debug:
                if storedBodyparts[i] != null:
                    var visibleName = "null"
                    var limbSlot = "null"
                    if storedBodyparts[i].get("visibleName") != null:
                        visibleName = storedBodyparts[i].visibleName
                    if storedBodyparts[i].get("limbSlot") != null:
                        limbSlot = storedBodyparts[i].limbSlot
                    print("slot: "+i+"\nvisibleName: "+ visibleName + " | limbslot: " + limbSlot)
            if i == "breasts":
                if storedBodyparts[i] != null:
                    if storedBodyparts[i].id == "breastshyperable":
                        var dataToRestore = parseDataGeneral(storedBodyparts,i)
                                
                        pc.removeBodypart(i)
                        pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanbreastshyperable"))

                        restoreData(dataToRestore, i, pc)
                        pc.updateAppearance()

            if i == "penis":
                if storedBodyparts[i] != null:
                    if storedBodyparts[i].id == "dragonpenismhyper":
                        var dataToRestore = parseDataGeneral(storedBodyparts, i)

                        pc.removeBodypart(i)
                        pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonpenishyperable"))

                        restoreData(dataToRestore, i, pc)
                        pc.updateAppearance()

            # if i == "head": # testing if fluid production detection works on restoreData function
            #     if storedBodyparts[i] != null:
            #         if storedBodyparts[i].id == "dragonhead":
            #             var dataToRestore = parseDataGeneral(storedBodyparts, i)

            #             pc.removeBodypart(i)
            #             pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))

            #             restoreData(dataToRestore, i, pc)
            #             pc.updateAppearance()

            if i == "vagina": # testing if fluid production detection works on restoreData function
                if storedBodyparts[i] != null:
                    if storedBodyparts[i].id == "vagina":
                        var dataToRestore = parseDataGeneral(storedBodyparts, i)

                        pc.removeBodypart(i)
                        pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("vaginahyperable"))

                        restoreData(dataToRestore, i, pc)
                        pc.updateAppearance()

        if storedBodyparts != null:
            storedBodyparts.clear()

func parseDataGeneral(_bodyparts:Dictionary, _slot:String):
    var listToCheck = []
    var dataToRestore = {}
    for property in _bodyparts[_slot].get_property_list():
        if property.name in filter:
            continue
        listToCheck.append(property.name)
    
    if debug:
        print(listToCheck)

    for property in listToCheck:
        dataToRestore[property] = _bodyparts[_slot].get(property)

    if debug:
        print(dataToRestore)

    return dataToRestore

func restoreData(_data:Dictionary, _slot:String, _target:BaseCharacter = GM.pc):
    for property in _data:
        if property == "fluidProduction" or "orifice":
            continue
        if _target != null:
            if _data[property] != null: # ignore null properties saved, I couldn't filter them out in the saving phase.
                _target.getBodypart(_slot).set(property, _data[property])
        else:
            return Log.printerr("why is target null?")

    if "fluidProduction" in _data.keys() && _data["fluidProduction"] != null:
        print("found fluid production, processing")
        var _fluidContentsData = _data["fluidProduction"].get("fluids").get("contents")
        var _fluidParsed:Array = []
        if _fluidContentsData.size() > 0:
            for i in range(_fluidContentsData.size()):
                var _fluidDNA_Data
                print(str(i)+"  "+str(_fluidContentsData[i]))
                if _fluidContentsData[i]["fluidDNA"]["charID"] == "pc":
                    print("is from the player")
                else:
                    print("is from "+GM.main.getCharacter((_fluidContentsData[i]["fluidDNA"]["charID"])).getName()) # I won't know this until I convert anus/vagina with stuff
            
        # if _data.fluidProduction.contents.size() != 0:
        # to be continued...


# func parsePenisData(data):
#     var curData = data
#     return 