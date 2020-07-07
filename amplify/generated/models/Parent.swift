// swiftlint:disable all
import Amplify
import Foundation

public struct Parent: Model {
    public let id: String
    public var name: String
    public var children: List<Child>?

    public init(id: String = UUID().uuidString,
                name: String,
                children: List<Child>? = []) {
        self.id = id
        self.name = name
        self.children = children
    }
}
