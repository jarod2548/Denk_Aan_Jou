//
//  VerbindMetIDPagina.swift
//  Denk_Aan_Jou
import SwiftUI
import SwiftData

struct VerbindMetIDPagina : View{
    @State private var lampID = ""
    @State private var lampNaam = ""
    @State private var foutmelding: String?
    @State private var viewModel = VerbindMetIDViewModel(
        apiClient: AppDependencies.apiClient
    )

    @Environment(\.modelContext) private var modelContext
    @Environment(\.apiClient) private var apiClient


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

                TextField("Bijv. Maria", text: $lampNaam)
                    .padding()
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundStyle(.red)
                        }

            if let success = viewModel.successMessage {
                            Text(success)
                                .foregroundStyle(.green)
                        }

            Button {
                Task{
                    await verbindMetLamp()
                }
                
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

    private func verbindMetLamp() async {
        let ingevoerdeID = lampID.trimmingCharacters(in: .whitespacesAndNewlines)
        let ingevoerdeNaam = lampNaam.trimmingCharacters(in: .whitespacesAndNewlines)
        let lamp = Lamp( name :ingevoerdeNaam, lampID:ingevoerdeID)
        
        await viewModel.connect(lamp: lamp,modelContext: modelContext)
        
        
        
    }

    }

    #Preview {
    NavigationStack {
        VerbindMetIDPagina()
    }
    .environment(\.apiClient, AppDependencies.apiClient)
}

//
//  Created by Jarod Konijnenberg on 12/10/2026.
//

