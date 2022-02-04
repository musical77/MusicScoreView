//  ScoreImageRender.swift
//  Created by lively77 on 2022/2/2.


import Foundation
import UIKit

import MusicScore

public class ScoreImageRender {
    
    /// init
    public init(score: MusicScore, param: ScoreRenderParam) {
        self.score = score
        self.param = param
        self.duration = score.duration
    }
    
    public func render() -> UIImage {
        let size = CGSize(width: imageWidth, height: imageHeight)
        
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
    
    public let param: ScoreRenderParam!
    
    
    /// privates
    
    /// draw music part
    private func draw(context: CGContext, musicPart: MusicPart) {
        for note in musicPart.notes {
            drawNote(context: context, note: note)
        }
    }
    
    /// draw a single note
    private func drawNote(context: CGContext, note: NoteInScore) {
        let xPos = note.beginBeat * param.noteWidthPerBeat
        let yPos = imageHeight - CGFloat(note.pitch.rawValue) / HIGHEST_PITCH * imageHeight
        let width = (note.endBeat - note.beginBeat) * param.noteWidthPerBeat
        let height = param.noteHeight
        
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        context.setAlpha(0.5)
        context.addRect(rect)
        context.drawPath(using: .fill)
    }
    
    private var score: MusicScore!
    private var duration: Double!
    
    private var imageWidth: CGFloat {
        return score.duration * param.noteWidthPerBeat
    }
    
    private var imageHeight: CGFloat {
        return HIGHEST_PITCH * param.noteHeight
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
