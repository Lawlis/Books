import Foundation

struct BookDetailItem {
    let id: Int
    let listId: Int
    let isbn: String
    let publicationDate: Date
    let author: String
    let title: String
    let img: URL
    let description: String
    
    init(id: Int, listId: Int, isbn: String, publicationDate: Date, author: String, title: String, img: URL, description: String) {
        self.id = id
        self.listId = listId
        self.isbn = isbn
        self.publicationDate = publicationDate
        self.author = author
        self.title = title
        self.img = img
        self.description = description
    }
}
