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
    @Published public var param: ScoreDrawingParam
    
    /// begin beat to draw
    public var beginBeatToDraw: MusicTimeStamp = 0.0
    
    /// end beat to draw, by default draw the first 48 beats of the score
    /// note: when (endBeat - beginBeat) is too large, the final output view could be empty, because there is no space for each note to draw.
    public var endBeatToDraw: MusicTimeStamp = 48
    
    public init(score: MusicScore,
                param: ScoreDrawingParam,
                beginBeat: MusicTimeStamp = 0.0,
                endBeat: MusicTimeStamp = 48.0) {
        self.score = score
        self.param = param
        self.allnotes = self.score.musicParts.flatMap { $0.notes }
        self.beginBeatToDraw = beginBeat
        self.endBeatToDraw = endBeat
        seek(beginBeat: beginBeatToDraw, endBeat: endBeatToDraw)
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
