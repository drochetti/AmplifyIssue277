// swiftlint:disable all
import Amplify
import Foundation

extension Parent {
    // MARK: - CodingKeys

    public enum CodingKeys: String, ModelKey {
        case id
        case name
        case children
    }

    public static let keys = CodingKeys.self

    //  MARK: - ModelSchema

    public static let schema = defineSchema { model in
        let parent = Parent.keys

        model.pluralName = "Parents"

        model.fields(
            .id(),
            .field(parent.name, is: .required, ofType: .string),
            .hasMany(parent.children, is: .optional, ofType: Child.self, associatedWith: Child.keys.parent)
        )
    }
}
