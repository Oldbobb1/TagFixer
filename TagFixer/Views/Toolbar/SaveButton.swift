import SwiftUI

struct SaveButton: View {
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
