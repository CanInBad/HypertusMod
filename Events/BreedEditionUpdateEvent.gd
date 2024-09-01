extends EventBase

func _init(): id = "HypertusBreedEditionUpdate"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
    var toWork = GlobalRegistry.getSpecies(Species.Canine)
    var flag = getModuleFlag("Hypertus","ForceBreedEdition",null)
    if (flag is bool):
        if (toWork.get("anus") != null):
            if (toWork.get("anus") == "anushyperable") && flag:
                for specie in GlobalRegistry.allSpecies:
                    if specie.get("anus") != null:
                        specie.set("anus","anuswombhyperable")
            elif (toWork.get("anus") == "anuswombhyperable") && !flag:
                for specie in GlobalRegistry.allSpecies:
                    if GlobalRegistry.allSpecies[specie].get("anus") != null:
                        GlobalRegistry.allSpecies[specie].set("anus","anushyperable")