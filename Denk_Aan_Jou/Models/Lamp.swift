//
//  Lamp.swift
//  MyApp
import SwiftData
import Foundation

@Model
class Lamp{
    var id: UUID
    var name: String
    var lampID : String

    init(id: UUID = UUID(), name: String = "", lampID:String) {
        self.id = id
        self.name = name
        self.lampID = lampID
    }
}
//
//  Created by Jarod Konijnenberg on 07/10/2026.
//

