//
//  ScoreViewModel.swift
//  testScoreViz
//
//  Created by lively77 on 2022/2/20.
//

import Foundation
import MusicScore
import MusicSymbol

/// score view model
public class ScoreViewModel : ObservableObject {
    
    /// notes in score to draw
    @Published public var notes: [NoteInScore] = []

    /// score drawing parameters
    @Published public var param: ScoreDrawingParam = .default_horizontal_screen
    
    /// begin beat to draw
    public var beginBeatToDraw: MusicTimeStamp = 0.0
    
    /// end beat to draw
    public var endBeatToDraw: MusicTimeStamp = 16.0
    
    public init(score: MusicScore, param: ScoreDrawingParam,
                beginBeat: MusicTimeStamp = 0.0, endBeat: MusicTimeStamp = 16.0) {
        self.score = score
        self.param = param
        self.allnotes = self.score.musicParts.flatMap { $0.notes }
        seek(beginBeat: beginBeat, endBeat: endBeat)
    }
    
    /// set the drawing interest region in [beginBeat, endBeat)
    public func seek(beginBeat: MusicTimeStamp, endBeat: MusicTimeStamp) {
        self.beginBeatToDraw = beginBeat
        self.endBeatToDraw = endBeat
        
        notes = allnotes.filter { $0.beginBeat >= beginBeat && $0.beginBeat < endBeat ||
            $0.endBeat >= beginBeat && $0.endBeat < endBeat
        }
    }
    
    private let score: MusicScore
    private var allnotes: [NoteInScore] = []
    private var beginBeatNoteIdx = 0
    private var endBeatNoteIdx = 0
}
