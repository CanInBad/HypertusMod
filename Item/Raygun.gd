extends ItemBase

func _init():
    id = "hypertusRayGun"

func getVisibleName():
    return "Personal Bluespace Anomaly Emitter"

func getCasualName():
    return "Raygun"
    
func getDescription():
    return "Tool that use to invoke bluespace on already existing anomalies"

func canUseInCombat(): return true

func canCombine(): return false

func getItemCategory(): return ItemCategory.Weapons

func getPrice(): return 25


func getPossibleActions():
    return [
        {
            "name": "Use",
            "scene": "UseItemLikeInCombatScene",
            "description": "use the thing",
        },
    ]    

func useInCombat(_attacker, _receiver):
    var _receiverHas:bool = false
    if _receiver !=null:
        for i in [BodypartSlot.Breasts, BodypartSlot.Penis,]: # BodypartSlot.Anus, BodypartSlot.Vagina]: # there are only 2 for now
            if checkHas(i, _receiver):
                _receiverHas = true
                break
        GM.main.getCurrentFightScene().runScene("RayGunUse", [_receiverHas])
        return "{pc.You} quickly holster {pc.your} energy weapon.\n[i]You only got one shot[/i]"
    else:
        for i in [BodypartSlot.Breasts, BodypartSlot.Penis,]: # BodypartSlot.Anus, BodypartSlot.Vagina]: # there are only 2 for now
            if checkHas(i, GM.pc):
                _receiverHas = true
                break
        GM.main.getCurrentScene().runScene("RayGunUse", [_receiverHas]) # assume that player have it, the check only use for targeting anyways
        return "{pc.You} holster {pc.your} energy weapon."

func checkHas(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false

func getTags():
    for i in [BodypartSlot.Breasts, BodypartSlot.Penis,]: # BodypartSlot.Anus, BodypartSlot.Vagina]: #there is only 2 sizes for now
        if checkHas(i, GM.pc):
            return [ItemTag.SoldByAlexRynard]
    return []