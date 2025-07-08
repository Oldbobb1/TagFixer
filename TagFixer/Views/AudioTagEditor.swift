//
//  TagEditor.swift
//  TagFixer
//
//  Created by Bobbi R. on 8.07.25.
//
import SwiftUI

struct AudioTagEditor: View {
    @StateObject var tagEditorModel = AudioTagEditorViewModel()
    var body: some View {
        VStack {
            ToolbarButtons(tagEditorModel)
            TrackListHeader()
            List {
                ForEach(tagEditorModel.mp3Files) { file in
                    AudioTrackRow(file)
                }
            }
//            .frame(minWidth: 500, minHeight: 500)
        }
    }
}
#Preview {
    AudioTagEditor()
}

