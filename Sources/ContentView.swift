import Amplify
import SwiftUI

struct ContentView: View {
    var parent: Parent?

    var body: some View {
        Button(action: self.onCreateClick) {
            Text("Create Parent + Child")
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.title)
        }
    }

    func onCreateClick() {
        let now = Temporal.DateTime.now().iso8601String
        let parent = Parent(name: "Parent \(now)")
        _ = Amplify.API.mutate(request: .create(parent)) {
            switch $0 {
            // first enum
            case let .success(result):
                // nested enum... a success but with a possible failure?
                switch result {
                case let .success(response):
                    print(response)
                    print("----------------------------")
                    print("Parent created with success!")
                    print("Will create child now...")
                    self.createChildFor(parent: response)
                case let .failure(error):
                    print(error)
                }
            case let .failure(error):
                print("----------------------------")
                print("Error creating Parent!")
                print(error)
            }
        }
    }

    private func createChildFor(parent: Parent) {
        let child = Child(name: "Child of parent \(parent.id)", parent: parent)
        _ = Amplify.API.mutate(request: .create(child)) {
            switch $0 {
            case let .success(result):
                print("----------------------------")
                print("Child created with success!")
                print(result)
            case let .failure(error):
                print("----------------------------")
                print("Error creating Child!")
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
