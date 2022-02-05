//  VerticalNoteDrawer.swift
//
//  Created by lively77 on 2022/2/5.

import Foundation
import MusicScore
import MusicSymbol
import UIKit

class VerticalNoteDrawer {
    
    internal init(param: ScoreRenderParam) {
        self.param = param
    }
    
    var param: ScoreRenderParam
    
    func draw(context: CGContext, note: NoteInScore, instrument: InstrumentType) {
        let imageHeight = CGFloat(context.height)
        let color = getColor(note: note, instrument: instrument).cgColor
        
        let xPos = note.beginBeat * param.noteWidthPerBeat
        let width = (note.endBeat - note.beginBeat) * param.noteWidthPerBeat
        
        let yMiddleCPos = getYPos(imageHeight: imageHeight, of: Pitch.C4)
        let yPos = getYPos(imageHeight: imageHeight, of: note.pitch)
        let height = abs(yPos - yMiddleCPos)
        
        let rect = CGRect(x: xPos, y: min(yPos, yMiddleCPos), width: width, height: height)
        
        context.setStrokeColor(color)
        context.setFillColor(color)
        context.setAlpha(0.9)
        context.addRect(rect)
        context.drawPath(using: .fill)
    }
    
    /// get color
    private func getColor(note: NoteInScore, instrument: InstrumentType) -> UIColor {
        switch param.noteColorMode {
        case .instrument:
            return NoteColorMap.getColorByInstrument(note: note, instrument: instrument)
        case .pitch:
            return NoteColorMap.getColorByNotePitch(note: note, instrument: instrument)
        case .key:
            return NoteColorMap.getColorByNoteKey(note: note, instrument: instrument)
        }
    }
    
    ///  get Y position
    private func getYPos(imageHeight: CGFloat, of pitch : Pitch) -> CGFloat {
        return imageHeight - CGFloat(pitch.rawValue) / HIGHEST_PITCH * imageHeight
    }
    
    private let HIGHEST_PITCH = 128.0
}
