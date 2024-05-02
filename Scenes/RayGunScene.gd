extends SceneBase

var _receiverID:String = ""
var _receiver:BaseCharacter = null # very dangerous
var oldSize:float = 0.0
var calledFrom:int = 0 # 0 is default, 1 is combat
const slotsToCheck = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
var outdatedBodyparts:Dictionary

func printDebug(msg):
    if OS.has_feature("debug"):
        print(msg)

func _init():
    sceneID = "RayGunUse"

# func _initScene(_args = []):
#     if(_args.size() > 0):
#         receiverHas = _args[0]

func _reactInit():
    outdatedBodyparts = getModule("Hypertus").get("outdatedBodyparts")
    var theFightScene = GM.main.getCurrentFightScene()

    if theFightScene != null:
        _receiver = theFightScene.enemyCharacter
        # if !receiverHas:
        #     _receiver = GM.pc # still forces
        calledFrom = 1
    else:
        _receiver = GM.pc
    _receiverID = _receiver.getID()
    if _receiver != GM.pc:
        addCharacter(_receiverID)

func announceTargeting():
    var text = "Currently targeting: [color="+_receiver.getChatColor()+"][b]"+_receiver.getName()+"[/b][/color]"
    if _receiver == GM.pc:
        text += " (Player)"
    saynn(text)

func _run():
    match state:
        "":
            if _receiver != GM.pc && _receiverID != "pc" && _receiver != null:
                addCharacter(_receiverID)

            if OS.has_feature("editor"):
                addButton("PrintSceneStack","","printSceneStack")
                
            var hasHyperable:bool = false
            for i in slotsToCheck:
                if checkHasHyperable(i, _receiver):
                    hasHyperable = true
                    break
            
            if _receiver == null:
                addMessage("WTF???? why is \"_receiver\" null???????")
                setState("endTurn")
                return
            else:
                var text = "Currently targeting: [color="+_receiver.getChatColor()+"][b]"+_receiver.getName()+"[/b][/color]"
                if _receiver == GM.pc:
                    text += " (Player)"
                    if calledFrom == 1:
                        var theFightScene = GM.main.getCurrentFightScene() # removed restriction since you can now convert bodypart
                        addButtonAt(14,"Target Enemy","Change targeting to "+theFightScene.enemyCharacter.getName(),"targetEnemy")
                else:
                    addButtonAt(14,"Target Self","Change targeting to "+GM.pc.getName(),"targetSelf")
                saynn(text)


            saynn("What do you want to do?")
            if (hasHyperable && (checkHasHyperable(BodypartSlot.Penis, _receiver) || checkHasHyperable(BodypartSlot.Breasts, _receiver))):
                addButton("Resize","Resize their packages","resizeMenu")
            else:
                addDisabledButton("Resize",_receiver.heShe()+" does not have any hyperable parts")
            if checkHasHyperable(BodypartSlot.Breasts, _receiver):
                addButton("Induce lactation", "Force "+_receiver.hisHer()+" breast to lactate", "induceLactation")
            else:
                addDisabledButton("Induce lactation",_receiver.hisHer()+" does not have any hyperable breasts")
            if ((!hasHyperable || (!checkHasHyperable(BodypartSlot.Penis, _receiver) || !checkHasHyperable(BodypartSlot.Breasts, _receiver) || !checkHasHyperable(BodypartSlot.Vagina, _receiver) || !checkHasHyperable(BodypartSlot.Anus, _receiver))) || checkHasOutdated(_receiver)):
                addButton("Convert a body part", "Select which body part on "+_receiver.himHer()+" to convert to hyperable", "convertBodypart2HyperableMenu")
            else:
                addDisabledButton("Convert a body part", "There is no bodypart to convert")
            if hasHyperable:
                addButton("Revert a body part", "Select which body part on "+_receiver.himHer()+" to revert from hyperable", "convertBodypartFromHyperableMenu")
            else:
                addDisabledButton("Revert a body part", "There is no bodypart to revert")
            if hasHyperable && (checkHasHyperable(BodypartSlot.Anus, _receiver) || checkHasHyperable(BodypartSlot.Vagina, _receiver)):
                addButton("Clear a orifice", "Select which orifice that hyperable to clear stuff", "clearOrifice") 
            else:
                addDisabledButton("Clear a orifice", "There is no applicable hyperable bodypart")
            
            # if checkHasHyperable(BodypartSlot.Vagina,_receiver):
            #     addButton("")

            addButton("Nothing", "", "endScene")
        "resizeMenu":
            announceTargeting()
            saynn("What part would you like to resize?")

            if checkHasHyperable(BodypartSlot.Penis,_receiver):
                addButton("Penis","resize "+_receiver.hisHer()+" shlong","penisSizeSelection")
                addButton("Balls","resize "+_receiver.hisHer()+" balls", "ballsSizeSelection")
            else:
                addDisabledButton("Penis","They don't have "+_receiver.hisHer()+" hotdog hyperable")
                addDisabledButton("Balls","They don't have "+_receiver.hisHer()+" balls hyperable")

            if checkHasHyperable(BodypartSlot.Breasts,_receiver):
                addButton("Breasts","resize "+_receiver.hisHer()+" boobies","boobSizeSelection")
            else:
                addDisabledButton("Breasts","They don't have "+_receiver.hisHer()+" boobies hyperable")

            addButton("Back", "go back", "")

        "boobSizeSelection":
            announceTargeting()
            saynn("Currently resizing "+ _receiver.getBodypart(BodypartSlot.Breasts).getLewdName())
            addButton("Back", "go back", "resizeMenu") # making sure that its always in front
            for i in range(max(-1,_receiver.getBodypart(BodypartSlot.Breasts).getBaseSize()-5), \
            min(50, _receiver.getBodypart(BodypartSlot.Breasts).getBaseSize()+5),1):
                var theSize = _receiver.getBodypart(BodypartSlot.Breasts).breastSizeModClass.breastSizeToCupString(i)
                addButton(theSize, "Select "+theSize, "boobResize", [i])

        "penisSizeSelection":
            announceTargeting()
            saynn("Currently resizing "+ _receiver.getBodypart(BodypartSlot.Penis).getLewdName())
            addButton("Back", "go back", "resizeMenu") # making sure that its always in front
            if _receiver.getBodypart(BodypartSlot.Penis).getLength()>30:
                for i in range(max(1,_receiver.getBodypart(BodypartSlot.Penis).getLength()-30), \
                _receiver.getBodypart(BodypartSlot.Penis).getLength()+31,5):
                    var theSize = Util.cmToString(i)
                    addButton(theSize, "Select "+theSize, "penisResize", [i])

            elif (_receiver.getBodypart(BodypartSlot.Penis).getLength()<=30) and (_receiver.getBodypart(BodypartSlot.Penis).getLength()>1):
                for i in range(max(1,_receiver.getBodypart(BodypartSlot.Penis).getLength()-15), \
                _receiver.getBodypart(BodypartSlot.Penis).getLength()+16,1):
                    var theSize = Util.cmToString(i)
                    addButton(theSize, "Select "+theSize, "penisResize", [i])

            elif _receiver.getBodypart(BodypartSlot.Penis).getLength()<=1.0: # making 0.1 cm penis possible
                # Log.print("equal 1.0")
                for i in range(1,12,1): # making it escapeable
                        var actualSize = i*0.1
                        var theSize = Util.cmToString(Util.roundF(actualSize,1))
                        addButton(theSize, "Select "+theSize, "penisResize", [Util.roundF(actualSize,1)])

        "ballsSizeSelection":
            announceTargeting()
            saynn("Currently resizing " + RNG.pick(["cum storage","balls"]))
            addMessage("Please note that this is cosmetic only. there is no plan to make it affect gameplay right now.")
            addButton("Back", "go back", "resizeMenu") # making sure that its always in front
            for i in [0.0,0.2,0.5,0.8,1.0,1.2,1.5,1.8,2.0,2.5,3.0,4.0,5.0,10.0]:
                addButton(str(int(i*100))+"%", "Select "+str(int(i*100))+"%", "ballsResize", [i])
        
        "convertBodypart2HyperableMenu":
            addButton("Nevermind", "go back", "")
            for slot in slotsToCheck:
                var bodypart = _receiver.getBodypart(slot)
                if bodypart != null:
                    var bodypartID = bodypart.id
                    if str(bodypartID) + "hyperable" in GlobalRegistry.bodyparts && !checkHasHyperable(slot, _receiver):
                        addButton(GlobalRegistry.bodyparts[bodypartID+"hyperable"].visibleName, "Convert " + bodypart.visibleName + " to hyperable", "convertBodypart", [bodypartID+"hyperable", slot])
                        printDebug("yes, "+str(bodypartID) + "hyperable existed")
                    elif checkHasHyperable(slot, _receiver):
                        if (bodypartID in outdatedBodyparts):
                            addButton(GlobalRegistry.bodyparts[outdatedBodyparts[bodypartID]].visibleName, "Update " + bodypart.visibleName + " to supported version", "convertBodypart", [outdatedBodyparts[bodypartID], slot])
                            printDebug(bodypartID + " is outdated, suggested "+outdatedBodyparts[bodypartID]+" instead")
                        else:
                            addDisabledButton(bodypart.visibleName, bodypart.visibleName + " is already hyperable")
                            printDebug("the " + str(bodypartID)+ " is already hyperable")
                    else:
                        addDisabledButton(bodypartID+"hyperable", "does not existed")
                        printDebug("no, "+str(bodypartID) + "hyperable" + " DOES NOT existed")
                else:
                    addDisabledButton(slot + " empty", slot+" slot does not have any bodypart")
                    printDebug("slot " + slot + " does not have any bodypart")
            saynn("Currently converting a bodypart to hyperable, which one do you pick?")

        "convertBodypartFromHyperableMenu":
            addButton("Nevermind", "go back", "")
            for slot in slotsToCheck:
                var bodypart = _receiver.getBodypart(slot)
                if bodypart != null:
                    var bodypartID = bodypart.id
                    if (checkHasHyperable(slot, _receiver) && !(bodypartID in outdatedBodyparts)):
                        if (bodypartID.trim_suffix("hyperable" in GlobalRegistry.bodyparts)):
                            addButton(GlobalRegistry.bodyparts[bodypartID.trim_suffix("hyperable")].visibleName, "revert " + bodypart.visibleName + " from hyperable", "convertBodypart", [bodypartID.trim_suffix("hyperable"), slot])
                            printDebug(slot+" ("+bodypartID+") has hyperable, convertable to normal one")
                        else:
                            addDisabledButton(bodypart.visibleName, "unable to revert back slot "+slot)
                            printDebug(slot+" ("+bodypartID+") has hyperable but unable to convert to normal one")
                    elif (bodypartID in outdatedBodyparts):
                        addDisabledButton(GlobalRegistry.bodyparts[outdatedBodyparts[bodypartID]].visibleName, "unable to revert due to the bodypart being outdated, please update it with convert menu.")
                        printDebug(slot+" ("+bodypartID+") is outdated")
                    else:
                        addDisabledButton(bodypart.visibleName, bodypart.visibleName+" is already normal")
                        printDebug(slot+" ("+bodypartID+") is already normal")
                else:
                    addDisabledButton(slot + " empty", slot+" slot does not have any bodypart")
                    printDebug("slot " + slot + " does not have any bodypart")
            saynn("Currently revertiing a bodypart from hyperable, which one do you pick?")

        "clearOrifice":
            addButton("Nevermind", "go back", "")
     
       
        "endTurn":
            addButton("OK","Continue","endScene")

        _:
            addMessage("It appears to be an error, please tell the developer what you did and maybe provide save.")
            addButton("OK?","I didn\'t know what happened but alright","")

func _react(_action: String, _args):
    if _action == "endScene":
        endScene()
        return

    if _action == "printSceneStack":
        var i = 0
        for scene in GM.main.sceneStack:
            var resultText = ""
            var sceneO:SceneBase = scene
            resultText += str(i)+") id = \""+str(sceneO.sceneID)+"\"\n"
            resultText += "state = \""+str(sceneO.state)+"\"\n"
            resultText += "SAVEDATA:\n"+var2str(sceneO.saveData())+"\n\n"
            i +=1
            print(resultText)

        setState("")
        return

    if _action == "targetSelf":
        _receiver = GM.pc
        addMessage("Now targeting "+ _receiver.getName())
        
        setState("")
        return

    if _action == "targetEnemy":
        var theFightScene = GM.main.getCurrentFightScene()

        if theFightScene != null:
            _receiver = theFightScene.enemyCharacter
            addMessage("Now targeting "+_receiver.getName())
        else: addMessage("There is no active fight scene! Tell this to developer!")

        setState("")
        return
    
    if _action == "boobResize":
        oldSize = _receiver.getBodypart(BodypartSlot.Breasts).getSize()
        var text:String = _receiver.getName()+ " just got "+_receiver.hisHer()+" "+ _receiver.getBodypart(BodypartSlot.Breasts).getLewdName()+" resized! "
        if checkHasHyperable(BodypartSlot.Breasts,_receiver):
            text += "(from "+_receiver.getBodypart(BodypartSlot.Breasts).breastSizeModClass.breastSizeToCupString(oldSize)+")"
        else: 
            text += "(from "+_receiver.getBodypart(BodypartSlot.Breasts).BreastsSize.breastSizeToCupString(oldSize)+")"
        addMessage(text)
        _receiver.getBodypart(BodypartSlot.Breasts).size =_args[0]
        _receiver.updateAppearance()
        
        if calledFrom != 0 : 
            setState("endTurn") # end the scene if called from combat
        else: 
            setState("")
        return

    if _action == "penisResize":
        oldSize = _receiver.getBodypart(BodypartSlot.Penis).getLength()
        addMessage(_receiver.getName()+ " just got "+_receiver.hisHer()+" "+ _receiver.getBodypart(BodypartSlot.Penis).getLewdName()+" resized! ("+Util.cmToString(_args[0] - oldSize)+")")
        _receiver.getBodypart(BodypartSlot.Penis).lengthCM = (_args[0])
        _receiver.updateAppearance()
        
        if calledFrom != 0 : 
            setState("endTurn") # end the scene if called from combat
            return
        else: 
            setState("")
            return

    if _action == "ballsResize":
        _receiver.getBodypart(BodypartSlot.Penis).ballsScale = _args[0]
        _receiver.updateAppearance()
        addMessage(_receiver.getName()+" just got "+_receiver.hisHer()+" "+RNG.pick(["balls","testicles","churning bags","male milk storage","•"])+" resized!")
        
        if calledFrom != 0 : 
            setState("endTurn") # end the scene if called from combat
        else: 
            setState("")
        return

    if _action == "induceLactation":
        _receiver.induceLactation()
        addMessage(_receiver.getName()+" just got "+_receiver.hisHer()+" "+_receiver.getBodypart(BodypartSlot.Breasts).getLewdName()+" force lactated!")
        
        if calledFrom != 0 : 
            setState("endTurn") # end the scene if called from combat
        else: 
            setState("")
        return
    
    if _action == "convertBodypart":
        var _toBodypart = _args[0]
        var _slot = _args[1]
        var _oldBodypart = _receiver.getBodypart(_slot).id
        var dataToRestore = _receiver.getBodypart(_slot).saveData().duplicate(true)
        _receiver.removeBodypart(_slot)
        _receiver.giveBodypartUnlessSame(GlobalRegistry.createBodypart(_toBodypart))
        _receiver.getBodypart(_slot).loadData(dataToRestore)
        _receiver.updateAppearance()
        addMessage("Successfully changed "+GlobalRegistry.bodyparts[_oldBodypart].visibleName+" to "+GlobalRegistry.bodyparts[_toBodypart].visibleName)
        if calledFrom != 0 : 
            setState("endTurn") # end the scene if called from combat
        else: 
            setState("")
        return
    setState(_action)

func saveData():
    var data = .saveData()
    
    data["calledFrom"] = calledFrom
    data["oldSize"] = oldSize
    data["_receiverID"] = _receiverID
    # data["receiverHas"] = receiverHas
    
    return data
    
func loadData(data):
    .loadData(data)
    
    calledFrom = SAVE.loadVar(data, "calledFrom", int(0))
    oldSize = SAVE.loadVar(data, "oldSize", float(0.0))
    _receiverID = SAVE.loadVar(data, "_receiverID", "")
    _receiver = GlobalRegistry.getCharacter(_receiverID)
    # yield(GM.get_tree().create_timer(0.2), "timeout")
    # receiverHas = SAVE.loadVar(data, "receiverHas", "")

func checkHasHyperable(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false

func checkHasAnyHyperable(_who):
    for i in slotsToCheck:
        if checkHasHyperable(i, _who):
            return true
    return false

func checkHasOutdated(_who):
    if _who != null:
        for i in slotsToCheck:
            if _who.hasBodypart(i):
                if _who.getBodypart(i).id in outdatedBodyparts:
                    return true
    return false