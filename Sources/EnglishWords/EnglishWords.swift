import Foundation
import os

/// Provides a listing of the most common words in the English language, ordered by
/// how commonly they occur (most common first).
@available(iOS 14.0, macOS 11.0, *)
public struct EnglishWords {
    /// English words, ranked by how common they occur, most common first.
    public private(set) var byOrdinalAscending = [HumanWord]()

    /// The words, sorted alphabetically ascending (a -> z).
    public var alphabeticalDescending: [HumanWord] {
        byOrdinalAscending.sorted(by: { $0.text < $1.text })
    }

    /// This module's name.
    public static var moduleName: String { "EnglishWords" }

    /// The name of the file that contains all of the words and their occurrence ordering.
    private let normalizedFilename = "words_normalized"

    private let log = Logger(category: "     words")

    // MARK: - Initialization
    /// Conditionally initializes by loading the words from a JSON file located in the bundle.
    /// - Parameter shouldLoadWords: `true` means we'll load the words from the file. Defaults is `true`.
    /// This allows testing without loading the words (e.g. `randomWord()` should return `nil`).
    public init?(shouldLoadWords: Bool = true) {
        do {
            if shouldLoadWords {
                try loadWords()
            }
        } catch {
            return nil
        }
    }

    // MARK: - API
    /// Returns a random word of any length out of the collection.
    ///
    /// `nil` is returned if `byOrdinalAscending` is empty.
    public func randomWord() -> HumanWord? {
        guard byOrdinalAscending.isEmpty == false else {
            return nil
        }

        return byOrdinalAscending.randomElement()
    }

    /// Returns a random word of the given `length` from the collection.
    /// - Parameter length: The desired word length.
    public func randomWord(length: Int) -> HumanWord? {
        words(length: length).randomElement()
    }

    /// Returns an array containing all of the words whose length equals the given `length`
    /// ordered alphabetically descending.
    /// - Parameter length: The desired word length.
    public func words(length: Int) -> [HumanWord] {
        alphabeticalDescending.filter({ $0.text.count == length })
    }

    // MARK: - Utilities
    private mutating func loadWords() throws {
        let filename = self.normalizedFilename
        guard let path = Bundle.module.path(forResource: normalizedFilename, ofType: "json") else {
            log.warning("\(filename).json file not found")
            return
        }

        guard let contents = try? String(contentsOf: URL(fileURLWithPath: path)) else {
            log.warning("Unable to load contents of \(filename).json")
            return
        }

        guard let data = contents.data(using: .utf8) else {
            log.warning("Unable to convert contents to Data")
            return
        }

        self.byOrdinalAscending = try JSONDecoder().decode([HumanWord].self, from: data)
    }
}
