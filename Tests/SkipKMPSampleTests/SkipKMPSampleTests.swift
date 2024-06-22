// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import XCTest
import OSLog
import Foundation
@testable import SkipKMPSample

let logger: Logger = Logger(subsystem: "SkipKMPSample", category: "Tests")

@available(macOS 13, *)
final class SkipKMPSampleTests: XCTestCase {
    func testSkipKMPSample() throws {
        XCTAssertEqual("Hello", SkipKMPSampleModule.stringFunction())
        XCTAssertEqual(135.23, SkipKMPSampleModule.performAdd())
        XCTAssertEqual(6, SkipKMPSampleModule.checkEnumClass())
    }
}
