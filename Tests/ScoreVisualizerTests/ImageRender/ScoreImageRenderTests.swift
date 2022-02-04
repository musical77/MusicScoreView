

import XCTest
import ScoreVisualizer
import MusicScore

class ScoreImageRenderTests: XCTestCase {

    func testScoreRender1() {
        let testScore = ScoreSamples.chopin92
        let render = ScoreImageRender(score: testScore)
        let image = render.render()
        
    }

}
