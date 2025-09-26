// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureRecordPhoto",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "FeatureRecordPhoto",
            targets: ["FeatureRecordPhoto"]
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
        ),
        .package(
            name: "CoreLog",
            path: "../Core/Log"
        )
    ],
    targets: [
        .target(
            name: "FeatureRecordPhoto",
            dependencies: [
                .product(
                    name: "SharedDesignSystem",
                    package: "SharedDesignSystem"
                ),
                .product(
                    name: "CoreRouterInterface",
                    package: "CoreRouterInterface"
                ),
                .product(
                    name: "CoreLog",
                    package: "CoreLog"
                ),
            ]
        )
    ]
)
