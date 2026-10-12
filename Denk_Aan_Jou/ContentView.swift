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
                    case .Bericht:
                        EmptyView()
                    case .BerichtResultaat:
                        BerichtResultaatpagina()
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

