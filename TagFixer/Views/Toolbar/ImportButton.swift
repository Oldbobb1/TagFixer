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
