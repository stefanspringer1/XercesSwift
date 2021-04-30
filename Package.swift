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
        .systemLibrary(
              name: "libxerces",
              pkgConfig: "libxerces"
        ),
        .target(
            name: "ObjCXercesSwift",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../XercesHeaders/src"),
                .headerSearchPath("../XercesHeaders/src/xercesc/dom"),
                .headerSearchPath("../XercesHeaders/src/xercesc/dom/impl"),
                .headerSearchPath("../XercesHeaders/src/xercesc/framework"),
                .headerSearchPath("../XercesHeaders/src/xercesc/framework/psvi"),
                .headerSearchPath("../XercesHeaders/src/xercesc/internal"),
                .headerSearchPath("../XercesHeaders/src/xercesc/parsers"),
                .headerSearchPath("../XercesHeaders/src/xercesc/sax"),
                .headerSearchPath("../XercesHeaders/src/xercesc/sax2"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util/FileManagers"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util/MsgLoaders"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util/MutexManagers"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util/NetAccessors"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util/regx"),
                .headerSearchPath("../XercesHeaders/src/xercesc/util/Transcoders"),
                .headerSearchPath("../XercesHeaders/src/xercesc/validators"),
                .headerSearchPath("../XercesHeaders/src/xercesc/validators/common"),
                .headerSearchPath("../XercesHeaders/src/xercesc/validators/datatype"),
                .headerSearchPath("../XercesHeaders/src/xercesc/validators/DTD"),
                .headerSearchPath("../XercesHeaders/src/xercesc/validators/schema"),
                .headerSearchPath("../XercesHeaders/src/xercesc/validators/schema/identity"),
                .headerSearchPath("../XercesHeaders/src/xercesc/xinclude"),
            ]
        ),
        .target(
            name: "XercesSwift",
            dependencies: ["ObjCXercesSwift"],
            path: "Sources/Swift"
        )
    ]
)
