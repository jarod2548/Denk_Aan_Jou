//
//  Verbindpagina.swift
//  MyApp
import SwiftUI

struct Verbindpagina : View{
    var body : some View{
        VStack(spacing: 20) {
               NavigationLink {
                   VerbindMetIDPagina()
               } label: {
                   Label("Verbinden met ID", systemImage: "keyboard")
                       .frame(maxWidth: .infinity)
                       .padding()
               }
               .buttonStyle(.borderedProminent)

               NavigationLink {
                   VerbindMetQRPagina()
               } label: {
                   Label("Verbinden met QR-code", systemImage: "qrcode")
                       .frame(maxWidth: .infinity)
                       .padding()
               }
               .buttonStyle(.bordered)
           }
           .padding()
           .navigationTitle("Lamp verbinden")
    }
}
//
//  Created by Jarod Konijnenberg on 07/10/2026.
//

