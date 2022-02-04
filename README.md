# ScoreVisualizer

[![Swift](https://github.com/musical77/ScoreVisualizer/actions/workflows/swift.yml/badge.svg?branch=main)](https://github.com/musical77/ScoreVisualizer/actions/workflows/swift.yml)

A music score library with `MusicPart`, `Measure`, `Note`, `Pitch` and `Tempo` representations in swift structs.

Support read music score from MIDI file. 

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
    .package(url: "https://github.com/musical77/ScoreVisualizer.git")
  ],
  targets: ...
)
```


Usage
----

`ScoreVisualizer` supports visulize a `MusicScore` from a midi file.

### Rendering a MusicScore 

``` swift
let score = MusicScore(url: ...)!
let render = ScoreImageRender(param: .default)
let image = render.render(score: score)
```

### Sample Image Output 

