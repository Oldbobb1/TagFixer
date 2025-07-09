//
//  ToolbarSaveButton.swift
//  TagFixer
//
//  Created by Bobbi R. on 9.07.25.
//
import SwiftUI

struct ToolbarSaveButton: View {
    @ObservedObject var tagEditorModel: AudioTagEditorViewModel
    init(_ tagEditorModel: AudioTagEditorViewModel) {
        self.tagEditorModel = tagEditorModel
    }
    var body: some View {
        Button(action: {
            tagEditorModel.saveEditedTracks()
        }){
            Image(systemName: "square.and.arrow.down.fill")
        }
        .buttonStyle(.bordered)
    }
}
