import ID3TagEditor
import SwiftUI

class AudioTrack: ObservableObject, Identifiable {
    let id = UUID()
    let url: URL
    @Published var title: String
    @Published var artist: String
    @Published var fileName: String
    @Published var album: String
    @Published var genre: String
    init(
        url: URL,
        title: String,
        artist: String,
        fileName: String,
        album: String,
        genre: String,
    ) {
        self.url = url
        self.title = title
        self.artist = artist
        self.fileName = fileName
        self.album = album
        self.genre = genre
    }
}
