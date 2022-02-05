# ScoreVisualizer

`ScoreVisualizer` supports visulize a `MusicScore`.

Demo
----

### Rendering a MusicScore 

``` swift
// pick a mid file as MusicScore input
let url = Bundle.module.url(forResource: "bach_846", withExtension: "mid")!
let score = MusicScore(url: url)!
        
// init a render with parameter
let render = ScoreImageRender(param: .default_vertical, score: score)

// rendering the whole score
let image = render.render()
        
// rendering the first 16 measures of the score
let image16 = render.render(beginMeasureIdx: 0, endMeasureIdx: 16) 
```

### Sample Rendered Image 

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
    .package(url: "https://github.com/musical77/ScoreVisualizer.git")
  ],
  targets: ...
)
```

Design
---

### Vertical Arrangement of Notes

https://www.behance.net/gallery/6529923/Sheet-Music-Visualization


### Horizontal Arrangement of Notes
