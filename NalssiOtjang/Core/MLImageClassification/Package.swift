// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreMLImageClassifier",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "CoreMLImageClassifierInterface",
            targets: ["CoreMLImageClassifierInterface"]
        ),
        .library(
            name: "CoreMLImageClassifier",
            targets: ["CoreMLImageClassifier"]
        )
    ],
    targets: [
        .target(
            name: "CoreMLImageClassifierInterface",
            path: "Interface"
        ),
        .target(
            name: "CoreMLImageClassifier",
            dependencies: ["CoreMLImageClassifierInterface"],
            path: "Sources"
        )
    ]
)
