import Foundation

public protocol BooksApiInterface {
    func books() async throws -> [Book]
    func bookDetails(for bookID: Int) async throws -> BookDetails
    func bookLists() async throws -> [List]
}

class BooksApiClient: BooksApiInterface {
    static var baseURL: String = "https://my-json-server.typicode.com/KeskoSenukaiDigital/assignment"
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    private func sendRequest<T: APIRequest>(_ request: T) async throws -> T.ResponseType {
        do {
            let urlRequest = try request.makeRequest(baseURL: BooksApiClient.baseURL)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return try decoder.decode(T.ResponseType.self, from: data)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func books() async throws -> [Book] {
        return try await sendRequest(GetBooksRequest())
    }
    
    func bookDetails(for bookID: Int) async throws -> BookDetails {
        return try await sendRequest(GetBookDetailsRequest(bookID: bookID))
    }
    
    func bookLists() async throws -> [List] {
        return try await sendRequest(GetListsRequest())
    }
}
