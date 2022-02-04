// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScoreVisualizer",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ScoreVisualizer",
            targets: ["ScoreVisualizer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "MusicScore", url: "https://github.com/musical77/MusicScore", from: "0.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ScoreVisualizer",
            dependencies: ["MusicScore"]),
        .testTarget(
            name: "ScoreVisualizerTests",
            dependencies: ["ScoreVisualizer"]),
    ]
)
