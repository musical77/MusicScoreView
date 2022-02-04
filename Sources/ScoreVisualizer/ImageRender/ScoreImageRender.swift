//  ScoreImageRender.swift
//  Created by lively77 on 2022/2/2.


import Foundation
import UIKit

import MusicScore

public class ScoreImageRender {
    
    /// init render
    public init(param: ScoreRenderParam) {
        self.param = param
    }
    
    /// render images
    /// - parameter score score to be rendered
    public func render(score: MusicScore) -> UIImage {
        let size = CGSize(width: imageWidth(score: score), height: imageHeight)
        
        // Create a context of the starting image size and set it as the current one
        UIGraphicsBeginImageContext(size)
        
        // Get the current context
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw musicPart each by each.
        for musicPart in score.musicParts {
            draw(context: context, musicPart: musicPart)
        }
        
        // Save the context as a new UIImage
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Return modified image
        return image!
    }
    
    public var param: ScoreRenderParam!
    
    /// privates
    
    /// draw music part
    private func draw(context: CGContext, musicPart: MusicPart) {
        let color = getColor(musicPart)
        
        for note in musicPart.notes {
            drawNote(context: context, note: note, color: color)
        }
    }
    
    /// draw a single note
    private func drawNote(context: CGContext, note: NoteInScore, color: CGColor) {
        let xPos = note.beginBeat * param.noteWidthPerBeat
        let yPos = imageHeight - CGFloat(note.pitch.rawValue) / HIGHEST_PITCH * imageHeight
        let width = (note.endBeat - note.beginBeat) * param.noteWidthPerBeat
        let height = param.noteHeight
        
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        
        context.setStrokeColor(color)
        context.setFillColor(color)
        context.setAlpha(0.8)
        context.addRect(rect)
        context.drawPath(using: .fill)
    }
        
    private func imageWidth(score: MusicScore) -> CGFloat {
        return score.duration * param.noteWidthPerBeat
    }
    
    private var imageHeight: CGFloat {
        return HIGHEST_PITCH * param.noteHeight
    }
    
    private func getColor(_ musicPart: MusicPart) -> CGColor {
        switch musicPart.meta.instrument {
        case .piano:
            return UIColor.green.cgColor
        case.violin:
            return UIColor.red.cgColor
        default:
            return UIColor.blue.cgColor
        }
    }
    
    private let HIGHEST_PITCH = 128.0
}


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
