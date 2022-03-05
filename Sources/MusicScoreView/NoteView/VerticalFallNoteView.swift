//  VerticalFallNoteView.swift
//
//  Created by lively77 on 2022/3/5.

import Foundation
import SwiftUI
import MusicScore
import MusicSymbol

public struct VerticalFallNoteView: View {
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
    
    /// note width is fixed
    var noteWidth: CGFloat {
        return 1.0 * noteWidthPerPitch
    }
    
    var noteWidthPerPitch: CGFloat {
        return drawingContext.screenWidth / HorizontalScreenNoteView.PITCHES
    }
    
    /// note height is calculated by the note duration
    var noteHeight: CGFloat {
        return min(note.endBeat - drawingContext.beginBeatToDraw, note.duration) * noteHeightPerBeat
    }
    
    var noteHeightPerBeat: CGFloat {
        return drawingContext.screenHeight / CGFloat((drawingContext.endBeatToDraw - drawingContext.beginBeatToDraw))
    }

    /// position
    var positionX: CGFloat {
        return (Double(note.pitch.rawValue) - VerticalFallNoteView.MIN_PITCH) * noteWidthPerPitch
    }
    
    var positionY: CGFloat {
        let endY = drawingContext.screenHeight - (note.beginBeat - drawingContext.beginBeatToDraw) * noteHeightPerBeat
        return endY - noteHeight
    }
    
    var noteColor: Color {
        return NoteColorMap.getColor(note: note, mode: drawingParam.noteColorMode)
    }
    
    var cornerRadius: CGFloat {
        return noteWidthPerPitch / 3.0
    }
    
    let note: NoteInScore
    let drawingParam: ScoreDrawingParam
    let drawingContext: ScoreDrawingContext
    
    static let MIN_PITCH = 12.0
    static let MAX_PITCH = 108.0
    static let PITCHES = MAX_PITCH - MIN_PITCH + 1
}

