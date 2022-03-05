//  ScoreRenderParam.swift
//
//  Created by lively77 on 2022/2/4.

import Foundation
import MusicSymbol

/// parameter for drawing score
public struct ScoreDrawingParam {
    
    /// whether to draw a line between measures or not
    /// TODO: implement
    public var drawMeasureLine = false
    
    /// vertical or horizontal
    public var noteArrangeMode: NoteArrangeMode = .horizontal_screen
    
    /// note color mode
    public var noteColorMode: NoteColorMode = .by_pitch

    public init() {}
}

/// note arrange mode
public enum NoteArrangeMode : Int, CaseIterable {
    case vertical_screen = 1
    case horizontal_screen = 2
    case vertical_fall = 3
}

/// note color mode, how to decide the color of this note
public enum NoteColorMode : Int, CaseIterable {
    case by_pitch = 1
    case by_key = 2
    case by_instrument = 3
}


/// default extensions
extension ScoreDrawingParam {
    
    public static var default_horizontal_screen: ScoreDrawingParam {
        var param = ScoreDrawingParam()
        param.noteArrangeMode = .horizontal_screen
        return param
    }
    
    public static var default_vertical_screen: ScoreDrawingParam {
        var param = ScoreDrawingParam()
        param.noteArrangeMode = .vertical_screen
        return param
    }
    
    public static var default_vertical_fall: ScoreDrawingParam {
        var param = ScoreDrawingParam()
        param.noteArrangeMode = .vertical_fall
        return param
    }
    
}
