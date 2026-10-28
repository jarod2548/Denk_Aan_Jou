//
//  APIClient.swift
//  MyApp
import Foundation

struct APIClient {
    let baseURL: URL
    

    func get<T: Decodable>(
        _ path: String,
        as type: T.Type = T.self
    ) async throws -> T {
        let url = baseURL.appending(path: path)

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )

        let (data, response) = try await URLSession.shared.data(
            for: request
        )

        guard let response = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200..<300).contains(response.statusCode) else {
            throw APIError.httpError(response.statusCode)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}


//
//  Created by Jarod Konijnenberg on 07/10/2026.
//

