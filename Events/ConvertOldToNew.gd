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

func onButton(_method, _args):
    if(_method == "convertBodyPart"):
        var pc = GM.pc
        var storedBodyparts = pc.bodyparts.duplicate(false) # only requires surface level info 
        if debug: print(storedBodyparts)
        for bodyslot in storedBodyparts:
            if debug:
                if storedBodyparts[bodyslot] != null:
                    var visibleName = "null"
                    var limbSlot = "null"
                    if storedBodyparts[bodyslot].get("visibleName") != null:
                        visibleName = storedBodyparts[bodyslot].visibleName
                    if storedBodyparts[bodyslot].get("limbSlot") != null:
                        limbSlot = storedBodyparts[bodyslot].limbSlot
                    print("slot: "+bodyslot+"\nvisibleName: "+ visibleName + " | limbslot: " + limbSlot)
            if bodyslot == "breasts":
                if storedBodyparts[bodyslot] != null:
                    if storedBodyparts[bodyslot].id == "breastshyperable":
                        var dataToRestore = pc.getBodypart(bodyslot).saveData().duplicate(true) # requires deep info to restore
                        
                        pc.removeBodypart(bodyslot)
                        pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanbreastshyperable"))
                        pc.getBodypart(bodyslot).loadData(dataToRestore)
                        pc.updateAppearance()
                        dataToRestore.clear()

            if bodyslot == "penis":
                if storedBodyparts[bodyslot] != null:
                    if storedBodyparts[bodyslot].id == "dragonpenismhyper":
                        var dataToRestore = pc.getBodypart(bodyslot).saveData().duplicate(true)

                        pc.removeBodypart(bodyslot)
                        pc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonpenishyperable"))
                        pc.getBodypart(bodyslot).loadData(dataToRestore)
                        pc.updateAppearance()
                        dataToRestore.clear()
        storedBodyparts.clear()