extends FluidProduction
# class_name CumProductionNew # 😤

func getCapacity() -> float:
	var penis = getBodypart()
	var lenCM = penis.getLength()

	var mult = 1.0
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.PenisBallsVolume)
	
	return round((50.0 + pow(lenCM, 2.0)) * (mult))

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	
	var mult = 1.0
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.PenisCumProduction)

	return (getCapacity() / 4.0) * mult

func afterMilked():
	var pc = getCharacter()
	if pc.hadPerk("Perk.HyperPenisFillAfterMill"):
		fillPercent(75.0)

func getFluidSource():
	return FluidSource.Penis
