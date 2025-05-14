import Foundation

public extension Date {

    ///
    /// A lightweight type that represents a time-based offset to apply to a `Date`,
    /// such as adding days, months, or years.
    ///
    /// Use `DateOffset` to perform expressive and safe date arithmetic using `+` and `-` operators with `Date`.
    ///
    /// For example:
    ///
    /// ```swift
    /// let future = Date.now + .days(3)
    /// let past = Date.now - .months(1)
    /// ```
    ///
    /// The offset is internally applied using `Calendar.current.date(byAdding:value:to:)`,
    /// which accounts for leap years, daylight saving time, and calendar-specific rules.
    ///
    struct DateOffset {
        ///
        /// The calendar component that should be applied (e.g. `.day`, `.month`).
        ///
        let component: Calendar.Component

        ///
        /// The numeric value to apply (positive or negative).
        ///
        let value: Int

        ///
        /// Creates a new `DateOffset` with a number of years.
        ///
        /// - Parameter value: The number of years to add or subtract.
        /// - Returns: A `DateOffset` representing the year offset.
        ///
        /// ### Example
        /// ```swift
        /// let offset = DateOffset.years(2) // +2 years
        /// let newDate = someDate + offset
        /// ```
        ///
        public static func years(_ value: Int) -> DateOffset {
            DateOffset(component: .year, value: value)
        }

        ///
        /// Creates a new `DateOffset` with a number of months.
        ///
        public static func months(_ value: Int) -> DateOffset {
            DateOffset(component: .month, value: value)
        }

        ///
        /// Creates a new `DateOffset` with a number of days.
        ///
        public static func days(_ value: Int) -> DateOffset {
            DateOffset(component: .day, value: value)
        }

        ///
        /// Creates a new `DateOffset` with a number of hours.
        ///
        public static func hours(_ value: Int) -> DateOffset {
            DateOffset(component: .hour, value: value)
        }

        ///
        /// Creates a new `DateOffset` with a number of minutes.
        ///
        public static func minutes(_ value: Int) -> DateOffset {
            DateOffset(component: .minute, value: value)
        }

        ///
        /// Creates a new `DateOffset` with a number of seconds.
        ///
        public static func seconds(_ value: Int) -> DateOffset {
            DateOffset(component: .second, value: value)
        }
    }

    ///
    /// Adds a `DateOffset` to a `Date`, returning a new date adjusted by the given component and value.
    ///
    /// - Parameters:
    ///   - lhs: The base `Date`.
    ///   - rhs: The `DateOffset` to add.
    /// - Returns: A new `Date` adjusted by the specified offset, or `nil` if the result is invalid.
    ///
    /// ### Example
    /// ```swift
    /// let newDate = Date.now + .days(10)
    /// ```
    ///
    static func + (lhs: Date, rhs: DateOffset) -> Date? {
        Calendar.current.date(byAdding: rhs.component, value: rhs.value, to: lhs)
    }

    ///
    /// Subtracts a `DateOffset` from a `Date`, returning a new date adjusted negatively by the component and value.
    ///
    /// - Parameters:
    ///   - lhs: The base `Date`.
    ///   - rhs: The `DateOffset` to subtract.
    /// - Returns: A new `Date` adjusted by the negative offset, or `nil` if the result is invalid.
    ///
    /// ### Example
    /// ```swift
    /// let pastDate = Date.now - .months(2)
    /// ```
    ///
    static func - (lhs: Date, rhs: DateOffset) -> Date? {
        Calendar.current.date(byAdding: rhs.component, value: -rhs.value, to: lhs)
    }
}
