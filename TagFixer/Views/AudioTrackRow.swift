import SwiftUI

struct AudioTrackRow: View {
    @ObservedObject var audioTrack: AudioTrack
    init(_ audioTrack: AudioTrack) {
        self.audioTrack = audioTrack
    }
    var body: some View {
        HStack {
            TextField("Title", text: $audioTrack.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Artist", text: $audioTrack.artist)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("File Name", text: $audioTrack.fileName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Album", text: $audioTrack.album)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Genre", text: $audioTrack.genre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
