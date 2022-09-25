// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Milepost",
    platforms: [
        .iOS(.v11),
        .macOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4),
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
