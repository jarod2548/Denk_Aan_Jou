# Features en gebruikersflow

Deze pagina beschrijft de belangrijkste schermen en het beoogde gebruik van de app.

## 1. Startscherm

Bestand: `Denk_Aan_Jou/Features/Home/Homepagina.swift`

Het startscherm toont:
- een lijst met verbonden lampen
- een melding als er nog geen lampen zijn
- een knop om een nieuwe lamp te verbinden

Wanneer er geen lampen zijn, wordt automatisch een testlamp toegevoegd in de huidige versie van de app.

## 2. Lamp verbinden

Bestand: `Denk_Aan_Jou/Features/Verbind/Verbindpagina.swift`

Dit scherm geeft de gebruiker twee opties:
- verbinden met ID
- verbinden met QR-code

## 3. Verbinden met ID

Bestanden:
- `VerbindMetIDPagina.swift`
- `VerbindMetIDViewModel.swift`

De flow werkt ongeveer als volgt:

1. Gebruiker voert een lampnaam en lamp-ID in.
2. De app controleert of beide velden zijn ingevuld.
3. Er wordt een check gedaan met de API: `lamps/{lampID}/exists`.
4. Als de lamp bestaat, wordt deze opgeslagen in SwiftData.
5. Er verschijnt een succes- of foutmelding.

## 4. Verbinden met QR-code

Bestanden:
- `QRScanner.swift`
- `QRScannerHandler.swift`
- `QRScannerView.swift`

Deze code is bedoeld voor het scannen van een QR-code om een lamp te identificeren. De flow is klaar voor uitbreiding, maar nog niet volledig afgerond.

## 5. Bericht maken

Bestand: `Denk_Aan_Jou/Features/Bericht/BerichtMakenPagina.swift`

Dit scherm is ontworpen om een lampbericht te maken voor een geselecteerde lamp. Op dit moment is de pagina nog eenvoudig en toont alleen het geselecteerde lampmodel.

## 6. Resultaat van het bericht

Bestand: `Denk_Aan_Jou/Features/BerichtResultaat/BerichtResultaatpagina.swift`

Dit scherm is nog een placeholder. Het is bedoeld als pagina met de resultaten van een verzonden lampbericht.

## Navigatieoverzicht

De route-structuur staat in `Denk_Aan_Jou/Enums/Navigation.swift`:

```swift
enum Navigation : Hashable {
    case Home
    case Verbind
    case VerbindMetID
    case VerbindMetQR
    case Bericht
    case BerichtResultaat
}
```

## Beoogde gebruikersflow

De werkelijke appflow is bedoeld als:

1. App openen
2. Lampen zien die al verbonden zijn
3. Nieuwe lamp koppelen via ID of QR-code
4. Lamp selecteren
5. Bericht samenstellen met kleur en ritme
6. Bericht verzenden
7. Resultaat bekijken

## Belangrijke kanttekeningen

Enkele onderdelen zijn nog niet volledig uitgewerkt:
- `Bericht` is momenteel `EmptyView()`
- `BerichtResultaatpagina` is leeg
- backend-API is nog niet volledig aangesloten
- `LampRitme` heeft nog maar één mogelijke waarde

De app zit dus op een goed fundament, maar de volledige gebruikerflow is nog in ontwikkeling.
