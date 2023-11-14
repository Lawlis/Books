import Foundation

struct GetBookDetailsRequest: APIRequest {
    typealias ResponseType = BookDetails

    let bookID: Int
    
    public init(bookID: Int) {
        self.bookID = bookID
    }

    var path: String { "/book/\(bookID)" }
    var method: HTTPMethod { .get }
    var body: Data? { nil }
}
