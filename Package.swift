// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "EasyDate",
    products: [
        .library(name: "EasyDate", targets: ["EasyDate"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/EasyPackages/EasyCore.git",
            .upToNextMajor(from: "0.0.1")
        )
    ],
    targets: [
        .target(name: "EasyDate", dependencies: ["EasyCore"]),
        .testTarget(
            name: "EasyDateTests",
            dependencies: ["EasyDate"]
        ),
    ]
)
