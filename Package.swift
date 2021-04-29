// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "XercesSwift",
    products: [
        .library(
            name: "XercesSwift",
            targets: ["ObjCXercesSwift", "XercesSwift"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ObjCXercesSwift",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../CPP/")
            ]
        ),
        .target(
            name: "XercesSwift",
            dependencies: ["ObjCXercesSwift"],
            path: "Sources/Swift"
        )
    ]
)
