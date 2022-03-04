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
                beginBeat: MusicTimeStamp, endBeat: MusicTimeStamp,
                screenWidth: CGFloat, screenHeight: CGFloat) {
        self.note = note
        self.beginBeat = beginBeat
        self.endBeat = endBeat
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        
        self.noteHeight = screenHeight / HorizontalScreenNoteView.PITCHES
        self.noteWidthPerBeat = screenWidth / (self.endBeat - self.beginBeat)
        self.cornerRadius = noteHeight / 3.0
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
        return (note.beginBeat - beginBeat) * noteWidthPerBeat
    }
    
    var positionY: CGFloat {
        return screenHeight - CGFloat(note.pitch.rawValue) * noteHeight
    }
    
    let cornerRadius: CGFloat!
    let noteWidthPerBeat: CGFloat!
    let noteHeight: CGFloat!
    
    let note: NoteInScore
    let beginBeat: MusicTimeStamp
    let endBeat: MusicTimeStamp
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    static let MIN_PITCH = 12.0
    static let MAX_PITCH = 108.0
    static let PITCHES = MAX_PITCH - MIN_PITCH + 1
}

