//  ScoreView.swift
//
//  Created by lively77 on 2022/2/20.

import Foundation
import SwiftUI
import MusicScore
import MusicSymbol

public struct ScoreView : View {
    
    public init(viewModel: ScoreViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject public var viewModel: ScoreViewModel

    public var body : some View {
        GeometryReader { geo in
            ZStack {
                ForEach(viewModel.notes, id: \.id) { note in
                    NoteView(note: note,
                             beginBeat: viewModel.beginBeat,
                             endBeat: viewModel.endBeat,
                             screenWidth: geo.size.width,
                             screenHeight: geo.size.height)
                }
            }
        }
    }
}




