//  NoteView.swift
//
//  Created by lively77 on 2022/2/20.
//

import Foundation
import SwiftUI
import MusicScore
import MusicSymbol

public struct HorizontalScreenNoteView: View {
    public init(note: NoteInScore,
                param: ScoreDrawingParam, context: ScoreDrawingContext) {
        self.note = note
        self.drawingParam = param
        self.drawingContext = context
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: noteWidth, height: noteHeight)
            .foregroundColor(noteColor)
            .position(x: positionX + noteWidth / 2, y: positionY)
    }
    
    // begin private
    
    var noteWidth: CGFloat {
        return note.beats * noteWidthPerBeat
    }
    
    var noteColor: Color {
        return NoteColorMap.getColorByNotePitch(note: note)
    }
    
    var positionX: CGFloat {
        return (note.beginBeat - drawingContext.beginBeatToDraw) * noteWidthPerBeat
    }
    
    var positionY: CGFloat {
        return drawingContext.screenHeight - CGFloat(note.pitch.rawValue) * noteHeight
    }
    
    var cornerRadius: CGFloat {
        return noteHeight / 3.0
    }
    
    var noteWidthPerBeat: CGFloat {
        return drawingContext.screenWidth / CGFloat((drawingContext.endBeatToDraw - drawingContext.beginBeatToDraw))
    }
    
    var noteHeight: CGFloat {
        return drawingContext.screenHeight / HorizontalScreenNoteView.PITCHES
    }
    
    let note: NoteInScore
    let drawingParam: ScoreDrawingParam
    let drawingContext: ScoreDrawingContext
    
    static let MIN_PITCH = 12.0
    static let MAX_PITCH = 108.0
    static let PITCHES = MAX_PITCH - MIN_PITCH + 1
}

