//
//  ToolbarSuppotrButton.swift
//  TagFixer
//
//  Created by Bobbi R. on 9.07.25.
//
import SwiftUI

struct SupportButton: View {
    @State private var donate = false
    var body: some View {
        Button("❤️Support") {
            donate = true
        }
        .padding(.trailing)
        .sheet(isPresented: $donate){
            DonateView()
        }
    }
}
