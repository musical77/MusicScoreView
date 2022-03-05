//
//  ContentView.swift
//  testScoreViz
//
//  Created by lively77 on 2022/2/20.
//

import SwiftUI
import MusicScore
import MusicSymbol
import MusicScoreView

struct ExampleView: View {
    
    /// replace it with a midi file url as you wish
    static let midiURL = ScoreSamples.url_spring1st
    
    /// load midi to `MusicScore` then loaded into a `ScoreViewModel`
    @ObservedObject var scoreVM = ScoreViewModel(score: MusicScore(url: midiURL)!,
                                                 param: .default_vertical_fall)

    var body: some View {
        HStack {
            VStack {
                ScoreView(viewModel: scoreVM)
                Rectangle().foregroundColor(.red).frame(height: 1)
                Spacer()
            }
            Rectangle().foregroundColor(.red).frame(width: 1)
            
            Spacer()
            
            VStack {
                Button(action: {
                    isPlaying.toggle()
                }) {
                    Text(isPlaying ? "Pause" : "Play")
                }
                Button(action: {scoreVM.param.noteArrangeMode = .horizontal_screen}) {
                    Text("Horizontal Screen")
                }
                Button(action: {scoreVM.param.noteArrangeMode = .vertical_fall}) {
                    Text("Vertical Fall")
                }
            }
        }.onReceive(timer) { t in
            if isPlaying {
                beginBeat = beginBeat + 0.015
                scoreVM.seek(beginBeat: beginBeat, endBeat: beginBeat + 16.0)
            }
        }
    }
    
    /// change begin beat periodically
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()
    
    @State var beginBeat: MusicTimeStamp = 0.0
    @State var isPlaying: Bool = true
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

