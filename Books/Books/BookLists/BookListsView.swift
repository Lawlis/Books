import SwiftUI
import NavigationBackport

struct BookListsView<ViewModel: BookListsViewModelInterface>: View {
    
    @ObservedObject private var viewModel: ViewModel
    @State var path: NBNavigationPath = NBNavigationPath()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NBNavigationStack(path: $path) {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let items):
                listView(items: items)
            case .error:
                ErrorView(explanationText: "Something went wrong") {
                    Task {
                        await viewModel.fetchBookLists(showLoading: true)
                    }
                }
            }
        }
        .task {
            await viewModel.fetchBookLists(showLoading: true)
        }
    }
    
    @ViewBuilder
    private func listView(items: [BookListRowItem]) -> some View {
        if items.isEmpty {
            Text("List is empty")
        } else {
            List {
                ForEach(items) { item in
                    BookListRow(viewModel: item,
                                onAllTapped: {
                        path.append(item)
                    })
                    .listRowSeparator(.hidden)
                }

            }       
            .navigationTitle("Book lists")
            .refreshable {
                await viewModel.fetchBookLists(showLoading: false)
            }
            .nbNavigationDestination(for: BookItem.self) { item in
                BookDetailsView(
                    viewModel: BookDetailsViewModel(bookId: item.id)
                )
            }
            .nbNavigationDestination(for: BookListRowItem.self) { item in
                BookListView(
                    viewModel: BookListViewModel(title: item.title, items: viewModel.listedItems(by: item.id))
                )
            }
        }
    }
}

#Preview {
    BookListsView(viewModel: SampleBookListsViewModel())
}
