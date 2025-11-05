// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DomainClothes",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "DomainClothesInterface",
            targets: ["DomainClothesInterface"]
        ),
        .library(
            name: "DomainClothes",
            targets: ["DomainClothes"]
        )
    ],
    targets: [
        .target(
            name: "DomainClothesInterface",
            path: "Interface"
        ),
        .target(
            name: "DomainClothes",
            dependencies: ["DomainClothesInterface"],
            path: "Sources"
        )
    ]
)
