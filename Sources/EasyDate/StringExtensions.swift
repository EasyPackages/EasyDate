//
// Created by Paolo Prodossimo Lopes
// Open-source utility for Date - Use freely with attribution.
//

import Foundation

public extension String {
    /// Computed property that attempts to convert the string into a `Date` object.
    ///
    /// This property tries to parse the string using a comprehensive list of date and time formats,
    /// including ISO 8601, common date/time formats, 12-hour clocks with AM/PM, month names (abbreviated and full),
    /// timezone-aware formats, regional variants, and time-only formats.
    ///
    /// The parsing uses a `DateFormatter` configured with the `en_US_POSIX` locale to ensure
    /// consistent and locale-independent date parsing behavior, especially important for fixed formats.
    ///
    /// The property iterates through the predefined list of date format patterns in order,
    /// attempting to parse the string using each pattern until one succeeds.
    ///
    /// - Note:
    ///   - This method covers many common date/time representations but might not parse every possible format.
    ///   - Parsing stops at the first successful match to improve performance.
    ///   - If no formats match, the property returns `nil`.
    ///
    /// - Returns:
    ///   A `Date` object if the string could be parsed successfully using any of the specified formats; otherwise, `nil`.
    ///
    /// - Example:
    /// ```swift
    /// let dateString = "2025-05-15T14:30:00Z"
    /// if let date = dateString.date {
    ///     print("Parsed date: \(date)")
    /// } else {
    ///     print("Could not parse date")
    /// }
    /// ```
    ///
    var date: Date? {
        let formats = [
            // ISO 8601 variations (with fractional seconds and timezone offsets)
            "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            "yyyy-MM-dd'T'HH:mm:ssXXXXX",
            "yyyy-MM-dd'T'HH:mm:ssZ",
            "yyyy-MM-dd'T'HH:mmXXXXX",
            "yyyy-MM-dd'T'HH:mmZ",
            
            // Common date and time with separators
            "yyyy-MM-dd HH:mm:ss",
            "yyyy/MM/dd HH:mm:ss",
            "yyyy.MM.dd HH:mm:ss",
            "dd-MM-yyyy HH:mm:ss",
            "dd/MM/yyyy HH:mm:ss",
            "MM/dd/yyyy HH:mm:ss",
            "dd.MM.yyyy HH:mm:ss",
            
            // Date only formats with various separators
            "yyyy-MM-dd",
            "yyyy/MM/dd",
            "yyyy.MM.dd",
            "dd-MM-yyyy",
            "dd/MM/yyyy",
            "MM/dd/yyyy",
            "dd.MM.yyyy",
            
            // 12-hour time formats with AM/PM
            "MM/dd/yyyy hh:mm a",
            "dd/MM/yyyy hh:mm a",
            "yyyy-MM-dd hh:mm a",
            "yyyy/MM/dd hh:mm a",
            "yyyy.MM.dd hh:mm a",
            "dd-MM-yyyy hh:mm a",
            "dd.MM.yyyy hh:mm a",
            
            // Formats with month names (abbreviated and full, with and without time)
            "MMM dd, yyyy",
            "dd MMM yyyy",
            "MMMM dd, yyyy",
            "dd MMMM yyyy",
            "MMM dd, yyyy hh:mm a",
            "dd MMM yyyy hh:mm a",
            "MMMM dd, yyyy hh:mm a",
            "dd MMMM yyyy hh:mm a",
            
            // Date/time with timezone abbreviations or offsets
            "yyyy-MM-dd HH:mm:ss ZZZ",
            "yyyy-MM-dd HH:mm:ss zzz",
            "yyyy-MM-dd'T'HH:mm:ss.SSS zzz",
            
            // Regional and RFC-like formats
            "EEE, dd MMM yyyy HH:mm:ss zzz",   // RFC1123 example
            "EEE MMM dd HH:mm:ss yyyy",
            "EEE, dd MMM yyyy HH:mm:ss 'GMT'",
            "yyyyMMdd'T'HHmmssZ",               // Basic ISO8601
            "yyyyMMdd",
            
            // Time-only formats
            "HH:mm:ss",
            "HH:mm",
            "hh:mm a",
            
            // Microsecond precision ISO8601 variants
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX",
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        ]
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .gmt
        
        for format in formats {
            formatter.dateFormat = format
            if let date = formatter.date(from: self) {
                return date
            }
        }
        
        return nil
    }
}
