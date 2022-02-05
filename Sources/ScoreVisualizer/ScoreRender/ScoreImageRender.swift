//  ScoreImageRender.swift
//  Created by lively77 on 2022/2/2.

#if os(iOS)

import Foundation
import UIKit

import MusicScore

public class ScoreImageRender {
    
    /// init render
    public init(param: ScoreRenderParam, score: MusicScore) {
        self.param = param
        self.score = score
        self.hDrawer = HorizontalNoteDrawer(param: param)
        self.vDrawer = VerticalNoteDrawer(param: param)
    }
    
    /// return image of score [beginMeasureIdx, endMeasureIdx)
    public func render(beginMeasureIdx: Int, endMeasureIdx: Int) -> UIImage {
        if self.image == nil {
            self.image = render()
        }
        
        let beginX = beginXPos(idx: beginMeasureIdx)
        let endX = beginXPos(idx: endMeasureIdx)
        let rect = CGRect(x: beginX, y: 0, width: endX - beginX, height: imageHeight)
        return self.image!.crop(rect: rect)
    }
    
    /// render images
    /// - parameter score score to be rendered
    private func render() -> UIImage {
        let size = CGSize(width: imageWidth, height: imageHeight)
        
        // Create a context of the starting image size and set it as the current one
        UIGraphicsBeginImageContext(size)
        
        // Get the current context
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw musicPart each by each.
        for musicPart in score.musicParts {
            draw(context: context, musicPart: musicPart)
        }
        
        // Draw Measure lines.
        if param.drawMeasureLine {
            drawMeasureLines(context: context, score: score)
        }
        
        // Save the context as a new UIImage
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Return modified image
        return image!
    }
    
    private var param: ScoreRenderParam!
    private var score: MusicScore!
    
    private var image: UIImage? = nil
    
    /// privates
    
    /// draw measure lines
    private func drawMeasureLines(context: CGContext, score: MusicScore) {
        for musicPart in score.musicParts {
            for measure in musicPart.measures {
                let beginXPos = beginXPos(of: measure) - param.measureLineWidth / 2
                context.setLineWidth(param.measureLineWidth)
                
                context.setStrokeColor(UIColor.gray.cgColor)
                context.move(to: CGPoint(x: beginXPos, y: 0))
                context.addLine(to: CGPoint(x: beginXPos, y: imageHeight))
                context.strokePath()
            }
        }
    }
    
    /// draw notes in this music part
    private func draw(context: CGContext, musicPart: MusicPart) {
        for note in musicPart.notes {
            if param.noteMode == .vertical {
                vDrawer.draw(context: context, note: note, instrument: musicPart.meta.instrument)
            } else {
                hDrawer.draw(context: context, note: note, instrument: musicPart.meta.instrument)
            }
        }
    }
    
    /// beginXPos
    private func beginXPos(of measure: Measure) -> Double {
        return measure.beginBeat * param.noteWidthPerBeat
    }
    private func beginXPos(idx: Int) -> Double {
        if idx < score.musicParts[0].measures.count {
            return beginXPos(of: score.musicParts[0].measures[idx])
        } else {
            return imageWidth
        }
    }
        
    /// score image width
    private var imageWidth: CGFloat {
        return score.duration * param.noteWidthPerBeat
    }
    
    /// score image height
    private var imageHeight: CGFloat {
        return HIGHEST_PITCH * param.noteHeight
    }
    
    private let HIGHEST_PITCH = 128.0
    
    private let hDrawer: HorizontalNoteDrawer!
    private let vDrawer: VerticalNoteDrawer!
}


#endif

//// Draw a red line
//context.setLineWidth(2.0)
//context.setStrokeColor(UIColor.red.cgColor)
//context.move(to: CGPoint(x: 100, y: 100))
//context.addLine(to: CGPoint(x: 200, y: 200))
//context.strokePath()
//
//// Draw a transparent green Circle
//context.setStrokeColor(UIColor.green.cgColor)
//context.setAlpha(0.5)
//context.setLineWidth(10.0)
//context.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
//context.drawPath(using: .stroke) // or .fillStroke if need filling
