import ID3TagEditor
import SwiftUI

final class AudioTagEditorViewModel: ObservableObject {
    @Published var mp3Files: [AudioTrack] = []
    private let id3TagEditor = ID3TagEditor()

    func importTracks() {
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.allowsMultipleSelection = true
        panel.allowedContentTypes = [.audio]
        if panel.runModal() == .OK {
            var newFiles: [AudioTrack] = []
            for url in panel.urls {
                do {
                    let id3Tag = try id3TagEditor.read(from: url.path)
                    let title =
                        (id3Tag?.frames[.title] as? ID3FrameWithStringContent)?
                        .content ?? ""
                    let artist =
                        (id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?
                        .content ?? ""
                    let album =
                        (id3Tag?.frames[.album] as? ID3FrameWithStringContent)?
                        .content ?? ""
                    let genre =
                        (id3Tag?.frames[.genre] as? ID3FrameGenre)?.description
                        ?? ""
                    let file = AudioTrack(
                        url: url,
                        title: title,
                        artist: artist,
                        fileName: url.lastPathComponent,
                        album: album,
                        genre: genre
                    )
                    newFiles.append(file)
                } catch {
                    print("Error")
                }
            }
            DispatchQueue.main.async {
                self.mp3Files.append(contentsOf: newFiles)
            }
        }
    }

    func saveEditedTracks() {
        for file in mp3Files {
            do {
                guard let tag = try? id3TagEditor.read(from: file.url.path)
                else {
                    continue
                }
                tag.frames[.title] = ID3FrameWithStringContent(
                    content: file.title
                )
                tag.frames[.artist] = ID3FrameWithStringContent(
                    content: file.artist
                )
                tag.frames[.album] = ID3FrameWithStringContent(
                    content: file.album
                )
                tag.frames[.genre] = ID3FrameGenre(
                    genre: nil,
                    description: file.genre
                )
                let panel = NSSavePanel()
                panel.allowedContentTypes = [.audio]
                panel.nameFieldStringValue = file.fileName
                if panel.runModal() == .OK, let saveURL = panel.url {
                    let originalData = try Data(contentsOf: file.url)
                    let newData = try id3TagEditor.write(
                        tag: tag,
                        mp3: originalData
                    )
                    try newData.write(to: saveURL)
                    if let index = mp3Files.firstIndex(where: {
                        $0.id == file.id
                    }) {
                        mp3Files.remove(at: index)
                    }
                }
            } catch {
                print("Error")
            }
        }
    }
}
