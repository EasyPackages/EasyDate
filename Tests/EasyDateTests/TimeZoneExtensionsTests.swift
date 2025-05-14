import Testing
import Foundation

@testable import EasyDate

@Suite("TimeZone")
struct TimeZoneHelpersTests {
    
    @Test("GMT should have 0 seconds from GMT")
    func testGMT() {
        #expect(TimeZone.gmt.secondsFromGMT() == 0)
    }
    
    @Test("UTC should have identifier 'GMT'")
    func testUTC() {
        #expect(TimeZone.utc.identifier == "GMT")
    }
    
    @Test("Sao Paulo identifier")
    func testSaoPaulo() {
        #expect(TimeZone.saoPaulo.identifier == "America/Sao_Paulo")
    }
    
    @Test("New York identifier")
    func testNewYork() {
        #expect(TimeZone.newYork.identifier == "America/New_York")
    }
    
    @Test("London identifier")
    func testLondon() {
        #expect(TimeZone.london.identifier == "Europe/London")
    }
    
    @Test("Paris identifier")
    func testParis() {
        #expect(TimeZone.paris.identifier == "Europe/Paris")
    }
    
    @Test("Tokyo identifier")
    func testTokyo() {
        #expect(TimeZone.tokyo.identifier == "Asia/Tokyo")
    }
    
    @Test("Los Angeles identifier")
    func testLosAngeles() {
        #expect(TimeZone.losAngeles.identifier == "America/Los_Angeles")
    }
    
    @Test("Berlin identifier")
    func testBerlin() {
        #expect(TimeZone.berlin.identifier == "Europe/Berlin")
    }
    
    @Test("Fixed timezone +3h should equal 10800 seconds")
    func testFixedHoursPositive() {
        let tz = TimeZone.fixed(offsetInHours: 3)
        #expect(tz?.secondsFromGMT() == 10800)
    }
    
    @Test("Fixed timezone -5h should equal -18000 seconds")
    func testFixedHoursNegative() {
        let tz = TimeZone.fixed(offsetInHours: -5)
        #expect(tz?.secondsFromGMT() == -18000)
    }
    
    @Test("Fixed timezone at 0h should be GMT")
    func testFixedHoursZero() {
        let tz = TimeZone.fixed(offsetInHours: 0)
        #expect(tz?.secondsFromGMT() == 0)
    }
    
    @Test("Fixed timezone at +15h should return GMT+15")
    func testFixedHoursTooHigh() {
        let tz = TimeZone.fixed(offsetInHours: 15)
        #expect(tz?.secondsFromGMT() == 54000)
    }
    
    @Test("Fixed timezone at -13h should return GMT-13")
    func testFixedHoursTooLow() {
        let tz = TimeZone.fixed(offsetInHours: -13)
        #expect(tz?.secondsFromGMT() == -46800)
    }
    
    @Test("Fixed timezone +90min should equal 5400 seconds")
    func testFixedMinutesPositive() {
        let tz = TimeZone.fixed(offsetInMinutes: 90)
        #expect(tz?.secondsFromGMT() == 5400)
    }
    
    @Test("Fixed timezone -150min should equal -9000 seconds")
    func testFixedMinutesNegative() {
        let tz = TimeZone.fixed(offsetInMinutes: -150)
        #expect(tz?.secondsFromGMT() == -9000)
    }
    
    @Test("Fixed timezone 0min should be GMT")
    func testFixedMinutesZero() {
        let tz = TimeZone.fixed(offsetInMinutes: 0)
        #expect(tz?.secondsFromGMT() == 0)
    }
    
    @Test("Fixed timezone +901min should return GMT+15:01")
    func testFixedMinutesTooHigh() {
        let tz = TimeZone.fixed(offsetInMinutes: 901)
        #expect(tz?.secondsFromGMT() == 54060)
    }
    
    @Test("Fixed timezone -781min should return GMT-13:01")
    func testFixedMinutesTooLow() {
        let tz = TimeZone.fixed(offsetInMinutes: -781)
        #expect(tz?.secondsFromGMT() == -46860)
    }
}
