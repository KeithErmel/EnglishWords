import Foundation
import os

@available(iOS 14.0, macOS 11.0, *)
public extension Logger {
    init(subsystem: LoggingProvider.Subsystem = .default, category: LoggingProvider.Category = .default) {
        self.init(subsystem: subsystem, category: category.rawValue)
    }

    init(category: String) {
        self.init(subsystem: .default, category: LoggingProvider.Category(rawValue: category))
    }
}

@available(iOS 14.0, macOS 11.0, *)
public extension OSLog {
    convenience init(subsystem: LoggingProvider.Subsystem = .default, category: LoggingProvider.Category = .default) {
        self.init(subsystem: subsystem, category: category.rawValue)
    }
}

@available(iOS 14.0, macOS 11.0, *)
public struct LoggingProvider {
    public typealias Subsystem = String

    public struct Category: Hashable, Equatable, RawRepresentable {
        public typealias RawValue = String
        public let rawValue: RawValue
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
    }

    public static func makeLog(subsystem: Subsystem = .default, category: Category = .default) -> OSLog {
        return OSLog(subsystem: subsystem, category: category)
    }
}

@available(iOS 14.0, macOS 11.0, *)
public extension LoggingProvider.Subsystem {
    static var `default` = Bundle.main.bundleIdentifier ?? ""
}

@available(iOS 14.0, macOS 11.0, *)
public extension LoggingProvider.Category {
    static let `default`: LoggingProvider.Category = .none
    static let none       = LoggingProvider.Category(rawValue: "          ")
}
