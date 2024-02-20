extends SceneBase

var _receiverID:String = ""
var _receiver:BaseCharacter = null # very dangerous
var oldSize:float = 0.0
var calledFrom:int = 0 # 0 is default, 1 is combat
# var receiverHas:bool = false

func _init():
    sceneID = "RayGunUse"

# func _initScene(_args = []):
#     if(_args.size() > 0):
#         receiverHas = _args[0]

func _reactInit():
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
            if OS.has_feature("editor"):
                addButton("PrintSceneStack","","printSceneStack")
                
            var hasHyperable:bool = false
            for i in [BodypartSlot.Breasts, BodypartSlot.Penis]:
                if checkHasHyperable(i, _receiver):
                    hasHyperable = true
                    break
            
            if _receiver == null:
                addMessage("WTF???? why is \"_receiver\" null???????")
                setState("endScene")
                return
            else:
                var text = "Currently targeting: [color="+_receiver.getChatColor()+"][b]"+_receiver.getName()+"[/b][/color]"
                if _receiver == GM.pc:
                    text += " (Player)"
                    if calledFrom == 1:
                        var theFightScene = GM.main.getCurrentFightScene()
                        if checkHasAnyHyperable(theFightScene.enemyCharacter):
                            addButtonAt(9,"Target Enemy","Change targeting to "+theFightScene.enemyCharacter.getName(),"targetEnemy")
                        else: addDisabledButtonAt(9,"Target Enemy","Can't change to "+theFightScene.enemyCharacter.getName()+" because they lack hyperable parts")
                else:
                    addButtonAt(9,"Target Self","Change targeting to "+GM.pc.getName(),"targetSelf")
                saynn(text)


            saynn("What do you want to do?")
            if hasHyperable:
                addButton("Resize","Resize their packages","resizeMenu")
            else:
                addDisabledButton("Resize",_receiver.heShe()+" does not have any hyperable parts")
            if checkHasHyperable(BodypartSlot.Breasts, _receiver):
                addButton("Induce lactation", "Force "+_receiver.hisHer()+" breast to lactate", "induceLactation")
            else:
                addDisabledButton("Induce lactation",_receiver.hisHer()+" does not have any hyperable breasts")
            
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
                for i in range(max(1,_receiver.getBodypart(BodypartSlot.Penis).getLength()-20), \
                _receiver.getBodypart(BodypartSlot.Penis).getLength()+20,5):
                    var theSize = Util.cmToString(i)
                    addButton(theSize, "Select "+theSize, "penisResize", [i])

            elif (_receiver.getBodypart(BodypartSlot.Penis).getLength()<=30) and (_receiver.getBodypart(BodypartSlot.Penis).getLength()>1):
                for i in range(max(1,_receiver.getBodypart(BodypartSlot.Penis).getLength()-15), \
                _receiver.getBodypart(BodypartSlot.Penis).getLength()+16,1):
                    var theSize = Util.cmToString(i)
                    addButton(theSize, "Select "+theSize, "penisResize", [i])

            elif _receiver.getBodypart(BodypartSlot.Penis).getLength()<=1.0: # making 0.1 cm penis possible
                # Log.print("equal 1.0")
                for i in range(1,11,1):
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
        _receiver.getBodypart(BodypartSlot.Breasts).setBaseSize(_args[0])
        _receiver.updateAppearance()
        
        if calledFrom != 0 : 
            setState("endTurn") # end the scene if called from combat
        else: 
            setState("")
        return

    if _action == "penisResize":
        oldSize = _receiver.getBodypart(BodypartSlot.Penis).getLength()
        addMessage(_receiver.getName()+ " just got "+_receiver.hisHer()+" "+ _receiver.getBodypart(BodypartSlot.Penis).getLewdName()+" resized! ("+Util.cmToString(_args[0] - oldSize)+")")
        _receiver.getBodypart(BodypartSlot.Penis).setLength(_args[0])
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
    for i in [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]:
        if checkHasHyperable(i, _who):
            return true
    return false
