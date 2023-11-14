import Foundation

public struct GetBookDetailsResponse: Decodable {
    let book: BookDetails
}

public struct BookDetails: Decodable {
    public let id: Int
    public let listId: Int
    public let isbn: String
    public let publicationDate: Date
    public let author: String
    public let title: String
    public let img: String
    public let description: String
}
