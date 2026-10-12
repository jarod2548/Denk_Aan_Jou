//
//  Homepagina.swift
//  MyApp
import SwiftUI
import SwiftData

struct Homepagina : View{
    @Query private var lampen : [Lamp]
    @Environment(\.modelContext) var modelContext
    var body : some View{
        
        VStack(alignment: .leading, spacing: 12) {
              Text("Homepagina").font(.title)
            
              
            Text("Verbonden lampen")
            if lampen.isEmpty {
                Text("Er zijn nog geen lampen verbonden")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .overlay {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1)
                    }
            }
            else{
                ForEach(lampen) { lamp in
                    NavigationLink {
                        Berichtpagina(lamp:lamp)
                    } label: {
                        Text(lamp.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
            HStack {
                NavigationLink {
                  Verbindpagina()
                } label: {
                    Label("Nieuwe lamp verbinden", systemImage: "plus")
                }
                }
            }
            .padding()
            .onAppear() {
                voegTestLampToe()
            }

            
    }

    private func voegTestLampToe() {
        if !lampen.isEmpty{ return }
            let lamp = Lamp(name: "Testlamp", lampID: "")
            modelContext.insert(lamp)
            do {
                try modelContext.save()
                    print("Testlamp toegevoegd!")
                print("Aantal lampen via @Query: \(lampen.count)")
                print("Lampen: \(lampen.map { $0.name })")
                } catch {
                    print("Fout bij opslaan: \(error)")
            }
        }
}
//
//  Created by Jarod Konijnenberg on 07/10/2026.
//

