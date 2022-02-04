//  ScoreImageRender.swift
//  Created by lively77 on 2022/2/2.


import Foundation
import UIKit

import MusicScore

public class ScoreImageRender {
    
    public init(score: MusicScore) {
        self.score = score
    }
    
    public func render() -> UIImage {
        let size = CGSize(width: 512, height: 256)
        
        // Create a context of the starting image size and set it as the current one
        UIGraphicsBeginImageContext(size)
        
        // Get the current context
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw a red line
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.move(to: CGPoint(x: 100, y: 100))
        context.addLine(to: CGPoint(x: 200, y: 200))
        context.strokePath()
        
        // Draw a transparent green Circle
        context.setStrokeColor(UIColor.green.cgColor)
        context.setAlpha(0.5)
        context.setLineWidth(10.0)
        context.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
        context.drawPath(using: .stroke) // or .fillStroke if need filling
        
        // Save the context as a new UIImage
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Return modified image
        return image!
    }
    
    public let noteHeight = 2.0
    public let noteWidthPerBeat = 5.0
    
    
    /// privates
    
    private var score: MusicScore!
    
    private var imageWidth: CGFloat {
        return score.duration * noteWidthPerBeat
    }
    
    private var imageHeight: CGFloat {
        return 256.0 * noteHeight
    }
}
