# SkipKMPSample

This is a [Skip](https://skip.dev) Swift/Kotlin library project that demonstrates 
integration with Skip transpiled classes and a Kotlin multiplatform library.
This package uses the [kmp-library-sample](https://github.com/skiptools/kmp-library-sample.git)
library in two ways:

 - `Package.swift` depends on the `MultiPlatformLibrary.xcframework` which publishes the natively compiled Objective-C framework compiled from the Kotlin (see [Kotlin/Native as an Apple framework](https://kotlinlang.org/docs/apple-framework.html))
 - `skip.yml` depends on the tagged Kotlin source for the Gradle package
 
In this way, the Swift side of the Skip project uses the published Objective-C API of the KMP library, and the transpiled Kotlin side of the Skip project depends directly on the native Kotlin.

See also:

 - https://kotlinlang.org/docs/native-ios-integration.html
 - https://kotlinlang.org/docs/native-objc-interop.html
 - https://kotlinlang.org/docs/apple-framework.html

## Building

This project is a Swift Package Manager module that uses the
[Skip](https://skip.dev) plugin to build the package for both iOS and Android.

## Testing

The module can be tested using the standard `swift test` command
or by running the test target for the macOS destination in Xcode,
which will run the Swift tests as well as the transpiled
Kotlin JUnit tests in the Robolectric Android simulation environment.

Parity testing can be performed with `skip test`,
which will output a table of the test results for both platforms.
