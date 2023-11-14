import Foundation
import ApiClient

protocol BookDetailsDataModelInterface {
    func fetchBookDetails() async throws -> BookDetails
}

final class BookDetailsDataModel: BookDetailsDataModelInterface {
    
    private let bookId: Int
    private let apiClient: BooksApiInterface

    init(bookId: Int,
         apiClient: BooksApiInterface = DefaultBooksApiFactory().makeBooksApiClient()) {
        self.bookId = bookId
        self.apiClient = apiClient
    }
    
    func fetchBookDetails() async throws -> BookDetails {
        try await apiClient.bookDetails(for: bookId)
    }
}
