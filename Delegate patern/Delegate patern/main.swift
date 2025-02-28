//
//  main.swift
//  Delegate patern
//
//  Created by Laszlo Kovacs on 2025. 01. 31..
//

import Foundation

protocol Tier3DataCertified {
    func canFixSwitches()
}

class Tier2Engineer {
    
    var dutyEngineer:Tier3DataCertified?
    
    func placeDutyCall() {
        dutyEngineer?.canFixSwitches()
    }
}

class Tier3DataEngineer:Tier3DataCertified {
    
    init(tier2Engineer:Tier2Engineer) {
        tier2Engineer.dutyEngineer = self
    }
    
    func canFixSwitches() {
        print("Tier3 uses knowladgeBase to fix switches")
    }
    
}

class Tier4Engineer:Tier3DataCertified {
    
    func canFixSwitches() {
        print("Tier4 enginer runs traces and fixes the problem")
    }
    
    init(tier2Engineer:Tier2Engineer){
        tier2Engineer.dutyEngineer  = self
    }
    
}

class Tier3CheefEngineer: Tier3DataEngineer {
    override func canFixSwitches() {
        super.canFixSwitches()
        print("Tier3 cheef uses the secret knowladge form the papers to fix issue")
    }
}




let emilio = Tier2Engineer()
let garam = Tier3DataEngineer(tier2Engineer: emilio)
emilio.placeDutyCall()
let sheron = Tier4Engineer(tier2Engineer: emilio)
emilio.placeDutyCall()
let krencz = Tier3CheefEngineer(tier2Engineer: emilio)
emilio.placeDutyCall()


protocol TudLelegeztetni {
   func tudLelegeztetni()
}

class HivasKezelo {
    
    var ugyeletes: TudLelegeztetni?
 
    func riaszt() {
        print("Felhivja az ugyeletest")
        ugyeletes?.tudLelegeztetni()
    }
}

class Szanitec:TudLelegeztetni {
    init(hivaskezelo:HivasKezelo) {
        hivaskezelo.ugyeletes = self
    }
    
    func tudLelegeztetni() {
        print("Kiutom a tappancsokkal")
    }
    
}

class Doki:TudLelegeztetni {
    
    func tudLelegeztetni() {
        print("Mellkasnyomast alkalmazzok")
    }
    
    init(hivaskezelo:HivasKezelo) {
        hivaskezelo.ugyeletes = self
        
        
    }
}

class Sebesz:Doki {
    override func tudLelegeztetni() {
        super.tudLelegeztetni()
        print("Na meg enekelek is ")
    }
    
}

let hivaskezelo1 = HivasKezelo()
let ugyeletes1 = Szanitec(hivaskezelo: hivaskezelo1)
hivaskezelo1.riaszt()

let ugyeletesDoki = Doki(hivaskezelo: hivaskezelo1)
hivaskezelo1.riaszt()

let ugyeletesSebesz = Sebesz(hivaskezelo: hivaskezelo1)
hivaskezelo1.riaszt()

protocol SzovegKezeleoDelegalo {
    func SzovegBeolvasasaBefejezve()
}

class SzovegKezeleo {
    
    var delegate: SzovegKezeleoDelegalo?
    init(delegate: SzovegKezeleoDelegalo? = nil) {
        delegate?.SzovegBeolvasasaBefejezve()
    }
    
}

class IdojarasEllenorzo:SzovegKezeleoDelegalo {
    init (szovegkezeleo: SzovegKezeleo) {
        szovegkezeleo.delegate = self
    }
    
    func SzovegBeolvasasaBefejezve() {
        
        print("Betoltom a szoveget")
        
    }
    
}

let szovegkezelo1 = SzovegKezeleo()
let ellenorzo1 = IdojarasEllenorzo(szovegkezeleo: szovegkezelo1)
szovegkezelo1.delegate?.SzovegBeolvasasaBefejezve()

