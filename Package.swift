// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "skip-kmp-sample",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipKMPSample", targets: ["SkipKMPSample"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.8.55"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.6.12")
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
            url: "https://github.com/skiptools/kmp-library-sample/releases/download/1.1.0/MultiPlatformLibrary.xcframework.zip",
            checksum: "310016ff410211358690a463ab3215f850ddaeefe7d71ee956dc1785b44bc081")
    ]
)
