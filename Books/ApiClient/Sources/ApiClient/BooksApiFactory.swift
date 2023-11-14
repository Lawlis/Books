import Foundation

public protocol BooksApiFactory {
    func makeBooksApiClient() -> BooksApiInterface
}

public struct DefaultBooksApiFactory: BooksApiFactory {
    public init() {}
    
    public func makeBooksApiClient() -> BooksApiInterface {
        BooksApiClient()
    }
}
