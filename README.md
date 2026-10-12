# Denk Aan Jou

Denk Aan Jou is an iOS SwiftUI app that connects to a physical light through a server and sends a light "message" describing the lamp's state, including its color and rhythm. The app is designed to let users connect to a light using either a QR code or an identifier and send structured data that the server can forward to the device.

## Key features
- Connect to a lamp via QR code
- Connect to a lamp by entering an ID
- Send a message describing the light's color and rhythm
- SwiftUI-based interface for an iOS app
- Light state represented with enums for color and rhythm

## Project structure

- `MyApp/`
  - `MyApp.swift` — app entry point
  - `ContentView.swift` — main SwiftUI content view
  - `Core/` — shared app logic and services
  - `Enums/` — lamp-related enums
  - `Features/` — app feature screens
    - `Verbind/`
      - `VerbindMetQRPagina.swift` — connection flow using QR code
      - `VerbindMetIDPagina.swift` — connection flow using ID
- `Denk_Aan_Jou/`
  - `Core/Services/`
    - `QRScanner.swift` — QR scanning logic
    - `QRScannerHandler.swift` — handler around QR scanning
  - `Enums/`
    - `LampColor.swift` — color definitions for the light
    - `LampRitme.swift` — rhythm definitions for the light
  - `Features/Verbind/`
    - `VerbindMetIDPagina.swift`
    - `VerbindMetQRPagina.swift`

## Tech stack
- Swift
- SwiftUI
- iOS app project in Xcode
- QR scanning support
- Server-based communication with a lamp

## Light message format
The app is intended to send a structured message that describes the lamp state. The repository suggests the light data is modeled through enums like `LampColor` and `LampRitme`.

A typical data payload could look like this:

```json
{
  "color": "blue",
  "ritme": "pulse"
}
```

This shape represents the light's color and rhythm, which are the core values the server can use to drive the lamp behavior.

## Example request
```bash
curl -X POST "https://your-server.example/api/lamp/send" \
  -H "Content-Type: application/json" \
  -d '{"color":"blue","ritme":"pulse"}'
```

Replace the URL and payload keys with the exact values used by your backend or lamp service.

## How to run
1. Open the project in Xcode.
2. Select a simulator or connected iPhone.
3. Build and run the app.
4. Use the QR or ID flow to connect to the lamp.
5. Send the light message to the connected device via the server.

## Notes
The current repository contains the app structure and light-related enums, but it may still require additional implementation work for the full communication flow, such as:
- API/client service for the server
- validation of QR or ID data
- network error handling
- parsing of result payloads
- full UI integration to send commands to the lamp

## Planned or recommended improvements
- Add a centralized networking layer for server communication
- Define exact JSON payload contracts between the app and server
- Add unit tests for light message encoding/decoding
- Add graceful handling for connection failures and invalid QR data
- Document the server endpoint and authentication flow

## License
This project does not currently appear to include an explicit license file. If you want to publish it publicly, consider adding a LICENSE file.
