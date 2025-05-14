import Foundation

///
/// A collection of reusable and localized `DateFormatter` configurations.
///
/// This extension provides preconfigured static formatters for common date and time formats,
/// including ISO 8601 for APIs, localized formats for user interfaces, and custom analytics/reporting styles.
///
/// Most formatters expose an optional `locale` parameter to allow for region-specific formatting,
/// defaulting to the current system locale (`Locale.current`).
///
public extension DateFormatter {

    ///
    /// ISO 8601 formatter with full date and time, UTC timezone, and POSIX locale.
    ///
    /// This formatter is ideal for APIs, logs, and systems that require a standardized, unambiguous format.
    ///
    /// Format: `"yyyy-MM-dd'T'HH:mm:ssXXXXX"`
    /// Example: `"2025-05-15T14:30:00Z"`
    ///
    /// - Always uses `en_US_POSIX` and UTC.
    ///
    static var iso8601: DateFormatter {
        let f = DateFormatter()
        f.calendar = Calendar(identifier: .iso8601)
        f.timeZone = TimeZone(secondsFromGMT: 0)
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return f
    }

    ///
    /// Formatter for log timestamps: `"yyyy-MM-dd HH:mm:ss"`
    ///
    /// Use this for internal logs, debug prints, and flat files.
    ///
    /// Example: `"2025-05-15 14:30:00"`
    ///
    /// - Uses `en_US_POSIX` and system timezone.
    ///
    static var logTimestamp: DateFormatter {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return f
    }

    ///
    /// Formatter for time only (e.g. `"14:30"` or `"2:30 PM"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func time(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.timeStyle = .short
        f.dateStyle = .none
        f.locale = locale
        return f
    }

    ///
    /// Formatter for date only (e.g. `"15/05/25"` or `"5/15/25"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func date(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .none
        f.locale = locale
        return f
    }

    ///
    /// Formatter for date and time (e.g. `"15/05/25 14:30"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func dateTime(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .short
        f.locale = locale
        return f
    }

    ///
    /// Formatter for full written date (e.g. `"quinta-feira, 15 de maio de 2025"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func fullDate(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .full
        f.timeStyle = .none
        f.locale = locale
        return f
    }

    ///
    /// Formatter for long written date (e.g. `"15 de maio de 2025"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func longDate(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = locale
        return f
    }

    ///
    /// Formatter for weekday name (e.g. `"quinta-feira"` or `"Thursday"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func weekday(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "EEEE"
        f.locale = locale
        return f
    }

    ///
    /// Formatter for month and year (e.g. `"maio 2025"` or `"May 2025"`), localized.
    ///
    /// - Parameter locale: The locale to use (default is `.current`).
    ///
    static func monthYear(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "LLLL yyyy"
        f.locale = locale
        return f
    }

    /// Formatter for day and month, localized for grammar, prepositions, and order.
    ///
    /// Uses the system’s localized date template resolution to apply correct formatting
    /// based on grammar rules, punctuation, and structure for each locale.
    ///
    /// - Example outputs:
    ///   - `"15 de maio"` in Portuguese
    ///   - `"15 mai"` in French
    ///   - `"May 15"` in English
    ///   - `"5月15日"` in Japanese
    ///
    /// - Parameter locale: The locale to use (default is `.current`)
    static func dayMonth(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.locale = locale
        f.setLocalizedDateFormatFromTemplate("d MMMM")
        return f
    }

    ///
    /// Formatter for year only (e.g. `"2025"`).
    ///
    /// Useful for analytics, graphs, or reports.
    ///
    static func yearOnly(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "yyyy"
        f.locale = locale
        return f
    }

    ///
    /// Formatter for numeric month only (e.g. `"01"` through `"12"`).
    ///
    /// Useful for technical parsing or sorting.
    ///
    static func monthNumber(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "MM"
        f.locale = locale
        return f
    }

    ///
    /// Formatter for numeric day of month (e.g. `"01"` through `"31"`).
    ///
    /// Useful for grids or analytics.
    ///
    static func day(locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "dd"
        f.locale = locale
        return f
    }

    ///
    /// Creates a custom formatter with a specific pattern and optional locale.
    ///
    /// - Parameters:
    ///   - pattern: The `dateFormat` string to use.
    ///   - locale: The locale to use (default is `.current`).
    ///
    /// ### Example
    /// ```swift
    /// DateFormatter.custom("MMM yyyy").string(from: Date())
    /// ```
    ///
    static func custom(_ pattern: String, locale: Locale = .current) -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = pattern
        f.locale = locale
        return f
    }
}
