extends BreastsSize

enum {
    P = 16,
    Q = 17,
    R = 18,
    S = 19,
    T = 20,
    U = 21,
    V = 22,
    W = 23,
    X = 24,
    Y = 25,
    Z = 26,
    ALPHA = 27,
    BETA = 28,
    GAMMA = 29,
    DELTA = 30,
    EPSILON = 31,
    ZETA = 32,
    ETA = 33,
    THETA = 34,
    IOTA = 35,
    KAPPA = 36,
    LAMDA = 37,
    MU = 38,
    NU = 39,
    XI = 40,
    OMRICON = 41,
    PIA = 42,
    RHO = 43,
    SIGMA = 44,
    TAUA = 45,
    UPSILON = 46,
    PHI = 47,
    CHI = 48,
    PSI = 49,
    OMEGA = 50
}

static func getAll():
    return [
        BreastsSize.FOREVER_FLAT,
        BreastsSize.FLAT,
        BreastsSize.A,
        BreastsSize.B,
        BreastsSize.C,
        BreastsSize.D,
        BreastsSize.DD,
        BreastsSize.DDD,
        BreastsSize.G,
        BreastsSize.H,
        BreastsSize.I,
        BreastsSize.J,
        BreastsSize.K,
        BreastsSize.L,
        BreastsSize.M,
        BreastsSize.N,
        BreastsSize.O,
        P, 
        Q, 
        R,
        S,
        T,
        U,
        V,
        X,
        Y,
        Z,
        ALPHA,
        BETA,
        GAMMA,
        DELTA,
        EPSILON,
        ZETA,
        ETA,
        THETA,
        IOTA,
        KAPPA,
        LAMDA,
        MU,
        NU,
        XI,
        OMRICON,
        PIA,
        RHO,
        SIGMA,
        TAUA,
        UPSILON,
        PHI,
        CHI,
        PSI,
        OMEGA
    ]

static func breastSizeToString(bsize:int):
    var names = {
        BreastsSize.FOREVER_FLAT: "Forever Flat",
        BreastsSize.FLAT: "Flat",
        BreastsSize.A: "A",
        BreastsSize.B: "B",
        BreastsSize.C: "C",
        BreastsSize.D: "D",
        BreastsSize.DD: "DD",
        BreastsSize.DDD: "DDD",
        BreastsSize.G: "G",
        BreastsSize.H: "H",
        BreastsSize.I: "I",
        BreastsSize.J: "J",
        BreastsSize.K: "K",
        BreastsSize.L: "L",
        BreastsSize.M: "M",
        BreastsSize.N: "N",
        BreastsSize.O: "O",
        P: "P", 
        Q: "Q", 
        R: "R",
        S: "S",
        T: "T",
        U: "U",
        V: "V",
        X: "X",
        Y: "Y",
        Z: "Z",
        ALPHA:	"α",
        BETA:	"β",
        GAMMA:	"γ",
        DELTA:	"δ",
        EPSILON:"ε",
        ZETA:	"ζ",
        ETA:	"η",
        THETA:	"θ",
        IOTA:	"ι",
        KAPPA:	"κ",
        LAMDA:	"λ",
        MU: 	"μ",
        NU: 	"ν",
        XI: 	"ξ",
        OMRICON:"ο",
        PIA: 	"π",
        RHO: 	"ρ",
        SIGMA: 	"σ",
        TAUA: 	"τ",
        UPSILON:"υ",
        PHI: 	"φ",
        CHI: 	"χ",
        PSI: 	"ψ",
        OMEGA: 	"ω"
    }
    # print(bsize," ",names[bsize])
    if(names.has(bsize)):
        return names[bsize]
    if(bsize < -1):
        return "Forever flat"
    return "WHAT" #this shouldn't happen right

static func breastSizeToCupString(bsize:int): # so I have been googling and 
    var cupName = breastSizeToString(bsize)   # https://en.wikipedia.org/wiki/Bra_size#Manufacturer_design_standards
    if(bsize <= 0):							  # seems good enough?
        return cupName
    if(bsize >= ALPHA):
        return "Greek-Letter-Cup ("+cupName+"-cup)"
    return cupName+"-cup"

static func breastSizeToMilkAmount(bsize:int):
    var amounts = {
        BreastsSize.FOREVER_FLAT: 0.0, 
        BreastsSize.FLAT: 0.0, 
        BreastsSize.A: 1.0, 
        BreastsSize.B: 1.5, 
        BreastsSize.C: 3.0, 
        BreastsSize.D: 5.0, 
        BreastsSize.DD: 8.0, 
        BreastsSize.DDD: 10.0, 
        BreastsSize.G: 12.0, 
        BreastsSize.H: 15.0, 
        BreastsSize.I: 20.0, 
        BreastsSize.J: 25.0, 
        BreastsSize.K: 32.0, 
        BreastsSize.L: 40.0, 
        BreastsSize.M: 50.0, 
        BreastsSize.N: 65.0, 
        BreastsSize.O: 80.0,
        P: 80.0+(15.0*1.0), 
        Q: 80.0+(15.0*2.0), 
        R: 80.0+(15.0*3.0),
        S: 80.0+(15.0*4.0),
        T: 80.0+(15.0*5.0),
        U: 80.0+(15.0*6.0),
        V: 80.0+(15.0*7.0),
        X: 80.0+(15.0*8.0),
        Y: 80.0+(15.0*9.0),
        Z: 80.0+(15.0*10.0), #haha im too lazy haha
        ALPHA:  250.0,
        BETA :  250.0+(25.0*1.0),
        GAMMA:  250.0+(25.0*2.0),
        DELTA:  250.0+(25.0*3.0),
        EPSILON:250.0+(25.0*4.0),
        ZETA:   250.0+(25.0*5.0),
        ETA:    250.0+(25.0*6.0),
        THETA:  250.0+(25.0*7.0),
        IOTA:   250.0+(25.0*8.0),
        KAPPA:  250.0+(25.0*9.0),
        LAMDA:  250.0+(25.0*10.0),
        MU:     550,
        NU:     550.0+(30.0*1.0),
        XI:     550.0+(30.0*2.0),
        OMRICON:550.0+(30.0*3.0),
        PIA:    550.0+(30.0*4.0),
        RHO:    550.0+(30.0*5.0),
        SIGMA:  550.0+(30.0*6.0),
        TAUA:   550.0+(30.0*7.0),
        UPSILON:550.0+(30.0*8.0),
        PHI:    550.0+(30.0*9.0),
        CHI:    550.0+(30.0*10.0),
        PSI:    900,
        OMEGA:  1000
    }
    
    if(amounts.has(bsize)):
        return amounts[bsize]
    
    if(bsize <= 0):
        return 0.0
    
    return 100.0

static func breastSizeToBoneScale(bsize:int):
    var sizes = {
        BreastsSize.FOREVER_FLAT: 1.0, 
        BreastsSize.FLAT: 1.0, 
        BreastsSize.A: 0.5, 
        BreastsSize.B: 0.6, 
        BreastsSize.C: 0.8, 
        BreastsSize.D: 1.0, 
        BreastsSize.DD: 1.1, 
        BreastsSize.DDD: 1.2, 
        BreastsSize.G: 1.3, 
        BreastsSize.H: 1.4, 
        BreastsSize.I: 1.5, 
        BreastsSize.J: 1.6, 
        BreastsSize.K: 1.7, 
        BreastsSize.L: 1.8, 
        BreastsSize.M: 1.9, 
        BreastsSize.N: 2.0, 
        BreastsSize.O: 2.1,
        Q: 2.2, 
        R: 2.3,
        S: 2.4,
        T: 2.5,
        U: 2.6,
        V: 2.7,
        X: 2.8,
        Y: 2.9,
        Z: 3.0,
        ALPHA: 	3.1,
        BETA: 	3.2,
        GAMMA:	3.3,
        DELTA:	3.4,
        EPSILON:3.5,
        ZETA:	3.6,
        ETA:	3.7,
        THETA:	3.8,
        IOTA:	3.9,
        KAPPA:	4.0,
        LAMDA:	4.1,
        MU:		4.2,
        NU:		4.3,
        XI:		4.4,
        OMRICON:4.5,
        PIA:	4.6,
        RHO:	4.7,
        SIGMA:	4.8,
        TAUA:	4.9,
        UPSILON:5.0,
        PHI:	5.1,
        CHI:	5.2,
        PSI:	5.3,
        OMEGA:	5.4
    }
    
    if(sizes.has(bsize)):
        return sizes[bsize]
    
    if(bsize <= 0):
        return 1.0
    
    var lastKey = OMEGA
    return sizes[lastKey] + float(bsize - lastKey) / 10.0
    

static func breastSizeToNameProcedural(bsize:int, cupEnding:String="-cup"):
	if(bsize <= -1):
		return "Forever flat"
	if(bsize <= 0):
		return "Flat"
	
	var names:Dictionary = {BreastsSize.A:"A", BreastsSize.B:"B", BreastsSize.C:"C", BreastsSize.D:"D", BreastsSize.DD:"DD", BreastsSize.DDD:"DDD"}
	if(names.has(bsize)):
		return names[bsize]+cupEnding
	
	var base_char:int = ord('A')
	var cup_char_ind:int = (bsize)
	var finalCupLetter:String = ""
	while(cup_char_ind >= 26):
		cup_char_ind -= 26
		finalCupLetter += "Z"
	if(cup_char_ind > 0):
		finalCupLetter += char(base_char - 1 + cup_char_ind)
	return finalCupLetter + cupEnding
