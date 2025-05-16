//
// Created by Paolo Prodossimo Lopes
// Open-source utility for Date - Use freely with attribution.
//

import Foundation

///
/// Common calendar systems provided as convenient static properties to support culturally-aware and standardized date operations.
///
/// These helpers simplify working with alternative calendar systems across regions,
/// such as ISO 8601 for business logic or the Hebrew calendar for religious applications.
///
/// ### Examples:
/// ```swift
/// let weekday = Calendar.hebrew.component(.weekday, from: Date())
/// let isWeekend = Calendar.japanese.isDateInWeekend(Date())
/// let isoCalendar = Calendar.iso8601
/// ```
///
/// Calendars that use the POSIX locale are configured explicitly for consistency across regions and platforms.
///
public extension Calendar {
    
    ///
    /// Gregorian calendar — the most widely used civil calendar internationally.
    ///
    static let gregorian = Calendar(identifier: .gregorian)
    
    ///
    /// ISO 8601 calendar — used for technical, international, and business standards.
    ///
    static let iso8601 = Calendar(identifier: .iso8601)
    
    ///
    /// Buddhist calendar — used in Thailand and other Southeast Asian countries.
    ///
    static let buddhist = Calendar(identifier: .buddhist)

    ///
    /// Hebrew calendar — used in Jewish tradition for holidays and observances.
    ///
    static let hebrew = Calendar(identifier: .hebrew)

    ///
    /// Islamic calendar — used in Muslim countries and religious contexts.
    ///
    static let islamic = Calendar(identifier: .islamic)

    ///
    /// Japanese calendar — tracks Japanese imperial eras and is used officially in Japan.
    ///
    static let japanese = Calendar(identifier: .japanese)
}
