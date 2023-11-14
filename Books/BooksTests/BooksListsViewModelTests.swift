import XCTest
@testable import Books
@testable import ApiClient

final class BooksListsViewModelTests: XCTestCase {
    class MockBookListsDataModel: BookListsDataModelInterface {
        var fetchBookListsCalled = false
        var fetchBooksCalled = false
        
        var fetchBookLists_mockData: [List] = []
        func fetchBookLists() async throws -> [List] {
            fetchBookListsCalled = true
            return fetchBookLists_mockData
        }
        
        var fetchBooks_mockData: [Book] = []
        func fetchBooks() async throws -> [Book] {
            fetchBooksCalled = true
            return []
        }
    }

    var viewModel: BookListsViewModel!
    var mockDataModel: MockBookListsDataModel!

    @MainActor 
    override func setUpWithError() throws {
        mockDataModel = MockBookListsDataModel()
        viewModel = BookListsViewModel(dataModel: mockDataModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockDataModel = nil
    }

    func testFetchBookListsWithLoading() async {
        // Given
        let expectation = expectation(description: "Loading book lists with loading indicator")
        let expectedItems: [BookListRowItem] = [BookListRowItem(id: 0, title: "Some", allBooks: [])]
        mockDataModel.fetchBookLists_mockData = [List(id: 0, title: "Some")]
        
        // When
        await viewModel.fetchBookLists(showLoading: true)

        // Then
        XCTAssertTrue(mockDataModel.fetchBookListsCalled, "fetchBookLists should be called")
        XCTAssertTrue(mockDataModel.fetchBooksCalled, "fetchBooks should be called")
        let state = await viewModel.state
        XCTAssertEqual(state, .loaded(items: expectedItems), "ViewModel state should be loaded")
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    @MainActor 
    func testListedItems() {
        // Given
        let listId = 123
        let mockPreviewBooks = [
            BookItem(id: 1, listId: 0, title: "Book 1", imageUrl: .applicationDirectory),
            BookItem(id: 2, listId: 0, title: "Book 2", imageUrl: .applicationSupportDirectory)
        ]
        let mockItem = BookListRowItem(id: listId, title: "List 1", allBooks: mockPreviewBooks)
        viewModel.items = [mockItem]

        // When
        let listedItems = viewModel.listedItems(by: listId)

        // Then
        XCTAssertEqual(listedItems, mockPreviewBooks, "Listed items should match the preview books of the item")
    }
}
