//
//  DonatePlaceholderView.swift
//  TagFixer
//
//  Created by Bobbi R. on 9.07.25.
//
import SwiftUI

struct DonatePlaceholderView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
            .ignoresSafeArea()
            .onTapGesture {
                dismiss()
            }
            VStack {
                TitleAndDescriptionDonate()
                ButtonPayDonate()
            }
        }
        .frame(minWidth: 450, minHeight: 250)
    }
}
#Preview {
    DonatePlaceholderView()
}
