//
//  ScoreViewModel.swift
//  testScoreViz
//
//  Created by lively77 on 2022/2/20.
//

import Foundation
import MusicScore
import MusicSymbol

public class ScoreViewModel : ObservableObject {
    
    public init(score: MusicScore) {
        self.score = score
        self.allnotes = self.score.musicParts.flatMap { $0.notes }
        seek(beginBeat: 0, endBeat: 16)
    }
    
    public func seek(beginBeat: MusicTimeStamp, endBeat: MusicTimeStamp) {
        self.beginBeat = beginBeat
        self.endBeat = endBeat
        
        notes = allnotes.filter { $0.beginBeat >= beginBeat && $0.beginBeat < endBeat ||
            $0.endBeat >= beginBeat && $0.endBeat < endBeat
        }
    }
    
    @Published var notes: [NoteInScore] = []
    @Published var beginBeat: MusicTimeStamp = 0.0
    @Published var endBeat: MusicTimeStamp = 16.0
    
    private let score: MusicScore
    private var allnotes: [NoteInScore] = []
    private var beginBeatNoteIdx = 0
    private var endBeatNoteIdx = 0
}
