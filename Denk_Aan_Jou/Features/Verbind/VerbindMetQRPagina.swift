
import SwiftUI
import SwiftData
import VisionKit

struct VerbindMetQRPagina: View {
    @State private var lampID = ""
    @State private var lampNaam = ""

    @State private var isShowingScanner = false
    @State private var showScannerUnavailableAlert = false

    @State private var viewModel = VerbindMetIDViewModel(
        apiClient: AppDependencies.apiClient
    )

    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(spacing: 24) {

            Text("Verbind met QR-code")
                .font(.title.bold())

            Text("Scan de QR-code van je lamp om verbinding te maken.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            // QR-code scannen
            VStack(alignment: .leading, spacing: 8) {
                Text("QR-code van je lamp")
                    .font(.headline)

                Button {
                    openScanner()
                } label: {
                    Label(
                        lampID.isEmpty
                            ? "Scan QR-code"
                            : "Scan opnieuw",
                        systemImage: "qrcode.viewfinder"
                    )
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .buttonStyle(.borderedProminent)

                // Toon de gevonden lamp-ID
                if !lampID.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Gevonden lamp-ID")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text(lampID)
                            .padding()
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .background(Color.gray.opacity(0.12))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                            .textSelection(.enabled)
                    }
                }
            }

            // Naam van de lamp
            VStack(alignment: .leading, spacing: 8) {
                Text("Een naam voor de lamp")
                    .font(.headline)

                TextField("Bijv. Maria", text: $lampNaam)
                    .padding()
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            // Foutmelding vanuit de ViewModel
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }

            // Succesmelding vanuit de ViewModel
            if let success = viewModel.successMessage {
                Text(success)
                    .foregroundStyle(.green)
            }

            // Lamp verbinden
            Button {
                Task {
                    await verbindMetLamp()
                }
            } label: {
                Text("Verbinden")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .disabled(
                lampID.trimmingCharacters(
                    in: .whitespacesAndNewlines
                ).isEmpty
            )

            Spacer()
        }
        .padding(24)
        .navigationTitle("Verbinden met QR-code")

        // Open de scanner als een sheet
        .sheet(isPresented: $isShowingScanner) {
            QRScannerView { code in
                lampID = code
                isShowingScanner = false
            }
            .ignoresSafeArea()
        }

        // Melding als scannen niet beschikbaar is
        .alert(
            "Scanner niet beschikbaar",
            isPresented: $showScannerUnavailableAlert
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(
                "QR-scanning wordt niet ondersteund of de camera is niet beschikbaar."
            )
        }
    }

    private func openScanner() {
        guard DataScannerViewController.isSupported,
              DataScannerViewController.isAvailable else {
            showScannerUnavailableAlert = true
            return
        }

        isShowingScanner = true
    }

    private func verbindMetLamp() async {
        let ingevoerdeID = lampID.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        let ingevoerdeNaam = lampNaam.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        let lamp = Lamp(
            name: ingevoerdeNaam,
            lampID: ingevoerdeID
        )

        await viewModel.connect(
            lamp: lamp,
            modelContext: modelContext
        )
    }
}

#Preview {
    NavigationStack {
        VerbindMetQRPagina()
    }
    .environment(\.apiClient, AppDependencies.apiClient)
}
