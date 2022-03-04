//  ScoreRenderParam.swift
//
//  Created by lively77 on 2022/2/4.

import Foundation
import MusicSymbol

/// parameter for score rendering
public struct ScoreRenderParam {
    
    /// whether to draw a line between measures or not
    public var drawMeasureLine = true
    
    /// vertical or horizontal
    public var noteArrangeMode: NoteArrangeMode = .horizontal_screen
    
    /// note color mode
    public var noteColorMode: NoteColorMode = .by_pitch

    public init() {}
}

/// note arrange mode
public enum NoteArrangeMode : Int {
    case vertical_screen = 1
    case horizontal_screen = 2
    case vertical_fall = 3
}

/// note color mode, how to decide the color of this note
public enum NoteColorMode : Int {
    case by_pitch = 1
    case by_key = 2
    case by_instrument = 3
}


/// default extensions
extension ScoreRenderParam {
    
    public static var default_horizontal_screen: ScoreRenderParam {
        return ScoreRenderParam()
    }
    
    public static var default_vertical_screen: ScoreRenderParam {
        var param = ScoreRenderParam()
        param.noteArrangeMode = .vertical_screen
        return param
    }
    
    public static var default_vertical_fall: ScoreRenderParam {
        var param = ScoreRenderParam()
        param.noteArrangeMode = .vertical_fall
        return param
    }
    
}
