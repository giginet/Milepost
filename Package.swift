// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RevisionPlate",
    platforms: [.macOS(.v11),],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RevisionPlate",
            targets: ["RevisionPlate"]
        ),
        .executable(
            name: "revision-info-generator",
            targets: ["revision-info-generator"]
        ),
        .plugin(
            name: "PrepareRevisionInfo",
            targets: ["PrepareRevisionInfo"]
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
            name: "RevisionPlate"
        ),
        .plugin(
            name: "PrepareRevisionInfo",
            capability: .buildTool(),
            dependencies: ["revision-info-generator"]
        ),
        .executableTarget(
            name: "revision-info-generator",
            dependencies: [
                .target(name: "RevisionPlate"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
