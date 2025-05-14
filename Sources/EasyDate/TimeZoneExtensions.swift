import Foundation

///
/// A collection of convenience properties and utilities for working with commonly used time zones.
///
/// This extension provides a set of predefined time zones (e.g. GMT, UTC, New York, Tokyo) for easier and safer access,
/// as well as utility methods for creating fixed-offset time zones in hours or minutes.
///
/// These helpers improve readability, reduce repetitive code, and avoid common pitfalls when working with raw `TimeZone` identifiers.
///
public extension TimeZone {
    
    ///
    /// Greenwich Mean Time (GMT), representing an offset of exactly zero seconds from UTC.
    ///
    /// This is a commonly used baseline for global time calculations.
    ///
    /// - Returns: A `TimeZone` instance with a fixed offset of 0 seconds from GMT.
    ///
    static var gmt: TimeZone {
        TimeZone(secondsFromGMT: 0)!
    }
    
    ///
    /// Coordinated Universal Time (UTC), used as the global time reference.
    ///
    /// Note: On most systems, the identifier `"UTC"` resolves to a `TimeZone` with the identifier `"GMT"`.
    ///
    /// - Returns: A `TimeZone` instance representing UTC, or GMT-equivalent.
    ///
    static var utc: TimeZone {
        TimeZone(identifier: "UTC")!
    }
    
    ///
    /// Brasília Standard Time (`America/Sao_Paulo`), used in Brazil (GMT-3 or GMT-2 during DST).
    ///
    /// - Returns: A `TimeZone` for São Paulo, Brazil.
    ///
    static var saoPaulo: TimeZone {
        TimeZone(identifier: "America/Sao_Paulo")!
    }
    
    ///
    /// Eastern Time (`America/New_York`), used in New York, USA.
    ///
    /// Adjusts automatically for Daylight Saving Time (EDT/EST).
    ///
    /// - Returns: A `TimeZone` for New York City.
    ///
    static var newYork: TimeZone {
        TimeZone(identifier: "America/New_York")!
    }
    
    ///
    /// Greenwich Mean Time Zone (`Europe/London`), used in the UK.
    ///
    /// Adjusts automatically for British Summer Time (BST).
    ///
    /// - Returns: A `TimeZone` for London.
    ///
    static var london: TimeZone {
        TimeZone(identifier: "Europe/London")!
    }
    
    ///
    /// Central European Time (`Europe/Paris`), used in France.
    ///
    /// Adjusts for Central European Summer Time (CEST).
    ///
    /// - Returns: A `TimeZone` for Paris.
    ///
    static var paris: TimeZone {
        TimeZone(identifier: "Europe/Paris")!
    }
    
    ///
    /// Japan Standard Time (`Asia/Tokyo`), used in Japan.
    ///
    /// Japan does not observe Daylight Saving Time.
    ///
    /// - Returns: A `TimeZone` for Tokyo.
    ///
    static var tokyo: TimeZone {
        TimeZone(identifier: "Asia/Tokyo")!
    }
    
    ///
    /// Pacific Time (`America/Los_Angeles`), used in California, USA.
    ///
    /// Adjusts automatically for Daylight Saving Time (PDT/PST).
    ///
    /// - Returns: A `TimeZone` for Los Angeles.
    ///
    static var losAngeles: TimeZone {
        TimeZone(identifier: "America/Los_Angeles")!
    }
    
    ///
    /// Central European Time (`Europe/Berlin`), used in Germany.
    ///
    /// Adjusts for Daylight Saving Time (CEST).
    ///
    /// - Returns: A `TimeZone` for Berlin.
    ///
    static var berlin: TimeZone {
        TimeZone(identifier: "Europe/Berlin")!
    }
    
    ///
    /// Creates a fixed-offset time zone based on the number of hours from GMT.
    ///
    /// Use this when you need a static `TimeZone`, such as for logs, tests, or when displaying times independent of location.
    ///
    /// - Parameter hours: The number of hours to offset from GMT (e.g., `3` for GMT+3).
    /// - Returns: A fixed-offset `TimeZone` or `nil` if the offset is invalid (e.g., exceeds the system-supported range).
    ///
    /// - Example:
    /// ```swift
    /// let tz = TimeZone.fixed(offsetInHours: -4) // GMT-4
    /// ```
    ///
    static func fixed(offsetInHours hours: Int) -> TimeZone? {
        TimeZone(secondsFromGMT: hours * 3600)
    }
    
    ///
    /// Creates a fixed-offset time zone based on the number of minutes from GMT.
    ///
    /// Useful for precise control, such as for GMT+5:45 (Nepal) or historical/time-series use cases.
    ///
    /// - Parameter minutes: The number of minutes to offset from GMT (e.g., `90` for GMT+1:30).
    /// - Returns: A fixed-offset `TimeZone` or `nil` if the offset is unsupported by the system.
    ///
    /// - Example:
    /// ```swift
    /// let tz = TimeZone.fixed(offsetInMinutes: 330) // GMT+5:30 (India)
    /// ```
    ///
    static func fixed(offsetInMinutes minutes: Int) -> TimeZone? {
        TimeZone(secondsFromGMT: minutes * 60)
    }
}
