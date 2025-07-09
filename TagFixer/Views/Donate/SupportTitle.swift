import SwiftUI

struct SupportTitle: View {
    var body: some View {
        Text("Support the project")
            .font(.title2)
        Text("Your donation helps improve this app and supports the creation of simple, honest tools.")
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .foregroundColor(.gray)
            .padding()
    }
}
