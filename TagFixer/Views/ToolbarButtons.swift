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
            Button(action: {
                tagEditorModel.importTracks()
            }){
                Image(systemName: "plus")
            }
            .buttonStyle(.borderedProminent)
            Button(action: {
                tagEditorModel.saveEditedTracks()
            }){
                Image(systemName: "square.and.arrow.down.fill")
            }
            .buttonStyle(.bordered)
        }
        .padding(.top)
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
