import XCTest
import os
@testable import EnglishWords

/// Validation of `HumanWord`.
final class HumanWordTests: XCTestCase {
    private let expectedText = "test"
    private let expectedOrdinal = 575

    /// Validates that we can successfully initialize.
    func testInit() throws {
        let sut = HumanWord(text: expectedText, ordinal: expectedOrdinal)
        XCTAssertEqual(sut.text, expectedText)
        XCTAssertEqual(sut.ordinal, expectedOrdinal)
    }

    /// Validates that `isEmpty` returns `true` when given an empty string.
    func testIsEmptyTrue() throws {
        let sut = HumanWord(text: "", ordinal: 0)
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `isEmpty` returns `false` when `text` is not an empty string.
    func testIsEmptyFalse() throws {
        let sut = HumanWord(text: expectedText, ordinal: expectedOrdinal)
        XCTAssertFalse(sut.isEmpty)
    }

    /// Validates that `isNotEmpty` returns `false` when given an empty string.
    func testIsNotEmptyFalse() throws {
        let sut = HumanWord(text: "", ordinal: 0)
        XCTAssertFalse(sut.isNotEmpty)
    }

    /// Validates that `isNotEmpty` returns `true` when `text` is not an empty string.
    func testIsNotEmptyTrue() throws {
        let sut = HumanWord(text: expectedText, ordinal: expectedOrdinal)
        XCTAssertTrue(sut.isNotEmpty)
    }

    /// Validates that `description` returns a non-empty string.
    func testDescription() throws {
        let sut = HumanWord(text: expectedText, ordinal: expectedOrdinal)
        XCTAssertFalse(sut.description.isEmpty)
    }
}
