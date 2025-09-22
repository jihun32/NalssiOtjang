// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecordPhotoFeature",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "RecordPhotoFeature",
            targets: ["RecordPhotoFeature"]
        )
    ],
    dependencies: [
        .package(
            name: "SharedDesignSystem",
            path: "../Shared/DesignSystem"
        ),
        .package(
            name: "CoreRouterInterface",
            path: "../Core/Router"
        )
    ],
    targets: [
        .target(
            name: "RecordPhotoFeature",
            dependencies: [
                .product(
                    name: "SharedDesignSystem",
                    package: "SharedDesignSystem"
                ),
                .product(
                    name: "CoreRouterInterface",
                    package: "CoreRouterInterface"
                ),
            ]
        )
    ]
)
