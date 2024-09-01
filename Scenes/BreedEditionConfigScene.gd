extends SceneBase

func _init(): 
    sceneID = "HypertusBreedEditionConfigScene"

var toggle:bool = false
var moduleForceBreed:bool = false 

func _reactInit():
    moduleForceBreed = getModule("Hypertus").forceBreedEdition

func _run():
    match state:
        "":
            if !(getModuleFlag("Hypertus","ForceBreedEdition", null) is bool):
                toggle = moduleForceBreed
            else:
                toggle = getModuleFlag("Hypertus","ForceBreedEdition", false)
            sayn("Toggle Breed edition?")
            saynn("Currently on: {0}".format([toggle]))

            if moduleForceBreed:
                sayn("[i]Currently there is a breed edition config file for Hypertus, changing this option will make the option in this save independent from the config file.[/i]")
            
            addButton("Toggle!","Toggle the setting","toggle")
            addButton("Exit", "Get me out of here!!!","endscene")

func _react(_action: String, _args):
    if _action == "toggle":
        if toggle:
            setModuleFlag("Hypertus", "ForceBreedEdition",false)
        else:
            setModuleFlag("Hypertus", "ForceBreedEdition",true)
        setState("")
        return
    if _action == "endscene":
        endScene()
        return
    setState(_action)