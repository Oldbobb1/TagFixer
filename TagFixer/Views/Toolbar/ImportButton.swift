//
//  ToolbarImportButton.swift
//  TagFixer
//
//  Created by Bobbi R. on 9.07.25.
//
import SwiftUI

struct ImportButton: View {
    @ObservedObject var tagEditorModel: AudioTagEditorViewModel
    init(_ tagEditorModel: AudioTagEditorViewModel) {
        self.tagEditorModel = tagEditorModel
    }
    var body: some View {
        Button(action: {
            tagEditorModel.importTracks()
        }){
            Image(systemName: "plus")
        }
        .buttonStyle(.borderedProminent)
    }
}
