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
    name: "Model",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Model",
            targets: ["Model"]
        )
    ],
    dependencies: [
        .package(path: "../../Shared")
    ],
    targets: [
        .target(
            name: "Model",
            dependencies: [
                .product(name: "Shared", package: "Shared")
            ]
        ),
        .testTarget(
            name: "ModelTests",
            dependencies: ["Model"]
        )
    ]
)
