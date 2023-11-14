import Foundation

enum BookListsViewModelState: Equatable {
    case idle
    case loaded(items: [BookListRowItem])
    case loading
    case error
}
