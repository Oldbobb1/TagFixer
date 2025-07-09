import SwiftUI

struct DonateView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            VStack {
                SupportTitle()
                DonateButtons()
            }
        }
        .frame(minWidth: 450, minHeight: 250)
    }
}
