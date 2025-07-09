//
//  ToolbarButtons.swift
//  TagFixer
//
//  Created by Bobbi R. on 8.07.25.
//
import SwiftUI

struct AudioEditorToolbar: View {
    @ObservedObject var tagEditorModel: AudioTagEditorViewModel
    init(_ tagEditorModel: AudioTagEditorViewModel) {
        self.tagEditorModel = tagEditorModel
    }
    var body: some View {
        HStack {
            ImportButton(tagEditorModel)
            SaveButton(tagEditorModel)
            Spacer()
            Text("quantity: \(tagEditorModel.mp3Files.count)")
            Spacer()
            SupportButton()
        }
        .padding(.top)
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
