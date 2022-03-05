# MusicScoreView

Visulize a `MusicScore` in SwiftUI.
- Horizontal Screen Mode
- Vertical Screen Mode 
- Vertical MIDI Fall Mode 

Demo App
----

Notes in Spring Sonata (Beethoven Violin Sonata No.5 Op.24 Spring movement I. Allegro)

https://user-images.githubusercontent.com/51254187/156871337-a337dbb9-bb80-4380-bfe2-cc58a10caf27.mov

### Quick Start

``` swift
struct ExampleView: View {
    
    /// replace it with a midi file url as you wish
    static let midiURL = ScoreSamples.url_spring1st
    
    /// load midi to `MusicScore` then loaded into a `ScoreViewModel`
    @ObservedObject var scoreVM = ScoreViewModel(score: MusicScore(url: midiURL)!,
                                                 param: .default_vertical_fall)

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
```

### Get the Snapshot of a MusicScore (UIImage)

``` swift
let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
let score = MusicScore(url: url)!
let scoreView = ScoreView(viewModel: ScoreViewModel(score: score, beginBeat: 0, endBeat: 64.0))
let image = scoreView.snapshot()
```

First 16 measures of Score - Johann Sebastian Bach – Prelude in C Major (Vertical Arrangement)
<img width="1403" alt="截屏2022-02-05 下午11 00 09" src="https://user-images.githubusercontent.com/51254187/152647234-db78d440-2cbf-43aa-886c-74d569513a0a.png">


First 16 measure of Score - Johann Sebastian Bach – Prelude in C Major (Horizontal Arrangement)
<img width="1404" alt="截屏2022-02-05 下午10 59 56" src="https://user-images.githubusercontent.com/51254187/152647222-c25ec33a-b740-400d-b9f8-b6b1b7707e2c.png">


First 16 measure of Score - Johann Sebastian Bach – Prelude in C Major (Vertical Fall)
<img width="1920" alt="bach_846_vertical_fall_by_pitch" src="https://user-images.githubusercontent.com/51254187/156871406-66c8f643-1943-4e8d-970e-5e3df43d8692.png">


Requirements
----

* Swift 5.0+
* iOS 14.0+

Install
----

### Swift Package Manager

``` swift
let package = Package(
  name: ...
  dependencies: [
    .package(url: "https://github.com/musical77/MusicScoreView.git")
  ],
  targets: ...
)
```

Design
---

### Vertical Arrangement of Notes

https://www.behance.net/gallery/6529923/Sheet-Music-Visualization


### Horizontal Arrangement of Notes
