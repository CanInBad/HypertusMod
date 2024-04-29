extends EventBase

func _init():
    id = "convertOldToNew"

func registerTriggers(es):
    es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
    addButton("Convert", "Convert old bodyparts", "convertBodyPart")

var filter = [ 
        "Reference", "script", "Script Variables", 
        "Node", "editor_description", "_import_path", 
        "pause_mode", "physics_interpolation_mode", "name", 
        "unique_name_in_owner", "filename", "owner", 
        "multiplayer", "custom_multiplayer", "process_priority",
        "character", "needsProcessing", "limbSlot",
        "id", "visibleName", "orifice",
        "breastSizeModClass", "fluidProduction"
        ]

func onButton(_method, _args):
    if(_method == "convertBodyPart"):
        var pc = GM.pc
        var storedBodyparts = pc.bodyparts.duplicate(true)
        for i in storedBodyparts:
            print("slot: "+i+"\nvisibleName: "+str(storedBodyparts[i].visibleName) + " | limbslot: " + str(storedBodyparts[i].limbSlot))
            if i == "breasts":
                if storedBodyparts[i].id == "breastshyperable":
                    var listToCheck = []
                    var dataToRestore = {}
                    for j in storedBodyparts[i].get_property_list():
                        if j.name in filter:
                            continue
                        else: 
                            listToCheck.append(j.name)
                    print(listToCheck)
                    for j in listToCheck:
                        dataToRestore[j] = storedBodyparts[i].get(j)
                            
                    pc.removeBodypart(BodypartSlot.Breasts)
                    pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanbreastshyperable"))
                    print(dataToRestore)
                    # print(pc.getBodypart(BodypartSlot.Breasts))
                    for j in dataToRestore:
                        pc.getBodypart(BodypartSlot.Breasts).set(j, dataToRestore[j])
                    GM.main.playAnimation(StageScene.Solo, "stand", {bodyState={naked=true,hard=true}})

# func parsePenisData(data):
#     var curData = data
#     return 