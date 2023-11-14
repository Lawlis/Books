import Foundation
import ApiClient

final class BookListsViewModel: BookListsViewModelInterface {
    @Published var state: BookListsViewModelState = .idle
    var items: [BookListRowItem] = []
    
    private let dataModel: BookListsDataModelInterface
    private let previewItemCount: Int = 5
    
    init(dataModel: BookListsDataModelInterface = BookListsDataModel()) {
        self.dataModel = dataModel
    }

    func fetchBookLists(showLoading: Bool) async {
        if showLoading {
            state = .loading
        }
        
        do {
            async let lists = dataModel.fetchBookLists()
            async let books = dataModel.fetchBooks()
            
            items = try await BookListsRowMapper.map(lists: lists, books: books)
            let previewedItems = items.map { item in
                var newItem = item
                newItem.previewBooks = Array(item.previewBooks.prefix(previewItemCount))
                return newItem
            }
            state = .loaded(items: previewedItems)
        } catch {
            state = .error
        }
    }
    
    func listedItems(by listId: Int) -> [BookItem] {
        items.first(where: { $0.id == listId })?.previewBooks ?? []
    }
}
