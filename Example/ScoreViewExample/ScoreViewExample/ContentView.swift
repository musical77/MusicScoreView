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
    @ObservedObject var scoreVM = ScoreViewModel(score: MusicScore(url: midiURL)!)

    var body: some View {
        VStack {
            ScoreView(viewModel: scoreVM)
        }.onReceive(timer) { t in
            beginBeat = beginBeat + 0.015
            scoreVM.seek(beginBeat: beginBeat, endBeat: beginBeat + 16.0)
        }
    }
    
    /// change begin beat periodically
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()
    
    @State var beginBeat: MusicTimeStamp = 0.0
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

