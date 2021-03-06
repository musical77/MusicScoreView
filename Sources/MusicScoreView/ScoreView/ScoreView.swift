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
                let drawingContext = ScoreDrawingContext(beginBeatToDraw: viewModel.beginBeatToDraw,
                                                         endBeatToDraw: viewModel.endBeatToDraw,
                                                         screenWidth: geo.size.width,
                                                         screenHeight: geo.size.height)
                
                ForEach(viewModel.notes, id: \.id) { note in
                    
                    if viewModel.param.noteArrangeMode == .horizontal_screen {
                        HorizontalScreenNoteView(note: note,
                                                 param: viewModel.param,
                                                 context: drawingContext)
                    }
                    
                    if viewModel.param.noteArrangeMode == .vertical_screen {
                        VerticalScreenNoteView(note: note,
                                               param: viewModel.param,
                                               context: drawingContext)
                    }
                    
                    if viewModel.param.noteArrangeMode == .vertical_fall {
                        VerticalFallNoteView(note: note,
                                             param: viewModel.param,
                                             context: drawingContext)
                    }
                }
            }.clipped()
        }
    }
}




