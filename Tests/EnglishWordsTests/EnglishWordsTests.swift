import XCTest
@testable import EnglishWords

/// Validation of `EnglishWords`.
@available(iOS 14.0, macOS 11.0, *)
final class EnglishWordsTests: XCTestCase {
    private var sut: EnglishWords!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = try XCTUnwrap(EnglishWords())
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    /// Validates that `moduleName)` is accessible and returns the expected value.
    func testModuleName() throws {
        XCTAssertEqual(EnglishWords.moduleName, "EnglishWords")
    }

    /// Validates that we can successfully initialize.
    func testInit() throws {
        XCTAssertFalse(sut.byOrdinalAscending.isEmpty)
    }

    /// Validates that `randomWord()` is capable of returning a word.
    func testRandomWordSuccess() throws {
        let word = try XCTUnwrap(sut.randomWord())
        XCTAssertFalse(word.isEmpty)
    }

    /// Validates that `randomWord()` returns `nil` if the words haven't been loaded.
    func testRandomWordFailure() throws {
        let noWordsSUT = try XCTUnwrap(EnglishWords(shouldLoadWords: false))
        XCTAssertTrue(noWordsSUT.byOrdinalAscending.isEmpty)
        XCTAssertNil(noWordsSUT.randomWord())
    }

    /// Validates that `words(length:)` returns words only of the given `length`.
    func testWordsLength() throws {
        let expectedLength = 3
        let words = sut.words(length: expectedLength)
        XCTAssertFalse(words.isEmpty)
        XCTAssertGreaterThan(sut.byOrdinalAscending.count, words.count)

        for word in words {
            XCTAssertEqual(word.text.count, expectedLength)
        }
    }
}
