//
//  ContentView.swift
//  testScoreViz
//
//  Created by lively77 on 2022/2/20.
//

import SwiftUI
import MusicScore
import MusicSymbol

struct ContentView: View {
    
    @ObservedObject var vm = ScoreViewModel(score: ScoreSamples.spring1st)
    
    @State var beatAt: MusicTimeStamp = 0.0
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            ScoreView(notes: vm.notes, beginBeat: vm.beginBeat, endBeat: vm.endBeat)
            
            Text("Hello Again!")
        }.onReceive(timer) { t in
            beatAt = beatAt + 0.015
            vm.seek(beginBeat: beatAt, endBeat: beatAt + 16.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}

