
import XCTest
import SwiftUI
import MusicScore
import MusicScoreView

class testScoreVizTests: XCTestCase {

    func testScoreViewSnapshot() {
        let score = ScoreSamples.spring1st
        let vm = ScoreViewModel(score: score, beginBeat: 0, endBeat: 32)
        let view = ScoreView(viewModel: vm)
        let image = view.snapshot()
        
        saveImage(image: image, filenamed: "score_view_512")
        saveImage(image: view.snapshot(size: CGSize(width: 1024, height: 512)), filenamed: "score_view_1024")
    }
    
    func testScoreViewSnapshotFromMid() {
        let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
        let score = MusicScore(url: url)!
        let scoreView = ScoreView(viewModel: ScoreViewModel(score: score, beginBeat: 0, endBeat: 16.0))
        let image = scoreView.snapshot()
        
        saveImage(image: image, filenamed: "bach_512")
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

