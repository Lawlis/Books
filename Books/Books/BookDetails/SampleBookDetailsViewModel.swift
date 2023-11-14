import Foundation

class SampleBookDetailsViewModel: BookDetailsViewModelInterface {
    
    @Published var state: BookDetailsViewModelState = .idle
        
    func fetchBookDetails() async {
        state = .loading
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        state = .loaded(details: BookDetailItem(
                                id: 0,
                                listId: 1,
                                isbn: "ISBN",
                                publicationDate: Date(),
                                author: "Author",
                                title: "Title",
                                img: URL(string: "https://covers.openlibrary.org/b/id/11464688-L.jpg")!,
                                description: "Description"
                            )
        )
    }
}
