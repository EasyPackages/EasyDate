![banner](./docs/banner.jpg)

[![Swift](https://github.com/EasyPackages/EasyDate/actions/workflows/swift.yml/badge.svg)](https://github.com/EasyPackages/EasyDate/actions/workflows/swift.yml)

**EasyDate** is a Swift package that simplifies working with dates, times, time zones, and localized formatting. It provides extensions and utilities to manipulate and format dates easily and efficiently, with support for multiple languages and international standards.

## Advantages

- **Simplicity**: Intuitive APIs for date manipulation and formatting.
- **Localization**: Comprehensive support for languages and regional standards.
- **Flexibility**: Allows creating custom formatting patterns.
- **Compatibility**: Ideal for projects requiring international support and API integration.

## Usage Examples

```swift
// Date creation
Date(year: 2025, month: 5, day: 15)
Date(year: 2025, month: 5, day: 15, calendar: .japanese, timeZone: .tokyo)

Date(year: 2025, month: 5, day: 15, hour: 12, minute: 30)
Date(year: 2025, month: 5, day: 15, hour: 12, minute: 30, calendar: .gregorian, timeZone: .gmt)
    
// String to date conversion
"2025-05-15 14:30:00".date
"2025-05-15".date
"15.05.2025".date
"2025/05/15 02:30 PM".date
...
    
// Easily compare dates
"2025-05-15 14:30:00".date?.isInPast // e.g., true
"2025-05-15 14:30:00".date?.isToday // e.g., true
"2025-05-15 14:30:00".date?.isTomorrow // e.g., false
"2025-05-15 14:30:00".date?.isYesterday // e.g., false
    
// Easily perform date operations
let secondsAfter = Date.now + .seconds(10)
let yearsBefore = Date.now - .years(3)
let monthsBefore = Date.now - .months(2)
let daysAfter = Date.now + .days(1)
...
    
// Simple and flexible formatting
"15.05.2025".date?.formatted(using: .date) // "15/05/25"
"15.05.2025".date?.formatted(using: .iso8601) // "2025-05-15T14:30:00Z"
"15.05.2025".date?.formatted(using: .longDate, locale: .enUS, timeZone: .gmt) // "May 15, 2025"
    
// Handling optional dates
"15.05.2025".date.orNow.formatted(using: .day) // "15"
```

## Installation

Add EasyDate to your Swift project using Swift Package Manager:

1. In Xcode, go to File > Add Packages.
2. Enter the repository URL: https://github.com/EasyPackages/EasyDate.
3. Choose the desired version and add the package to your project.

## Testing

EasyDate includes a comprehensive test suite to ensure the accuracy and reliability of its features. To run the tests:

```swift
swift test
```
