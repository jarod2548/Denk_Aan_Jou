# Ontwikkelhandleiding

Deze gids helpt je de app lokaal te draaien en te veranderen.

## Vereisten

- Xcode 15 of nieuwer
- simulator of fysiek iPhone
- toegang tot een backend of testserver als de netwerklaag actief wordt

## App draaien

1. Open `Denk_Aan_Jou.xcodeproj` in Xcode.
2. Kies een simulator of apparaat.
3. Bouw het project.
4. Start de app.

## Belangrijkste bestanden om te kennen

- `Denk_Aan_Jou/MyApp.swift` — startpunt van de app
- `Denk_Aan_Jou/ContentView.swift` — navigatie en routing
- `Denk_Aan_Jou/Features/` — schermen
- `Denk_Aan_Jou/Core/` — gedeelde infrastructuur
- `Denk_Aan_Jou/Models/` — domeinmodellen
- `docs/wiki/` — documentatie voor ontwikkelaars

## Netwerklaag

De app gebruikt `APIClient` om requests te doen:

```swift
struct APIClient {
    let baseURL: URL

    func get<T: Decodable>(
        _ path: String,
        as type: T.Type = T.self
    ) async throws -> T {
        let url = baseURL.appending(path: path)
        // logica voor request en decoding
    }
}
```

Op dit moment:
- is de client nog eenvoudig
- zijn GET-requests ondersteund
- is er een placeholder voor de URL
- is er nog geen volledige backendcontract opgebouwd

## SwiftData

De app gebruikt SwiftData voor lokale lampgegevens. De belangrijkste modelklasse is `Lamp`.

Als je nieuwe data wilt toevoegen:
- maak een nieuw `@Model` als dat nodig is
- gebruik `@Environment(\.modelContext)` waar je data wilt opslaan
- houd de datamodellen gescheiden van de UI

## Een nieuwe feature toevoegen

Gebruik deze flow:

1. Maak een scherm in de juiste map onder `Features/`
2. Voeg een route toe aan `Navigation.swift`
3. Werk `ContentView` bij zodat de route wordt geladen
4. Zet logica in een ViewModel of service als het om netwerk gaat
5. Werk de wiki bij wanneer de feature echt werkt

## Goede uitbreidingspunten

- `Denk_Aan_Jou/Core/Networking/APIClient.swift`
- `Denk_Aan_Jou/Features/Verbind/VerbindMetIDViewModel.swift`
- `Denk_Aan_Jou/Features/Bericht/BerichtMakenPagina.swift`
- `Denk_Aan_Jou/Models/LampBericht.swift`
- `Denk_Aan_Jou/Enums/LampRitme.swift`

## Documentatie-updates

Als je de app uitbreidt, is het handig om de wiki in `docs/wiki/` bij te werken. Zo blijft de codebase begrijpelijk voor nieuwe ontwikkelaars en teamgenoten.

## Samenvatting

De repo heeft een duidelijke basisstructuur. De meeste belangrijke onderdelen staan al op de juiste plaats. De volgende stap is om de netwerklaag, gebruikersflow en lampberichten koppelen aan een echte backend of lampservice.
