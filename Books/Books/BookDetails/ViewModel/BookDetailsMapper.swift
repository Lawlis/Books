import Foundation
import ApiClient

struct BookDetailsMapper {
    static func map(bookDetails: BookDetails) -> BookDetailItem {
        BookDetailItem(
            id: bookDetails.id,
            listId: bookDetails.listId,
            isbn: bookDetails.isbn,
            publicationDate: bookDetails.publicationDate,
            author: bookDetails.author,
            title: bookDetails.title,
            img: URL(string: bookDetails.img)!,
            description: bookDetails.description
        )
    }
}
