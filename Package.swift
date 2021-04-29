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
                .headerSearchPath("../CPP/src"),
                .headerSearchPath("../CPP/src/xercesc/dom"),
                .headerSearchPath("../CPP/src/xercesc/dom/impl"),
                .headerSearchPath("../CPP/src/xercesc/framework"),
                .headerSearchPath("../CPP/src/xercesc/framework/psvi"),
                .headerSearchPath("../CPP/src/xercesc/internal"),
                .headerSearchPath("../CPP/src/xercesc/parsers"),
                .headerSearchPath("../CPP/src/xercesc/sax"),
                .headerSearchPath("../CPP/src/xercesc/sax2"),
                .headerSearchPath("../CPP/src/xercesc/util"),
                .headerSearchPath("../CPP/src/xercesc/util/FileManagers"),
                .headerSearchPath("../CPP/src/xercesc/util/MsgLoaders"),
                .headerSearchPath("../CPP/src/xercesc/util/MutexManagers"),
                .headerSearchPath("../CPP/src/xercesc/util/NetAccessors"),
                .headerSearchPath("../CPP/src/xercesc/util/regx"),
                .headerSearchPath("../CPP/src/xercesc/util/Transcoders"),
                .headerSearchPath("../CPP/src/xercesc/validators"),
                .headerSearchPath("../CPP/src/xercesc/validators/common"),
                .headerSearchPath("../CPP/src/xercesc/validators/datatype"),
                .headerSearchPath("../CPP/src/xercesc/validators/DTD"),
                .headerSearchPath("../CPP/src/xercesc/validators/schema"),
                .headerSearchPath("../CPPsrc/xercesc/validators/schema/identity"),
                .headerSearchPath("../CPPsrc/xercesc/xinclude"),
            ]
        ),
        .target(
            name: "XercesSwift",
            dependencies: ["ObjCXercesSwift"],
            path: "Sources/Swift"
        )
    ]
)
