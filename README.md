# Denk Aan Jou

Denk Aan Jou is een iOS SwiftUI-app die een fysieke lamp koppelt aan een server en een lamp-bericht stuurt dat de kleur en het ritme van de lamp beschrijft. De app is gebouwd om een verbinding met een lamp op te zetten via een QR-code of een lamp-ID en daarna een statusbericht te sturen.

## Belangrijkste functies
- Verbind een lamp via QR-code
- Verbind een lamp via een ID
- Stuur een bericht dat kleur en ritme beschrijft
- SwiftUI-interface voor iPhone/iPad
- Lampstatus wordt modelleerd met enums voor kleur en ritme

## Projectstructuur

```text
Denk_Aan_Jou/
├── MyApp.swift
├── ContentView.swift
├── Core/
│   ├── Appdepencies.swift
│   ├── Components/
│   ├── Enviroments/
│   ├── Networking/
│   │   └── APIClient.swift
│   └── Services/
│       ├── QRScanner.swift
│       ├── QRScannerHandler.swift
│       └── VerbindService.swift
├── Enums/
│   ├── APIError.swift
│   ├── LampColor.swift
│   ├── LampRitme.swift
│   └── Navigation.swift
├── Features/
│   ├── Bericht/
│   │   └── BerichtMakenPagina.swift
│   ├── BerichtResultaat/
│   │   └── BerichtResultaatpagina.swift
│   ├── Home/
│   │   └── Homepagina.swift
│   └── Verbind/
│       ├── QRScannerView.swift
│       ├── VerbindMetIDPagina.swift
│       ├── VerbindMetIDViewModel.swift
│       ├── VerbindMetQRPagina.swift
│       └── Verbindpagina.swift
├── Models/
│   ├── Lamp.swift
│   └── LampBericht.swift
├── Assets.xcassets/
└── ...
```

## Wiki / documentatie

De codebase heeft nu een wiki met uitleg over de architectuur, data-modellen, gebruikersflow en ontwikkelhandleiding:

- [Wiki overzicht](docs/wiki/README.md)
- [Architectuur](docs/wiki/architecture.md)
- [Datamodellen](docs/wiki/data-model.md)
- [Features en flow](docs/wiki/features.md)
- [Ontwikkelhandleiding](docs/wiki/development.md)

## Tech stack
- Swift
- SwiftUI
- Xcode
- SwiftData
- QR-scanning
- HTTP-client voor servercommunicatie

## Hoe de app draait
1. Open het project in Xcode.
2. Kies een simulator of aangesloten iPhone.
3. Bouw en start de app.
4. Gebruik de flow om een lamp te verbinden.
5. Gebruik het scherm om een bericht te maken voor de lamp.

## Opmerking
De repository bevat al een basisstructuur voor de app en de lamp-logica, maar sommige onderdelen zijn nog in een vroeg stadium of placeholder-implementaties. De wiki helpt om die structuur sneller te begrijpen en de volgende verbeteringen beter te plannen.

## Licentie
Er is momenteel geen expliciete licentiebestand in de repo zichtbaar.
