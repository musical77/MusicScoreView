//  ScoreRenderParam.swift
//  
//  Created by lively77 on 2022/2/4.

import Foundation

/// parameter for score rendering
public struct ScoreRenderParam {
    
    public static var `default` = {
        return ScoreRenderParam()
    }()
    
    public init() {}
    
    /// height for each note
    public var noteHeight = 6.0
    
    /// width for each beat
    public var noteWidthPerBeat = 32.0
    
    /// whether to draw a line between measures or not
    public var drawMeasureLine = true
}
