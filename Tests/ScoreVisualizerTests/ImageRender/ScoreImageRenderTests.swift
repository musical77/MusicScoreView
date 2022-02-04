

import XCTest
import ScoreVisualizer
import MusicScore

class ScoreImageRenderTests: XCTestCase {

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func testScoreRender1() {
        let testScore = ScoreSamples.chopin92
        let render = ScoreImageRender(score: testScore, param: ScoreRenderParam())
        let image = render.render()
        
        if let data = image.pngData() {
            let fileURL = getDocumentsDirectory().appendingPathComponent("render.png")
            try? data.write(to: fileURL)
            print(fileURL)
        }
    }

}
