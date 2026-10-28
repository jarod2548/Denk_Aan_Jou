# Architectuur van Denk Aan Jou

Deze pagina legt uit hoe de app is opgebouwd en welke verantwoordelijkheid elk deel van de codebase heeft.

## Startpunt van de app

Het programma start in `Denk_Aan_Jou/MyApp.swift`.

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Lamp.self, inMemory: true)
    }
}
```

Belangrijke punten:
- `MyApp` is het startpunt van de app.
- `ContentView()` wordt als eerste scherm geladen.
- SwiftData wordt gebruikt voor lokale opslag van de lampdata.
- De container staat momenteel op `inMemory: true`, dus de data blijft alleen in de app-sessie.

## Hoofdnavigeering

`Denk_Aan_Jou/ContentView.swift` zet de navigatie op:

- `Home`
- `Verbind`
- `VerbindMetID`
- `VerbindMetQR`
- `Bericht`
- `BerichtResultaat`

De navigatie is gebaseerd op een `Navigation` enum, zodat routes centraal gedefinieerd zijn.

## Mappen en verantwoordelijkheden

### `Core/`

Hier staat gedeelde infrastructuur.

- `Appdepencies.swift`: centrale afhankelijkheden
- `Enviroments/ApiClientEnviroment.swift`: API-client in SwiftUI environment
- `Networking/APIClient.swift`: algemene HTTP-client
- `Services/`: helpers zoals QR-scanning en verbindingslogica

### `Features/`

Hier staan de schermen van de app.

- `Home/`: startpagina met verbonden lampen
- `Verbind/`: lamp verbinden via ID of QR-code
- `Bericht/`: scherm om bericht te maken
- `BerichtResultaat/`: resultaatpagina

### `Models/`

De domeinmodellen bevinden zich hier.

- `Lamp.swift`: opgeslagen lampmodel
- `LampBericht.swift`: boodschap/datamodel voor lampstatus

### `Enums/`

Hier staan typdefinities en vaste waarden.

- `LampColor.swift`: toegestane kleuren
- `LampRitme.swift`: ritme-waardes
- `Navigation.swift`: app routes
- `APIError.swift`: fouttypes

## Dataflow

De flow in de app is globaal als volgt:

1. App start.
2. `ContentView` laadt de navigatie.
3. Gebruiker gaat naar de verbindingsflow.
4. De app valideert een lamp-ID of QR-code.
5. De lamp wordt lokaal opgeslagen in SwiftData.
6. De gebruiker kiest een lamp en maakt een bericht.
7. Het bericht wordt naar de backend of lampdienst gestuurd.

## Observaties over de architectuur

De codebase heeft een duidelijke opbouw zoals een typische SwiftUI-app met een scheiding tussen:

- views
- view models / services
- models
- shared infrastructuur

Er zijn echter ook nog placeholder-gebeiden, zoals:
- `Bericht` is nog een `EmptyView()`
- `BerichtResultaatpagina` is nog leeg
- API-URL is een placeholder
- `LampRitme` heeft nog maar één waarde: `rustig`

## Aanbevolen aanpak voor nieuwe features

- Houd de schermlogica kort en duidelijk.
- Zet netwerkwerk in services of view models.
- Gebruik modellen voor domeinlogica, niet voor UI-gedrag.
- Documenteer nieuwe flows zodra een scherm echt werkt.

## Samenvatting

De app is op een logische manier opgebouwd: schermen onder `Features`, gedeelde code onder `Core`, modellen onder `Models` en enums onder `Enums`. De basis is aanwezig, maar de end-to-end communicatie en de laatste schermflows moeten nog verder worden uitgewerkt.
