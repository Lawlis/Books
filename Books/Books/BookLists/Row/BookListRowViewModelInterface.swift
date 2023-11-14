import Foundation

protocol BookListRowViewModelInterface {
    var title: String { get }
    var previewBooks: [BookItem] { get }
}
