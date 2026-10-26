//
//  APIError.swift
//  Denk_Aan_Jou
//
//  Created by Jarod Konijnenberg on 14/10/2026.
//


enum APIError: Error {
    case invalidResponse
    case httpError(Int)
}