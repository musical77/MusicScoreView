////
////  File.swift
////  
////
////  Created by lively77 on 2022/2/20.
////
//
//import Foundation
//
//import XCTest
//import MusicScoreView
//import MusicScore
//
//
//class ScoreViewTests: XCTestCase {
//    
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//    
//    func saveImage(image: UIImage, filenamed: String) {
//        if let data = image.pngData() {
//            let fileURL = getDocumentsDirectory().appendingPathComponent("\(filenamed).png")
//            try? data.write(to: fileURL)
//            print(fileURL)
//        }
//    }
//    
//    func testScoreView1() {
//        let testScore = ScoreSamples.spring1st
//        let view = ScoreView(score: testScore)
//            .frame(width: 100, height: 100, alignment: .center)
//            .foregroundColor(.blue)
//        
//        let image = view.snapshot()
//        saveImage(image: image, filenamed: "score_view")
//    }
//}
