// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DomainClassificationClothesInterface",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "DomainClassificationClothesInterface",
            targets: ["DomainClassificationClothesInterface"]
        ),
        .library(
            name: "DomainClassificationClothes",
            targets: ["DomainClassificationClothes"]
        )
    ],
    targets: [
        .target(
            name: "DomainClassificationClothesInterface",
            path: "Interface"
        ),
        .target(
            name: "DomainClassificationClothes",
            path: "Sources"
        )
    ]
)
