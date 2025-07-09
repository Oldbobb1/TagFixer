import SwiftUI

struct DonateButtons: View {
    var body: some View {
        HStack(spacing: 10) {
            Button("💖 small donat $0.99") {

            }
            .padding(.leading)
            Button("☕ support $2.99") {

            }
            Button("🍕 big donat $4.99") {

            }
            .padding(.trailing)
        }
    }
}
