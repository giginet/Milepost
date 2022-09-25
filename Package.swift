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
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 .upToNextMinor(from: "1.1.4")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
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
    ]
)
