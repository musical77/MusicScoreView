

import XCTest
import ScoreVisualizer
import MusicScore

class ScoreImageRenderTests: XCTestCase {

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveImage(image: UIImage, filenamed: String) {
        if let data = image.pngData() {
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(filenamed).png")
            try? data.write(to: fileURL)
            print(fileURL)
        }
    }
    
    func testScoreRender1() {
        let testScore = ScoreSamples.chopin92
        let render = ScoreImageRender(param: .default)
        let image = render.render(score: testScore)
        saveImage(image: image, filenamed: "chopin")
    }
    
    func testScoreRender2() {
        var testScore = ScoreSamples.spring1st
        let render = ScoreImageRender(param: .default)
        let image = render.render(score: testScore)
        saveImage(image: image, filenamed: "spring")
        
        testScore.cut(beginBeat: 0, endBeat: 16)
        saveImage(image: render.render(score: testScore), filenamed: "spring_first_4")
    }

}
