import Testing
import Foundation

@testable import EasyDate

@Suite("String")
struct StringExtensionsTests {
    
    private let referenceDate: Date = {
        var components = DateComponents()
        components.year = 2025
        components.month = 5
        components.day = 15
        components.hour = 14
        components.minute = 30
        components.second = 0
        components.timeZone = TimeZone(secondsFromGMT: 0)
        return Calendar(identifier: .gregorian).date(from: components)!
    }()
    
    private let referenceDateOnly: Date = {
        var components = DateComponents()
        components.year = 2025
        components.month = 5
        components.day = 15
        components.timeZone = TimeZone(secondsFromGMT: 0)
        return Calendar(identifier: .gregorian).date(from: components)!
    }()
    
    private func isSameDate(_ date1: Date?, _ date2: Date?, accuracySeconds: TimeInterval = 1) -> Bool {
        guard let d1 = date1, let d2 = date2 else { return false }
        return abs(d1.timeIntervalSince1970 - d2.timeIntervalSince1970) <= accuracySeconds
    }
    
    @Test("ISO8601 Full Fractional Seconds + TZ1")
    func iso8601FullFracTZ1() {
        #expect(isSameDate("2025-05-15T14:30:00.123+00:00".date, referenceDate))
    }
    
    @Test("ISO8601 Basic")
    func iso8601Basic() {
        #expect(isSameDate("20250515T143000+0000".date, referenceDate))
    }
    
    @Test("DateTimeDash24")
    func dateTimeDash24() {
        #expect(isSameDate("2025-05-15 14:30:00".date, referenceDate))
    }
    
    @Test("DateTimeSlash24")
    func dateTimeSlash24() {
        #expect(isSameDate("2025/05/15 14:30:00".date, referenceDate))
    }
    
    @Test("DateTimeDot24")
    func dateTimeDot24() {
        #expect(isSameDate("2025.05.15 14:30:00".date, referenceDate))
    }
    
    @Test("DateTimeDashDMY24")
    func dateTimeDashDMY24() {
        #expect(isSameDate("15-05-2025 14:30:00".date, referenceDate))
    }
    
    @Test("DateTimeSlashDMY24")
    func dateTimeSlashDMY24() {
        #expect(isSameDate("15/05/2025 14:30:00".date, referenceDate))
    }
    
    @Test("DateTimeSlashMDY24")
    func dateTimeSlashMDY24() {
        #expect(isSameDate("05/15/2025 14:30:00".date, referenceDate))
    }
    
    @Test("DateTimeDotDMY24")
    func dateTimeDotDMY24() {
        #expect(isSameDate("15.05.2025 14:30:00".date, referenceDate))
    }
    
    @Test("DateOnlyDashYMD")
    func dateOnlyDashYMD() {
        #expect(isSameDate("2025-05-15".date, referenceDateOnly))
    }
    
    @Test("DateOnlySlashYMD")
    func dateOnlySlashYMD() {
        #expect(isSameDate("2025/05/15".date, referenceDateOnly))
    }
    
    @Test("DateOnlyDotYMD")
    func dateOnlyDotYMD() {
        #expect(isSameDate("2025.05.15".date, referenceDateOnly))
    }
    
    @Test("DateOnlyDashDMY")
    func dateOnlyDashDMY() {
        #expect(isSameDate("15-05-2025".date, referenceDateOnly))
    }
    
    @Test("DateOnlySlashDMY")
    func dateOnlySlashDMY() {
        #expect(isSameDate("15/05/2025".date, referenceDateOnly))
    }
    
    @Test("DateOnlySlashMDY")
    func dateOnlySlashMDY() {
        #expect(isSameDate("05/15/2025".date, referenceDateOnly))
    }
    
    @Test("DateOnlyDotDMY")
    func dateOnlyDotDMY() {
        #expect(isSameDate("15.05.2025".date, referenceDateOnly))
    }
    
    @Test("DateTimeSlashMDY12")
    func dateTimeSlashMDY12() {
        #expect(isSameDate("05/15/2025 02:30 PM".date, referenceDate))
    }
    
    @Test("DateTimeSlashDMY12")
    func dateTimeSlashDMY12() {
        #expect(isSameDate("15/05/2025 02:30 PM".date, referenceDate))
    }
    
    @Test("DateTimeDash12")
    func dateTimeDash12() {
        #expect(isSameDate("2025-05-15 02:30 PM".date, referenceDate))
    }
    
    @Test("DateTimeSlash12")
    func dateTimeSlash12() {
        #expect(isSameDate("2025/05/15 02:30 PM".date, referenceDate))
    }
    
    @Test("DateTimeDot12")
    func dateTimeDot12() {
        #expect(isSameDate("2025.05.15 02:30 PM".date, referenceDate))
    }
    
    @Test("DateTimeDashDMY12")
    func dateTimeDashDMY12() {
        #expect(isSameDate("15-05-2025 02:30 PM".date, referenceDate))
    }
    
    @Test("DateTimeDotDMY12")
    func dateTimeDotDMY12() {
        #expect(isSameDate("15.05.2025 02:30 PM".date, referenceDate))
    }
    
    @Test("MonthAbbrevDayYearComma")
    func monthAbbrevDayYearComma() {
        #expect("May 15, 2025".date != nil)
    }
    
    @Test("MonthAbbrevDayYear")
    func monthAbbrevDayYear() {
        #expect("15 May 2025".date != nil)
    }
    
    @Test("MonthAbbrevDayYearTime")
    func monthAbbrevDayYearTime() {
        #expect("May 15, 2025 02:30 PM".date != nil)
    }
    
    @Test("MonthAbbrevDayYearTimeAlt")
    func monthAbbrevDayYearTimeAlt() {
        #expect("15 May 2025 02:30 PM".date != nil)
    }
    
    @Test("Time24HMS")
    func time24HMS() throws {
        let date = try #require("14:30:00".date)
        var cal = Calendar.gregorian
        cal.timeZone = .gmt
        #expect(cal.component(.hour, from: date) == 14)
        #expect(cal.component(.minute, from: date) == 30)
        #expect(cal.component(.second, from: date) == 0)
    }
    
    @Test("Time24HM")
    func time24HM() throws {
        let date = try #require("14:30".date)
        var cal = Calendar.gregorian
        cal.timeZone = .gmt
        #expect(cal.component(.hour, from: date) == 14)
        #expect(cal.component(.minute, from: date) == 30)
    }
    
    @Test("Time12H")
    func time12H() throws {
        let date = try #require("02:30 PM".date)
        var cal = Calendar.gregorian
        cal.timeZone = .gmt
        #expect(cal.component(.hour, from: date) == 14)
        #expect(cal.component(.minute, from: date) == 30)
    }
    
    @Test("InvalidString")
    func invalidString() {
        #expect("not a date".date == nil)
    }
}
