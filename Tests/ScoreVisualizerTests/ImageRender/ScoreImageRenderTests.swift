#if os(iOS)

import XCTest
import ScoreVisualizer
import MusicScore
import AudioToolbox

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
    
    func testScoreRenderVertical1() {
        let testScore = ScoreSamples.chopin92
        let render = ScoreImageRender(param: .default_vertical, score: testScore)
        let image = render.render(beginMeasureIdx: 0, endMeasureIdx: 100)
        saveImage(image: image, filenamed: "chopin_vertical")
        
        let subImage = render.render(beginMeasureIdx: 0, endMeasureIdx: 4)
        saveImage(image: subImage, filenamed: "chopin_vertical_first_4")
    }
    
    func testScoreRenderVertical2() {
        let testScore = ScoreSamples.spring1st
        let render = ScoreImageRender(param: .default_vertical, score: testScore)
        let image = render.render(beginMeasureIdx: 0, endMeasureIdx: 100)
        saveImage(image: image, filenamed: "spring_vertical")
        
        let subScore = render.render(beginMeasureIdx: 0, endMeasureIdx: 4)
        saveImage(image: subScore, filenamed: "spring_vertical_first_4")
    }
    
    func testScoreRenderHorizontal1() {
        let testScore = ScoreSamples.chopin92
        var param = ScoreRenderParam()
        param.noteMode = .horizontal
        let render = ScoreImageRender(param: .default_horizontal, score: testScore)
        let image = render.render(beginMeasureIdx: 0, endMeasureIdx: 100)
        saveImage(image: image, filenamed: "chopin_horizontal")
    }
    
    func testScoreRenderHorizontal2() {
        let testScore = ScoreSamples.spring1st
        let render = ScoreImageRender(param: .default_horizontal, score: testScore)
        let image = render.render(beginMeasureIdx: 0, endMeasureIdx: 100)
        saveImage(image: image, filenamed: "spring_horizontal")
        
        let subScore = render.render(beginMeasureIdx: 0, endMeasureIdx: 4)
        saveImage(image: subScore, filenamed: "spring_horizontal_first_4")
    }
    
    

}

#endif
