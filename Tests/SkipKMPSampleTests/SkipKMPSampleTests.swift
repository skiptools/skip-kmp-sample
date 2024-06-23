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

    func testSkipKMPErrors() throws {
        XCTAssertEqual(1, try SkipKMPSampleModule.checkDiceRoller(diceCount: 1, sideCount: 6).count)

        // test that errors work as expected
        do {
            _ = try SkipKMPSampleModule.checkDiceRoller(diceCount: 1, sideCount: 1)
        } catch {
            var desc = error.localizedDescription
            
            // the prefix in Skip-translated Java exceptions
            let prefix = "skip.lib.ErrorException: java.lang.IllegalArgumentException: "
            if desc.hasPrefix(prefix) {
                desc = desc.dropFirst(prefix.count).description
            }

            XCTAssertEqual("Dice must have at least 3 sides (tried to roll 1-sided dice)", desc)
        }
    }

    func testSkipKMPAsync() async throws {
        let value = try await SkipKMPSampleModule.checkAsync(duration: Int64(1), value: "suspended")
        XCTAssertEqual("suspended", value)
    }
}
