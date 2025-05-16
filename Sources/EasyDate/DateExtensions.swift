//
// Created by Paolo Prodossimo Lopes
// Open-source utility for Date - Use freely with attribution.
//

import Foundation

///
/// Utility extensions for formatting and manipulating `Date` values in a simple and expressive way.
///
/// `EasyDate` provides convenient initializers and helpers for creating `Date` instances safely,
/// and supports transforming them into user-friendly strings for UI or reporting.
/// It also enables flexible formatting based on custom patterns or locales.
///
public extension Date {
    
    ///
    /// Initializes a `Date` from a given year, month, and day.
    ///
    /// Returns `nil` if the provided components do not form a valid date (e.g., February 31st).
    ///
    /// - Parameters:
    ///   - year: The target year
    ///   - month: The month (1...12)
    ///   - day: The day of the month
    ///
    /// - Example:
    /// ```swift
    /// if let date = Date(year: 2025, month: 12, day: 1) {
    ///     print(date.formattedAsDayMonthYear)
    /// }
    /// ```
    ///
    init?(year: Int, month: Int, day: Int, calendar: Calendar = .current, timeZone: TimeZone = .current) {
        var calendar = calendar
        calendar.timeZone = timeZone
        
        let components = DateComponents(year: year, month: month, day: day)
        
        guard let date = calendar.date(from: components),
              calendar.dateComponents([.year, .month, .day], from: date) == components else {
            return nil
        }
        
        self = date
    }
    
    ///
    /// Initializes a `Date` from a given year, month, day, hour, and minute in the current calendar's time zone.
    ///
    /// Returns `nil` if the combination of components does not form a valid date and time.
    ///
    /// - Example:
    /// ```swift
    /// if let date = Date(year: 2025, month: 12, day: 1, hour: 14, minute: 30) {
    ///     print(date.hourAndMinute)
    /// }
    /// ```
    ///
    init?(year: Int, month: Int, day: Int, hour: Int, minute: Int, calendar: Calendar = .current, timeZone: TimeZone = .current) {
        var cal = calendar
        let components = DateComponents(
            year: year, month: month, day: day,
            hour: hour, minute: minute
        )
        cal.timeZone = timeZone
        
        guard let date = cal.date(from: components),
              cal.dateComponents([.year, .month, .day, .hour, .minute], from: date) == components else {
            return nil
        }
        
        self = date
    }
    
    ///
    /// Returns the current date and time (`Date.now` or `Date()`), wrapped as a static convenience property.
    ///
    /// Uses `Date.now` on supported OS versions (iOS 15+, macOS 12+), falling back to `Date()` on earlier systems.
    ///
    /// This property offers a more expressive and readable way to access the current moment, especially in chaining or fluent interfaces.
    ///
    /// - Returns: The current system date and time.
    ///
    /// ### Example
    /// ```swift
    /// let timestamp = Date.now
    /// if timestamp.isToday { ... }
    /// ```
    @available(iOS, introduced: 1.0, obsoleted: 15.0)
    @available(macOS, introduced: 10.10, obsoleted: 12.0)
    @available(tvOS, introduced: 9.0, obsoleted: 15.0)
    @available(watchOS, introduced: 1.0, obsoleted: 8.0)
    static var now: Date {
        Date()
    }
    
    ///
    /// Indicates whether the date represents **today**, relative to the user's current calendar and time zone.
    ///
    /// Internally uses `Calendar.current.isDateInToday`.
    ///
    /// - Returns: `true` if the date is today; otherwise, `false`.
    ///
    /// ### Example
    /// ```swift
    /// if myDate.isToday {
    ///     print("This is today's date.")
    /// }
    /// ```
    ///
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    ///
    /// Indicates whether the date represents **yesterday**, relative to the user's current calendar and time zone.
    ///
    /// - Returns: `true` if the date is yesterday; otherwise, `false`.
    ///
    var isYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }
    
    ///
    /// Indicates whether the date represents **tomorrow**, relative to the user's current calendar and time zone.
    ///
    /// - Returns: `true` if the date is tomorrow; otherwise, `false`.
    ///
    var isTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }
    
    ///
    /// Indicates whether the date is in the past relative to `Date.now`.
    ///
    /// - Returns: `true` if the date is before the current moment.
    ///
    var isInPast: Bool {
        self < Date()
    }
    
    ///
    /// Indicates whether the date is in the future relative to `Date.now`.
    ///
    /// - Returns: `true` if the date is after the current moment.
    ///
    var isInFuture: Bool {
        self > Date()
    }
    
    ///
    /// Checks whether the date occurs on the **same calendar day** as another date.
    ///
    /// - Parameter other: The date to compare.
    /// - Returns: `true` if both dates fall on the same day (year, month, day).
    ///
    /// ### Example
    /// ```swift
    /// if date1.isSameDay(as: date2) {
    ///     print("These two dates are on the same day.")
    /// }
    /// ```
    ///
    func isSameDay(as other: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: other)
    }
    
    ///
    /// Checks whether the date occurs in the **same calendar month and year** as another date.
    ///
    /// - Parameter other: The date to compare.
    /// - Returns: `true` if both dates are in the same month and year.
    ///
    func isSameMonth(as other: Date) -> Bool {
        let cal = Calendar.current
        let selfComponents = cal.dateComponents([.year, .month], from: self)
        let otherComponents = cal.dateComponents([.year, .month], from: other)
        return selfComponents.year == otherComponents.year &&
        selfComponents.month == otherComponents.month
    }
    
    ///
    /// Checks whether the date occurs in the **same calendar year** as another date.
    ///
    /// - Parameter other: The date to compare.
    /// - Returns: `true` if both dates are in the same year.
    ///
    func isSameYear(as other: Date) -> Bool {
        let cal = Calendar.current
        return cal.component(.year, from: self) == cal.component(.year, from: other)
    }
    
    ///
    /// Returns the number of **full days** between the current date and another date.
    ///
    /// Partial days are not counted — the difference is calculated from midnight to midnight.
    ///
    /// - Parameter other: The date to compare.
    /// - Returns: The number of full days (positive, negative, or zero).
    ///
    /// ### Example
    /// ```swift
    /// let days = startDate.daysBetween(endDate)
    /// ```
    ///
    func daysBetween(_ other: Date) -> Int {
        let start = Calendar.current.startOfDay(for: self)
        let end = Calendar.current.startOfDay(for: other)
        return Calendar.current.dateComponents([.day], from: start, to: end).day ?? 0
    }
    
    ///
    /// Returns the number of **seconds** between the current date and another date.
    ///
    /// The result is a signed `TimeInterval`. Positive if `other` is in the future, negative if in the past.
    ///
    /// - Parameter other: The date to compare.
    /// - Returns: The time interval between `self` and `other`, in seconds.
    ///
    /// ### Example
    /// ```swift
    /// let delta = eventDate.secondsBetween(Date.now)
    /// ```
    ///
    func secondsBetween(_ other: Date) -> TimeInterval {
        other.timeIntervalSince(self)
    }
    
    ///
    /// Returns a formatted string of the current date using a provided `DateFormatter`.
    ///
    /// This function uses the given `DateFormatter` to convert the `Date` object (`self`)
    /// into a textual representation according to the format specified by the formatter.
    ///
    /// - Parameters:
    ///   - formatter: A `DateFormatter` object configured with the desired format and locale.
    ///                Responsible for converting the date into a formatted string.
    ///
    /// - Returns: A string representing the date formatted according to the provided formatter.
    ///
    /// - Example usage:
    /// ```swift
    /// print(Date.now.formatted(using: .iso8601)) // Example: "2025-05-15 14:30:00"
    /// ```
    ///
    func formatted(using formatter: DateFormatter) -> String {
        formatter.string(from: self)
    }
    
    ///
    /// Returns a formatted string representation of the date using the specified `DateFormatter`,
    /// with customizable `Locale` and `TimeZone` settings.
    ///
    /// This method allows you to format the date into a string, while optionally specifying
    /// the locale and timezone to be used by the formatter. By default, it uses the system's
    /// current locale and timezone, but you can override these parameters to format the date
    /// for different regions or time zones.
    ///
    /// - Parameters:
    ///   - formatter: A configured `DateFormatter` instance used to convert the date to a string.
    ///   - locale: The `Locale` to use for formatting the date. Defaults to `.current`.
    ///   - timeZone: The `TimeZone` to apply when formatting the date. Defaults to `.current`.
    ///
    /// - Returns: A string representing the formatted date according to the provided formatter,
    ///   locale, and timezone.
    ///
    /// - Important:
    ///   Modifying the formatter's `locale` and `timeZone` properties inside this method
    ///   affects the formatting behavior. If you reuse the formatter instance elsewhere,
    ///   be aware that its locale and timezone might have been changed.
    ///
    /// - Example:
    /// ```swift
    /// let date = Date()
    /// let formatter = DateFormatter()
    /// formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    /// let formattedDate = date.formatted(using: formatter, locale: Locale(identifier: "en_US"), timeZone: TimeZone(abbreviation: "PST")!)
    /// print(formattedDate) // e.g., "2025-05-15 07:30:00"
    /// ```
    ///
    func formatted(using formatter: DateFormatter, locale: Locale = .current, timeZone: TimeZone = .current) -> String {
        formatter.locale = locale
        formatter.timeZone = timeZone
        return formatted(using: formatter)
    }
}
