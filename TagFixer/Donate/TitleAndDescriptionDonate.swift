//
//  TitleAndDescriptionDonate.swift
//  TagFixer
//
//  Created by Bobbi R. on 9.07.25.
//
import SwiftUI

struct TitleAndDescriptionDonate: View {
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
