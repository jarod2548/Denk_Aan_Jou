//
//  VerbindMetIDPagina.swift
//  Denk_Aan_Jou
import SwiftUI

struct VerbindMetIDPagina : View{
    @State private var lampID = ""
    @State private var lampNaam = ""
    @State private var foutmelding: String?

    var body: some View {
        VStack(spacing: 24) {

            Text("Verbind met ID")
                .font(.title.bold())

            Text("Voer de ID van je lamp in om verbinding te maken.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            VStack(alignment: .leading, spacing: 8) {
                Text("Lamp-ID")
                    .font(.headline)

                TextField("Bijv. LAMP-12345", text: $lampID)
                    .padding()
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Een naam voor de lamp")
                    .font(.headline)

                TextField("Bijv. Maria", text: $lampID)
                    .padding()
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Button {
                verbindMetLamp()
            } label: {
                Text("Verbinden")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .disabled(lampID.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

            Spacer()
        }
        .padding(24)
        .navigationTitle("Verbinden met ID")
    }

    private func verbindMetLamp() {
        let ingevoerdeID = lampID.trimmingCharacters(in: .whitespacesAndNewlines)
        let ingevoerdeNaam = lampNaam.trimmingCharacters(in: .whitespacesAndNewlines)
        let lamp = Lamp( name :ingevoerdeNaam, lampID:ingevoerdeID)
        // Voeg hier je verbindingslogica toe.
        print("Verbinden met lamp-ID: \(ingevoerdeID)")
    }

    }

    #Preview {
    NavigationStack {
    VerbindMetIDPagina()
    }
}

//
//  Created by Jarod Konijnenberg on 12/10/2026.
//

