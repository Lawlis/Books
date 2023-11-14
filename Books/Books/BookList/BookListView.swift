import SwiftUI
import NavigationBackport

protocol BookListViewModelInterface {
    var title: String { get set }
    var items: [BookItem] { get set }
}

struct BookListViewModel: BookListViewModelInterface {
    var title: String
    var items: [BookItem]
    
    init(title: String, items: [BookItem]) {
        self.title = title
        self.items = items
    }
}

struct BookListView<ViewModel: BookListViewModelInterface>: View {
    
    let viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                NBNavigationLink(value: item) {
                    HStack {
                        PhasedAsyncImage(widthHeightDimension: 64, url: item.imageUrl)
                        Text(item.title)
                    }
                }
            }
        }
        .navigationTitle(viewModel.title)
    }
}

#Preview {
    BookListView(
        viewModel: BookListViewModel(
            title: "Reading",
            items: [
                BookItem(
                    id: 0,
                    listId: 0,
                    title: "hey",
                    imageUrl: URL(string: "https://covers.openlibrary.org/b/id/11464688-L.jpg")!
                )
            ]
        )
    )
}
