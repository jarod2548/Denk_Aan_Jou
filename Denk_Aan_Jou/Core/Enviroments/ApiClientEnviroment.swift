//
//  ApiClientEnviroment.swift
//  Denk_Aan_Jou
import SwiftUI

private struct APIClientKey: EnvironmentKey {
    static let defaultValue = APIClient(
        baseURL: URL(string: "https://example.com/api/")!
    )
}

extension EnvironmentValues {
    var apiClient: APIClient {
        get { self[APIClientKey.self] }
        set { self[APIClientKey.self] = newValue }
    }
}
//
//  Created by Jarod Konijnenberg on 26/10/2026.
//

