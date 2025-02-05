// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UtilityHelper",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "UtilityHelper",
            targets: ["UtilityHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apphud/ApphudSDK", "3.5.9"..<"4.0.0")
    ],
    targets: [
        .target(
            name: "UtilityHelper",
            dependencies: [
                .product(name: "ApphudSDK", package: "ApphudSDK")
            ]),
    ]
)
