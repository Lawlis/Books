import Foundation
import ApiClient
import Combine

struct BookDetailsViewModel: BookDetailsViewModelInterface {
    
    var state: BookDetailsViewModelState = .idle
    private let dataModel: BookDetailsDataModelInterface
    
    init(bookId: Int) {
        dataModel = BookDetailsDataModel(bookId: bookId)
    }
    
    mutating func fetchBookDetails() async {
        state = .loading
        do {
            let detailsDTO = try await dataModel.fetchBookDetails()
            let details = BookDetailsMapper.map(bookDetails: detailsDTO)
            state = .loaded(details: details)
        } catch {
            state = .error
        }
    }
}
