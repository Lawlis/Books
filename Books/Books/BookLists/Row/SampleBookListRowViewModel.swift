import Foundation

final class SampleBookListRowViewModel: BookListRowViewModelInterface {
    var title: String = "Reading"
    var previewBooks: [BookItem] = [
        BookItem(
            id: 12,
            listId: 1,
            title: "Dune",
            imageUrl: URL(string: "https://covers.openlibrary.org/b/id/12181264-L.jpg")!
        ),
        BookItem(
            id: 10,
            listId: 1,
            title: "The Hitchhikers Guide to the Galaxy",
            imageUrl: URL(string: "https://covers.openlibrary.org/b/id/11464688-L.jpg")!
        )
    ]
    var allBooks: [BookItem] = []
}
