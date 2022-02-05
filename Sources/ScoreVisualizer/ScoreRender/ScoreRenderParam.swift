//  ScoreRenderParam.swift
//  
//  Created by lively77 on 2022/2/4.

import Foundation

/// draw mode
public enum NoteMode : Int {
    case vertical = 1
    case horizontal = 2
}

/// parameter for score rendering
public struct ScoreRenderParam {
    
    public static var default_horizontal: ScoreRenderParam {
        return ScoreRenderParam()
    }
    
    public static var default_vertical: ScoreRenderParam {
        var param = ScoreRenderParam()
        param.noteMode = .vertical
        return param
    }
    
    public init() {}
    
    /// height for each note
    public var noteHeight = 6.0
    
    /// width for each beat
    public var noteWidthPerBeat = 32.0
    
    /// whether to draw a line between measures or not
    public var drawMeasureLine = true
    
    /// measure line width
    public var measureLineWidth = 2.0
    
    /// vertical or horizontal
    public var noteMode: NoteMode = .horizontal
}
