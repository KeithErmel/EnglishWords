# EnglishWords

iOS/macOS framework that contains nearly 5000 of the most commonly used words in the English language, arranged by how often they occur in everyday use.

### Installation
`EnglishWords` is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, add it as a dependency within your Package.swift manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/KeithErmel/EnglishWords", from: "0.0.1")
    ],
    ...
)
```

Then import `EnglishWords` wherever you'd like to use it:

`import EnglishWords`

For more information on how to use the Swift Package Manager, check out [this article](https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager), or [its official documentation](https://swift.org/package-manager).

### Usage
The `EnglishWords` structure provides access to the words. You only need to initialize an instance once in your app.
* With the `byOrdinalAscending` property the words in the array are arranged by how commonly they occur, ascending (where an individual word's `ordinal` value of `1` means the word occurs more often than a word whose value is greater).
* You can also obtain an array of words arranged alphabetically ascending (`a` to `z`) via the `alphabeticalDescending` property.
* There are two functions that return a randomly selected word:
  1. `randomWord()` returns a word of any length
  2. `randomWord(length: Int)` returns a word of the given length
* To get an array of words only of a specific length, use the `words(length: Int)` function.
