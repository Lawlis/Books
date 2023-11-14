import Foundation

struct GetBooksRequest: APIRequest {
    typealias ResponseType = [Book]

    var path: String { "/books" }
    var method: HTTPMethod { .get }
    var body: Data? { nil }
}

