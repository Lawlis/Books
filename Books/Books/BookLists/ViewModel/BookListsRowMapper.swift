import Foundation
import ApiClient

struct BookListsRowMapper {
    static func map(lists: [List], books: [Book]) -> [BookListRowItem] {
        var listItems: [BookListRowItem] = []

        for list in lists {
            let booksInList = books.filter { $0.listId == list.id }
            let bookItems: [BookItem] = booksInList.compactMap { book -> BookItem? in
                guard let imageUrl = URL(string: book.img) else { return nil }
                return BookItem(id: book.id, listId: book.listId, title: book.title, imageUrl: imageUrl)
            }

            let listRowItem = BookListRowItem(id: list.id, title: list.title, allBooks: bookItems)
            listItems.append(listRowItem)
        }

        return listItems
    }
}
