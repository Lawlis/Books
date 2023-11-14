import Foundation
import ApiClient

protocol BookListsDataModelInterface {
    func fetchBookLists() async throws -> [List]
    func fetchBooks() async throws -> [Book]
}

final class BookListsDataModel: BookListsDataModelInterface {
    private let client: BooksApiInterface
    
    private var books: [Book] = []
    private var lists: [List] = []
    
    init(client: BooksApiInterface = DefaultBooksApiFactory().makeBooksApiClient()) {
        self.client = client
    }
    
    func fetchBookLists() async throws -> [List] {
        lists = try await client.bookLists()
        return lists
    }
    
    func fetchBooks() async throws -> [Book] {
        books = try await client.books()
        return books
    }
}
