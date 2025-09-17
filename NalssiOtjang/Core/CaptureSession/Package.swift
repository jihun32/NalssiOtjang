// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CaptureSession",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        .library(
            name: "CaptureSessionInterface",
            targets: ["CaptureSessionInterface"]
        ),
        .library(
            name: "CaptureSessionFeature",
            targets: ["CaptureSessionFeature"]
        ),
    ],
    targets: [
        .target(
            name: "CaptureSessionInterface",
            path: "Interface"
        ),
        .target(
            name: "CaptureSessionFeature",
            dependencies: ["CaptureSessionInterface"]
        ),
    ]
)
