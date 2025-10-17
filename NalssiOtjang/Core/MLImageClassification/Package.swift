// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreMLImageClassifier",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "CoreMLImageClassifier",
            targets: ["CoreMLImageClassifier"]
        ),
    ],
    dependencies: [
        .package(
            name: "DomainClothesInterface",
            path: "../Domain/Clothes"
        )
    ],
    targets: [
        .target(
            name: "CoreMLImageClassifier",
            dependencies: [
                .product(
                    name: "DomainClothesInterface",
                    package: "DomainClothesInterface"
                )
            ]
        )
    ]
)
