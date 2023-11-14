import SwiftUI

@main
struct BooksApp: App {
    var body: some Scene {
        WindowGroup {
            BookListsView(viewModel: BookListsViewModel())
        }
    }
}
