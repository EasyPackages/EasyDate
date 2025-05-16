import Testing
import Foundation

@testable import EasyDate

@Suite("Date")
struct DateExtensionsTests {
    
    @Suite("Date(year:month:day:)")
    struct YearMonthDay {
        
        @Test("Valid date: 2025-12-01")
        func validSimpleDate() {
            let expected = makeDate(year: 2025, month: 12, day: 1)
            let sut = Date(year: 2025, month: 12, day: 1)
            #expect(sut == expected)
        }
        
        @Test("Valid date: 2000-01-01")
        func validY2K() {
            let expected = makeDate(year: 2000, month: 1, day: 1)
            let sut = Date(year: 2000, month: 1, day: 1)
            #expect(sut == expected)
        }
        
        @Test("Valid date: 1999-07-04")
        func validAmericanIndependence() {
            let expected = makeDate(year: 1999, month: 7, day: 4)
            let sut = Date(year: 1999, month: 7, day: 4)
            #expect(sut == expected)
        }
        
        @Test("Valid leap year date: 2024-02-29")
        func validLeapYear() {
            let expected = makeDate(year: 2024, month: 2, day: 29)
            let sut = Date(year: 2024, month: 2, day: 29)
            #expect(sut == expected)
        }
    }
    
    @Suite("Date(year:month:day:hour:minute)")
    struct HourMinute {
        
        @Test("Valid date with time: 2025-12-01 14:30")
        func validDateWithTime() {
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 14, minute: 30)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 14, minute: 30)
            #expect(sut == expected)
        }
        
        @Test("Valid early morning: 2025-12-01 06:00")
        func validEarlyMorning() {
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 6, minute: 0)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 6, minute: 0)
            #expect(sut == expected)
        }
        
        @Test("Valid midnight: 2025-12-01 00:00")
        func validMidnight() {
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 0, minute: 0)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 0, minute: 0)
            #expect(sut == expected)
        }
    }
    
    @Suite("Date(year:month:day:hour:minute:timezone)")
    struct WithTimeZone {
        
        @Test("Valid date with GMT")
        func validDateWithTimezone() {
            let tz = TimeZone.gmt
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 10, minute: 0, timeZone: tz)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 10, minute: 0, timeZone: tz)
            #expect(sut == expected)
        }
        
        @Test("Valid Sao Paulo: 2025-12-01 10:00")
        func validSaoPaulo() {
            let tz = TimeZone.saoPaulo
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 10, minute: 0, timeZone: tz)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 10, minute: 0, timeZone: tz)
            #expect(sut == expected)
        }
        
        @Test("Zero offset timezone")
        func zeroOffsetTimezone() {
            let tz = TimeZone.fixed(offsetInHours: 0)!
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 0, minute: 0, timeZone: tz)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 0, minute: 0, timeZone: tz)
            #expect(sut == expected)
        }
        
        @Test("Extreme timezone offset: +14:00")
        func maxPositiveOffsetTimezone() {
            let tz = TimeZone.fixed(offsetInHours: 14)!
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 23, minute: 59, timeZone: tz)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 23, minute: 59, timeZone: tz)
            #expect(sut == expected)
        }
        
        @Test("Extreme timezone offset: -12:00")
        func maxNegativeOffsetTimezone() {
            let tz = TimeZone.fixed(offsetInHours: -12)!
            let expected = makeDate(year: 2025, month: 12, day: 1, hour: 0, minute: 0, timeZone: tz)
            let sut = Date(year: 2025, month: 12, day: 1, hour: 0, minute: 0, timeZone: tz)
            #expect(sut == expected)
        }
    }
    
    @Suite("Date(year:month:day:) - invalid calendar adjustments")
    struct CalendarAdjustment {
        
        @Test("Invalid month (13) adjusts date")
        func invalidMonth() {
            let sut = Date(year: 2025, month: 13, day: 1)
            #expect(sut == nil)
        }
        
        @Test("Day 0 adjusts to previous month")
        func zeroDay() {
            let sut = Date(year: 2025, month: 12, day: 0)
            #expect(sut == nil)
        }
        
        @Test("February 31 adjusts to March")
        func februaryOverflow() {
            let sut = Date(year: 2025, month: 2, day: 31)
            #expect(sut == nil)
        }
        
        @Test("Hour greater than 23 adjusts to next day")
        func hourTooHigh() {
            let sut = Date(year: 2025, month: 12, day: 1, hour: 24, minute: 0)
            #expect(sut == nil)
        }
        
        @Test("Negative hour adjusts to previous day")
        func hourTooLow() {
            let sut = Date(year: 2025, month: 12, day: 1, hour: -1, minute: 0)
            #expect(sut == nil)
        }
        
        @Test("Minute greater than 59 adjusts to next hour")
        func minuteTooHigh() {
            let sut = Date(year: 2025, month: 12, day: 1, hour: 10, minute: 60)
            #expect(sut == nil)
        }
        
        @Test("Negative minute adjusts to previous hour")
        func minuteTooLow() {
            let sut = Date(year: 2025, month: 12, day: 1, hour: 10, minute: -5)
            #expect(sut == nil)
        }
    }
    
    @Suite("Date(year:month:day:) - invalid inputs")
    struct InvalidInputs {
        
        @Test("Month less than 1")
        func monthTooLow() {
            let sut = Date(year: 2025, month: 0, day: 15)
            #expect(sut == nil)
        }
        
        @Test("Month greater than 12")
        func monthTooHigh() {
            let sut = Date(year: 2025, month: 15, day: 10)
            #expect(sut == nil)
        }
        
        @Test("Day less than 1")
        func dayTooLow() {
            let sut = Date(year: 2025, month: 5, day: 0)
            #expect(sut == nil)
        }
        
        @Test("Day greater than 31")
        func dayTooHigh() {
            let sut = Date(year: 2025, month: 1, day: 32)
            #expect(sut == nil)
        }
        
        @Test("Invalid leap year date")
        func february29OnNonLeapYear() {
            let sut = Date(year: 2023, month: 2, day: 29)
            #expect(sut == nil)
        }
        
        @Test("Negative year")
        func negativeYear() {
            let sut = Date(year: -44, month: 3, day: 15)
            #expect(sut == nil)
        }
        
        @Test("Month = 0 returns nil (invalid component)")
        func invalidMonthZero() {
            let tz = TimeZone.gmt
            let sut = Date(year: 2025, month: 0, day: 10, hour: 10, minute: 0, timeZone: tz)
            #expect(sut == nil)
        }
        
        @Test("Hour = -1 returns nil (invalid component)")
        func invalidNegativeHour() {
            let tz = TimeZone.gmt
            let sut = Date(year: 2025, month: 12, day: 10, hour: -1, minute: 0, timeZone: tz)
            #expect(sut == nil)
        }
        
        @Test("Minute = 60 returns nil (adjusts forward)")
        func minuteOverflow() {
            let tz = TimeZone.gmt
            let sut = Date(year: 2025, month: 12, day: 10, hour: 10, minute: 60, timeZone: tz)
            #expect(sut == nil)
        }
        
        @Test("Hour = 24 returns nil (adjusts forward)")
        func hourOverflow() {
            let tz = TimeZone.gmt
            let sut = Date(year: 2025, month: 12, day: 10, hour: 24, minute: 0, timeZone: tz)
            #expect(sut == nil)
        }
        
        @Test("Negative year returns nil")
        func invalidNegativeYear() {
            let tz = TimeZone.gmt
            let sut = Date(year: -500, month: 1, day: 1, hour: 10, minute: 0, timeZone: tz)
            #expect(sut == nil)
        }
    }
    
    @Suite("Date - Comparison Helpers")
    struct DateComparisonHelpersTests {
        
        @available(iOS, introduced: 1.0, obsoleted: 15.0)
        @available(tvOS, introduced: 9.0, obsoleted: 15.0)
        @available(watchOS, introduced: 1.0, obsoleted: 8.0)
        @Test("Date.now returns a recent date")
        func nowReturnsRecentDate() {
            let now = Date.now
            let systemNow = Date()
            #expect(abs(now.timeIntervalSince(systemNow)) < 1)
        }

        @Test("isToday should return true for current date")
        func isTodayTrue() {
            let today = Date()
            #expect(today.isToday)
        }

        @Test("isYesterday should return true for yesterday")
        func isYesterdayTrue() {
            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            #expect(yesterday.isYesterday)
        }

        @Test("isTomorrow should return true for tomorrow")
        func isTomorrowTrue() {
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            #expect(tomorrow.isTomorrow)
        }

        @Test("isInPast should return true for a date in the past")
        func isInPastTrue() {
            let past = Date(timeIntervalSinceNow: -3600)
            #expect(past.isInPast)
        }

        @Test("isInFuture should return true for a date in the future")
        func isInFutureTrue() {
            let future = Date(timeIntervalSinceNow: 3600)
            #expect(future.isInFuture)
        }

        @Test("isSameDay returns true for same day")
        func isSameDayTrue() {
            let now = Date()
            let copy = now.addingTimeInterval(60 * 60) // same day, different time
            #expect(now.isSameDay(as: copy))
        }

        @Test("isSameDay returns false for different days")
        func isSameDayFalse() {
            let today = Date()
            let other = Calendar.current.date(byAdding: .day, value: -1, to: today)!
            #expect(!today.isSameDay(as: other))
        }

        @Test("isSameMonth returns true for same month and year")
        func isSameMonthTrue() {
            let date1 = Date(year: 2025, month: 5, day: 10)!
            let date2 = Date(year: 2025, month: 5, day: 28)!
            #expect(date1.isSameMonth(as: date2))
        }

        @Test("isSameMonth returns false for different months")
        func isSameMonthFalse() {
            let date1 = Date(year: 2025, month: 5, day: 10)!
            let date2 = Date(year: 2025, month: 6, day: 1)!
            #expect(!date1.isSameMonth(as: date2))
        }

        @Test("isSameYear returns true for same year")
        func isSameYearTrue() {
            let date1 = Date(year: 2025, month: 5, day: 10)!
            let date2 = Date(year: 2025, month: 12, day: 31)!
            #expect(date1.isSameYear(as: date2))
        }

        @Test("isSameYear returns false for different years")
        func isSameYearFalse() {
            let date1 = Date(year: 2025, month: 5, day: 10)!
            let date2 = Date(year: 2024, month: 5, day: 10)!
            #expect(!date1.isSameYear(as: date2))
        }

        @Test("daysBetween returns correct number of days")
        func daysBetweenReturnsValue() {
            let start = Date(year: 2025, month: 5, day: 1)!
            let end = Date(year: 2025, month: 5, day: 10)!
            #expect(start.daysBetween(end) == 9)
        }

        @Test("secondsBetween returns correct interval")
        func secondsBetweenReturnsValue() {
            let start = Date()
            let end = start.addingTimeInterval(120)
            #expect(start.secondsBetween(end) == 120)
        }
    }
    
    @Suite(".formatted(using:)")
    struct DateFormattedUsingTests {

        private let testDate = makeDate(
            year: 2025,
            month: 5,
            day: 15,
            hour: 14,
            minute: 30,
            timeZone: TimeZone.gmt
        )!

        func sut(using formatter: DateFormatter) -> String {
            testDate.formatted(using: formatter, locale: .enUS, timeZone: .gmt)
        }

        @Test("iso8601")
        func iso8601() {
            #expect(sut(using: .iso8601) == "2025-05-15T14:30:00Z")
        }
        
        @Test("iso8601")
        func iso8601WithLocale() {
            #expect(testDate.formatted(using: .iso8601, timeZone: .newYork) == "2025-05-15T10:30:00-04:00")
        }

        @Test("logTimestamp")
        func logTimestamp() {
            #expect(sut(using: .timestamp) == "2025-05-15 14:30:00")
        }

        @Test("yearOnly")
        func yearOnly() {
            #expect(sut(using: .year) == "2025")
        }

        @Test("monthNumber")
        func monthNumber() {
            #expect(sut(using: .month) == "05")
        }

        @Test("day")
        func day() {
            #expect(sut(using: .day) == "15")
        }

        @Test("custom pattern")
        func custom() {
            let formatter = DateFormatter.custom("MMM yyyy")
            #expect(sut(using: formatter) == "May 2025")
        }
    }

    fileprivate static func makeDate(
        year: Int,
        month: Int,
        day: Int,
        hour: Int? = nil,
        minute: Int? = nil,
        timeZone: TimeZone? = nil
    ) -> Date? {
        var calendar = Calendar.current
        if let tz = timeZone {
            calendar.timeZone = tz
        }
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.timeZone = timeZone
        return calendar.date(from: components)
    }
}
