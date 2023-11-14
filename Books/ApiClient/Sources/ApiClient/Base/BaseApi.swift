import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
}

protocol APIRequest {
    associatedtype ResponseType: Decodable
    
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
}

extension APIRequest {
    func makeRequest(baseURL: String) throws -> URLRequest {
        guard let urlComponents = URLComponents(string: baseURL + path) else {
            throw APIError.invalidURL
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        return request
    }
}
