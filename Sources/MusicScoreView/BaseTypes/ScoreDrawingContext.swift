//  ScoreDrawingContext.swift
//  
//  Created by lively77 on 2022/3/4.

import Foundation
import MusicSymbol

/// drawing context 
public struct ScoreDrawingContext {
 
    /// begin beat to draw notes
    let beginBeatToDraw: MusicTimeStamp
    
    /// end beat to draw notes
    let endBeatToDraw: MusicTimeStamp
    
    /// current drawing screen width
    let screenWidth: CGFloat
    
    /// current drawing screen height
    let screenHeight: CGFloat

    public init(beginBeatToDraw: MusicTimeStamp, endBeatToDraw: MusicTimeStamp,
                screenWidth: CGFloat, screenHeight: CGFloat) {
        self.beginBeatToDraw = beginBeatToDraw
        self.endBeatToDraw = endBeatToDraw
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
    }
    
}
