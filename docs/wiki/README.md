# Wiki van Denk Aan Jou

Welkom bij de ontwikkelwiki van Denk Aan Jou. Deze pagina geeft je een overzicht van de codebase en helpt je sneller te begrijpen hoe de app is opgebouwd.

## Snel starten

- Open de README in de repositoryroot voor een algemeen overzicht.
- Lees eerst de architectuurpagina om te zien hoe de app is gestructureerd.
- Daarna kun je de datamodellen en feature-flows bekijken.

## Documenten in deze wiki

- [Overzicht](README.md)
- [Architectuur](architecture.md)
- [Datamodellen](data-model.md)
- [Features en gebruikersflow](features.md)
- [Ontwikkelhandleiding](development.md)

## Repositorystuctuur

```text
Denk_Aan_Jou/
├── MyApp.swift
├── ContentView.swift
├── Core/
│   ├── Appdepencies.swift
│   ├── Enviroments/
│   ├── Networking/
│   └── Services/
├── Enums/
├── Features/
├── Models/
├── Assets.xcassets/
├── docs/
│   ├── lamp_schema.sql
│   └── wiki/
│       ├── README.md
│       ├── architecture.md
│       ├── data-model.md
│       ├── features.md
│       └── development.md
└── doc/
    ├── erd.mmd
    ├── lamp_db_diagram.svg
    └── DatabaseDiagram.mmd
```

## Doel van de app

De app is ontworpen om een lamp te koppelen, een lampnaam en -ID op te slaan, en een bericht te sturen met een kleur en een ritme. De huidige codebase legt de basis voor deze flow, maar sommige onderdelen zijn nog in ontwikkeling.

## Waar je moet beginnen

1. Lees `docs/wiki/architecture.md` voor de globale structuur.
2. Bekijk `docs/wiki/data-model.md` voor de modellen.
3. Lees `docs/wiki/features.md` voor de gebruikersstappen.
4. Gebruik `docs/wiki/development.md` als je wilt uitbreiden of draaien op Xcode.

## Belangrijke opmerking

Het project is een goed begin, maar nog niet volledig afgerond. De wiki helpt nieuwe ontwikkelaars om snel te begrijpen waar de app staat, welke bestanden belangrijk zijn en waar de volgende stappen liggen.
