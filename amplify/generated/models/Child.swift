// swiftlint:disable all
import Amplify
import Foundation

public struct Child: Model {
    public let id: String
    public var name: String
    public var parent: Parent

    public init(id: String = UUID().uuidString,
                name: String,
                parent: Parent) {
        self.id = id
        self.name = name
        self.parent = parent
    }
}
