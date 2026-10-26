//
//  Appdepencies.swift
//  Denk_Aan_Jou

import Foundation

enum AppDependencies {
    static let apiClient = APIClient(
        baseURL: URL(string: "https://example.com/api/")!
    )
}

//
//  Created by Jarod Konijnenberg on 26/10/2026.
//

