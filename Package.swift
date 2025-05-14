// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "EasyDate",
    products: [
        .library(name: "EasyDate", targets: ["EasyDate"]),
    ],
    targets: [
        .target(name: "EasyDate"),
        .testTarget(
            name: "EasyDateTests",
            dependencies: ["EasyDate"]
        ),
    ]
)
