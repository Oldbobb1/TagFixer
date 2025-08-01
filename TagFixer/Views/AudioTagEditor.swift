import SwiftUI

struct AudioTagEditor: View {
    @StateObject private var tagEditorModel = AudioTagEditorViewModel()

    var body: some View {
        VStack {
            AudioEditorToolbar(tagEditorModel)
            TrackListHeader()
            List {
                ForEach(tagEditorModel.mp3Files) { file in
                    AudioTrackRow(file)
                }
            }
        }
    }
}
