
import SwiftUI

struct BerichtMakenPagina: View {
    let lamp: Lamp

    
    @State private var lichtkleur: Color = .blue
    @State private var frequentie: Double = 1.0

    var body: some View {
        VStack(spacing: 24) {

            Text("Berichtpagina")
                .font(.title)

            Text("Geselecteerde lamp:")
            Text(lamp.name)
                .font(.headline)

            Divider()

            // Lichtkleur kiezen
            VStack(alignment: .leading, spacing: 12) {
                Text("Lichtkleur")
                    .font(.headline)

                ColorPicker(
                    "Kies een kleur",
                    selection: $lichtkleur,
                    supportsOpacity: false
                )

                Circle()
                    .fill(lichtkleur)
                    .frame(width: 80, height: 80)
                    .frame(maxWidth: .infinity)
            }

            Divider()

            // Knipperfrequentie kiezen
            VStack(alignment: .leading, spacing: 12) {
                Text("Knipperfrequentie")
                    .font(.headline)

                Slider(
                    value: $frequentie,
                    in: 1...10,
                    step: 0.5
                )

                Text(
                    String(
                        format: "%.1f Knipper/Seconden",
                        frequentie
                    )
                )
                .font(.subheadline)
            }

            Spacer()

            NavigationLink(
                destination: BerichtOntvangenPagina(
                    lampNaam: lamp.name
                )
            ) {
                Text("Verstuur bericht")
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
        .navigationTitle("Bericht")
        .navigationBarTitleDisplayMode(.inline)
    }
    func verstuurbericht() async {
        guard let kleur = LampColor(color: lichtkleur) else {
            print("Kleur kon niet worden omgezet")
            return
        }

        let ritme = LampRitme(frequentie: frequentie)

        let lampBericht = LampBericht(
            lampId: lamp.id,
            kleur: kleur,
            ritme: ritme
        )
    }

}

