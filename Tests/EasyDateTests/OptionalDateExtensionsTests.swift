import Testing
import Foundation

@testable import EasyDate

@Suite("Date?")
struct OptionalDateHelpersTests {
    
    @Test("Returns now when value is nil")
    func returnsNowWhenNil() {
        let sut: Date? = nil
        
        let now = Date()
        let result = sut.orNow
        
        // Check that result is within 1 second of 'now'
        #expect(abs(result.timeIntervalSince(now)) < 1)
    }

    @Test("Returns wrapped value when present")
    func returnsWrappedDate() {
        let referenceDate = Date(timeIntervalSince1970: 123_456)
        let sut: Date? = referenceDate

        let result = sut.orNow

        #expect(result == referenceDate)
    }

    @Test("Returns .distantPast if wrapped")
    func returnsDistantPastIfPresent() {
        let sut: Date? = .distantPast

        let result = sut.orNow

        #expect(result == .distantPast)
    }

    @Test("Returns .distantFuture if wrapped")
    func returnsDistantFutureIfPresent() {
        let sut: Date? = .distantFuture

        let result = sut.orNow

        #expect(result == .distantFuture)
    }
}
