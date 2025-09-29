// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreCaptureSession",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        .library(
            name: "CoreCaptureSessionInterface",
            targets: ["CoreCaptureSessionInterface"]
        ),
        .library(
            name: "CoreCaptureSession",
            targets: ["CoreCaptureSession"]
        ),
    ],
    targets: [
        .target(
            name: "CoreCaptureSessionInterface",
            path: "Interface"
        ),
        .target(
            name: "CoreCaptureSession",
            dependencies: ["CoreCaptureSessionInterface"],
            path: "Sources"
        ),
    ]
)
