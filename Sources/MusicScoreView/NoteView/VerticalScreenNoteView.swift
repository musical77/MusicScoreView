//  VerticalScreenNoteView.swift
//
//  Created by lively77 on 2022/3/5.

import Foundation
import SwiftUI
import MusicScore
import MusicSymbol

public struct VerticalScreenNoteView: View {
    public init(note: NoteInScore,
                param: ScoreDrawingParam,
                context: ScoreDrawingContext) {
        self.note = note
        self.drawingParam = param
        self.drawingContext = context
    }
    
    public var body: some View {
        return RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: noteWidth, height: noteHeight)
            .foregroundColor(noteColor)
            .position(x: positionX + noteWidth / 2, y: positionY + noteHeight / 2)
    }
    
    // begin private
    
    /// note width is calculated by duration of this notes
    var noteWidth: CGFloat {
        return note.beats * noteWidthPerBeat
    }
    
    var noteWidthPerBeat: CGFloat {
        return drawingContext.screenWidth / CGFloat((drawingContext.endBeatToDraw - drawingContext.beginBeatToDraw))
    }
    
    /// note height is calculated by the pitch distance to C4
    var noteHeight: CGFloat {
        let pitchDistToC4 = abs(CGFloat(note.pitch.rawValue - Pitch.C4.rawValue))
        return pitchDistToC4 * noteHeightPerPitch
    }
    
    var noteHeightPerPitch: CGFloat {
        return drawingContext.screenHeight / HorizontalScreenNoteView.PITCHES
    }
    
    /// position
    var positionX: CGFloat {
        return (note.beginBeat - drawingContext.beginBeatToDraw) * noteWidthPerBeat
    }
    
    var positionY: CGFloat {
        let c4Y = drawingContext.screenHeight - CGFloat(Pitch.C4.rawValue) * noteHeightPerPitch
            + VerticalScreenNoteView.MIN_PITCH * noteHeightPerPitch
        if note.pitch.rawValue > Pitch.C4.rawValue {
            return c4Y - noteHeight
        } else {
            return c4Y
        }
    }
    
    var noteColor: Color {
        return NoteColorMap.getColor(note: note, mode: drawingParam.noteColorMode)
    }
    
    var cornerRadius: CGFloat {
        return noteHeightPerPitch / 3.0
    }
    
    let note: NoteInScore
    let drawingParam: ScoreDrawingParam
    let drawingContext: ScoreDrawingContext
    
    static let MIN_PITCH = 12.0
    static let MAX_PITCH = 108.0
    static let PITCHES = MAX_PITCH - MIN_PITCH + 1
}

