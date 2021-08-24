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
    name: "WebService",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(name: "WebService", targets: ["WebService"])
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.5.0")),
        .package(path: "../Shared")
    ],
    targets: [
        .executableTarget(
            name: "WebService",
            dependencies: [
                .target(name: "ExampleWebService")
            ]
        ),
        .target(
            name: "ExampleWebService",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniREST", package: "Apodini"),
                .product(name: "ApodiniOpenAPI", package: "Apodini"),
                .product(name: "ApodiniDatabase", package: "Apodini"),
                .product(name: "Shared", package: "Shared")
            ]
        ),
        .testTarget(
            name: "ExampleWebServiceTests",
            dependencies: [
                //.product(name: "XCTApodini", package: "Apodini"),
                //.product(name: "XCTApodiniDatabase", package: "Apodini"),
                .target(name: "ExampleWebService")
            ]
        )
    ]
)
