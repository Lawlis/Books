import Foundation

public struct GetListsResponse: Decodable {
    let lists: [List]
}

public struct List: Decodable {
    public let id: Int
    public let title: String
}
