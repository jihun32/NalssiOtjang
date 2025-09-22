// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecordPhoto",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "RecordPhotoFeature",
            targets: ["RecordPhotoFeature"]
        )
    ],
    dependencies: [.package(
        name: "SharedDesignSystem",
        path: "../Shared/DesignSystem"
    )],
    targets: [
        .target(
            name: "RecordPhotoFeature",
            dependencies: [
                .product(name: "SharedDesignSystem", package: "SharedDesignSystem")
            ]
        )
    ]
)
