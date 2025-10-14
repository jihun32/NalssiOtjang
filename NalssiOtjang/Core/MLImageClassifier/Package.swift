// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLImageClassifier",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "MLImageClassifier",
            targets: ["MLImageClassifier"]
        ),
    ],
    targets: [
        .target(
            name: "MLImageClassifier",
            dependencies: [
                .product(
                    name: "DomainClassificationClothesInterface",
                    package: "DomainClassificationClothesInterface"
                ),
            ],
            path: "Sources"
        ),

    ]
)
