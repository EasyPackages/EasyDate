import Testing
import Foundation

@testable import EasyDate

@Suite("DateOffset")
struct DateOffsetOperatorTests {
    
    @Test("Add 10 days to a fixed date")
    func addDays() {
        let base = Date(year: 2025, month: 12, day: 1)!
        let result = base + .days(10)
        let expected = Date(year: 2025, month: 12, day: 11)
        #expect(result == expected)
    }
    
    @Test("Subtract 1 month from a fixed date")
    func subtractMonth() {
        let base = Date(year: 2025, month: 12, day: 1)!
        let result = base - .months(1)
        let expected = Date(year: 2025, month: 11, day: 1)
        #expect(result == expected)
    }
    
    @Test("Add 1 year to a fixed date")
    func addYear() {
        let base = Date(year: 2025, month: 12, day: 1)!
        let result = base + .years(1)
        let expected = Date(year: 2026, month: 12, day: 1)
        #expect(result == expected)
    }
    
    @Test("Add 15 minutes to a known time")
    func addMinutes() {
        let base = Date(year: 2025, month: 12, day: 1, hour: 14, minute: 30)!
        let result = base + .minutes(15)
        let expected = Date(year: 2025, month: 12, day: 1, hour: 14, minute: 45)
        #expect(result == expected)
    }
    
    @Test("Subtract 10 seconds from a known time")
    func subtractSeconds() {
        let base = Date(year: 2025, month: 12, day: 1, hour: 10, minute: 0)!
        let result = base - .seconds(10)
        let expected = base.addingTimeInterval(-10)
        #expect(abs(result!.timeIntervalSince(expected)) < 0.001)
    }
    
    @Test("Support negative offset values")
    func negativeOffset() {
        let base = Date(year: 2025, month: 12, day: 1)!
        let result = base + .days(-5)
        let expected = Date(year: 2025, month: 11, day: 26)
        #expect(result == expected)
    }
    
    @Test("Apply offset using GMT TimeZone")
    func applyOffsetInGMT() {
        let tz = TimeZone.gmt
        var calendar = Calendar.current
        calendar.timeZone = tz
        
        let base = DateComponents(calendar: calendar, timeZone: tz, year: 2025, month: 12, day: 1, hour: 12, minute: 0).date!
        let result = base + .hours(2)
        
        let expected = DateComponents(calendar: calendar, timeZone: tz, year: 2025, month: 12, day: 1, hour: 14, minute: 0).date
        #expect(result == expected)
    }
    
    @Test("Apply offset using São Paulo TimeZone (DST-safe)")
    func applyOffsetInSaoPaulo() {
        let tz = TimeZone.saoPaulo
        var calendar = Calendar.current
        calendar.timeZone = tz
        
        let base = DateComponents(calendar: calendar, timeZone: tz, year: 2025, month: 12, day: 1, hour: 22, minute: 0).date!
        let result = base + .hours(2)
        
        let expected = DateComponents(calendar: calendar, timeZone: tz, year: 2025, month: 12, day: 2, hour: 0, minute: 0).date
        #expect(result == expected)
    }
    
    @Test("Chained operation: +2 days -3 hours +45 minutes")
    func chainedOffsets() {
        let base = Date(year: 2025, month: 12, day: 1, hour: 10, minute: 0)!
        let result = ((base + .days(2))! - .hours(3))! + .minutes(45)
        let expected = Date(year: 2025, month: 12, day: 3, hour: 7, minute: 45)
        #expect(result == expected)
    }
    
    @Test("Chained offsets crossing month and year")
    func chainedAcrossMonthAndYear() {
        let base = Date(year: 2025, month: 12, day: 31, hour: 23, minute: 30)!
        let result = ((base + .minutes(45))! + .days(1))!
        let expected = Date(year: 2026, month: 1, day: 2, hour: 0, minute: 15)
        #expect(result == expected)
    }
    
    @Test("Result is beyond Date.distantFuture")
    func resultExceedsDistantFuture() {
        let base = Date.distantFuture
        let result = base + .years(100)
        #expect(result! > Date.distantFuture)
    }

    @Test("Result is before Date.distantPast")
    func resultBelowDistantPast() {
        let base = Date.distantPast
        let result = base - .years(100)
        #expect(result! < Date.distantPast)
    }

    @Test("Result overflows but is still valid Date")
    func resultExtremeOverflow() {
        let base = Date()
        let result = base + .years(1_000_000)
        #expect(result != nil)
    }
    
    @Test("Nil when using invalid calendar date (Feb 31)")
    func invalidCalendarDateReturnsNil() {
        let invalid = Date(year: 2025, month: 2, day: 31)
        #expect(invalid == nil)
    }
    
    @Test("Nil when adding to nil base date")
    func addToNilBaseReturnsNil() {
        let base: Date? = nil
        let result = base.map { $0 + .days(1) }
        #expect(result == nil)
    }
}
