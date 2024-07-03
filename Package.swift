// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "skip-kmp-sample",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipKMPSample", type: .dynamic, targets: ["SkipKMPSample"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.9.3"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.7.0")
    ],
    targets: [
        .target(name: "SkipKMPSample", dependencies: [
            .product(name: "SkipFoundation", package: "skip-foundation"),
            "MultiPlatformLibrary"
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipKMPSampleTests", dependencies: [
            "SkipKMPSample",
            .product(name: "SkipTest", package: "skip")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .binaryTarget(name: "MultiPlatformLibrary",
            url: "https://github.com/skiptools/kmp-library-sample/releases/download/1.2.0/MultiPlatformLibrary.xcframework.zip",
            checksum: "f897a94f996fff8b75faff399a65d674479272d9927baf59cf032b9433954b83")
    ]
)
