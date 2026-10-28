import SwiftUI

struct ContentView: View {
    @State private var path: [Navigation] = [.Home]
    
        
    var body: some View {
        NavigationStack(path: $path) {
            Text("Ladn")
                .navigationDestination(for: Navigation.self) { navigation in
                    switch navigation {
                    case .Home:
                        Homepagina()
                    case .Verbind:
                        Verbindpagina()
                    case .VerbindMetID:
                        VerbindMetIDPagina()
                    case .VerbindMetQR:
                        VerbindMetQRPagina()
                    case .Bericht:
                        EmptyView()
                    case .BerichtResultaat:
                        BerichtResultaatpagina()
                    }
                }
        }
        .environment(\.apiClient, AppDependencies.apiClient)
        .padding()
    }
}

#Preview {
    ContentView()
}

