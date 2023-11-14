import Foundation

@MainActor
protocol BookListsViewModelInterface: ObservableObject {
    var state: BookListsViewModelState { get }
    var items: [BookListRowItem] { get }
    
    func fetchBookLists(showLoading: Bool) async
    func listedItems(by listId: Int) -> [BookItem]
}
