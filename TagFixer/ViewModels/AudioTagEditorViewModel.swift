//
//  FileManagerModel.swift
//  TagFixer
//
//  Created by Bobbi R. on 8.07.25.
//
import AppKit
import ID3TagEditor

class AudioTagEditorViewModel: ObservableObject {
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
                    let title = (id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content ?? ""
                    let artist = (id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content ?? ""
                    let album = (id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content ?? ""
                    let genre = (id3Tag?.frames[.genre] as? ID3FrameGenre)?.description ?? ""
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
                    print("Ошибка чтения тега файла \(url.lastPathComponent): \(error)")
                }
            }
            DispatchQueue.main.async {
                self.mp3Files.append(contentsOf: newFiles)  // Добавляем к уже существующим
            }
        }
    }
    func saveEditedTracks() {
        for file in mp3Files {
            do {
                guard let tag = try? id3TagEditor.read(from: file.url.path) else {
                    print("⚠️ Невозможно прочитать тег у: \(file.fileName)")
                    continue
                }
                tag.frames[.title] = ID3FrameWithStringContent(content: file.title)
                tag.frames[.artist] = ID3FrameWithStringContent(content: file.artist)
                tag.frames[.album] = ID3FrameWithStringContent(content: file.album)
                tag.frames[.genre] = ID3FrameGenre(genre: nil, description: file.genre)
                let panel = NSSavePanel()
                panel.allowedContentTypes = [.audio]
                panel.nameFieldStringValue = file.fileName
                panel.title = "Сохранить изменённый файл"
                if panel.runModal() == .OK, let saveURL = panel.url {
                    // Чтение оригинального MP3 как Data
                    let originalData = try Data(contentsOf: file.url)
                    // Создаём новые данные тега
                    let newData = try id3TagEditor.write(tag: tag, mp3: originalData)
                    // Записываем в выбранное место
                    try newData.write(to: saveURL)
                    print("✅ Файл сохранён: \(saveURL.lastPathComponent)")
                    // Удаляем файл из TagEditor после успешного сохранения
                    if let index = mp3Files.firstIndex(where: { $0.id == file.id }) {
                        mp3Files.remove(at: index)
                        print("🗑 Файл удалён из редактора: \(file.fileName)")
                    }
                }
            } catch {
                print("❌ Ошибка при сохранении \(file.fileName): \(error)")
            }
        }
    }
}
