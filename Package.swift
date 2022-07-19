// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EnglishWords",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "EnglishWords",
            targets: ["EnglishWords"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "EnglishWords",
            dependencies: [],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "EnglishWordsTests",
            dependencies: ["EnglishWords"]),
    ]
)
