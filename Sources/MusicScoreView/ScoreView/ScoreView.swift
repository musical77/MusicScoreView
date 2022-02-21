//  ScoreView.swift
//
//  Created by lively77 on 2022/2/20.

import Foundation
import SwiftUI
import MusicScore
import MusicSymbol

public struct ScoreView : View {
    
    let notes: [NoteInScore]
    let beginBeat: MusicTimeStamp
    let endBeat: MusicTimeStamp

    public var body : some View {
        GeometryReader { geo in
            ZStack {
                ForEach(notes, id: \.id) { note in
                    NoteView(note: note,
                             beginBeat: beginBeat,
                             endBeat: endBeat,
                             screenWidth: geo.size.width,
                             screenHeight: geo.size.height)
                }
            }
        }
    }
  
}

