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
        .package(url: "https://source.skip.tools/skip.git", from: "0.8.52"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.0.0")
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
        .binaryTarget(name: "MultiPlatformLibrary", url: "https://github.com/skiptools/kmp-library-sample/releases/download/0.1.3/MultiPlatformLibrary.xcframework.zip", checksum: "243befae81053e097c78ab177ebad9c15c1b49f66486dd4dad6cab4dd61ed88c")
    ]
)
