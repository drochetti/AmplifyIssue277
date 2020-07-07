// swiftlint:disable all
import Amplify
import Foundation

extension Child {
    // MARK: - CodingKeys

    public enum CodingKeys: String, ModelKey {
        case id
        case name
        case parent
    }

    public static let keys = CodingKeys.self

    //  MARK: - ModelSchema

    public static let schema = defineSchema { model in
        let child = Child.keys

        model.pluralName = "Children"

        model.fields(
            .id(),
            .field(child.name, is: .required, ofType: .string),
            .belongsTo(child.parent, is: .required, ofType: Parent.self, targetName: "childParentId")
        )
    }
}
