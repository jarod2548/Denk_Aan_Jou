//
//  VerbindMetIDViewModel.swift
//  Denk_Aan_Jou

import Foundation
import SwiftData
import Observation

@MainActor
@Observable
final class VerbindMetIDViewModel {
    private let apiClient: APIClient

    var isConnecting = false
    var errorMessage: String?
    var successMessage: String?
    

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func connect(
        lamp : Lamp, 
        modelContext: ModelContext
    ) async {
        let id = lamp.lampID.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        let lampName = lamp.name.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !id.isEmpty, !lampName.isEmpty else {
            errorMessage = "Vul zowel een lamp-ID als een naam in."
            return
        }

        isConnecting = true
        errorMessage = nil
        successMessage = nil

        defer { isConnecting = false }

        do {
            let exists : Bool = try await apiClient.get(
                "lamps/\(lamp.lampID)/exists"
            )

            guard exists else {
                errorMessage = "Deze lamp-ID bestaat niet."
                return
            }

            modelContext.insert(lamp)
            try modelContext.save()

            successMessage = "Lamp succesvol verbonden!"
        } catch {
            errorMessage =
                "Verbinden mislukt: \(error.localizedDescription)"
        }
    }
}

//
//  Created by Jarod Konijnenberg on 26/10/2026.
//

