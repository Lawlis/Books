import Foundation

public struct GetBooksResponse: Decodable {
    let books: [Book]
}

public struct Book: Decodable {
    public let id: Int
    public let listId: Int
    public let title: String
    public let img: String
}
