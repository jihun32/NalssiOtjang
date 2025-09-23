// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRouter",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "CoreRouterInterface",
            targets: ["CoreRouterInterface"]
        ),
        .library(
            name: "CoreRouter",
            targets: ["CoreRouter"]
        ),
    ],
    targets: [
        .target(
            name: "CoreRouterInterface",
            path: "Interface"
        ),
        .target(
            name: "CoreRouter",
            dependencies: ["CoreRouterInterface"],
            path: "Sources"
        )
    ]
)
