import Foundation

struct BookItem: Identifiable, BookPreviewItemViewModel, Equatable, Hashable {
    let id: Int
    let listId: Int
    let title: String
    let imageUrl: URL
    
    init(id: Int, listId: Int, title: String, imageUrl: URL) {
        self.id = id
        self.listId = listId
        self.title = title
        self.imageUrl = imageUrl
    }
    
    static func == (lhs: BookItem, rhs: BookItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.listId == rhs.listId &&
        lhs.title == rhs.title &&
        lhs.imageUrl == rhs.imageUrl
    }
}
