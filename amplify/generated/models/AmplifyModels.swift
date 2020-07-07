// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol.

public final class AmplifyModels: AmplifyModelRegistration {
    public let version: String = "c929f371fe1ace59cbf294579182740e"

    public func registerModels(registry _: ModelRegistry.Type) {
        ModelRegistry.register(modelType: Parent.self)
        ModelRegistry.register(modelType: Child.self)
    }
}
