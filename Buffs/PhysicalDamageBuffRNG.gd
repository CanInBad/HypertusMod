extends BuffBase

var amount = 0
var chance = 0

func _init():
	id = "Buff.PhysicalDamageBuffRNG"

func initBuff(_args):
	amount = _args[0]
	chance = _args[1]

func getVisibleDescription():
	var text = str(amount)
	var roll = str(chance)
	if(amount > 0 and chance > 0):
		text = "+"+text

	return "Physical damage "+text+"% with "+roll+"% chance"

func apply(_buffHolder):
	if RNG.chance(chance):
		_buffHolder.dealDamageMult[DamageType.Physical] += (amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Physical)

func saveData():
	var data = .saveData()
	
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	amount = SAVE.loadVar(_data, "amount", 0)

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
