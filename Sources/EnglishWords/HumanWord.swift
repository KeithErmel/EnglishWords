import Foundation

/// Represents a word in a human language.
public struct HumanWord: Hashable, Codable, CustomStringConvertible {
    /// The word's contents.
    public let text: String

    /// Represents how common the word is in the native language; lower
    /// numbers have a higher ranking (i.e. a word with an `ordinal` value
    /// of  `1` means it occurs more often than a word with a value of `2`
    /// or `5` or `4793`).
    public let ordinal: Int

    // MARK: - CustomStringConvertible
    public var description: String {
        "\(text): \(ordinal)"
    }
}

extension HumanWord {
    /// Returns `true` if this word's `text` is empty; `false` otherwise.
    public var isEmpty: Bool {
        text.isEmpty
    }

    /// Returns `true` if this word's `text` is **NOT** empty; `false` otherwise.
    public var isNotEmpty: Bool {
        self.isEmpty == false
    }
}
