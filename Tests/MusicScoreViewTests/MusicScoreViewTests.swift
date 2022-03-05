
import XCTest
import SwiftUI
import MusicScore
import MusicScoreView

class MusicScoreViewTests: XCTestCase {

    func testScoreViewSnapshot() {
        let score = ScoreSamples.spring1st
        let vm = ScoreViewModel(score: score, param: .default_horizontal_screen, beginBeat: 0, endBeat: 32)
        let view = ScoreView(viewModel: vm)
        let image = view.snapshot(size: CGSize(width: 512, height: 512))
        
        saveImage(image: image, filenamed: "score_view_512")
        saveImage(image: view.snapshot(size: CGSize(width: 1024, height: 512)), filenamed: "score_view_1024")
    }
    
    func testScoreViewSnapshotFromMid() {
        let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
        let score = MusicScore(url: url)!
        let scoreView = ScoreView(viewModel: ScoreViewModel(
            score: score, param: .default_horizontal_screen, beginBeat: 0, endBeat: 16))
        let image = scoreView.snapshot(size: CGSize(width: 512, height: 512))
        
        saveImage(image: image, filenamed: "bach_512")
    }
    
    func testNoteColorMode() {
        let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
        let score = MusicScore(url: url)!
        
        var param = ScoreDrawingParam()
        param.noteColorMode = .by_key
        param.noteArrangeMode = .horizontal_screen
        let scoreView = ScoreView(viewModel: ScoreViewModel(
            score: score, param: param, beginBeat: 0, endBeat: 16))
        let image = scoreView.snapshot(size: CGSize(width: 512, height: 512))
        
        saveImage(image: image, filenamed: "bach_846_by_key")
    }
    
    func testAllModes() {
        let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
        let score = MusicScore(url: url)!
        
        for arrangeMode: NoteArrangeMode in [.vertical_screen, .horizontal_screen, .vertical_fall] {
            for noteColorMode: NoteColorMode in [.by_pitch, .by_key, .by_instrument] {
                var param = ScoreDrawingParam()
                param.noteArrangeMode = arrangeMode
                param.noteColorMode = noteColorMode
                
                let scoreView = ScoreView(viewModel: ScoreViewModel(
                    score: score, param: param, beginBeat: 0, endBeat: 48.0))
                    .frame(width: 1920, height: 1080)
                let image = scoreView.snapshot(size: CGSize(width: 1920, height: 1080))
                saveImage(image: image, filenamed: "bach_846_\(param.noteArrangeMode)_\(param.noteColorMode)")
            }
        }
    }
    
    func testAllModes2() {
        let score = ScoreSamples.spring1st
        
        for arrangeMode: NoteArrangeMode in [.vertical_screen, .horizontal_screen, .vertical_fall] {
            for noteColorMode: NoteColorMode in [.by_pitch, .by_key, .by_instrument] {
                var param = ScoreDrawingParam()
                param.noteArrangeMode = arrangeMode
                param.noteColorMode = noteColorMode
                
                let scoreView = ScoreView(viewModel: ScoreViewModel(
                    score: score, param: param, beginBeat: 0, endBeat: 48.0))
                    .frame(width: 1920, height: 1080)
                let image = scoreView.snapshot(size: CGSize(width: 1920, height: 1080))
                saveImage(image: image, filenamed: "spring_\(param.noteArrangeMode)_\(param.noteColorMode)")
            }
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func saveImage(image: UIImage, filenamed: String) {
        if let data = image.pngData() {
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(filenamed).png")
            try? data.write(to: fileURL)
            print(fileURL)
        }
    }
}

