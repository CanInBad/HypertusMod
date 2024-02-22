extends SexActivityBase

var theGun:String = ""
var oldSize:float = 0.0 # very dangerous!
var newSize:float = 0.0
var tick:int = 0
var breastSizeMod = load("res://Modules/Z_Hypertus/Misc/BreastsSizeModi.gd").new()

func _init():
    id = "DomRayGunUseOnSelfBreast"
    startedByDom = true
    startedBySub = false

func getGoals(): return {}

func getVisibleName(): return "Use Personal Bluespace Anomaly Emitter"

func getCategory(): return ["Use"]

func getDomTags(): return []

func getSubTags(): return [SexActivityTag.BreastsUsed]

func getSupportedSexTypes():
    return {
        SexType.DefaultSex: true,
        SexType.StocksSex: true,
        SexType.SlutwallSex: true,
    }

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
    return 0.0

var allRaygunIDs = ["hypertusRayGun"] # sorry, I will do better.

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
    var dom:BaseCharacter = _domInfo.getChar()
    var domHyperable = checkHasHyperable(BodypartSlot.Breasts,dom)
    if !domHyperable:
        return false
    return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
    var actions = []
    var dom:BaseCharacter = _domInfo.getChar()
    # var sub:BaseCharacter = _subInfo.getChar()
    oldSize = dom.getBodypart(BodypartSlot.Breasts).getBaseSize()

    if dom.isPlayer():
        for gun in dom.getInventory().getAllOf("hypertusRayGun"):
            for amount in range(min(50,dom.getBodypart(BodypartSlot.Breasts).getBaseSize()+5),max(dom.getBodypart(BodypartSlot.Breasts).getBaseSize()-5,0),-1):
                var toName = ""
                var toDesc = ""
                toName = breastSizeMod.breastSizeToCupString(amount)
                toDesc = breastSizeMod.breastSizeToCupString(amount)
                if amount == dom.getBodypart(BodypartSlot.Breasts).getBaseSize():
                    continue
                actions.append({
                    name = toName,
                    desc = toDesc,
                    args = ["dom", gun.uniqueID, amount, oldSize],
                    score = 0.0,
                    category = ["Use", "Resize Breasts on Self"]
                })
    else:
        # for id in allRaygunIDs:
        #     var gun:ItemBase = GlobalRegistry.getItemRef(id)
            # actions.append({
            #     name = gun.getVisibleName(),
            #     desc = gun.getVisisbleDescription(),
            #     args = ["sub", gun.uniqueID],
            #     score = 0.0, # I am not ready to make a new fetish yet
            #     category = ["Use", "Raygun penis increase on sub"]
            # })
        actions = []

    return actions
    
func startActivity(_args):
    state = ""

    if _args[0] == "dom":
        var rayGun:ItemBase
        if getDom().isPlayer():
            rayGun = getDom().getInventory().getItemByUniqueID(_args[1])
            theGun = rayGun.uniqueID
        else: # this is not used yet, maybe after I figure out fetishes
            rayGun = GlobalRegistry.createItem(_args[1])
            theGun = rayGun.uniqueID
        newSize = _args[2]
        oldSize = _args[3]
  
        var text = RNG.pick([
            "{dom.You} {dom.youVerb('aim')} the "+rayGun.getCasualName()+" on {dom.yourself}.",
            "{dom.You} {dom.youVerb('ready')} the "+rayGun.getCasualName()+"\'s trigger on {dom.yourself}.",
        ])

        return { text = text }

func processTurn():
    var dom = getDom()
    if state == "":
        if (newSize == oldSize):
            endActivity()
            return
        
        tick += 1

        if(tick>1):
            dom.getBodypart(BodypartSlot.Breasts).size = newSize
            dom.updateAppearance()
            var colorCode = ""
            if newSize-oldSize>0: colorCode = "7CFC00]+"
            else: colorCode = "FF4500]"

            var number = " ([color=#"+colorCode+str(newSize-oldSize)+"[/color])"
            var toText = "{dom.You} shot {sub.yourHis} "+str(dom.getBodypart(BodypartSlot.Breasts).getLewdName())+"."\
            +"\nNew size: "+breastSizeMod.breastSizeToCupString(dom.getBodypart(BodypartSlot.Breasts).getSize())+number
            
            endActivity()
            return {
                text = toText,
            }

func saveData():
    var data = .saveData()

    data["theGun"] = theGun
    data["oldSize"] = oldSize
    data["newSize"] = newSize
    data["tick"] = tick

    return data

func loadData(data):
    .loadData(data)

    theGun = SAVE.loadVar(data, "theGun", "")
    oldSize = SAVE.loadVar(data, "oldSize", 0.0)
    newSize = SAVE.loadVar(data, "newSize", 0.0)
    tick = SAVE.loadVar(data, "tick", 0)

func checkHasHyperable(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false