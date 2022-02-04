//  ScoreRenderParam.swift
//  
//  Created by lively77 on 2022/2/4.

import Foundation

/// parameter for score rendering
public struct ScoreRenderParam {
    
    public init(noteHeight: Double = 2.0, noteWidthPerBeat: Double = 5.0) {
        self.noteHeight = noteHeight
        self.noteWidthPerBeat = noteWidthPerBeat
    }
    
    /// height for each note
    public var noteHeight = 2.0
    
    /// width for each beat
    public var noteWidthPerBeat = 5.0
}
