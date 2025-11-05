// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedDesignSystem",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        .library(
            name: "SharedDesignSystem",
            targets: ["SharedDesignSystem"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.5.2")
    ],
    targets: [
        .target(
            name: "SharedDesignSystem",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
