//
//  NoteHorizontalShape.swift
//  shape for drawing music note
//
//  Created by lively77 on 2022/2/20.
//

import Foundation
import SwiftUI
import MusicScore

public struct NoteHorizontalShape : Shape {
    
    public init(note: NoteInScore, param: ScoreRenderParam) {
        self.note = note
        self.param = param
    }
    
    public func path(in rect: CGRect) -> Path {
        let imageHeight = CGFloat(rect.height)
        
        let xPos = note.beginBeat * param.noteWidthPerBeat
        let yPos = imageHeight - CGFloat(note.pitch.rawValue) / NoteInScore.HIGHEST_PITCH * imageHeight
        let width = (note.endBeat - note.beginBeat) * param.noteWidthPerBeat
        let height = param.noteHeight
        
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        
        var path = Path()
        path.addRect(rect)
        return path
    }
    
    private var note: NoteInScore
    private var param: ScoreRenderParam
}
