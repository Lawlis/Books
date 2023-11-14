import Foundation

struct BookListRowItem: Identifiable, BookListRowViewModelInterface, Equatable, Hashable {
    
    let id: Int
    let title: String
    var previewBooks: [BookItem]
    
    init(id: Int, title: String, allBooks: [BookItem]) {
        self.id = id
        self.title = title
        self.previewBooks = allBooks
    }
    
    static func == (lhs: BookListRowItem, rhs: BookListRowItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.previewBooks == rhs.previewBooks
    }
}
