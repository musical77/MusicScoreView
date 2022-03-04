//
//  ContentView.swift
//  testScoreViz
//
//  Created by lively77 on 2022/2/20.
//

import SwiftUI
import MusicScore
import MusicSymbol

struct ExampleView: View {
    
    @ObservedObject var vm = ScoreViewModel(score: ScoreSamples.spring1st)
    
    @State var beatAt: MusicTimeStamp = 0.0

    var body: some View {
        VStack {
            ScoreView(viewModel: vm)
        }.onReceive(timer) { t in
            beatAt = beatAt + 0.015
            vm.seek(beginBeat: beatAt, endBeat: beatAt + 16.0)
        }
    }
    
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()
}


struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
