// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Milepost",
    platforms: [.macOS(.v11),],
    products: [
        .library(
            name: "Milepost",
            targets: ["Milepost"]
        ),
        .plugin(
            name: "PrepareMilepost",
            targets: ["PrepareMilepost"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 .upToNextMinor(from: "1.1.4")),
    ],
    targets: [
        .target(
            name: "Milepost"
        ),
        .plugin(
            name: "PrepareMilepost",
            capability: .buildTool(),
            dependencies: ["bundle-generator"]
        ),
        .executableTarget(
            name: "bundle-generator",
            dependencies: [
                .target(name: "Milepost"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "bundle-generatorTests",
            dependencies: [
                "bundle-generator"
            ]
        )
    ]
)
