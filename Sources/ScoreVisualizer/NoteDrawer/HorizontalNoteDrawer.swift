//  HorizontalNoteDrawer.swift
//
//  Created by lively77 on 2022/2/5.


import Foundation
import MusicScore
import UIKit

class HorizontalNoteDrawer {
    internal init(param: ScoreRenderParam) {
        self.param = param
    }
    
    var param: ScoreRenderParam
    
    func draw(context: CGContext, note: NoteInScore, instrument: InstrumentType) {
        let imageHeight = CGFloat(context.height)
        let color = NoteColorMap.getColor(instrument: instrument).cgColor
        
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
    
    private let HIGHEST_PITCH = 128.0
}
