
import SwiftUI

struct BerichtOntvangenPagina: View {

    let lampNaam: String

    // Later te koppelen aan data van je backend
    @State private var berichtAangekomen: Bool = true

    var body: some View {
        VStack(spacing: 24) {

            Image(
                systemName: berichtAangekomen
                    ? "checkmark.circle.fill"
                    : "clock.fill"
            )
            .font(.system(size: 80))
            .foregroundStyle(
                berichtAangekomen ? .green : .orange
            )

            Text(
                berichtAangekomen
                    ? "Bericht aangekomen!"
                    : "Wachten op bevestiging..."
            )
            .font(.title2)
            .fontWeight(.bold)

            Text("Geselecteerde lamp: \(lampNaam)")
                .font(.headline)

            Text(
                berichtAangekomen
                    ? "Het bericht is succesvol ontvangen."
                    : "De ontvangst van het bericht is nog niet bevestigd."
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)

            Spacer()

            // Later kun je hier de status opnieuw ophalen
            Button("Controleer status opnieuw") {
                controleerStatus()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Berichtstatus")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func controleerStatus() {
        // TODO: Later koppelen aan terugkerende data
        // van de backend of lamp.
    }
}
