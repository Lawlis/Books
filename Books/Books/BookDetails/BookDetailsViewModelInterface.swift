import Foundation

@MainActor
protocol BookDetailsViewModelInterface {
    var state: BookDetailsViewModelState { get set }
    mutating func fetchBookDetails() async
}
