extends SexActivityBase

var theGun:String = ""
var oldSize:float = 0.0 # very dangerous!
var newSize:float = 0.0

func _init():
    id = "DomRayGunUseOnPenisIncreaseSub"
    startedByDom = true
    startedBySub = false

func getGoals(): return {}

func getVisibleName(): return "Use Personal Bluespace Anomaly Emitter"

func getCategory(): return ["Use"]

func getDomTags(): return []

func getSubTags(): return [SexActivityTag.PenisUsed]

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
    var sub:BaseCharacter = _subInfo.getChar()
    var subHyperable = checkHasHyperable(BodypartSlot.Penis,sub)
    if !subHyperable:
        Log.print(sub.getName()+" doesn't have hyperable pp")
        return false
    Log.print(sub.getName()+" DOES have hyperable pp")
    return true # idk if this will have any consequences
    # return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
    var actions = []
    var dom:BaseCharacter = _domInfo.getChar()
    var sub:BaseCharacter = _subInfo.getChar()
    oldSize = sub.getBodypart(BodypartSlot.Penis).getLength()

    if dom.isPlayer():
        # if checkHasHyperable(BodypartSlot.Penis, sub):
        for gun in dom.getInventory().getAllOf("hypertusRayGun"):
            for amount in range(sub.getBodypart(BodypartSlot.Penis).getLength()+20.0,sub.getBodypart(BodypartSlot.Penis).getLength(),-5.0):
                var toName = ""
                if amount-oldSize>0:
                    toName = "[color=green]+"+str(amount-oldSize)+"[/color]"
                else:
                    toName = "[color=red]-"+str(amount-oldSize)+"[/color]"
                actions.append({
                    name = toName,
                    desc = gun.getVisisbleDescription(),
                    args = ["sub", gun.uniqueID, amount],
                    score = 0.0,
                    category = ["Use", "Penis Increase on Sub"]
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

    if _args[0] == "sub":
        var rayGun:ItemBase
        if getDom().isPlayer():
            rayGun = getDom().getInventory().getItemByUniqueID(_args[1])
            theGun = rayGun.uniqueID
        else: # this is not used yet, maybe after I figure out fetishes
            rayGun = GlobalRegistry.createItem(_args[1])
            theGun = rayGun.uniqueID
        newSize = _args[2]
  
        var text = RNG.pick([
            "{dom.You} {dom.youVerb('shoot')} the "+rayGun.getCasualName()+" on {sub.you}.",
            "{dom.You} {dom.youVerb('pull')} the "+rayGun.getCasualName()+"\'s trigger on {sub.you}.",
        ])

        return { text = text }

func processTurn():
    var sub = getSub()
    if state == "":
        if oldSize==newSize:
            sub.getBodypart(BodypartSlot.Penis).setLength(newSize)
            endActivity()
            var toText = "\nNew size: "+str(sub.getBodypart(BodypartSlot.Penis).getLength())+" ([color=green]+"+str(newSize-oldSize)+"[/color])"
            return {
                text = "{dom.You} shot {sub.yourHis} "+str(sub.getBodypart(BodypartSlot.Penis).getLewdName())+"."+toText,
            }


func saveData():
    var data = .saveData()

    data["theGun"] = theGun
    data["oldSize"] = oldSize
    data["newSize"] = newSize

    return data

func loadData(data):
    .loadData(data)

    theGun = SAVE.loadVar(data, "theGun", "")
    oldSize = SAVE.loadVar(data, "oldSize", 0.0)
    newSize = SAVE.loadVar(data, "newSize", 0.0)

func checkHasHyperable(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false