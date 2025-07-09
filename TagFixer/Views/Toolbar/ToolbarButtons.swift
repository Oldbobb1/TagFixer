//
//  ToolbarButtons.swift
//  TagFixer
//
//  Created by Bobbi R. on 8.07.25.
//
import SwiftUI

struct ToolbarButtons: View {
    @ObservedObject var tagEditorModel: AudioTagEditorViewModel
    init(_ tagEditorModel: AudioTagEditorViewModel) {
        self.tagEditorModel = tagEditorModel
    }
    var body: some View {
        HStack {
            ToolbarImportButton(tagEditorModel)
            ToolbarSaveButton(tagEditorModel)
            Spacer()
            Text("quantity: \(tagEditorModel.mp3Files.count)")
            Spacer()
            ToolbarSuppotrButton()
        }
        .padding(.top)
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
