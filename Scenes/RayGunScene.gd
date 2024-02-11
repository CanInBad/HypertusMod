extends SceneBase

var _receiver:BaseCharacter = null # very dangerous
var oldSize:float = 0.0
var calledFrom:int = 0 # 0 is default

func _init():
    sceneID = "RayGunUse"

# func _initScene(_args = []):
#     if(_args.size() > 0):
#         calledFrom = _args[0]

func _reactInit():
    var theFightScene = GM.main.getCurrentFightScene()

    if theFightScene != null: # and (calledFrom == 1): # my dumb ass forgot that SexActivity is sperate thing
        _receiver = theFightScene.enemyCharacter
        calledFrom = 1
    else:
        _receiver = GM.pc

func _run():
    match state:
        "":
            if _receiver == null:
                addMessage("WTF???? why is \"_receiver\" null???????")
                setState("endScene")
            else:
                if _receiver == GM.pc:
                    saynn("Currently targeting: [b]"+_receiver.getName()+"[/b] (The player)")
                else:
                    saynn("Currently targeting: [b]"+_receiver.getName()+"[/b]")

            var hasHyperable:bool = false
            for i in [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Anus, BodypartSlot.Vagina]:
                if checkHasHyperable(i, _receiver):
                    hasHyperable = true
                    break

            saynn("What do you want to do?")
            if hasHyperable:
                addButton("Resize","Use it","resizeMenu")
            else:
                addDisabledButton("Resize",_receiver.getName()+" does not have any hyperable parts")
            if checkHasHyperable(BodypartSlot.Breasts, _receiver):
                addButton("Induce lactation", "Foce", "induceLactation")
            else:
                addDisabledButton("Induce lactation",_receiver.getName()+" does not have any hyperable breasts")

            addButton("Nothing", "", "endScene")
        "resizeMenu":
            saynn("What part would you like to resize?")

            if checkHasHyperable(BodypartSlot.Penis,_receiver):
                addButton("Penis","resize them shlong","penisSizeSelect")
                addButton("Balls","resize them balls", "ballsSizeSelect")
            else:
                addDisabledButton("Penis","They don't have them hotdog hyperable")
                addDisabledButton("Balls","They don't have them balls hyperable")

            if checkHasHyperable(BodypartSlot.Breasts,_receiver):
                addButton("Breasts","resize them boobies","boobSizeSelect")
            else:
                addDisabledButton("Breasts","They don't have them boobies hyperable")

            addButton("Back", "go back", "")

        "boobSizeSelection":
            addButton("Back", "go back", "resizeMenu") # making sure that its always in front
            for i in range(max(-1,_receiver.getBodypart(BodypartSlot.Breasts).getBaseSize()-5), \
            min(50, _receiver.getBodypart(BodypartSlot.Breasts).getBaseSize()+5),1):
                var theSize = _receiver.getBodypart(BodypartSlot.Breasts).breastSizeModClass.breastSizeToCupString(i)
                addButton(theSize, "Select "+theSize, "boobResize", [i])

        "penisSizeSelection":
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
                Log.print("equal 1.0")
                for i in range(1,11,1):
                        var actualSize = i*0.1
                        var theSize = Util.cmToString(Util.roundF(actualSize,1))
                        addButton(theSize, "Select "+theSize, "penisResize", [Util.roundF(actualSize,1)])

        "ballsSizeSelection":
            addMessage("Please note that this is cosmetic only. there is no plan to make it affect gameplay right now.")
            addButton("Back", "go back", "resizeMenu") # making sure that its always in front
            for i in [0.0,0.2,0.5,0.8,1.0,1.2,1.5,1.8,2.0,2.5,3.0,4.0,5.0,10.0]:
                addButton(str(int(i*100))+"%", "Select "+str(int(i*100))+"%", "ballsResize", [i])


func _react(_action: String, _args):
    if _action == "endScene":
        endScene()
        return

    if _action == "boobSizeSelect":
        setState("boobSizeSelection")
        return

    if _action == "penisSizeSelect":
        setState("penisSizeSelection")
        return

    if _action == "ballsSizeSelect":
        setState("ballsSizeSelection")
        return

    if _action == "boobResize":
        # oldSize = _receiver.getBodypart(BodypartSlot.Breasts).getSize()
        addMessage(_receiver.getName()+ " just got "+_receiver.hisHer()+" "+ _receiver.getBodypart(BodypartSlot.Breasts).getLewdName()+" resized!")
        _receiver.getBodypart(BodypartSlot.Breasts).setBaseSize(_args[0])
        _receiver.updateAppearance()
        
        if calledFrom != 0 : setState("endScene")
        else: setState("")
        return

    if _action == "penisResize":
        oldSize = _receiver.getBodypart(BodypartSlot.Penis).getLength()
        addMessage(_receiver.getName()+ " just got "+_receiver.hisHer()+" "+ _receiver.getBodypart(BodypartSlot.Penis).getLewdName()+" resized! ("+Util.cmToString(_args[0] - oldSize)+")")
        _receiver.getBodypart(BodypartSlot.Penis).setLength(_args[0])
        _receiver.updateAppearance()
        
        if calledFrom != 0 : setState("endScene")
        else: setState("")
        return

    if _action == "ballsResize":
        _receiver.getBodypart(BodypartSlot.Penis).ballsScale = _args[0]
        _receiver.updateAppearance()
        addMessage(_receiver.getName()+" just got "+_receiver.hisHer()+" "+RNG.pick(["balls","testicles","churning bags","male milk storage","•"])+" resized!")
        
        if calledFrom != 0 : setState("endScene")
        else: setState("")
        return

    if _action == "induceLactation":
        _receiver.induceLactation()
        addMessage(_receiver.getName()+" just got "+_receiver.hisHer()+" "+_receiver.getBodypart(BodypartSlot.Breasts).getLewdName()+" force lactated!")
        
        if calledFrom != 0 : setState("endScene")
        else: setState("")
        return

    setState(_action)

func saveData():
    var data = .saveData()
    
    data["oldSize"] = oldSize
    data["_receiver"] = _receiver
    
    return data
    
func loadData(data):
    .loadData(data)
    
    oldSize = SAVE.loadVar(data, "oldSize", "")
    _receiver = SAVE.loadVar(data, "_receiver", "")

func checkHasHyperable(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false