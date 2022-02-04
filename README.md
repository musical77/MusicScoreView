# ScoreVisualizer

[![Swift](https://github.com/musical77/ScoreVisualizer/actions/workflows/swift.yml/badge.svg?branch=main)](https://github.com/musical77/ScoreVisualizer/actions/workflows/swift.yml)

`ScoreVisualizer` supports visulize a `MusicScore`.

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

First 4 measures of Score - Beethoven Violin Sonata No.5 Op.24 Spring movement I Allegro.

<img width="527" alt="截屏2022-02-04 下午5 17 02" src="https://user-images.githubusercontent.com/51254187/152504748-5a4156b0-5736-4cb0-b5cf-1e56d3922522.png">
