//
//  BerichtPagina.swift
//  MyApp
import SwiftUI

struct BerichtMakenPagina : View{
    let lamp : Lamp
    var body : some View{
        VStack(spacing: 16) {
                Text("Berichtpagina")
                    .font(.title)

                Text("Geselecteerde lamp:")
                Text(lamp.name)
                    .font(.headline)
            }
            .padding()
            .navigationTitle("Bericht")
    }
}
//
//  Created by Jarod Konijnenberg on 07/10/2026.
//

