// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRouterInterface",
    products: [
        .library(
            name: "CoreRouterInterface",
            targets: ["CoreRouterInterface"]
        ),
    ],
    targets: [
        .target(
            name: "CoreRouterInterface",
            path: "Interface"
        ),

    ]
)
