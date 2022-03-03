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
    
    /// notes for UI
    @Published public var notes: [NoteInScore] = []
    
    /// begin beat of notes in score
    @Published public var beginBeat: MusicTimeStamp = 0.0
    /// end beat of notes in score
    @Published public var endBeat: MusicTimeStamp = 16.0
    
    public init(score: MusicScore, beginBeat: MusicTimeStamp = 0.0, endBeat: MusicTimeStamp = 16.0) {
        self.score = score
        self.allnotes = self.score.musicParts.flatMap { $0.notes }
        seek(beginBeat: beginBeat, endBeat: endBeat)
    }
    
    public func seek(beginBeat: MusicTimeStamp, endBeat: MusicTimeStamp) {
        self.beginBeat = beginBeat
        self.endBeat = endBeat
        
        notes = allnotes.filter { $0.beginBeat >= beginBeat && $0.beginBeat < endBeat ||
            $0.endBeat >= beginBeat && $0.endBeat < endBeat
        }
    }
    
    private let score: MusicScore
    private var allnotes: [NoteInScore] = []
    private var beginBeatNoteIdx = 0
    private var endBeatNoteIdx = 0
}
