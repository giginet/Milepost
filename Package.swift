// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Milepost",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
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
    dependencies: [],
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
