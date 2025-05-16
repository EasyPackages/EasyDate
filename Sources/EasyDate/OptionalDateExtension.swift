//
// Created by Paolo Prodossimo Lopes
// Open-source utility for Date - Use freely with attribution.
//

import Foundation

public extension Optional where Wrapped == Date {
    
    /// Returns the current date and time (`Date()`) if the optional is `nil`, or the wrapped date otherwise.
    ///
    /// This is a convenience property that simplifies working with optional `Date` values,
    /// especially in scenarios where a fallback to the current time is acceptable or desirable.
    ///
    /// It improves readability by avoiding verbose unwrapping and makes intent explicit:
    ///
    /// - If `self` contains a `Date`, it returns that date.
    /// - If `self` is `nil`, it returns `Date()`, i.e., the current moment.
    ///
    /// ### Example
    /// ```swift
    /// let expirationDate: Date? = nil
    /// let validUntil = expirationDate.orNow
    /// print(validUntil) // Prints the current date and time
    ///
    /// let createdAt: Date? = Date(timeIntervalSince1970: 0)
    /// print(createdAt.orNow) // Prints 1970-01-01 00:00:00 +0000
    /// ```
    var orNow: Date {
        return switch self {
        case .none:
            Date()
        case .some(let date):
            date
        }
    }
}
