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

func getPrice(): return 100


func getPossibleActions():
    return [
        {
            "name": "Use",
            "scene": "UseItemLikeInCombatScene",
            "description": "use the thing",
        },
    ]    

# func useInSex(_receiver):
# 	_receiver.addEffect(StatusEffect.SexAnaphrodisiacDrug)
# 	_receiver.removeEffect(StatusEffect.SexHeatDrug)
# 	return {
# 		text = "{USER.You} {USER.youVerb('feel')} like {USER.youHe} lost passion for sex.".replace("USER", _receiver.getID()),
# 	}

func useInCombat(_attacker, _receiver):
    var receiverHas:bool = false
    if _receiver !=null:
        for i in [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Anus, BodypartSlot.Vagina]:
            if checkHas(i, _receiver):
                receiverHas = true
                break
        if !receiverHas:
            return _receiver.getName() + " doesn't have any bluespace anomalies"
        GM.main.getCurrentFightScene().runScene("RayGunUse")
    GM.main.getCurrentScene().runScene("RayGunUse")
    return "You holster your energy weapon."

func checkHas(bodyslot, _who:BaseCharacter): # this checks if _who have hyperable parts
    if _who != null:
        if _who.hasBodypart(bodyslot):
            if _who.bodypartHasTrait(bodyslot,"Hyperable"):
                return true
    return false

func getTag():
    for i in [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Anus, BodypartSlot.Vagina]:
        if checkHas(i, GM.pc):
            return [ItemTag.SoldByAlexRynard]
    return []