import Testing
import Foundation

@testable import EasyDate

@Suite("DateFormatter")
struct DateFormatterExtensionTests {
    
    @Test("Supports 50 major locales", arguments: [
        "zh_CN", "zh_TW", "en_US", "en_GB", "hi_IN", "es_ES", "es_MX", "ar_EG", "ar_SA", "bn_BD",
        "bn_IN", "pt_BR", "pt_PT", "ru_RU", "ja_JP", "de_DE", "jv_ID", "ko_KR", "fr_FR", "fr_CA",
        "tr_TR", "vi_VN", "it_IT", "pl_PL", "ta_IN", "mr_IN", "te_IN", "th_TH", "gu_IN", "ur_PK",
        "ur_IN", "pa_IN", "fa_IR", "ro_RO", "uk_UA", "ml_IN", "kn_IN", "my_MM", "am_ET", "or_IN",
        "az_AZ", "su_ID", "ha_NG", "yo_NG", "ne_NP", "si_LK", "ceb_PH", "sr_RS", "sv_SE", "hu_HU"
    ])
    func dayMonthAcrossLocales(code: String) {
        let locale = Locale(identifier: code)
        let result = Self.sut(.dayMonth, locale: locale)
        #expect(!result.isEmpty, "Expected non-empty result for \(code)")
        #expect(
            result.contains(
                "15"
            ) || result.rangeOfCharacter(from: .decimalDigits) != nil,
            "Expected '15' or digits in output for \(code): \(result)"
        )
    }
    
    @Test("Month and year formats across locales", arguments: [
        "zh_CN", "zh_TW", "en_US", "en_GB", "hi_IN", "es_ES", "es_MX", "ar_EG", "ar_SA", "bn_BD",
        "bn_IN", "pt_BR", "pt_PT", "ru_RU", "ja_JP", "de_DE", "jv_ID", "ko_KR", "fr_FR", "fr_CA",
        "tr_TR", "vi_VN", "it_IT", "pl_PL", "ta_IN", "mr_IN", "te_IN", "th_TH", "gu_IN", "ur_PK",
        "ur_IN", "pa_IN", "fa_IR", "ro_RO", "uk_UA", "ml_IN", "kn_IN", "my_MM", "am_ET", "or_IN",
        "az_AZ", "su_ID", "ha_NG", "yo_NG", "ne_NP", "si_LK", "ceb_PH", "sr_RS", "sv_SE", "hu_HU"
    ])
    func monthYearAcrossLocales(code: String) {
        let locale = Locale(identifier: code)
        let result = Self.sut(.monthYear, locale: locale)
        #expect(!result.isEmpty, "Expected non-empty result for \(code)")
        #expect(result.contains("2025") || result.rangeOfCharacter(from: .decimalDigits) != nil,
                "Expected year or digits in output for \(code): \(result)")
    }
    
    @Test("Weekday formats across locales", arguments: [
        "zh_CN", "zh_TW", "en_US", "en_GB", "hi_IN", "es_ES", "es_MX", "ar_EG", "ar_SA", "bn_BD",
        "bn_IN", "pt_BR", "pt_PT", "ru_RU", "ja_JP", "de_DE", "jv_ID", "ko_KR", "fr_FR", "fr_CA",
        "tr_TR", "vi_VN", "it_IT", "pl_PL", "ta_IN", "mr_IN", "te_IN", "th_TH", "gu_IN", "ur_PK",
        "ur_IN", "pa_IN", "fa_IR", "ro_RO", "uk_UA", "ml_IN", "kn_IN", "my_MM", "am_ET", "or_IN",
        "az_AZ", "su_ID", "ha_NG", "yo_NG", "ne_NP", "si_LK", "ceb_PH", "sr_RS", "sv_SE", "hu_HU"
    ])
    func weekdayAcrossLocales(code: String) {
        let locale = Locale(identifier: code)
        let result = Self.sut(.weekday, locale: locale)
        #expect(!result.isEmpty, "Expected non-empty result for \(code)")
        #expect(result.rangeOfCharacter(from: CharacterSet.letters) != nil,
                "Expected textual weekday output for \(code): \(result)")
    }
    
    @Suite(".year")
    struct YearOnlyTests {
        let yearNumber = "2025"
        
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.year, locale: .zhCN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.year, locale: .zhTW, timeZone: .gmt) == yearNumber)
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.year, locale: .enUS, timeZone: .gmt) == yearNumber)
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.year, locale: .enGB, timeZone: .gmt) == yearNumber)
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.year, locale: .hiIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.year, locale: .esES, timeZone: .gmt) == yearNumber)
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.year, locale: .esMX, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.year, locale: .arEG, timeZone: .gmt) == "٢٠٢٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.year, locale: .arSA, timeZone: .gmt) == "١٤٤٦")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.year, locale: .bnBD, timeZone: .gmt) == "২০২৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.year, locale: .bnIN, timeZone: .gmt) == "২০২৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.year, locale: .ptBR, timeZone: .gmt) == yearNumber)
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.year, locale: .ptPT, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.year, locale: .ruRU, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.year, locale: .jaJP, timeZone: .gmt) == yearNumber)
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.year, locale: .deDE, timeZone: .gmt) == yearNumber)
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.year, locale: .jvID, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.year, locale: .koKR, timeZone: .gmt) == yearNumber)
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.year, locale: .frFR, timeZone: .gmt) == yearNumber)
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.year, locale: .frCA, timeZone: .gmt) == yearNumber)
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.year, locale: .trTR, timeZone: .gmt) == yearNumber)
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.year, locale: .viVN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.year, locale: .itIT, timeZone: .gmt) == yearNumber)
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.year, locale: .plPL, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.year, locale: .taIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.year, locale: .mrIN, timeZone: .gmt) == "२०२५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.year, locale: .teIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.year, locale: .thTH, timeZone: .gmt) == "2568")
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.year, locale: .guIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.year, locale: .urPK, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.year, locale: .urIN, timeZone: .gmt) == "۲۰۲۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.year, locale: .paIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.year, locale: .faIR, timeZone: .gmt) == "۱۴۰۴")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.year, locale: .roRO, timeZone: .gmt) == yearNumber)
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.year, locale: .ukUA, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.year, locale: .mlIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.year, locale: .knIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.year, locale: .myMM, timeZone: .gmt) == "၂၀၂၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.year, locale: .amET, timeZone: .gmt) == yearNumber)
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.year, locale: .orIN, timeZone: .gmt) == yearNumber)
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.year, locale: .azAZ, timeZone: .gmt) == yearNumber)
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.year, locale: .suID, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.year, locale: .haNG, timeZone: .gmt) == yearNumber)
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.year, locale: .yoNG, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.year, locale: .neNP, timeZone: .gmt) == "२०२५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.year, locale: .siLK, timeZone: .gmt) == yearNumber)
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.year, locale: .cebPH, timeZone: .gmt) == yearNumber)
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.year, locale: .srRS, timeZone: .gmt) == yearNumber)
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.year, locale: .svSE, timeZone: .gmt) == yearNumber)
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.year, locale: .huHU, timeZone: .gmt) == yearNumber)
        }
    }
    
    @Suite(".month")
    struct MonthNumberTests {
        private let month = "05"
        
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.month, locale: .zhCN, timeZone: .gmt) == month)
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.month, locale: .zhTW, timeZone: .gmt) == month)
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.month, locale: .enUS, timeZone: .gmt) == month)
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.month, locale: .enGB, timeZone: .gmt) == month)
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.month, locale: .hiIN, timeZone: .gmt) == month)
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.month, locale: .esES, timeZone: .gmt) == month)
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.month, locale: .esMX, timeZone: .gmt) == month)
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.month, locale: .arEG, timeZone: .gmt) == "٠٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.month, locale: .arSA, timeZone: .gmt) == "١١")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.month, locale: .bnBD, timeZone: .gmt) == "০৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.month, locale: .bnIN, timeZone: .gmt) == "০৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.month, locale: .ptBR, timeZone: .gmt) == month)
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.month, locale: .ptPT, timeZone: .gmt) == month)
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.month, locale: .ruRU, timeZone: .gmt) == month)
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.month, locale: .jaJP, timeZone: .gmt) == month)
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.month, locale: .deDE, timeZone: .gmt) == month)
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.month, locale: .jvID, timeZone: .gmt) == month)
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.month, locale: .koKR, timeZone: .gmt) == month)
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.month, locale: .frFR, timeZone: .gmt) == month)
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.month, locale: .frCA, timeZone: .gmt) == month)
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.month, locale: .trTR, timeZone: .gmt) == month)
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.month, locale: .viVN, timeZone: .gmt) == month)
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.month, locale: .itIT, timeZone: .gmt) == month)
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.month, locale: .plPL, timeZone: .gmt) == month)
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.month, locale: .taIN, timeZone: .gmt) == month)
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.month, locale: .mrIN, timeZone: .gmt) == "०५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.month, locale: .teIN, timeZone: .gmt) == month)
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.month, locale: .thTH, timeZone: .gmt) == month)
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.month, locale: .guIN, timeZone: .gmt) == month)
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.month, locale: .urPK, timeZone: .gmt) == month)
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.month, locale: .urIN, timeZone: .gmt) == "۰۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.month, locale: .paIN, timeZone: .gmt) == month)
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.month, locale: .faIR, timeZone: .gmt) == "۰۲")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.month, locale: .roRO, timeZone: .gmt) == month)
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.month, locale: .ukUA, timeZone: .gmt) == month)
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.month, locale: .mlIN, timeZone: .gmt) == month)
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.month, locale: .knIN, timeZone: .gmt) == month)
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.month, locale: .myMM, timeZone: .gmt) == "၀၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.month, locale: .amET, timeZone: .gmt) == month)
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.month, locale: .orIN, timeZone: .gmt) == month)
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.month, locale: .azAZ, timeZone: .gmt) == month)
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.month, locale: .suID, timeZone: .gmt) == month)
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.month, locale: .haNG, timeZone: .gmt) == month)
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.month, locale: .yoNG, timeZone: .gmt) == month)
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.month, locale: .neNP, timeZone: .gmt) == "०५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.month, locale: .siLK, timeZone: .gmt) == month)
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.month, locale: .cebPH, timeZone: .gmt) == month)
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.month, locale: .srRS, timeZone: .gmt) == month)
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.month, locale: .svSE, timeZone: .gmt) == month)
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.month, locale: .huHU, timeZone: .gmt) == month)
        }
    }
    
    @Suite(".day")
    struct DayTests {
        let dayNumber = "15"
        
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.day, locale: .zhCN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.day, locale: .zhTW, timeZone: .gmt) == dayNumber)
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.day, locale: .enUS, timeZone: .gmt) == dayNumber)
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.day, locale: .enGB, timeZone: .gmt) == dayNumber)
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.day, locale: .hiIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.day, locale: .esES, timeZone: .gmt) == dayNumber)
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.day, locale: .esMX, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.day, locale: .arEG, timeZone: .gmt) == "١٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.day, locale: .arSA, timeZone: .gmt) == "١٧")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.day, locale: .bnBD, timeZone: .gmt) == "১৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.day, locale: .bnIN, timeZone: .gmt) == "১৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.day, locale: .ptBR, timeZone: .gmt) == dayNumber)
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.day, locale: .ptPT, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.day, locale: .ruRU, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.day, locale: .jaJP, timeZone: .gmt) == dayNumber)
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.day, locale: .deDE, timeZone: .gmt) == dayNumber)
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.day, locale: .jvID, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.day, locale: .koKR, timeZone: .gmt) == dayNumber)
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.day, locale: .frFR, timeZone: .gmt) == dayNumber)
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.day, locale: .frCA, timeZone: .gmt) == dayNumber)
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.day, locale: .trTR, timeZone: .gmt) == dayNumber)
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.day, locale: .viVN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.day, locale: .itIT, timeZone: .gmt) == dayNumber)
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.day, locale: .plPL, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.day, locale: .taIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.day, locale: .mrIN, timeZone: .gmt) == "१५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.day, locale: .teIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.day, locale: .thTH, timeZone: .gmt) == dayNumber)
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.day, locale: .guIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.day, locale: .urPK, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.day, locale: .urIN, timeZone: .gmt) == "۱۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.day, locale: .paIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.day, locale: .faIR, timeZone: .gmt) == "۲۵")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.day, locale: .roRO, timeZone: .gmt) == dayNumber)
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.day, locale: .ukUA, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.day, locale: .mlIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.day, locale: .knIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.day, locale: .myMM, timeZone: .gmt) == "၁၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.day, locale: .amET, timeZone: .gmt) == dayNumber)
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.day, locale: .orIN, timeZone: .gmt) == dayNumber)
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.day, locale: .azAZ, timeZone: .gmt) == dayNumber)
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.day, locale: .suID, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.day, locale: .haNG, timeZone: .gmt) == dayNumber)
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.day, locale: .yoNG, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.day, locale: .neNP, timeZone: .gmt) == "१५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.day, locale: .siLK, timeZone: .gmt) == dayNumber)
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.day, locale: .cebPH, timeZone: .gmt) == dayNumber)
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.day, locale: .srRS, timeZone: .gmt) == dayNumber)
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.day, locale: .svSE, timeZone: .gmt) == dayNumber)
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.day, locale: .huHU, timeZone: .gmt) == dayNumber)
        }
    }
    
    @Suite(".monthYear")
    struct MonthYearTests {
        
        @Test("zhCN")
        func zhCN() {
            #expect(sut(.monthYear, locale: .zhCN, timeZone: .gmt) == "五月 2025")
        }
        
        @Test("zhTW")
        func zhTW() {
            #expect(sut(.monthYear, locale: .zhTW, timeZone: .gmt) == "5月 2025")
        }
        
        @Test("enUS")
        func enUS() {
            #expect(sut(.monthYear, locale: .enUS, timeZone: .gmt) == "May 2025")
        }
        
        @Test("enGB")
        func enGB() {
            #expect(sut(.monthYear, locale: .enGB, timeZone: .gmt) == "May 2025")
        }
        
        @Test("hiIN")
        func hiIN() {
            #expect(sut(.monthYear, locale: .hiIN, timeZone: .gmt) == "मई 2025")
        }
        
        @Test("esES")
        func esES() {
            #expect(sut(.monthYear, locale: .esES, timeZone: .gmt) == "mayo 2025")
        }
        
        @Test("esMX")
        func esMX() {
            #expect(sut(.monthYear, locale: .esMX, timeZone: .gmt) == "mayo 2025")
        }
        
        @Test("arEG")
        func arEG() {
            #expect(sut(.monthYear, locale: .arEG, timeZone: .gmt) == "مايو ٢٠٢٥")
        }
        
        @Test("arSA")
        func arSA() {
            #expect(sut(.monthYear, locale: .arSA, timeZone: .gmt) == "ذو القعدة ١٤٤٦")
        }
        
        @Test("bnBD")
        func bnBD() {
            #expect(sut(.monthYear, locale: .bnBD, timeZone: .gmt) == "মে ২০২৫")
        }
        
        @Test("bnIN")
        func bnIN() {
            #expect(sut(.monthYear, locale: .bnIN, timeZone: .gmt) == "মে ২০২৫")
        }
        
        @Test("ptBR")
        func ptBR() {
            #expect(sut(.monthYear, locale: .ptBR, timeZone: .gmt) == "maio 2025")
        }
        
        @Test("ptPT")
        func ptPT() {
            #expect(sut(.monthYear, locale: .ptPT, timeZone: .gmt) == "maio 2025")
        }
        
        @Test("ruRU")
        func ruRU() {
            #expect(sut(.monthYear, locale: .ruRU, timeZone: .gmt) == "май 2025")
        }
        
        @Test("jaJP")
        func jaJP() {
            #expect(sut(.monthYear, locale: .jaJP, timeZone: .gmt) == "5月 2025")
        }
        
        @Test("deDE")
        func deDE() {
            #expect(sut(.monthYear, locale: .deDE, timeZone: .gmt) == "Mai 2025")
        }
        
        @Test("jvID")
        func jvID() {
            #expect(sut(.monthYear, locale: .jvID, timeZone: .gmt) == "Mei 2025")
        }
        
        @Test("koKR")
        func koKR() {
            #expect(sut(.monthYear, locale: .koKR, timeZone: .gmt) == "5월 2025")
        }
        
        @Test("frFR")
        func frFR() {
            #expect(sut(.monthYear, locale: .frFR, timeZone: .gmt) == "mai 2025")
        }
        
        @Test("frCA")
        func frCA() {
            #expect(sut(.monthYear, locale: .frCA, timeZone: .gmt) == "mai 2025")
        }
        
        @Test("trTR")
        func trTR() {
            #expect(sut(.monthYear, locale: .trTR, timeZone: .gmt) == "Mayıs 2025")
        }
        
        @Test("viVN")
        func viVN() {
            #expect(sut(.monthYear, locale: .viVN, timeZone: .gmt) == "Tháng 5 2025")
        }
        
        @Test("itIT")
        func itIT() {
            #expect(sut(.monthYear, locale: .itIT, timeZone: .gmt) == "maggio 2025")
        }
        
        @Test("plPL")
        func plPL() {
            #expect(sut(.monthYear, locale: .plPL, timeZone: .gmt) == "maj 2025")
        }
        
        @Test("taIN")
        func taIN() {
            #expect(sut(.monthYear, locale: .taIN, timeZone: .gmt) == "மே 2025")
        }
        
        @Test("mrIN")
        func mrIN() {
            #expect(sut(.monthYear, locale: .mrIN, timeZone: .gmt) == "मे २०२५")
        }
        
        @Test("teIN")
        func teIN() {
            #expect(sut(.monthYear, locale: .teIN, timeZone: .gmt) == "మే 2025")
        }
        
        @Test("thTH")
        func thTH() {
            #expect(sut(.monthYear, locale: .thTH, timeZone: .gmt) == "พฤษภาคม 2568")
        }
        
        @Test("guIN")
        func guIN() {
            #expect(sut(.monthYear, locale: .guIN, timeZone: .gmt) == "મે 2025")
        }
        
        @Test("urPK")
        func urPK() {
            #expect(sut(.monthYear, locale: .urPK, timeZone: .gmt) == "مئی 2025")
        }
        
        @Test("urIN")
        func urIN() {
            #expect(sut(.monthYear, locale: .urIN, timeZone: .gmt) == "مئی ۲۰۲۵")
        }
        
        @Test("paIN")
        func paIN() {
            #expect(sut(.monthYear, locale: .paIN, timeZone: .gmt) == "ਮਈ 2025")
        }
        
        @Test("faIR")
        func faIR() {
            #expect(sut(.monthYear, locale: .faIR, timeZone: .gmt) == "اردیبهشت ۱۴۰۴")
        }
        
        @Test("roRO")
        func roRO() {
            #expect(sut(.monthYear, locale: .roRO, timeZone: .gmt) == "mai 2025")
        }
        
        @Test("ukUA")
        func ukUA() {
            #expect(sut(.monthYear, locale: .ukUA, timeZone: .gmt) == "травень 2025")
        }
        
        @Test("mlIN")
        func mlIN() {
            #expect(sut(.monthYear, locale: .mlIN, timeZone: .gmt) == "മേയ് 2025")
        }
        
        @Test("knIN")
        func knIN() {
            #expect(sut(.monthYear, locale: .knIN, timeZone: .gmt) == "ಮೇ 2025")
        }
        
        @Test("myMM")
        func myMM() {
            #expect(sut(.monthYear, locale: .myMM, timeZone: .gmt) == "မေ ၂၀၂၅")
        }
        
        @Test("amET")
        func amET() {
            #expect(sut(.monthYear, locale: .amET, timeZone: .gmt) == "ሜይ 2025")
        }
        
        @Test("orIN")
        func orIN() {
            #expect(sut(.monthYear, locale: .orIN, timeZone: .gmt) == "ମଇ 2025")
        }
        
        @Test("azAZ")
        func azAZ() {
            #expect(sut(.monthYear, locale: .azAZ, timeZone: .gmt) == "may 2025")
        }
        
        @Test("suID")
        func suID() {
            #expect(sut(.monthYear, locale: .suID, timeZone: .gmt) == "Méi 2025")
        }
        
        @Test("haNG")
        func haNG() {
            #expect(sut(.monthYear, locale: .haNG, timeZone: .gmt) == "Mayu 2025")
        }
        
        @Test("yoNG")
        func yoNG() {
            #expect(sut(.monthYear, locale: .yoNG, timeZone: .gmt) == "Ẹ̀bibi 2025")
        }
        
        @Test("neNP")
        func neNP() {
            #expect(sut(.monthYear, locale: .neNP, timeZone: .gmt) == "मे २०२५")
        }
        
        @Test("siLK")
        func siLK() {
            #expect(sut(.monthYear, locale: .siLK, timeZone: .gmt) == "මැයි 2025")
        }
        
        @Test("cebPH")
        func cebPH() {
            #expect(sut(.monthYear, locale: .cebPH, timeZone: .gmt) == "Mayo 2025")
        }
        
        @Test("srRS")
        func srRS() {
            #expect(sut(.monthYear, locale: .srRS, timeZone: .gmt) == "мај 2025")
        }
        
        @Test("svSE")
        func svSE() {
            #expect(sut(.monthYear, locale: .svSE, timeZone: .gmt) == "maj 2025")
        }
        
        @Test("huHU")
        func huHU() {
            #expect(sut(.monthYear, locale: .huHU, timeZone: .gmt) == "május 2025")
        }
    }
    
    @Suite(".weekday")
    struct WeekdayTests {
        
        @Test("zhCN")
        func zhCN() {
            #expect(sut(.weekday, locale: .zhCN, timeZone: .gmt) == "星期四")
        }
        
        @Test("zhTW")
        func zhTW() {
            #expect(sut(.weekday, locale: .zhTW, timeZone: .gmt) == "星期四")
        }
        
        @Test("enUS")
        func enUS() {
            #expect(sut(.weekday, locale: .enUS, timeZone: .gmt) == "Thursday")
        }
        
        @Test("enGB")
        func enGB() {
            #expect(sut(.weekday, locale: .enGB, timeZone: .gmt) == "Thursday")
        }
        
        @Test("hiIN")
        func hiIN() {
            #expect(sut(.weekday, locale: .hiIN, timeZone: .gmt) == "गुरुवार")
        }
        
        @Test("esES")
        func esES() {
            #expect(sut(.weekday, locale: .esES, timeZone: .gmt) == "jueves")
        }
        
        @Test("esMX")
        func esMX() {
            #expect(sut(.weekday, locale: .esMX, timeZone: .gmt) == "jueves")
        }
        
        @Test("arEG")
        func arEG() {
            #expect(sut(.weekday, locale: .arEG, timeZone: .gmt) == "الخميس")
        }
        
        @Test("arSA")
        func arSA() {
            #expect(sut(.weekday, locale: .arSA, timeZone: .gmt) == "الخميس")
        }
        
        @Test("bnBD")
        func bnBD() {
            #expect(sut(.weekday, locale: .bnBD, timeZone: .gmt) == "বৃহস্পতিবার")
        }
        
        @Test("bnIN")
        func bnIN() {
            #expect(sut(.weekday, locale: .bnIN, timeZone: .gmt) == "বৃহস্পতিবার")
        }
        
        @Test("ptBR")
        func ptBR() {
            #expect(sut(.weekday, locale: .ptBR, timeZone: .gmt) == "quinta-feira")
        }
        
        @Test("ptPT")
        func ptPT() {
            #expect(sut(.weekday, locale: .ptPT, timeZone: .gmt) == "quinta-feira")
        }
        
        @Test("ruRU")
        func ruRU() {
            #expect(sut(.weekday, locale: .ruRU, timeZone: .gmt) == "четверг")
        }
        
        @Test("jaJP")
        func jaJP() {
            #expect(sut(.weekday, locale: .jaJP, timeZone: .gmt) == "木曜日")
        }
        
        @Test("deDE")
        func deDE() {
            #expect(sut(.weekday, locale: .deDE, timeZone: .gmt) == "Donnerstag")
        }
        
        @Test("jvID")
        func jvID() {
            #expect(sut(.weekday, locale: .jvID, timeZone: .gmt) == "Kamis")
        }
        
        @Test("koKR")
        func koKR() {
            #expect(sut(.weekday, locale: .koKR, timeZone: .gmt) == "목요일")
        }
        
        @Test("frFR")
        func frFR() {
            #expect(sut(.weekday, locale: .frFR, timeZone: .gmt) == "jeudi")
        }
        
        @Test("frCA")
        func frCA() {
            #expect(sut(.weekday, locale: .frCA, timeZone: .gmt) == "jeudi")
        }
        
        @Test("trTR")
        func trTR() {
            #expect(sut(.weekday, locale: .trTR, timeZone: .gmt) == "Perşembe")
        }
        
        @Test("viVN")
        func viVN() {
            #expect(sut(.weekday, locale: .viVN, timeZone: .gmt) == "Thứ Năm")
        }
        
        @Test("itIT")
        func itIT() {
            #expect(sut(.weekday, locale: .itIT, timeZone: .gmt) == "giovedì")
        }
        
        @Test("plPL")
        func plPL() {
            #expect(sut(.weekday, locale: .plPL, timeZone: .gmt) == "czwartek")
        }
        
        @Test("taIN")
        func taIN() {
            #expect(sut(.weekday, locale: .taIN, timeZone: .gmt) == "வியாழன்")
        }
        
        @Test("mrIN")
        func mrIN() {
            #expect(sut(.weekday, locale: .mrIN, timeZone: .gmt) == "गुरुवार")
        }
        
        @Test("teIN")
        func teIN() {
            #expect(sut(.weekday, locale: .teIN, timeZone: .gmt) == "గురువారం")
        }
        
        @Test("thTH")
        func thTH() {
            #expect(sut(.weekday, locale: .thTH, timeZone: .gmt) == "วันพฤหัสบดี")
        }
        
        @Test("guIN")
        func guIN() {
            #expect(sut(.weekday, locale: .guIN, timeZone: .gmt) == "ગુરુવાર")
        }
        
        @Test("urPK")
        func urPK() {
            #expect(sut(.weekday, locale: .urPK, timeZone: .gmt) == "جمعرات")
        }
        
        @Test("urIN")
        func urIN() {
            #expect(sut(.weekday, locale: .urIN, timeZone: .gmt) == "جمعرات")
        }
        
        @Test("paIN")
        func paIN() {
            #expect(sut(.weekday, locale: .paIN, timeZone: .gmt) == "ਵੀਰਵਾਰ")
        }
        
        @Test("faIR")
        func faIR() {
            #expect(sut(.weekday, locale: .faIR, timeZone: .gmt) == "پنجشنبه")
        }
        
        @Test("roRO")
        func roRO() {
            #expect(sut(.weekday, locale: .roRO, timeZone: .gmt) == "joi")
        }
        
        @Test("ukUA")
        func ukUA() {
            #expect(sut(.weekday, locale: .ukUA, timeZone: .gmt) == "четвер")
        }
        
        @Test("mlIN")
        func mlIN() {
            #expect(sut(.weekday, locale: .mlIN, timeZone: .gmt) == "വ്യാഴാഴ്‌ച")
        }
        
        @Test("knIN")
        func knIN() {
            #expect(sut(.weekday, locale: .knIN, timeZone: .gmt) == "ಗುರುವಾರ")
        }
        
        @Test("myMM")
        func myMM() {
            #expect(sut(.weekday, locale: .myMM, timeZone: .gmt) == "ကြာသပတေး")
        }
        
        @Test("amET")
        func amET() {
            #expect(sut(.weekday, locale: .amET, timeZone: .gmt) == "ሐሙስ")
        }
        
        @Test("orIN")
        func orIN() {
            #expect(sut(.weekday, locale: .orIN, timeZone: .gmt) == "ଗୁରୁବାର")
        }
        
        @Test("azAZ")
        func azAZ() {
            #expect(sut(.weekday, locale: .azAZ, timeZone: .gmt) == "cümə axşamı")
        }
        
        @Test("suID")
        func suID() {
            #expect(sut(.weekday, locale: .suID, timeZone: .gmt) == "Kemis")
        }
        
        @Test("haNG")
        func haNG() {
            #expect(sut(.weekday, locale: .haNG, timeZone: .gmt) == "Alhamis")
        }
        
        @Test("yoNG")
        func yoNG() {
            #expect(sut(.weekday, locale: .yoNG, timeZone: .gmt) == "Ọjọ́bọ")
        }
        
        @Test("neNP")
        func neNP() {
            #expect(sut(.weekday, locale: .neNP, timeZone: .gmt) == "बिहिबार")
        }
        
        @Test("siLK")
        func siLK() {
            #expect(sut(.weekday, locale: .siLK, timeZone: .gmt) == "බ්‍රහස්පතින්දා")
        }
        
        @Test("cebPH")
        func cebPH() {
            #expect(sut(.weekday, locale: .cebPH, timeZone: .gmt) == "Huwebes")
        }
        
        @Test("srRS")
        func srRS() {
            #expect(sut(.weekday, locale: .srRS, timeZone: .gmt) == "четвртак")
        }
        
        @Test("svSE")
        func svSE() {
            #expect(sut(.weekday, locale: .svSE, timeZone: .gmt) == "torsdag")
        }
        
        @Test("huHU")
        func huHU() {
            #expect(sut(.weekday, locale: .huHU, timeZone: .gmt) == "csütörtök")
        }
    }
    
    @Suite(".fullDate")
    struct FullDateTests {
        
        @Test("zhCN")
        func zhCN() {
            #expect(sut(.fullDate, locale: .zhCN, timeZone: .gmt) == "2025年5月15日 星期四")
        }
        
        @Test("zhTW")
        func zhTW() {
            #expect(sut(.fullDate, locale: .zhTW, timeZone: .gmt) == "2025年5月15日 星期四")
        }
        
        @Test("enUS")
        func enUS() {
            #expect(sut(.fullDate, locale: .enUS, timeZone: .gmt) == "Thursday, May 15, 2025")
        }
        
        @Test("enGB")
        func enGB() {
            #expect(sut(.fullDate, locale: .enGB, timeZone: .gmt) == "Thursday 15 May 2025")
        }
        
        @Test("hiIN")
        func hiIN() {
            #expect(sut(.fullDate, locale: .hiIN, timeZone: .gmt) == "गुरुवार, 15 मई 2025")
        }
        
        @Test("esES")
        func esES() {
            #expect(sut(.fullDate, locale: .esES, timeZone: .gmt) == "jueves, 15 de mayo de 2025")
        }
        
        @Test("esMX")
        func esMX() {
            #expect(sut(.fullDate, locale: .esMX, timeZone: .gmt) == "jueves, 15 de mayo de 2025")
        }
        
        @Test("arEG")
        func arEG() {
            #expect(sut(.fullDate, locale: .arEG, timeZone: .gmt) == "الخميس، ١٥ مايو، ٢٠٢٥")
        }
        
        @Test("arSA")
        func arSA() {
            #expect(sut(.fullDate, locale: .arSA, timeZone: .gmt) == "الخميس، ١٧ ذو القعدة، ١٤٤٦ هـ")
        }
        
        @Test("bnBD")
        func bnBD() {
            #expect(sut(.fullDate, locale: .bnBD, timeZone: .gmt) == "বৃহস্পতিবার, ১৫ মে, ২০২৫")
        }
        
        @Test("bnIN")
        func bnIN() {
            #expect(sut(.fullDate, locale: .bnIN, timeZone: .gmt) == "বৃহস্পতিবার, ১৫ মে, ২০২৫")
        }
        
        @Test("ptBR")
        func ptBR() {
            #expect(sut(.fullDate, locale: .ptBR, timeZone: .gmt) == "quinta-feira, 15 de maio de 2025")
        }
        
        @Test("ptPT")
        func ptPT() {
            #expect(sut(.fullDate, locale: .ptPT, timeZone: .gmt) == "quinta-feira, 15 de maio de 2025")
        }
        
        @Test("ruRU")
        func ruRU() {
            #expect(sut(.fullDate, locale: .ruRU, timeZone: .gmt) == "четверг, 15 мая 2025 г.")
        }
        
        @Test("jaJP")
        func jaJP() {
            #expect(sut(.fullDate, locale: .jaJP, timeZone: .gmt) == "2025年5月15日 木曜日")
        }
        
        @Test("deDE")
        func deDE() {
            #expect(sut(.fullDate, locale: .deDE, timeZone: .gmt) == "Donnerstag, 15. Mai 2025")
        }
        
        @Test("jvID")
        func jvID() {
            #expect(sut(.fullDate, locale: .jvID, timeZone: .gmt) == "Kamis, 15 Mei 2025")
        }
        
        @Test("koKR")
        func koKR() {
            #expect(sut(.fullDate, locale: .koKR, timeZone: .gmt) == "2025년 5월 15일 목요일")
        }
        
        @Test("frFR")
        func frFR() {
            #expect(sut(.fullDate, locale: .frFR, timeZone: .gmt) == "jeudi 15 mai 2025")
        }
        
        @Test("frCA")
        func frCA() {
            #expect(sut(.fullDate, locale: .frCA, timeZone: .gmt) == "jeudi 15 mai 2025")
        }
        
        @Test("trTR")
        func trTR() {
            #expect(sut(.fullDate, locale: .trTR, timeZone: .gmt) == "15 Mayıs 2025 Perşembe")
        }
        
        @Test("viVN")
        func viVN() {
            #expect(sut(.fullDate, locale: .viVN, timeZone: .gmt) == "Thứ Năm, ngày 15 tháng 5, 2025")
        }
        
        @Test("itIT")
        func itIT() {
            #expect(sut(.fullDate, locale: .itIT, timeZone: .gmt) == "giovedì 15 maggio 2025")
        }
        
        @Test("plPL")
        func plPL() {
            #expect(sut(.fullDate, locale: .plPL, timeZone: .gmt) == "czwartek, 15 maja 2025")
        }
        
        @Test("taIN")
        func taIN() {
            #expect(sut(.fullDate, locale: .taIN, timeZone: .gmt) == "வியாழன், 15 மே, 2025")
        }
        
        @Test("mrIN")
        func mrIN() {
            #expect(sut(.fullDate, locale: .mrIN, timeZone: .gmt) == "गुरुवार, १५ मे, २०२५")
        }
        
        @Test("teIN")
        func teIN() {
            #expect(sut(.fullDate, locale: .teIN, timeZone: .gmt) == "15, మే 2025, గురువారం")
        }
        
        @Test("thTH")
        func thTH() {
            #expect(sut(.fullDate, locale: .thTH, timeZone: .gmt) == "วันพฤหัสบดีที่ 15 พฤษภาคม พ.ศ. 2568")
        }
        
        @Test("guIN")
        func guIN() {
            #expect(sut(.fullDate, locale: .guIN, timeZone: .gmt) == "ગુરુવાર, 15 મે, 2025")
        }
        
        @Test("urPK")
        func urPK() {
            #expect(sut(.fullDate, locale: .urPK, timeZone: .gmt) == "جمعرات، 15 مئی، 2025")
        }
        
        @Test("urIN")
        func urIN() {
            #expect(sut(.fullDate, locale: .urIN, timeZone: .gmt) == "جمعرات، ۱۵ مئی، ۲۰۲۵")
        }
        
        @Test("paIN")
        func paIN() {
            #expect(sut(.fullDate, locale: .paIN, timeZone: .gmt) == "ਵੀਰਵਾਰ, 15 ਮਈ 2025")
        }
        
        @Test("faIR")
        func faIR() {
            #expect(sut(.fullDate, locale: .faIR, timeZone: .gmt) == "۱۴۰۴ اردیبهشت ۲۵, پنجشنبه")
        }
        
        @Test("roRO")
        func roRO() {
            #expect(sut(.fullDate, locale: .roRO, timeZone: .gmt) == "joi, 15 mai 2025")
        }
        
        @Test("ukUA")
        func ukUA() {
            #expect(sut(.fullDate, locale: .ukUA, timeZone: .gmt) == "четвер, 15 травня 2025 р.")
        }
        
        @Test("mlIN")
        func mlIN() {
            #expect(sut(.fullDate, locale: .mlIN, timeZone: .gmt) == "2025, മേയ് 15, വ്യാഴാഴ്‌ച")
        }
        
        @Test("knIN")
        func knIN() {
            #expect(sut(.fullDate, locale: .knIN, timeZone: .gmt) == "ಗುರುವಾರ, ಮೇ 15, 2025")
        }
        
        @Test("myMM")
        func myMM() {
            #expect(sut(.fullDate, locale: .myMM, timeZone: .gmt) == "၂၀၂၅၊ မေ ၁၅၊ ကြာသပတေး")
        }
        
        @Test("amET")
        func amET() {
            #expect(sut(.fullDate, locale: .amET, timeZone: .gmt) == "2025 ሜይ 15, ሐሙስ")
        }
        
        @Test("orIN")
        func orIN() {
            #expect(sut(.fullDate, locale: .orIN, timeZone: .gmt) == "ଗୁରୁବାର, ମଇ 15, 2025")
        }
        
        @Test("azAZ")
        func azAZ() {
            #expect(sut(.fullDate, locale: .azAZ, timeZone: .gmt) == "15 may 2025, cümə axşamı")
        }
        
        @Test("suID")
        func suID() {
            #expect(sut(.fullDate, locale: .suID, timeZone: .gmt) == "Kemis, 15 Méi 2025")
        }
        
        @Test("haNG")
        func haNG() {
            #expect(sut(.fullDate, locale: .haNG, timeZone: .gmt) == "Alhamis 15 Mayu, 2025")
        }
        
        @Test("yoNG")
        func yoNG() {
            #expect(sut(.fullDate, locale: .yoNG, timeZone: .gmt) == "Ọjọ́bọ, 15 Ẹ̀bi 2025")
        }
        
        @Test("neNP")
        func neNP() {
            #expect(sut(.fullDate, locale: .neNP, timeZone: .gmt) == "२०२५ मे १५, बिहिबार")
        }
        
        @Test("siLK")
        func siLK() {
            #expect(sut(.fullDate, locale: .siLK, timeZone: .gmt) == "2025 මැයි 15, බ්‍රහස්පතින්දා")
        }
        
        @Test("cebPH")
        func cebPH() {
            #expect(sut(.fullDate, locale: .cebPH, timeZone: .gmt) == "Huwebes, Mayo 15, 2025")
        }
        
        @Test("srRS")
        func srRS() {
            #expect(sut(.fullDate, locale: .srRS, timeZone: .gmt) == "четвртак, 15. мај 2025.")
        }
        
        @Test("svSE")
        func svSE() {
            #expect(sut(.fullDate, locale: .svSE, timeZone: .gmt) == "torsdag 15 maj 2025")
        }
        
        @Test("huHU")
        func huHU() {
            #expect(sut(.fullDate, locale: .huHU, timeZone: .gmt) == "2025. május 15., csütörtök")
        }
    }
    
    @Suite(".longDate")
    struct LongDate {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.longDate, locale: .zhCN, timeZone: .gmt) == "2025年5月15日")
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.longDate, locale: .zhTW, timeZone: .gmt) == "2025年5月15日")
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.longDate, locale: .enUS, timeZone: .gmt) == "May 15, 2025")
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.longDate, locale: .enGB, timeZone: .gmt) == "15 May 2025")
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.longDate, locale: .hiIN, timeZone: .gmt) == "15 मई 2025")
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.longDate, locale: .esES, timeZone: .gmt) == "15 de mayo de 2025")
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.longDate, locale: .esMX, timeZone: .gmt) == "15 de mayo de 2025")
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.longDate, locale: .arEG, timeZone: .gmt) == "١٥ مايو، ٢٠٢٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.longDate, locale: .arSA, timeZone: .gmt) == "١٧ ذو القعدة، ١٤٤٦ هـ")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.longDate, locale: .bnBD, timeZone: .gmt) == "১৫ মে, ২০২৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.longDate, locale: .bnIN, timeZone: .gmt) == "১৫ মে, ২০২৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.longDate, locale: .ptBR, timeZone: .gmt) == "15 de maio de 2025")
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.longDate, locale: .ptPT, timeZone: .gmt) == "15 de maio de 2025")
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.longDate, locale: .ruRU, timeZone: .gmt) == "15 мая 2025 г.")
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.longDate, locale: .jaJP, timeZone: .gmt) == "2025年5月15日")
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.longDate, locale: .deDE, timeZone: .gmt) == "15. Mai 2025")
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.longDate, locale: .jvID, timeZone: .gmt) == "15 Mei 2025")
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.longDate, locale: .koKR, timeZone: .gmt) == "2025년 5월 15일")
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.longDate, locale: .frFR, timeZone: .gmt) == "15 mai 2025")
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.longDate, locale: .frCA, timeZone: .gmt) == "15 mai 2025")
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.longDate, locale: .trTR, timeZone: .gmt) == "15 Mayıs 2025")
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.longDate, locale: .viVN, timeZone: .gmt) == "ngày 15 tháng 5, 2025")
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.longDate, locale: .itIT, timeZone: .gmt) == "15 maggio 2025")
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.longDate, locale: .plPL, timeZone: .gmt) == "15 maja 2025")
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.longDate, locale: .taIN, timeZone: .gmt) == "15 மே, 2025")
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.longDate, locale: .mrIN, timeZone: .gmt) == "१५ मे, २०२५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.longDate, locale: .teIN, timeZone: .gmt) == "15 మే, 2025")
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.longDate, locale: .thTH, timeZone: .gmt) == "15 พฤษภาคม 2568")
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.longDate, locale: .guIN, timeZone: .gmt) == "15 મે, 2025")
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.longDate, locale: .urPK, timeZone: .gmt) == "15 مئی، 2025")
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.longDate, locale: .urIN, timeZone: .gmt) == "۱۵ مئی، ۲۰۲۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.longDate, locale: .paIN, timeZone: .gmt) == "15 ਮਈ 2025")
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.longDate, locale: .faIR, timeZone: .gmt) == "۲۵ اردیبهشت ۱۴۰۴")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.longDate, locale: .roRO, timeZone: .gmt) == "15 mai 2025")
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.longDate, locale: .ukUA, timeZone: .gmt) == "15 травня 2025 р.")
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.longDate, locale: .mlIN, timeZone: .gmt) == "2025, മേയ് 15")
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.longDate, locale: .knIN, timeZone: .gmt) == "ಮೇ 15, 2025")
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.longDate, locale: .myMM, timeZone: .gmt) == "၂၀၂၅၊ မေ ၁၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.longDate, locale: .amET, timeZone: .gmt) == "15 ሜይ 2025")
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.longDate, locale: .orIN, timeZone: .gmt) == "ମଇ 15, 2025")
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.longDate, locale: .azAZ, timeZone: .gmt) == "15 may 2025")
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.longDate, locale: .suID, timeZone: .gmt) == "15 Méi 2025")
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.longDate, locale: .haNG, timeZone: .gmt) == "15 Mayu, 2025")
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.longDate, locale: .yoNG, timeZone: .gmt) == "15 Ẹ̀bi 2025")
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.longDate, locale: .neNP, timeZone: .gmt) == "२०२५ मे १५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.longDate, locale: .siLK, timeZone: .gmt) == "2025 මැයි 15")
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.longDate, locale: .cebPH, timeZone: .gmt) == "Mayo 15, 2025")
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.longDate, locale: .srRS, timeZone: .gmt) == "15. мај 2025.")
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.longDate, locale: .svSE, timeZone: .gmt) == "15 maj 2025")
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.longDate, locale: .huHU, timeZone: .gmt) == "2025. május 15.")
        }
    }
    
    @Suite(".date")
    struct DateTests {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.date, locale: .zhCN, timeZone: .gmt) == "2025/5/15")
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.date, locale: .zhTW, timeZone: .gmt) == "2025/5/15")
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.date, locale: .enUS, timeZone: .gmt) == "5/15/25")
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.date, locale: .enGB, timeZone: .gmt) == "15/05/2025")
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.date, locale: .hiIN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.date, locale: .esES, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.date, locale: .esMX, timeZone: .gmt) == "15/05/25")
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.date, locale: .arEG, timeZone: .gmt) == "١٥‏/٥‏/٢٠٢٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.date, locale: .arSA, timeZone: .gmt) == "١٧ ذو. ق، ١٤٤٦ هـ")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.date, locale: .bnBD, timeZone: .gmt) == "১৫/৫/২৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.date, locale: .bnIN, timeZone: .gmt) == "১৫/৫/২৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.date, locale: .ptBR, timeZone: .gmt) == "15/05/2025")
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.date, locale: .ptPT, timeZone: .gmt) == "15/05/25")
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.date, locale: .ruRU, timeZone: .gmt) == "15.05.2025")
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.date, locale: .jaJP, timeZone: .gmt) == "2025/05/15")
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.date, locale: .deDE, timeZone: .gmt) == "15.05.25")
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.date, locale: .jvID, timeZone: .gmt) == "15-05-2025")
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.date, locale: .koKR, timeZone: .gmt) == "2025. 5. 15.")
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.date, locale: .frFR, timeZone: .gmt) == "15/05/2025")
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.date, locale: .frCA, timeZone: .gmt) == "2025-05-15")
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.date, locale: .trTR, timeZone: .gmt) == "15.05.2025")
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.date, locale: .viVN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.date, locale: .itIT, timeZone: .gmt) == "15/05/25")
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.date, locale: .plPL, timeZone: .gmt) == "15.05.2025")
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.date, locale: .taIN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.date, locale: .mrIN, timeZone: .gmt) == "१५/५/२५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.date, locale: .teIN, timeZone: .gmt) == "15-05-25")
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.date, locale: .thTH, timeZone: .gmt) == "15/5/68")
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.date, locale: .guIN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.date, locale: .urPK, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.date, locale: .urIN, timeZone: .gmt) == "۱۵/۵/۲۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.date, locale: .paIN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.date, locale: .faIR, timeZone: .gmt) == "۱۴۰۴/۲/۲۵")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.date, locale: .roRO, timeZone: .gmt) == "15.05.2025")
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.date, locale: .ukUA, timeZone: .gmt) == "15.05.25")
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.date, locale: .mlIN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.date, locale: .knIN, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.date, locale: .myMM, timeZone: .gmt) == "၁၅/၅/၂၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.date, locale: .amET, timeZone: .gmt) == "15/05/2025")
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.date, locale: .orIN, timeZone: .gmt) == "5/15/25")
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.date, locale: .azAZ, timeZone: .gmt) == "15.05.25")
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.date, locale: .suID, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.date, locale: .haNG, timeZone: .gmt) == "15/5/25")
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.date, locale: .yoNG, timeZone: .gmt) == "15/5/2025")
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.date, locale: .neNP, timeZone: .gmt) == "२५/५/१५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.date, locale: .siLK, timeZone: .gmt) == "2025-05-15")
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.date, locale: .cebPH, timeZone: .gmt) == "5/15/25")
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.date, locale: .srRS, timeZone: .gmt) == "15.5.25.")
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.date, locale: .svSE, timeZone: .gmt) == "2025-05-15")
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.date, locale: .huHU, timeZone: .gmt) == "2025. 05. 15.")
        }
    }
    
    @Suite(".time")
    struct TimeTests {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.time, locale: .zhCN, timeZone: .gmt) == "14:30")
        }

        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.time, locale: .zhTW, timeZone: .gmt) == "下午2:30")
        }

        @Test("en_US")
        func enUS() {
            #expect(sut(.time, locale: .enUS, timeZone: .gmt) == "2:30 PM")
        }

        @Test("en_GB")
        func enGB() {
            #expect(sut(.time, locale: .enGB, timeZone: .gmt) == "14:30")
        }

        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.time, locale: .hiIN, timeZone: .gmt) == "अ 2:30")
        }

        @Test("es_ES")
        func esES() {
            #expect(sut(.time, locale: .esES, timeZone: .gmt) == "14:30")
        }

        @Test("es_MX")
        func esMX() {
            #expect(sut(.time, locale: .esMX, timeZone: .gmt) == "2:30 p.m.")
        }

        @Test("ar_EG")
        func arEG() {
            #expect(sut(.time, locale: .arEG, timeZone: .gmt) == "٢:٣٠ م")
        }

        @Test("ar_SA")
        func arSA() {
            #expect(sut(.time, locale: .arSA, timeZone: .gmt) == "٢:٣٠ م")
        }

        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.time, locale: .bnBD, timeZone: .gmt) == "২:৩০ PM")
        }

        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.time, locale: .bnIN, timeZone: .gmt) == "২:৩০ PM")
        }

        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.time, locale: .ptBR, timeZone: .gmt) == "14:30")
        }

        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.time, locale: .ptPT, timeZone: .gmt) == "14:30")
        }

        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.time, locale: .ruRU, timeZone: .gmt) == "14:30")
        }

        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.time, locale: .jaJP, timeZone: .gmt) == "14:30")
        }

        @Test("de_DE")
        func deDE() {
            #expect(sut(.time, locale: .deDE, timeZone: .gmt) == "14:30")
        }

        @Test("jv_ID")
        func jvID() {
            #expect(sut(.time, locale: .jvID, timeZone: .gmt) == "14:30")
        }

        @Test("ko_KR")
        func koKR() {
            #expect(sut(.time, locale: .koKR, timeZone: .gmt) == "오후 2:30")
        }

        @Test("fr_FR")
        func frFR() {
            #expect(sut(.time, locale: .frFR, timeZone: .gmt) == "14:30")
        }

        @Test("fr_CA")
        func frCA() {
            #expect(sut(.time, locale: .frCA, timeZone: .gmt) == "14:30")
        }

        @Test("tr_TR")
        func trTR() {
            #expect(sut(.time, locale: .trTR, timeZone: .gmt) == "14:30")
        }

        @Test("vi_VN")
        func viVN() {
            #expect(sut(.time, locale: .viVN, timeZone: .gmt) == "14:30")
        }

        @Test("it_IT")
        func itIT() {
            #expect(sut(.time, locale: .itIT, timeZone: .gmt) == "14:30")
        }

        @Test("pl_PL")
        func plPL() {
            #expect(sut(.time, locale: .plPL, timeZone: .gmt) == "14:30")
        }

        @Test("ta_IN")
        func taIN() {
            #expect(sut(.time, locale: .taIN, timeZone: .gmt) == "பிற்பகல் 2:30")
        }

        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.time, locale: .mrIN, timeZone: .gmt) == "२:३० PM")
        }

        @Test("te_IN")
        func teIN() {
            #expect(sut(.time, locale: .teIN, timeZone: .gmt) == "2:30 PM")
        }

        @Test("th_TH")
        func thTH() {
            #expect(sut(.time, locale: .thTH, timeZone: .gmt) == "14:30")
        }

        @Test("gu_IN")
        func guIN() {
            #expect(sut(.time, locale: .guIN, timeZone: .gmt) == "02:30 PM")
        }

        @Test("ur_PK")
        func urPK() {
            #expect(sut(.time, locale: .urPK, timeZone: .gmt) == "2:30 ب.د.")
        }

        @Test("ur_IN")
        func urIN() {
            #expect(sut(.time, locale: .urIN, timeZone: .gmt) == "۲:۳۰ ب.د.")
        }

        @Test("pa_IN")
        func paIN() {
            #expect(sut(.time, locale: .paIN, timeZone: .gmt) == "2:30 ਬਾ.ਦੁ.")
        }

        @Test("fa_IR")
        func faIR() {
            #expect(sut(.time, locale: .faIR, timeZone: .gmt) == "۱۴:۳۰")
        }

        @Test("ro_RO")
        func roRO() {
            #expect(sut(.time, locale: .roRO, timeZone: .gmt) == "14:30")
        }

        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.time, locale: .ukUA, timeZone: .gmt) == "14:30")
        }

        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.time, locale: .mlIN, timeZone: .gmt) == "2:30 PM")
        }

        @Test("kn_IN")
        func knIN() {
            #expect(sut(.time, locale: .knIN, timeZone: .gmt) == "02:30 ಅಪರಾಹ್ನ")
        }

        @Test("my_MM")
        func myMM() {
            #expect(sut(.time, locale: .myMM, timeZone: .gmt) == "၁၄:၃၀")
        }

        @Test("am_ET")
        func amET() {
            #expect(sut(.time, locale: .amET, timeZone: .gmt) == "2:30 ከሰዓት")
        }

        @Test("or_IN")
        func orIN() {
            #expect(sut(.time, locale: .orIN, timeZone: .gmt) == "2:30 PM")
        }

        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.time, locale: .azAZ, timeZone: .gmt) == "14:30")
        }

        @Test("su_ID")
        func suID() {
            #expect(sut(.time, locale: .suID, timeZone: .gmt) == "14.30")
        }

        @Test("ha_NG")
        func haNG() {
            #expect(sut(.time, locale: .haNG, timeZone: .gmt) == "14:30")
        }

        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.time, locale: .yoNG, timeZone: .gmt) == "14:30")
        }

        @Test("ne_NP")
        func neNP() {
            #expect(sut(.time, locale: .neNP, timeZone: .gmt) == "१४:३०")
        }

        @Test("si_LK")
        func siLK() {
            #expect(sut(.time, locale: .siLK, timeZone: .gmt) == "14.30")
        }

        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.time, locale: .cebPH, timeZone: .gmt) == "2:30 PM")
        }

        @Test("sr_RS")
        func srRS() {
            #expect(sut(.time, locale: .srRS, timeZone: .gmt) == "14:30")
        }

        @Test("sv_SE")
        func svSE() {
            #expect(sut(.time, locale: .svSE, timeZone: .gmt) == "14:30")
        }

        @Test("hu_HU")
        func huHU() {
            #expect(sut(.time, locale: .huHU, timeZone: .gmt) == "14:30")
        }
    }
    
    @Suite(".dateTime")
    struct DateTimeTests {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.dateTime, locale: .zhCN, timeZone: .saoPaulo) == "2025/5/15 14:30")
        }

        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.dateTime, locale: .zhTW, timeZone: .gmt) == "2025/5/15 下午2:30")
        }

        @Test("en_US")
        func enUS() {
            #expect(sut(.dateTime, locale: .enUS, timeZone: .gmt) == "5/15/25, 2:30 PM")
        }

        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.dateTime, locale: .hiIN, timeZone: .gmt) == "15/5/25, अ 2:30")
        }

        @Test("es_ES")
        func esES() {
            #expect(sut(.dateTime, locale: .esES, timeZone: .gmt) == "15/5/25, 14:30")
        }

        @Test("es_MX")
        func esMX() {
            #expect(sut(.dateTime, locale: .esMX, timeZone: .gmt) == "15/05/25, 2:30 p.m.")
        }

        @Test("ar_EG")
        func arEG() {
            #expect(sut(.dateTime, locale: .arEG, timeZone: .gmt) == "١٥‏/٥‏/٢٠٢٥، ٢:٣٠ م")
        }

        @Test("ar_SA")
        func arSA() {
            #expect(sut(.dateTime, locale: .arSA, timeZone: .gmt) == "١٧ ذو. ق، ١٤٤٦ هـ، ٢:٣٠ م")
        }

        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.dateTime, locale: .bnBD, timeZone: .gmt) == "১৫/৫/২৫, ২:৩০ PM")
        }

        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.dateTime, locale: .bnIN, timeZone: .gmt) == "১৫/৫/২৫, ২:৩০ PM")
        }

        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.dateTime, locale: .ptBR, timeZone: .gmt) == "15/05/2025, 14:30")
        }

        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.dateTime, locale: .ptPT, timeZone: .gmt) == "15/05/25, 14:30")
        }

        @Test("jv_ID")
        func jvID() {
            #expect(sut(.dateTime, locale: .jvID, timeZone: .gmt) == "15-05-2025, 14:30")
        }

        @Test("ko_KR")
        func koKR() {
            #expect(sut(.dateTime, locale: .koKR, timeZone: .gmt) == "2025. 5. 15. 오후 2:30")
        }

        @Test("vi_VN")
        func viVN() {
            #expect(sut(.dateTime, locale: .viVN, timeZone: .gmt) == "14:30 15/5/25")
        }

        @Test("it_IT")
        func itIT() {
            #expect(sut(.dateTime, locale: .itIT, timeZone: .gmt) == "15/05/25, 14:30")
        }

        @Test("ta_IN")
        func taIN() {
            #expect(sut(.dateTime, locale: .taIN, timeZone: .gmt) == "15/5/25, பிற்பகல் 2:30")
        }

        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.dateTime, locale: .mrIN, timeZone: .gmt) == "१५/५/२५, २:३० PM")
        }

        @Test("te_IN")
        func teIN() {
            #expect(sut(.dateTime, locale: .teIN, timeZone: .gmt) == "15-05-25 2:30 PM")
        }

        @Test("th_TH")
        func thTH() {
            #expect(sut(.dateTime, locale: .thTH, timeZone: .gmt) == "15/5/68 14:30")
        }

        @Test("gu_IN")
        func guIN() {
            #expect(sut(.dateTime, locale: .guIN, timeZone: .gmt) == "15/5/25 02:30 PM")
        }

        @Test("ur_PK")
        func urPK() {
            #expect(sut(.dateTime, locale: .urPK, timeZone: .gmt) == "15/5/25، 2:30 ب.د.")
        }

        @Test("ur_IN")
        func urIN() {
            #expect(sut(.dateTime, locale: .urIN, timeZone: .gmt) == "۱۵/۵/۲۵، ۲:۳۰ ب.د.")
        }

        @Test("pa_IN")
        func paIN() {
            #expect(sut(.dateTime, locale: .paIN, timeZone: .gmt) == "15/5/25, 2:30 ਬਾ.ਦੁ.")
        }

        @Test("fa_IR")
        func faIR() {
            #expect(sut(.dateTime, locale: .faIR, timeZone: .gmt) == "۱۴۰۴/۲/۲۵, ۱۴:۳۰")
        }

        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.dateTime, locale: .mlIN, timeZone: .gmt) == "15/5/25 2:30 PM")
        }

        @Test("kn_IN")
        func knIN() {
            #expect(sut(.dateTime, locale: .knIN, timeZone: .gmt) == "15/5/25, 02:30 ಅಪರಾಹ್ನ")
        }

        @Test("my_MM")
        func myMM() {
            #expect(sut(.dateTime, locale: .myMM, timeZone: .gmt) == "၁၅/၅/၂၅ ၁၄:၃၀")
        }

        @Test("am_ET")
        func amET() {
            #expect(sut(.dateTime, locale: .amET, timeZone: .gmt) == "15/05/2025 2:30 ከሰዓት")
        }

        @Test("or_IN")
        func orIN() {
            #expect(sut(.dateTime, locale: .orIN, timeZone: .gmt) == "5/15/25, 2:30 PM")
        }

        @Test("su_ID")
        func suID() {
            #expect(sut(.dateTime, locale: .suID, timeZone: .gmt) == "15/5/25, 14.30")
        }

        @Test("ha_NG")
        func haNG() {
            #expect(sut(.dateTime, locale: .haNG, timeZone: .gmt) == "15/5/25, 14:30")
        }

        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.dateTime, locale: .yoNG, timeZone: .gmt) == "15/5/2025, 14:30")
        }

        @Test("ne_NP")
        func neNP() {
            #expect(sut(.dateTime, locale: .neNP, timeZone: .gmt) == "२५/५/१५, १४:३०")
        }

        @Test("si_LK")
        func siLK() {
            #expect(sut(.dateTime, locale: .siLK, timeZone: .gmt) == "2025-05-15, 14.30")
        }

        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.dateTime, locale: .cebPH, timeZone: .gmt) == "5/15/25, 2:30 PM")
        }

        @Test("sr_RS")
        func srRS() {
            #expect(sut(.dateTime, locale: .srRS, timeZone: .gmt) == "15.5.25. 14:30")
        }

        @Test("hu_HU")
        func huHU() {
            #expect(sut(.dateTime, locale: .huHU, timeZone: .gmt) == "2025. 05. 15. 14:30")
        }
    }
    
    @Suite(".iso8601")
    struct Iso8601Tests {
        private let sutProp = DateFormatter.iso8601
        
        @Test("formatOutput")
        func formatOutput() {
            #expect(sut(sutProp) == "2025-05-15T14:30:00Z")
        }

        @Test("calendarIsISO8601")
        func calendarIsISO8601() {
            #expect(sutProp.calendar.identifier == .iso8601)
        }

        @Test("timeZoneIsUTC")
        func timeZoneIsUTC() {
            #expect(sutProp.timeZone.secondsFromGMT() == 0)
        }

        @Test("localeIsEnUSPOSIX")
        func localeIsEnUSPOSIX() {
            #expect(sutProp.locale.identifier == "en_US_POSIX")
        }

        @Test("dateFormatCorrect")
        func dateFormatCorrect() {
            #expect(sutProp.dateFormat == "yyyy-MM-dd'T'HH:mm:ssXXXXX")
        }
    }
    
    @Suite(".logTimestamp")
    struct LogTimestampTests {
        private let sutProp = DateFormatter.timestamp
        
        @Test("formatOutput")
        func formatOutput() {
            #expect(sut(sutProp) == "2025-05-15 14:30:00")
        }

        @Test("localeIsEnUSPOSIX")
        func localeIsEnUSPOSIX() {
            #expect(sutProp.locale.identifier == "en_US_POSIX")
        }

        @Test("dateFormatCorrect")
        func dateFormatCorrect() {
            #expect(sutProp.dateFormat == "yyyy-MM-dd HH:mm:ss")
        }
    }
    
    @Suite(".custom")
    struct CustomFormatterTests {
        
        @Test("formatOutput")
        func formatOutput() {
            let pattern = "MMM yyyy"
            let formatter = DateFormatter.custom(pattern)
            #expect(sut(formatter) == "May 2025")
        }
        
        @Test("dateFormatIsSetCorrectly")
        func dateFormatIsSetCorrectly() {
            let pattern = "yyyy/MM/dd HH:mm"
            let formatter = DateFormatter.custom(pattern)
            #expect(formatter.dateFormat == pattern)
        }
    }
    
    private static func sut(_ f: DateFormatter, locale: Locale = .enUS, timeZone: TimeZone = .gmt) -> String {
        let date = Date(year: 2025, month: 5, day: 15, hour: 14, minute: 30, calendar: .gregorian, timeZone: timeZone)!
        return date.formatted(using: f, locale: locale, timeZone: timeZone)
    }
}
