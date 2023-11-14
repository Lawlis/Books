import Foundation

final class SampleBookListsViewModel: BookListsViewModelInterface {
    @Published var showBookDetails: Bool = false
    
    @Published var state: BookListsViewModelState = .loaded(items: [
        BookListRowItem(
            id: 1,
            title: "Reading",
            allBooks: [
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
        ),
        BookListRowItem(
            id: 2,
            title: "Read",
            allBooks: []
        ),
        BookListRowItem(
            id: 3,
            title: "Plan to read",
            allBooks: []
        ),
    ])
    var items: [BookListRowItem] = []
    
    func fetchBookLists(showLoading: Bool) async {}  
    func listedItems(by listId: Int) -> [BookItem] {
        []
    }
}
