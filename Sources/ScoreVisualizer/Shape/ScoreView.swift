//
//  ScoreView.swift
//  
//
//  Created by lively77 on 2022/2/20.
//

import Foundation
import SwiftUI
import MusicScore

public struct ScoreView : View {
    
    public init(score: MusicScore) {
        self.score = score
    }
    
    private let score: MusicScore
    
    public var body : some View {
        Rectangle().fill(.blue)
    }
}

public extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct ScoreView_Preview: PreviewProvider {
    static let testScore = ScoreSamples.spring1st
    
    static var previews: some View {
        return ScoreView(score: testScore)
    }
}

