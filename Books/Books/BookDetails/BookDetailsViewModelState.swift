import Foundation

enum BookDetailsViewModelState {
    case idle
    case loading
    case loaded(details: BookDetailItem)
    case error
}
