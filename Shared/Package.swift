// swift-tools-version:5.5

//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "Shared",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.17.0")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "FluentKit", package: "fluent-kit")
            ]
        ),
        .testTarget(
            name: "SharedTests",
            dependencies: ["Shared"]
        )
    ]
)
