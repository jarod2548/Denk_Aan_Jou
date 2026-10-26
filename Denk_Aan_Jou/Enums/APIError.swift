enum APIError: Error {
    case invalidResponse
    case httpError(Int)
}