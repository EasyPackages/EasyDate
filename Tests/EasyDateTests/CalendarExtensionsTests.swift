import Testing
import Foundation

@testable import EasyDate

@Suite("Calendar")
struct CalendarHelpersTests {
    
    @Test("Gregorian calendar should have correct identifier")
    func gregorianIdentifier() {
        #expect(Calendar.gregorian.identifier == .gregorian)
    }

    @Test("ISO 8601 calendar should have correct identifier")
    func iso8601Identifier() {
        #expect(Calendar.iso8601.identifier == .iso8601)
    }

    @Test("Buddhist calendar should have correct identifier")
    func buddhistIdentifier() {
        #expect(Calendar.buddhist.identifier == .buddhist)
    }

    @Test("Hebrew calendar should have correct identifier")
    func hebrewIdentifier() {
        #expect(Calendar.hebrew.identifier == .hebrew)
    }

    @Test("Islamic calendar should have correct identifier")
    func islamicIdentifier() {
        #expect(Calendar.islamic.identifier == .islamic)
    }

    @Test("Japanese calendar should have correct identifier")
    func japaneseIdentifier() {
        #expect(Calendar.japanese.identifier == .japanese)
    }

    @Test("Gregorian calendar should compute weekday")
    func weekdayFromGregorian() {
        let weekday = Calendar.gregorian.component(.weekday, from: Date())
        #expect((1...7).contains(weekday))
    }

    @Test("Japanese calendar should detect weekend")
    func isWeekendOnJapaneseCalendar() {
        let result = Calendar.japanese.isDateInWeekend(Date())
        #expect(result == Calendar(identifier: .japanese).isDateInWeekend(Date()))
    }
}
