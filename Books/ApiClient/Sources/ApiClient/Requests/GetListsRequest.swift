import Foundation

struct GetListsRequest: APIRequest {
    typealias ResponseType = [List]

    var path: String { "/lists" }
    var method: HTTPMethod { .get }
    var body: Data? { nil }
}
