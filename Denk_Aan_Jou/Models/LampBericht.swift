//
//  LampBericht.swift
//  MyApp
import Observation

@Observable
class LampBericht{
    var lampId : String
    var kleur : LampColor
    var ritme : LampRitme
    init(lampId: String, kleur: LampColor, ritme: LampRitme) {
        self.lampId = lampId
        self.kleur = kleur
        self.ritme = ritme
    }
}
//
//  Created by Jarod Konijnenberg on 07/10/2026.
//

