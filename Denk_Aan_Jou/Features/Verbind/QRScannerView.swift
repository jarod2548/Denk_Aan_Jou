//
//  QRScannerView.swift
//  Denk_Aan_Jou

import SwiftUI
import VisionKit
import Vision
import UIKit

struct QRScannerView: UIViewControllerRepresentable {
    let onCodeScanned: (String) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onCodeScanned: onCodeScanned)
    }

    func makeUIViewController(
        context: Context
    ) -> DataScannerViewController {

        let scanner = DataScannerViewController(
            recognizedDataTypes: [
                .barcode(symbologies: [.qr])
            ],
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isHighFrameRateTrackingEnabled: false,
            isPinchToZoomEnabled: true,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )

        scanner.delegate = context.coordinator

        do {
            try scanner.startScanning()
        } catch {
            print("Scanner kon niet starten: \(error)")
        }

        return scanner
    }

    func updateUIViewController(
        _ uiViewController: DataScannerViewController,
        context: Context
    ) {}

    static func dismantleUIViewController(
        _ uiViewController: DataScannerViewController,
        coordinator: Coordinator
    ) {
        uiViewController.stopScanning()
    }

    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        private let onCodeScanned: (String) -> Void
        private var hasScanned = false

        init(onCodeScanned: @escaping (String) -> Void) {
            self.onCodeScanned = onCodeScanned
        }

        func dataScanner(
            _ dataScanner: DataScannerViewController,
            didAdd addedItems: [RecognizedItem],
            allItems: [RecognizedItem]
        ) {
            guard !hasScanned else { return }

            for item in addedItems {
                if case .barcode(let code) = item,
                   let payload = code.payloadStringValue {

                    hasScanned = true
                    dataScanner.stopScanning()
                    onCodeScanned(payload)
                    return
                }
            }
        }
    }
}

//
//  Created by Jarod Konijnenberg on 26/10/2026.
//

