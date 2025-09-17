// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecordPhoto",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "RecordPhotoInterface",
            targets: ["RecordPhotoInterface"]
        ),
        .library(
            name: "RecordPhotoFeature",
            targets: ["RecordPhotoFeature"]
        ),
    ],
    targets: [
        .target(
            name: "RecordPhotoInterface",
            path: "Interface"
        ),
        .target(
            name: "RecordPhotoFeature",
            dependencies: ["RecordPhotoInterface"]
        ),

    ]
)
