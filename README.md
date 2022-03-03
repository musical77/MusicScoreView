# MusicScoreView

`MusicScoreView` supports visulize a `MusicScore` in SwiftUI.

Demo
----

### MusicScoreView Demo

``` swift
struct ContentView: View {
    
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
```

### Demo Result 

### Get UIImage Snapshot

``` swift
let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
let score = MusicScore(url: url)!
let scoreView = ScoreView(viewModel: ScoreViewModel(score: score, beginBeat: 0, endBeat: 16.0))
let image = scoreView.snapshot()
```

First 4 measures of Score - Beethoven Violin Sonata No.5 Op.24 Spring movement I Allegro. (Horizontal Arrangement)

<img width="527" alt="截屏2022-02-04 下午5 17 02" src="https://user-images.githubusercontent.com/51254187/152504748-5a4156b0-5736-4cb0-b5cf-1e56d3922522.png">

First 16 measures of Score - Johann Sebastian Bach – Prelude in C Major (Vertical Arrangement)
<img width="1403" alt="截屏2022-02-05 下午11 00 09" src="https://user-images.githubusercontent.com/51254187/152647234-db78d440-2cbf-43aa-886c-74d569513a0a.png">


First 16 measure of Score - Johann Sebastian Bach – Prelude in C Major (Horizontal Arrangement)
<img width="1404" alt="截屏2022-02-05 下午10 59 56" src="https://user-images.githubusercontent.com/51254187/152647222-c25ec33a-b740-400d-b9f8-b6b1b7707e2c.png">

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
