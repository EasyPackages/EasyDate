import Testing
import Foundation

@testable import EasyDate

@Suite("DateFormatter")
struct DateFormatterExtensionTests {
    
    @Test("Supports 50 major locales")
    func dayMonthAcrossLocales() {
        let locales: [String] = [
            "zh_CN", "zh_TW", "en_US", "en_GB", "hi_IN", "es_ES", "es_MX", "ar_EG", "ar_SA", "bn_BD",
            "bn_IN", "pt_BR", "pt_PT", "ru_RU", "ja_JP", "de_DE", "jv_ID", "ko_KR", "fr_FR", "fr_CA",
            "tr_TR", "vi_VN", "it_IT", "pl_PL", "ta_IN", "mr_IN", "te_IN", "th_TH", "gu_IN", "ur_PK",
            "ur_IN", "pa_IN", "fa_IR", "ro_RO", "uk_UA", "ml_IN", "kn_IN", "my_MM", "am_ET", "or_IN",
            "az_AZ", "su_ID", "ha_NG", "yo_NG", "ne_NP", "si_LK", "ceb_PH", "sr_RS", "sv_SE", "hu_HU"
        ]
        
        for code in locales {
            let locale = Locale(identifier: code)
            let result = Self.sut(.dayMonth(locale: locale))
            #expect(!result.isEmpty, "Expected non-empty result for \(code)")
            #expect(result.contains("15") || result.rangeOfCharacter(from: .decimalDigits) != nil,
                    "Expected '15' or digits in output for \(code): \(result)")
        }
    }
    
    @Test("Month and year formats across locales")
    func monthYearAcrossLocales() {
        let locales: [String] = [
            "zh_CN", "zh_TW", "en_US", "en_GB", "hi_IN", "es_ES", "es_MX", "ar_EG", "ar_SA", "bn_BD",
            "bn_IN", "pt_BR", "pt_PT", "ru_RU", "ja_JP", "de_DE", "jv_ID", "ko_KR", "fr_FR", "fr_CA",
            "tr_TR", "vi_VN", "it_IT", "pl_PL", "ta_IN", "mr_IN", "te_IN", "th_TH", "gu_IN", "ur_PK",
            "ur_IN", "pa_IN", "fa_IR", "ro_RO", "uk_UA", "ml_IN", "kn_IN", "my_MM", "am_ET", "or_IN",
            "az_AZ", "su_ID", "ha_NG", "yo_NG", "ne_NP", "si_LK", "ceb_PH", "sr_RS", "sv_SE", "hu_HU"
        ]
        
        for code in locales {
            let locale = Locale(identifier: code)
            let result = Self.sut(.monthYear(locale: locale))
            #expect(!result.isEmpty, "Expected non-empty result for \(code)")
            #expect(result.contains("2025") || result.rangeOfCharacter(from: .decimalDigits) != nil,
                    "Expected year or digits in output for \(code): \(result)")
        }
    }
    
    @Test("Weekday formats across locales")
    func weekdayAcrossLocales() {
        let locales: [String] = [
            "zh_CN", "zh_TW", "en_US", "en_GB", "hi_IN", "es_ES", "es_MX", "ar_EG", "ar_SA", "bn_BD",
            "bn_IN", "pt_BR", "pt_PT", "ru_RU", "ja_JP", "de_DE", "jv_ID", "ko_KR", "fr_FR", "fr_CA",
            "tr_TR", "vi_VN", "it_IT", "pl_PL", "ta_IN", "mr_IN", "te_IN", "th_TH", "gu_IN", "ur_PK",
            "ur_IN", "pa_IN", "fa_IR", "ro_RO", "uk_UA", "ml_IN", "kn_IN", "my_MM", "am_ET", "or_IN",
            "az_AZ", "su_ID", "ha_NG", "yo_NG", "ne_NP", "si_LK", "ceb_PH", "sr_RS", "sv_SE", "hu_HU"
        ]
        
        for code in locales {
            let locale = Locale(identifier: code)
            let result = Self.sut(.weekday(locale: locale))
            #expect(!result.isEmpty, "Expected non-empty result for \(code)")
            #expect(result.rangeOfCharacter(from: CharacterSet.letters) != nil,
                    "Expected textual weekday output for \(code): \(result)")
        }
    }
    
    @Suite(".yearOnly")
    struct YearOnlyTests {
        let yearNumber = "2025"
        
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.yearOnly(locale: .zhCN)) == yearNumber)
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.yearOnly(locale: .zhTW)) == yearNumber)
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.yearOnly(locale: .enUS)) == yearNumber)
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.yearOnly(locale: .enGB)) == yearNumber)
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.yearOnly(locale: .hiIN)) == yearNumber)
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.yearOnly(locale: .esES)) == yearNumber)
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.yearOnly(locale: .esMX)) == yearNumber)
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.yearOnly(locale: .arEG)) == "٢٠٢٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.yearOnly(locale: .arSA)) == "١٤٤٦")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.yearOnly(locale: .bnBD)) == "২০২৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.yearOnly(locale: .bnIN)) == "২০২৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.yearOnly(locale: .ptBR)) == yearNumber)
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.yearOnly(locale: .ptPT)) == yearNumber)
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.yearOnly(locale: .ruRU)) == yearNumber)
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.yearOnly(locale: .jaJP)) == yearNumber)
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.yearOnly(locale: .deDE)) == yearNumber)
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.yearOnly(locale: .jvID)) == yearNumber)
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.yearOnly(locale: .koKR)) == yearNumber)
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.yearOnly(locale: .frFR)) == yearNumber)
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.yearOnly(locale: .frCA)) == yearNumber)
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.yearOnly(locale: .trTR)) == yearNumber)
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.yearOnly(locale: .viVN)) == yearNumber)
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.yearOnly(locale: .itIT)) == yearNumber)
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.yearOnly(locale: .plPL)) == yearNumber)
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.yearOnly(locale: .taIN)) == yearNumber)
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.yearOnly(locale: .mrIN)) == "२०२५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.yearOnly(locale: .teIN)) == yearNumber)
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.yearOnly(locale: .thTH)) == "2568")
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.yearOnly(locale: .guIN)) == yearNumber)
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.yearOnly(locale: .urPK)) == yearNumber)
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.yearOnly(locale: .urIN)) == "۲۰۲۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.yearOnly(locale: .paIN)) == yearNumber)
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.yearOnly(locale: .faIR)) == "۱۴۰۴")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.yearOnly(locale: .roRO)) == yearNumber)
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.yearOnly(locale: .ukUA)) == yearNumber)
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.yearOnly(locale: .mlIN)) == yearNumber)
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.yearOnly(locale: .knIN)) == yearNumber)
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.yearOnly(locale: .myMM)) == "၂၀၂၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.yearOnly(locale: .amET)) == yearNumber)
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.yearOnly(locale: .orIN)) == yearNumber)
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.yearOnly(locale: .azAZ)) == yearNumber)
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.yearOnly(locale: .suID)) == yearNumber)
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.yearOnly(locale: .haNG)) == yearNumber)
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.yearOnly(locale: .yoNG)) == yearNumber)
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.yearOnly(locale: .neNP)) == "२०२५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.yearOnly(locale: .siLK)) == yearNumber)
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.yearOnly(locale: .cebPH)) == yearNumber)
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.yearOnly(locale: .srRS)) == yearNumber)
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.yearOnly(locale: .svSE)) == yearNumber)
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.yearOnly(locale: .huHU)) == yearNumber)
        }
    }
    
    @Suite(".monthNumber")
    struct MonthNumberTests {
        let monthNumber = "05"
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.monthNumber(locale: .zhCN)) == monthNumber)
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.monthNumber(locale: .zhTW)) == monthNumber)
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.monthNumber(locale: .enUS)) == monthNumber)
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.monthNumber(locale: .enGB)) == monthNumber)
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.monthNumber(locale: .hiIN)) == monthNumber)
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.monthNumber(locale: .esES)) == monthNumber)
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.monthNumber(locale: .esMX)) == monthNumber)
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.monthNumber(locale: .arEG)) == "٠٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.monthNumber(locale: .arSA)) == "١١")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.monthNumber(locale: .bnBD)) == "০৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.monthNumber(locale: .bnIN)) == "০৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.monthNumber(locale: .ptBR)) == monthNumber)
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.monthNumber(locale: .ptPT)) == monthNumber)
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.monthNumber(locale: .ruRU)) == monthNumber)
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.monthNumber(locale: .jaJP)) == monthNumber)
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.monthNumber(locale: .deDE)) == monthNumber)
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.monthNumber(locale: .jvID)) == monthNumber)
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.monthNumber(locale: .koKR)) == monthNumber)
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.monthNumber(locale: .frFR)) == monthNumber)
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.monthNumber(locale: .frCA)) == monthNumber)
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.monthNumber(locale: .trTR)) == monthNumber)
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.monthNumber(locale: .viVN)) == monthNumber)
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.monthNumber(locale: .itIT)) == monthNumber)
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.monthNumber(locale: .plPL)) == monthNumber)
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.monthNumber(locale: .taIN)) == monthNumber)
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.monthNumber(locale: .mrIN)) == "०५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.monthNumber(locale: .teIN)) == monthNumber)
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.monthNumber(locale: .thTH)) == monthNumber)
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.monthNumber(locale: .guIN)) == monthNumber)
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.monthNumber(locale: .urPK)) == monthNumber)
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.monthNumber(locale: .urIN)) == "۰۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.monthNumber(locale: .paIN)) == monthNumber)
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.monthNumber(locale: .faIR)) == "۰۲")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.monthNumber(locale: .roRO)) == monthNumber)
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.monthNumber(locale: .ukUA)) == monthNumber)
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.monthNumber(locale: .mlIN)) == monthNumber)
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.monthNumber(locale: .knIN)) == monthNumber)
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.monthNumber(locale: .myMM)) == "၀၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.monthNumber(locale: .amET)) == monthNumber)
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.monthNumber(locale: .orIN)) == monthNumber)
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.monthNumber(locale: .azAZ)) == monthNumber)
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.monthNumber(locale: .suID)) == monthNumber)
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.monthNumber(locale: .haNG)) == monthNumber)
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.monthNumber(locale: .yoNG)) == monthNumber)
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.monthNumber(locale: .neNP)) == "०५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.monthNumber(locale: .siLK)) == monthNumber)
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.monthNumber(locale: .cebPH)) == monthNumber)
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.monthNumber(locale: .srRS)) == monthNumber)
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.monthNumber(locale: .svSE)) == monthNumber)
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.monthNumber(locale: .huHU)) == monthNumber)
        }
    }
    
    @Suite(".day")
    struct DayTests {
        let dayNumber = "15"
        
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.day(locale: .zhCN)) == dayNumber)
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.day(locale: .zhTW)) == dayNumber)
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.day(locale: .enUS)) == dayNumber)
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.day(locale: .enGB)) == dayNumber)
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.day(locale: .hiIN)) == dayNumber)
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.day(locale: .esES)) == dayNumber)
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.day(locale: .esMX)) == dayNumber)
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.day(locale: .arEG)) == "١٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.day(locale: .arSA)) == "١٧")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.day(locale: .bnBD)) == "১৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.day(locale: .bnIN)) == "১৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.day(locale: .ptBR)) == dayNumber)
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.day(locale: .ptPT)) == dayNumber)
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.day(locale: .ruRU)) == dayNumber)
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.day(locale: .jaJP)) == dayNumber)
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.day(locale: .deDE)) == dayNumber)
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.day(locale: .jvID)) == dayNumber)
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.day(locale: .koKR)) == dayNumber)
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.day(locale: .frFR)) == dayNumber)
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.day(locale: .frCA)) == dayNumber)
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.day(locale: .trTR)) == dayNumber)
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.day(locale: .viVN)) == dayNumber)
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.day(locale: .itIT)) == dayNumber)
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.day(locale: .plPL)) == dayNumber)
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.day(locale: .taIN)) == dayNumber)
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.day(locale: .mrIN)) == "१५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.day(locale: .teIN)) == dayNumber)
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.day(locale: .thTH)) == dayNumber)
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.day(locale: .guIN)) == dayNumber)
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.day(locale: .urPK)) == dayNumber)
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.day(locale: .urIN)) == "۱۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.day(locale: .paIN)) == dayNumber)
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.day(locale: .faIR)) == "۲۵")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.day(locale: .roRO)) == dayNumber)
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.day(locale: .ukUA)) == dayNumber)
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.day(locale: .mlIN)) == dayNumber)
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.day(locale: .knIN)) == dayNumber)
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.day(locale: .myMM)) == "၁၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.day(locale: .amET)) == dayNumber)
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.day(locale: .orIN)) == dayNumber)
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.day(locale: .azAZ)) == dayNumber)
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.day(locale: .suID)) == dayNumber)
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.day(locale: .haNG)) == dayNumber)
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.day(locale: .yoNG)) == dayNumber)
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.day(locale: .neNP)) == "१५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.day(locale: .siLK)) == dayNumber)
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.day(locale: .cebPH)) == dayNumber)
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.day(locale: .srRS)) == dayNumber)
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.day(locale: .svSE)) == dayNumber)
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.day(locale: .huHU)) == dayNumber)
        }
    }
    
    @Suite(".monthYear")
    struct MonthYearTests {
        
        @Test("zhCN")
        func zhCN() {
            #expect(sut(.monthYear(locale: .zhCN)) == "五月 2025")
        }
        
        @Test("zhTW")
        func zhTW() {
            #expect(sut(.monthYear(locale: .zhTW)) == "5月 2025")
        }
        
        @Test("enUS")
        func enUS() {
            #expect(sut(.monthYear(locale: .enUS)) == "May 2025")
        }
        
        @Test("enGB")
        func enGB() {
            #expect(sut(.monthYear(locale: .enGB)) == "May 2025")
        }
        
        @Test("hiIN")
        func hiIN() {
            #expect(sut(.monthYear(locale: .hiIN)) == "मई 2025")
        }
        
        @Test("esES")
        func esES() {
            #expect(sut(.monthYear(locale: .esES)) == "mayo 2025")
        }
        
        @Test("esMX")
        func esMX() {
            #expect(sut(.monthYear(locale: .esMX)) == "mayo 2025")
        }
        
        @Test("arEG")
        func arEG() {
            #expect(sut(.monthYear(locale: .arEG)) == "مايو ٢٠٢٥")
        }
        
        @Test("arSA")
        func arSA() {
            #expect(sut(.monthYear(locale: .arSA)) == "ذو القعدة ١٤٤٦")
        }
        
        @Test("bnBD")
        func bnBD() {
            #expect(sut(.monthYear(locale: .bnBD)) == "মে ২০২৫")
        }
        
        @Test("bnIN")
        func bnIN() {
            #expect(sut(.monthYear(locale: .bnIN)) == "মে ২০২৫")
        }
        
        @Test("ptBR")
        func ptBR() {
            #expect(sut(.monthYear(locale: .ptBR)) == "maio 2025")
        }
        
        @Test("ptPT")
        func ptPT() {
            #expect(sut(.monthYear(locale: .ptPT)) == "maio 2025")
        }
        
        @Test("ruRU")
        func ruRU() {
            #expect(sut(.monthYear(locale: .ruRU)) == "май 2025")
        }
        
        @Test("jaJP")
        func jaJP() {
            #expect(sut(.monthYear(locale: .jaJP)) == "5月 2025")
        }
        
        @Test("deDE")
        func deDE() {
            #expect(sut(.monthYear(locale: .deDE)) == "Mai 2025")
        }
        
        @Test("jvID")
        func jvID() {
            #expect(sut(.monthYear(locale: .jvID)) == "Mei 2025")
        }
        
        @Test("koKR")
        func koKR() {
            #expect(sut(.monthYear(locale: .koKR)) == "5월 2025")
        }
        
        @Test("frFR")
        func frFR() {
            #expect(sut(.monthYear(locale: .frFR)) == "mai 2025")
        }
        
        @Test("frCA")
        func frCA() {
            #expect(sut(.monthYear(locale: .frCA)) == "mai 2025")
        }
        
        @Test("trTR")
        func trTR() {
            #expect(sut(.monthYear(locale: .trTR)) == "Mayıs 2025")
        }
        
        @Test("viVN")
        func viVN() {
            #expect(sut(.monthYear(locale: .viVN)) == "Tháng 5 2025")
        }
        
        @Test("itIT")
        func itIT() {
            #expect(sut(.monthYear(locale: .itIT)) == "maggio 2025")
        }
        
        @Test("plPL")
        func plPL() {
            #expect(sut(.monthYear(locale: .plPL)) == "maj 2025")
        }
        
        @Test("taIN")
        func taIN() {
            #expect(sut(.monthYear(locale: .taIN)) == "மே 2025")
        }
        
        @Test("mrIN")
        func mrIN() {
            #expect(sut(.monthYear(locale: .mrIN)) == "मे २०२५")
        }
        
        @Test("teIN")
        func teIN() {
            #expect(sut(.monthYear(locale: .teIN)) == "మే 2025")
        }
        
        @Test("thTH")
        func thTH() {
            #expect(sut(.monthYear(locale: .thTH)) == "พฤษภาคม 2568")
        }
        
        @Test("guIN")
        func guIN() {
            #expect(sut(.monthYear(locale: .guIN)) == "મે 2025")
        }
        
        @Test("urPK")
        func urPK() {
            #expect(sut(.monthYear(locale: .urPK)) == "مئی 2025")
        }
        
        @Test("urIN")
        func urIN() {
            #expect(sut(.monthYear(locale: .urIN)) == "مئی ۲۰۲۵")
        }
        
        @Test("paIN")
        func paIN() {
            #expect(sut(.monthYear(locale: .paIN)) == "ਮਈ 2025")
        }
        
        @Test("faIR")
        func faIR() {
            #expect(sut(.monthYear(locale: .faIR)) == "اردیبهشت ۱۴۰۴")
        }
        
        @Test("roRO")
        func roRO() {
            #expect(sut(.monthYear(locale: .roRO)) == "mai 2025")
        }
        
        @Test("ukUA")
        func ukUA() {
            #expect(sut(.monthYear(locale: .ukUA)) == "травень 2025")
        }
        
        @Test("mlIN")
        func mlIN() {
            #expect(sut(.monthYear(locale: .mlIN)) == "മേയ് 2025")
        }
        
        @Test("knIN")
        func knIN() {
            #expect(sut(.monthYear(locale: .knIN)) == "ಮೇ 2025")
        }
        
        @Test("myMM")
        func myMM() {
            #expect(sut(.monthYear(locale: .myMM)) == "မေ ၂၀၂၅")
        }
        
        @Test("amET")
        func amET() {
            #expect(sut(.monthYear(locale: .amET)) == "ሜይ 2025")
        }
        
        @Test("orIN")
        func orIN() {
            #expect(sut(.monthYear(locale: .orIN)) == "ମଇ 2025")
        }
        
        @Test("azAZ")
        func azAZ() {
            #expect(sut(.monthYear(locale: .azAZ)) == "may 2025")
        }
        
        @Test("suID")
        func suID() {
            #expect(sut(.monthYear(locale: .suID)) == "Méi 2025")
        }
        
        @Test("haNG")
        func haNG() {
            #expect(sut(.monthYear(locale: .haNG)) == "Mayu 2025")
        }
        
        @Test("yoNG")
        func yoNG() {
            #expect(sut(.monthYear(locale: .yoNG)) == "Ẹ̀bibi 2025")
        }
        
        @Test("neNP")
        func neNP() {
            #expect(sut(.monthYear(locale: .neNP)) == "मे २०२५")
        }
        
        @Test("siLK")
        func siLK() {
            #expect(sut(.monthYear(locale: .siLK)) == "මැයි 2025")
        }
        
        @Test("cebPH")
        func cebPH() {
            #expect(sut(.monthYear(locale: .cebPH)) == "Mayo 2025")
        }
        
        @Test("srRS")
        func srRS() {
            #expect(sut(.monthYear(locale: .srRS)) == "мај 2025")
        }
        
        @Test("svSE")
        func svSE() {
            #expect(sut(.monthYear(locale: .svSE)) == "maj 2025")
        }
        
        @Test("huHU")
        func huHU() {
            #expect(sut(.monthYear(locale: .huHU)) == "május 2025")
        }
    }
    
    @Suite(".weekday")
    struct WeekdayTests {
        
        @Test("zhCN")
        func zhCN() {
            #expect(sut(.weekday(locale: .zhCN)) == "星期四")
        }
        
        @Test("zhTW")
        func zhTW() {
            #expect(sut(.weekday(locale: .zhTW)) == "星期四")
        }
        
        @Test("enUS")
        func enUS() {
            #expect(sut(.weekday(locale: .enUS)) == "Thursday")
        }
        
        @Test("enGB")
        func enGB() {
            #expect(sut(.weekday(locale: .enGB)) == "Thursday")
        }
        
        @Test("hiIN")
        func hiIN() {
            #expect(sut(.weekday(locale: .hiIN)) == "गुरुवार")
        }
        
        @Test("esES")
        func esES() {
            #expect(sut(.weekday(locale: .esES)) == "jueves")
        }
        
        @Test("esMX")
        func esMX() {
            #expect(sut(.weekday(locale: .esMX)) == "jueves")
        }
        
        @Test("arEG")
        func arEG() {
            #expect(sut(.weekday(locale: .arEG)) == "الخميس")
        }
        
        @Test("arSA")
        func arSA() {
            #expect(sut(.weekday(locale: .arSA)) == "الخميس")
        }
        
        @Test("bnBD")
        func bnBD() {
            #expect(sut(.weekday(locale: .bnBD)) == "বৃহস্পতিবার")
        }
        
        @Test("bnIN")
        func bnIN() {
            #expect(sut(.weekday(locale: .bnIN)) == "বৃহস্পতিবার")
        }
        
        @Test("ptBR")
        func ptBR() {
            #expect(sut(.weekday(locale: .ptBR)) == "quinta-feira")
        }
        
        @Test("ptPT")
        func ptPT() {
            #expect(sut(.weekday(locale: .ptPT)) == "quinta-feira")
        }
        
        @Test("ruRU")
        func ruRU() {
            #expect(sut(.weekday(locale: .ruRU)) == "четверг")
        }
        
        @Test("jaJP")
        func jaJP() {
            #expect(sut(.weekday(locale: .jaJP)) == "木曜日")
        }
        
        @Test("deDE")
        func deDE() {
            #expect(sut(.weekday(locale: .deDE)) == "Donnerstag")
        }
        
        @Test("jvID")
        func jvID() {
            #expect(sut(.weekday(locale: .jvID)) == "Kamis")
        }
        
        @Test("koKR")
        func koKR() {
            #expect(sut(.weekday(locale: .koKR)) == "목요일")
        }
        
        @Test("frFR")
        func frFR() {
            #expect(sut(.weekday(locale: .frFR)) == "jeudi")
        }
        
        @Test("frCA")
        func frCA() {
            #expect(sut(.weekday(locale: .frCA)) == "jeudi")
        }
        
        @Test("trTR")
        func trTR() {
            #expect(sut(.weekday(locale: .trTR)) == "Perşembe")
        }
        
        @Test("viVN")
        func viVN() {
            #expect(sut(.weekday(locale: .viVN)) == "Thứ Năm")
        }
        
        @Test("itIT")
        func itIT() {
            #expect(sut(.weekday(locale: .itIT)) == "giovedì")
        }
        
        @Test("plPL")
        func plPL() {
            #expect(sut(.weekday(locale: .plPL)) == "czwartek")
        }
        
        @Test("taIN")
        func taIN() {
            #expect(sut(.weekday(locale: .taIN)) == "வியாழன்")
        }
        
        @Test("mrIN")
        func mrIN() {
            #expect(sut(.weekday(locale: .mrIN)) == "गुरुवार")
        }
        
        @Test("teIN")
        func teIN() {
            #expect(sut(.weekday(locale: .teIN)) == "గురువారం")
        }
        
        @Test("thTH")
        func thTH() {
            #expect(sut(.weekday(locale: .thTH)) == "วันพฤหัสบดี")
        }
        
        @Test("guIN")
        func guIN() {
            #expect(sut(.weekday(locale: .guIN)) == "ગુરુવાર")
        }
        
        @Test("urPK")
        func urPK() {
            #expect(sut(.weekday(locale: .urPK)) == "جمعرات")
        }
        
        @Test("urIN")
        func urIN() {
            #expect(sut(.weekday(locale: .urIN)) == "جمعرات")
        }
        
        @Test("paIN")
        func paIN() {
            #expect(sut(.weekday(locale: .paIN)) == "ਵੀਰਵਾਰ")
        }
        
        @Test("faIR")
        func faIR() {
            #expect(sut(.weekday(locale: .faIR)) == "پنجشنبه")
        }
        
        @Test("roRO")
        func roRO() {
            #expect(sut(.weekday(locale: .roRO)) == "joi")
        }
        
        @Test("ukUA")
        func ukUA() {
            #expect(sut(.weekday(locale: .ukUA)) == "четвер")
        }
        
        @Test("mlIN")
        func mlIN() {
            #expect(sut(.weekday(locale: .mlIN)) == "വ്യാഴാഴ്‌ച")
        }
        
        @Test("knIN")
        func knIN() {
            #expect(sut(.weekday(locale: .knIN)) == "ಗುರುವಾರ")
        }
        
        @Test("myMM")
        func myMM() {
            #expect(sut(.weekday(locale: .myMM)) == "ကြာသပတေး")
        }
        
        @Test("amET")
        func amET() {
            #expect(sut(.weekday(locale: .amET)) == "ሐሙስ")
        }
        
        @Test("orIN")
        func orIN() {
            #expect(sut(.weekday(locale: .orIN)) == "ଗୁରୁବାର")
        }
        
        @Test("azAZ")
        func azAZ() {
            #expect(sut(.weekday(locale: .azAZ)) == "cümə axşamı")
        }
        
        @Test("suID")
        func suID() {
            #expect(sut(.weekday(locale: .suID)) == "Kemis")
        }
        
        @Test("haNG")
        func haNG() {
            #expect(sut(.weekday(locale: .haNG)) == "Alhamis")
        }
        
        @Test("yoNG")
        func yoNG() {
            #expect(sut(.weekday(locale: .yoNG)) == "Ọjọ́bọ")
        }
        
        @Test("neNP")
        func neNP() {
            #expect(sut(.weekday(locale: .neNP)) == "बिहिबार")
        }
        
        @Test("siLK")
        func siLK() {
            #expect(sut(.weekday(locale: .siLK)) == "බ්‍රහස්පතින්දා")
        }
        
        @Test("cebPH")
        func cebPH() {
            #expect(sut(.weekday(locale: .cebPH)) == "Huwebes")
        }
        
        @Test("srRS")
        func srRS() {
            #expect(sut(.weekday(locale: .srRS)) == "четвртак")
        }
        
        @Test("svSE")
        func svSE() {
            #expect(sut(.weekday(locale: .svSE)) == "torsdag")
        }
        
        @Test("huHU")
        func huHU() {
            #expect(sut(.weekday(locale: .huHU)) == "csütörtök")
        }
    }
    
    @Suite(".fullDate")
    struct FullDateTests {
        
        @Test("zhCN")
        func zhCN() {
            #expect(sut(.fullDate(locale: .zhCN)) == "2025年5月15日 星期四")
        }
        
        @Test("zhTW")
        func zhTW() {
            #expect(sut(.fullDate(locale: .zhTW)) == "2025年5月15日 星期四")
        }
        
        @Test("enUS")
        func enUS() {
            #expect(sut(.fullDate(locale: .enUS)) == "Thursday, May 15, 2025")
        }
        
        @Test("enGB")
        func enGB() {
            #expect(sut(.fullDate(locale: .enGB)) == "Thursday 15 May 2025")
        }
        
        @Test("hiIN")
        func hiIN() {
            #expect(sut(.fullDate(locale: .hiIN)) == "गुरुवार, 15 मई 2025")
        }
        
        @Test("esES")
        func esES() {
            #expect(sut(.fullDate(locale: .esES)) == "jueves, 15 de mayo de 2025")
        }
        
        @Test("esMX")
        func esMX() {
            #expect(sut(.fullDate(locale: .esMX)) == "jueves, 15 de mayo de 2025")
        }
        
        @Test("arEG")
        func arEG() {
            #expect(sut(.fullDate(locale: .arEG)) == "الخميس، ١٥ مايو، ٢٠٢٥")
        }
        
        @Test("arSA")
        func arSA() {
            #expect(sut(.fullDate(locale: .arSA)) == "الخميس، ١٧ ذو القعدة، ١٤٤٦ هـ")
        }
        
        @Test("bnBD")
        func bnBD() {
            #expect(sut(.fullDate(locale: .bnBD)) == "বৃহস্পতিবার, ১৫ মে, ২০২৫")
        }
        
        @Test("bnIN")
        func bnIN() {
            #expect(sut(.fullDate(locale: .bnIN)) == "বৃহস্পতিবার, ১৫ মে, ২০২৫")
        }
        
        @Test("ptBR")
        func ptBR() {
            #expect(sut(.fullDate(locale: .ptBR)) == "quinta-feira, 15 de maio de 2025")
        }
        
        @Test("ptPT")
        func ptPT() {
            #expect(sut(.fullDate(locale: .ptPT)) == "quinta-feira, 15 de maio de 2025")
        }
        
        @Test("ruRU")
        func ruRU() {
            #expect(sut(.fullDate(locale: .ruRU)) == "четверг, 15 мая 2025 г.")
        }
        
        @Test("jaJP")
        func jaJP() {
            #expect(sut(.fullDate(locale: .jaJP)) == "2025年5月15日 木曜日")
        }
        
        @Test("deDE")
        func deDE() {
            #expect(sut(.fullDate(locale: .deDE)) == "Donnerstag, 15. Mai 2025")
        }
        
        @Test("jvID")
        func jvID() {
            #expect(sut(.fullDate(locale: .jvID)) == "Kamis, 15 Mei 2025")
        }
        
        @Test("koKR")
        func koKR() {
            #expect(sut(.fullDate(locale: .koKR)) == "2025년 5월 15일 목요일")
        }
        
        @Test("frFR")
        func frFR() {
            #expect(sut(.fullDate(locale: .frFR)) == "jeudi 15 mai 2025")
        }
        
        @Test("frCA")
        func frCA() {
            #expect(sut(.fullDate(locale: .frCA)) == "jeudi 15 mai 2025")
        }
        
        @Test("trTR")
        func trTR() {
            #expect(sut(.fullDate(locale: .trTR)) == "15 Mayıs 2025 Perşembe")
        }
        
        @Test("viVN")
        func viVN() {
            #expect(sut(.fullDate(locale: .viVN)) == "Thứ Năm, ngày 15 tháng 5, 2025")
        }
        
        @Test("itIT")
        func itIT() {
            #expect(sut(.fullDate(locale: .itIT)) == "giovedì 15 maggio 2025")
        }
        
        @Test("plPL")
        func plPL() {
            #expect(sut(.fullDate(locale: .plPL)) == "czwartek, 15 maja 2025")
        }
        
        @Test("taIN")
        func taIN() {
            #expect(sut(.fullDate(locale: .taIN)) == "வியாழன், 15 மே, 2025")
        }
        
        @Test("mrIN")
        func mrIN() {
            #expect(sut(.fullDate(locale: .mrIN)) == "गुरुवार, १५ मे, २०२५")
        }
        
        @Test("teIN")
        func teIN() {
            #expect(sut(.fullDate(locale: .teIN)) == "15, మే 2025, గురువారం")
        }
        
        @Test("thTH")
        func thTH() {
            #expect(sut(.fullDate(locale: .thTH)) == "วันพฤหัสบดีที่ 15 พฤษภาคม พ.ศ. 2568")
        }
        
        @Test("guIN")
        func guIN() {
            #expect(sut(.fullDate(locale: .guIN)) == "ગુરુવાર, 15 મે, 2025")
        }
        
        @Test("urPK")
        func urPK() {
            #expect(sut(.fullDate(locale: .urPK)) == "جمعرات، 15 مئی، 2025")
        }
        
        @Test("urIN")
        func urIN() {
            #expect(sut(.fullDate(locale: .urIN)) == "جمعرات، ۱۵ مئی، ۲۰۲۵")
        }
        
        @Test("paIN")
        func paIN() {
            #expect(sut(.fullDate(locale: .paIN)) == "ਵੀਰਵਾਰ, 15 ਮਈ 2025")
        }
        
        @Test("faIR")
        func faIR() {
            #expect(sut(.fullDate(locale: .faIR)) == "۱۴۰۴ اردیبهشت ۲۵, پنجشنبه")
        }
        
        @Test("roRO")
        func roRO() {
            #expect(sut(.fullDate(locale: .roRO)) == "joi, 15 mai 2025")
        }
        
        @Test("ukUA")
        func ukUA() {
            #expect(sut(.fullDate(locale: .ukUA)) == "четвер, 15 травня 2025 р.")
        }
        
        @Test("mlIN")
        func mlIN() {
            #expect(sut(.fullDate(locale: .mlIN)) == "2025, മേയ് 15, വ്യാഴാഴ്‌ച")
        }
        
        @Test("knIN")
        func knIN() {
            #expect(sut(.fullDate(locale: .knIN)) == "ಗುರುವಾರ, ಮೇ 15, 2025")
        }
        
        @Test("myMM")
        func myMM() {
            #expect(sut(.fullDate(locale: .myMM)) == "၂၀၂၅၊ မေ ၁၅၊ ကြာသပတေး")
        }
        
        @Test("amET")
        func amET() {
            #expect(sut(.fullDate(locale: .amET)) == "2025 ሜይ 15, ሐሙስ")
        }
        
        @Test("orIN")
        func orIN() {
            #expect(sut(.fullDate(locale: .orIN)) == "ଗୁରୁବାର, ମଇ 15, 2025")
        }
        
        @Test("azAZ")
        func azAZ() {
            #expect(sut(.fullDate(locale: .azAZ)) == "15 may 2025, cümə axşamı")
        }
        
        @Test("suID")
        func suID() {
            #expect(sut(.fullDate(locale: .suID)) == "Kemis, 15 Méi 2025")
        }
        
        @Test("haNG")
        func haNG() {
            #expect(sut(.fullDate(locale: .haNG)) == "Alhamis 15 Mayu, 2025")
        }
        
        @Test("yoNG")
        func yoNG() {
            #expect(sut(.fullDate(locale: .yoNG)) == "Ọjọ́bọ, 15 Ẹ̀bi 2025")
        }
        
        @Test("neNP")
        func neNP() {
            #expect(sut(.fullDate(locale: .neNP)) == "२०२५ मे १५, बिहिबार")
        }
        
        @Test("siLK")
        func siLK() {
            #expect(sut(.fullDate(locale: .siLK)) == "2025 මැයි 15, බ්‍රහස්පතින්දා")
        }
        
        @Test("cebPH")
        func cebPH() {
            #expect(sut(.fullDate(locale: .cebPH)) == "Huwebes, Mayo 15, 2025")
        }
        
        @Test("srRS")
        func srRS() {
            #expect(sut(.fullDate(locale: .srRS)) == "четвртак, 15. мај 2025.")
        }
        
        @Test("svSE")
        func svSE() {
            #expect(sut(.fullDate(locale: .svSE)) == "torsdag 15 maj 2025")
        }
        
        @Test("huHU")
        func huHU() {
            #expect(sut(.fullDate(locale: .huHU)) == "2025. május 15., csütörtök")
        }
    }
    
    @Suite(".longDate")
    struct LongDate {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.longDate(locale: .zhCN)) == "2025年5月15日")
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.longDate(locale: .zhTW)) == "2025年5月15日")
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.longDate(locale: .enUS)) == "May 15, 2025")
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.longDate(locale: .enGB)) == "15 May 2025")
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.longDate(locale: .hiIN)) == "15 मई 2025")
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.longDate(locale: .esES)) == "15 de mayo de 2025")
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.longDate(locale: .esMX)) == "15 de mayo de 2025")
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.longDate(locale: .arEG)) == "١٥ مايو، ٢٠٢٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.longDate(locale: .arSA)) == "١٧ ذو القعدة، ١٤٤٦ هـ")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.longDate(locale: .bnBD)) == "১৫ মে, ২০২৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.longDate(locale: .bnIN)) == "১৫ মে, ২০২৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.longDate(locale: .ptBR)) == "15 de maio de 2025")
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.longDate(locale: .ptPT)) == "15 de maio de 2025")
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.longDate(locale: .ruRU)) == "15 мая 2025 г.")
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.longDate(locale: .jaJP)) == "2025年5月15日")
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.longDate(locale: .deDE)) == "15. Mai 2025")
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.longDate(locale: .jvID)) == "15 Mei 2025")
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.longDate(locale: .koKR)) == "2025년 5월 15일")
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.longDate(locale: .frFR)) == "15 mai 2025")
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.longDate(locale: .frCA)) == "15 mai 2025")
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.longDate(locale: .trTR)) == "15 Mayıs 2025")
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.longDate(locale: .viVN)) == "ngày 15 tháng 5, 2025")
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.longDate(locale: .itIT)) == "15 maggio 2025")
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.longDate(locale: .plPL)) == "15 maja 2025")
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.longDate(locale: .taIN)) == "15 மே, 2025")
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.longDate(locale: .mrIN)) == "१५ मे, २०२५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.longDate(locale: .teIN)) == "15 మే, 2025")
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.longDate(locale: .thTH)) == "15 พฤษภาคม 2568")
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.longDate(locale: .guIN)) == "15 મે, 2025")
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.longDate(locale: .urPK)) == "15 مئی، 2025")
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.longDate(locale: .urIN)) == "۱۵ مئی، ۲۰۲۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.longDate(locale: .paIN)) == "15 ਮਈ 2025")
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.longDate(locale: .faIR)) == "۲۵ اردیبهشت ۱۴۰۴")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.longDate(locale: .roRO)) == "15 mai 2025")
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.longDate(locale: .ukUA)) == "15 травня 2025 р.")
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.longDate(locale: .mlIN)) == "2025, മേയ് 15")
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.longDate(locale: .knIN)) == "ಮೇ 15, 2025")
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.longDate(locale: .myMM)) == "၂၀၂၅၊ မေ ၁၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.longDate(locale: .amET)) == "15 ሜይ 2025")
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.longDate(locale: .orIN)) == "ମଇ 15, 2025")
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.longDate(locale: .azAZ)) == "15 may 2025")
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.longDate(locale: .suID)) == "15 Méi 2025")
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.longDate(locale: .haNG)) == "15 Mayu, 2025")
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.longDate(locale: .yoNG)) == "15 Ẹ̀bi 2025")
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.longDate(locale: .neNP)) == "२०२५ मे १५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.longDate(locale: .siLK)) == "2025 මැයි 15")
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.longDate(locale: .cebPH)) == "Mayo 15, 2025")
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.longDate(locale: .srRS)) == "15. мај 2025.")
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.longDate(locale: .svSE)) == "15 maj 2025")
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.longDate(locale: .huHU)) == "2025. május 15.")
        }
    }
    
    @Suite(".date")
    struct DateTests {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.date(locale: .zhCN)) == "2025/5/15")
        }
        
        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.date(locale: .zhTW)) == "2025/5/15")
        }
        
        @Test("en_US")
        func enUS() {
            #expect(sut(.date(locale: .enUS)) == "5/15/25")
        }
        
        @Test("en_GB")
        func enGB() {
            #expect(sut(.date(locale: .enGB)) == "15/05/2025")
        }
        
        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.date(locale: .hiIN)) == "15/5/25")
        }
        
        @Test("es_ES")
        func esES() {
            #expect(sut(.date(locale: .esES)) == "15/5/25")
        }
        
        @Test("es_MX")
        func esMX() {
            #expect(sut(.date(locale: .esMX)) == "15/05/25")
        }
        
        @Test("ar_EG")
        func arEG() {
            #expect(sut(.date(locale: .arEG)) == "١٥‏/٥‏/٢٠٢٥")
        }
        
        @Test("ar_SA")
        func arSA() {
            #expect(sut(.date(locale: .arSA)) == "١٧ ذو. ق، ١٤٤٦ هـ")
        }
        
        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.date(locale: .bnBD)) == "১৫/৫/২৫")
        }
        
        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.date(locale: .bnIN)) == "১৫/৫/২৫")
        }
        
        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.date(locale: .ptBR)) == "15/05/2025")
        }
        
        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.date(locale: .ptPT)) == "15/05/25")
        }
        
        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.date(locale: .ruRU)) == "15.05.2025")
        }
        
        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.date(locale: .jaJP)) == "2025/05/15")
        }
        
        @Test("de_DE")
        func deDE() {
            #expect(sut(.date(locale: .deDE)) == "15.05.25")
        }
        
        @Test("jv_ID")
        func jvID() {
            #expect(sut(.date(locale: .jvID)) == "15-05-2025")
        }
        
        @Test("ko_KR")
        func koKR() {
            #expect(sut(.date(locale: .koKR)) == "2025. 5. 15.")
        }
        
        @Test("fr_FR")
        func frFR() {
            #expect(sut(.date(locale: .frFR)) == "15/05/2025")
        }
        
        @Test("fr_CA")
        func frCA() {
            #expect(sut(.date(locale: .frCA)) == "2025-05-15")
        }
        
        @Test("tr_TR")
        func trTR() {
            #expect(sut(.date(locale: .trTR)) == "15.05.2025")
        }
        
        @Test("vi_VN")
        func viVN() {
            #expect(sut(.date(locale: .viVN)) == "15/5/25")
        }
        
        @Test("it_IT")
        func itIT() {
            #expect(sut(.date(locale: .itIT)) == "15/05/25")
        }
        
        @Test("pl_PL")
        func plPL() {
            #expect(sut(.date(locale: .plPL)) == "15.05.2025")
        }
        
        @Test("ta_IN")
        func taIN() {
            #expect(sut(.date(locale: .taIN)) == "15/5/25")
        }
        
        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.date(locale: .mrIN)) == "१५/५/२५")
        }
        
        @Test("te_IN")
        func teIN() {
            #expect(sut(.date(locale: .teIN)) == "15-05-25")
        }
        
        @Test("th_TH")
        func thTH() {
            #expect(sut(.date(locale: .thTH)) == "15/5/68")
        }
        
        @Test("gu_IN")
        func guIN() {
            #expect(sut(.date(locale: .guIN)) == "15/5/25")
        }
        
        @Test("ur_PK")
        func urPK() {
            #expect(sut(.date(locale: .urPK)) == "15/5/25")
        }
        
        @Test("ur_IN")
        func urIN() {
            #expect(sut(.date(locale: .urIN)) == "۱۵/۵/۲۵")
        }
        
        @Test("pa_IN")
        func paIN() {
            #expect(sut(.date(locale: .paIN)) == "15/5/25")
        }
        
        @Test("fa_IR")
        func faIR() {
            #expect(sut(.date(locale: .faIR)) == "۱۴۰۴/۲/۲۵")
        }
        
        @Test("ro_RO")
        func roRO() {
            #expect(sut(.date(locale: .roRO)) == "15.05.2025")
        }
        
        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.date(locale: .ukUA)) == "15.05.25")
        }
        
        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.date(locale: .mlIN)) == "15/5/25")
        }
        
        @Test("kn_IN")
        func knIN() {
            #expect(sut(.date(locale: .knIN)) == "15/5/25")
        }
        
        @Test("my_MM")
        func myMM() {
            #expect(sut(.date(locale: .myMM)) == "၁၅/၅/၂၅")
        }
        
        @Test("am_ET")
        func amET() {
            #expect(sut(.date(locale: .amET)) == "15/05/2025")
        }
        
        @Test("or_IN")
        func orIN() {
            #expect(sut(.date(locale: .orIN)) == "5/15/25")
        }
        
        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.date(locale: .azAZ)) == "15.05.25")
        }
        
        @Test("su_ID")
        func suID() {
            #expect(sut(.date(locale: .suID)) == "15/5/25")
        }
        
        @Test("ha_NG")
        func haNG() {
            #expect(sut(.date(locale: .haNG)) == "15/5/25")
        }
        
        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.date(locale: .yoNG)) == "15/5/2025")
        }
        
        @Test("ne_NP")
        func neNP() {
            #expect(sut(.date(locale: .neNP)) == "२५/५/१५")
        }
        
        @Test("si_LK")
        func siLK() {
            #expect(sut(.date(locale: .siLK)) == "2025-05-15")
        }
        
        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.date(locale: .cebPH)) == "5/15/25")
        }
        
        @Test("sr_RS")
        func srRS() {
            #expect(sut(.date(locale: .srRS)) == "15.5.25.")
        }
        
        @Test("sv_SE")
        func svSE() {
            #expect(sut(.date(locale: .svSE)) == "2025-05-15")
        }
        
        @Test("hu_HU")
        func huHU() {
            #expect(sut(.date(locale: .huHU)) == "2025. 05. 15.")
        }
    }
    
    @Suite(".time")
    struct TimeTests {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.time(locale: .zhCN)) == "14:30")
        }

        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.time(locale: .zhTW)) == "下午2:30")
        }

        @Test("en_US")
        func enUS() {
            #expect(sut(.time(locale: .enUS)) == "2:30 PM")
        }

        @Test("en_GB")
        func enGB() {
            #expect(sut(.time(locale: .enGB)) == "14:30")
        }

        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.time(locale: .hiIN)) == "अ 2:30")
        }

        @Test("es_ES")
        func esES() {
            #expect(sut(.time(locale: .esES)) == "14:30")
        }

        @Test("es_MX")
        func esMX() {
            #expect(sut(.time(locale: .esMX)) == "2:30 p.m.")
        }

        @Test("ar_EG")
        func arEG() {
            #expect(sut(.time(locale: .arEG)) == "٢:٣٠ م")
        }

        @Test("ar_SA")
        func arSA() {
            #expect(sut(.time(locale: .arSA)) == "٢:٣٠ م")
        }

        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.time(locale: .bnBD)) == "২:৩০ PM")
        }

        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.time(locale: .bnIN)) == "২:৩০ PM")
        }

        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.time(locale: .ptBR)) == "14:30")
        }

        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.time(locale: .ptPT)) == "14:30")
        }

        @Test("ru_RU")
        func ruRU() {
            #expect(sut(.time(locale: .ruRU)) == "14:30")
        }

        @Test("ja_JP")
        func jaJP() {
            #expect(sut(.time(locale: .jaJP)) == "14:30")
        }

        @Test("de_DE")
        func deDE() {
            #expect(sut(.time(locale: .deDE)) == "14:30")
        }

        @Test("jv_ID")
        func jvID() {
            #expect(sut(.time(locale: .jvID)) == "14:30")
        }

        @Test("ko_KR")
        func koKR() {
            #expect(sut(.time(locale: .koKR)) == "오후 2:30")
        }

        @Test("fr_FR")
        func frFR() {
            #expect(sut(.time(locale: .frFR)) == "14:30")
        }

        @Test("fr_CA")
        func frCA() {
            #expect(sut(.time(locale: .frCA)) == "14:30")
        }

        @Test("tr_TR")
        func trTR() {
            #expect(sut(.time(locale: .trTR)) == "14:30")
        }

        @Test("vi_VN")
        func viVN() {
            #expect(sut(.time(locale: .viVN)) == "14:30")
        }

        @Test("it_IT")
        func itIT() {
            #expect(sut(.time(locale: .itIT)) == "14:30")
        }

        @Test("pl_PL")
        func plPL() {
            #expect(sut(.time(locale: .plPL)) == "14:30")
        }

        @Test("ta_IN")
        func taIN() {
            #expect(sut(.time(locale: .taIN)) == "பிற்பகல் 2:30")
        }

        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.time(locale: .mrIN)) == "२:३० PM")
        }

        @Test("te_IN")
        func teIN() {
            #expect(sut(.time(locale: .teIN)) == "2:30 PM")
        }

        @Test("th_TH")
        func thTH() {
            #expect(sut(.time(locale: .thTH)) == "14:30")
        }

        @Test("gu_IN")
        func guIN() {
            #expect(sut(.time(locale: .guIN)) == "02:30 PM")
        }

        @Test("ur_PK")
        func urPK() {
            #expect(sut(.time(locale: .urPK)) == "2:30 ب.د.")
        }

        @Test("ur_IN")
        func urIN() {
            #expect(sut(.time(locale: .urIN)) == "۲:۳۰ ب.د.")
        }

        @Test("pa_IN")
        func paIN() {
            #expect(sut(.time(locale: .paIN)) == "2:30 ਬਾ.ਦੁ.")
        }

        @Test("fa_IR")
        func faIR() {
            #expect(sut(.time(locale: .faIR)) == "۱۴:۳۰")
        }

        @Test("ro_RO")
        func roRO() {
            #expect(sut(.time(locale: .roRO)) == "14:30")
        }

        @Test("uk_UA")
        func ukUA() {
            #expect(sut(.time(locale: .ukUA)) == "14:30")
        }

        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.time(locale: .mlIN)) == "2:30 PM")
        }

        @Test("kn_IN")
        func knIN() {
            #expect(sut(.time(locale: .knIN)) == "02:30 ಅಪರಾಹ್ನ")
        }

        @Test("my_MM")
        func myMM() {
            #expect(sut(.time(locale: .myMM)) == "၁၄:၃၀")
        }

        @Test("am_ET")
        func amET() {
            #expect(sut(.time(locale: .amET)) == "2:30 ከሰዓት")
        }

        @Test("or_IN")
        func orIN() {
            #expect(sut(.time(locale: .orIN)) == "2:30 PM")
        }

        @Test("az_AZ")
        func azAZ() {
            #expect(sut(.time(locale: .azAZ)) == "14:30")
        }

        @Test("su_ID")
        func suID() {
            #expect(sut(.time(locale: .suID)) == "14.30")
        }

        @Test("ha_NG")
        func haNG() {
            #expect(sut(.time(locale: .haNG)) == "14:30")
        }

        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.time(locale: .yoNG)) == "14:30")
        }

        @Test("ne_NP")
        func neNP() {
            #expect(sut(.time(locale: .neNP)) == "१४:३०")
        }

        @Test("si_LK")
        func siLK() {
            #expect(sut(.time(locale: .siLK)) == "14.30")
        }

        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.time(locale: .cebPH)) == "2:30 PM")
        }

        @Test("sr_RS")
        func srRS() {
            #expect(sut(.time(locale: .srRS)) == "14:30")
        }

        @Test("sv_SE")
        func svSE() {
            #expect(sut(.time(locale: .svSE)) == "14:30")
        }

        @Test("hu_HU")
        func huHU() {
            #expect(sut(.time(locale: .huHU)) == "14:30")
        }
    }
    
    @Suite(".dateTime")
    struct DateTimeTests {
        @Test("zh_CN")
        func zhCN() {
            #expect(sut(.dateTime(locale: .zhCN)) == "2025/5/15 14:30")
        }

        @Test("zh_TW")
        func zhTW() {
            #expect(sut(.dateTime(locale: .zhTW)) == "2025/5/15 下午2:30")
        }

        @Test("en_US")
        func enUS() {
            #expect(sut(.dateTime(locale: .enUS)) == "5/15/25, 2:30 PM")
        }

        @Test("hi_IN")
        func hiIN() {
            #expect(sut(.dateTime(locale: .hiIN)) == "15/5/25, अ 2:30")
        }

        @Test("es_ES")
        func esES() {
            #expect(sut(.dateTime(locale: .esES)) == "15/5/25, 14:30")
        }

        @Test("es_MX")
        func esMX() {
            #expect(sut(.dateTime(locale: .esMX)) == "15/05/25, 2:30 p.m.")
        }

        @Test("ar_EG")
        func arEG() {
            #expect(sut(.dateTime(locale: .arEG)) == "١٥‏/٥‏/٢٠٢٥، ٢:٣٠ م")
        }

        @Test("ar_SA")
        func arSA() {
            #expect(sut(.dateTime(locale: .arSA)) == "١٧ ذو. ق، ١٤٤٦ هـ، ٢:٣٠ م")
        }

        @Test("bn_BD")
        func bnBD() {
            #expect(sut(.dateTime(locale: .bnBD)) == "১৫/৫/২৫, ২:৩০ PM")
        }

        @Test("bn_IN")
        func bnIN() {
            #expect(sut(.dateTime(locale: .bnIN)) == "১৫/৫/২৫, ২:৩০ PM")
        }

        @Test("pt_BR")
        func ptBR() {
            #expect(sut(.dateTime(locale: .ptBR)) == "15/05/2025, 14:30")
        }

        @Test("pt_PT")
        func ptPT() {
            #expect(sut(.dateTime(locale: .ptPT)) == "15/05/25, 14:30")
        }

        @Test("jv_ID")
        func jvID() {
            #expect(sut(.dateTime(locale: .jvID)) == "15-05-2025, 14:30")
        }

        @Test("ko_KR")
        func koKR() {
            #expect(sut(.dateTime(locale: .koKR)) == "2025. 5. 15. 오후 2:30")
        }

        @Test("vi_VN")
        func viVN() {
            #expect(sut(.dateTime(locale: .viVN)) == "14:30 15/5/25")
        }

        @Test("it_IT")
        func itIT() {
            #expect(sut(.dateTime(locale: .itIT)) == "15/05/25, 14:30")
        }

        @Test("ta_IN")
        func taIN() {
            #expect(sut(.dateTime(locale: .taIN)) == "15/5/25, பிற்பகல் 2:30")
        }

        @Test("mr_IN")
        func mrIN() {
            #expect(sut(.dateTime(locale: .mrIN)) == "१५/५/२५, २:३० PM")
        }

        @Test("te_IN")
        func teIN() {
            #expect(sut(.dateTime(locale: .teIN)) == "15-05-25 2:30 PM")
        }

        @Test("th_TH")
        func thTH() {
            #expect(sut(.dateTime(locale: .thTH)) == "15/5/68 14:30")
        }

        @Test("gu_IN")
        func guIN() {
            #expect(sut(.dateTime(locale: .guIN)) == "15/5/25 02:30 PM")
        }

        @Test("ur_PK")
        func urPK() {
            #expect(sut(.dateTime(locale: .urPK)) == "15/5/25، 2:30 ب.د.")
        }

        @Test("ur_IN")
        func urIN() {
            #expect(sut(.dateTime(locale: .urIN)) == "۱۵/۵/۲۵، ۲:۳۰ ب.د.")
        }

        @Test("pa_IN")
        func paIN() {
            #expect(sut(.dateTime(locale: .paIN)) == "15/5/25, 2:30 ਬਾ.ਦੁ.")
        }

        @Test("fa_IR")
        func faIR() {
            #expect(sut(.dateTime(locale: .faIR)) == "۱۴۰۴/۲/۲۵, ۱۴:۳۰")
        }

        @Test("ml_IN")
        func mlIN() {
            #expect(sut(.dateTime(locale: .mlIN)) == "15/5/25 2:30 PM")
        }

        @Test("kn_IN")
        func knIN() {
            #expect(sut(.dateTime(locale: .knIN)) == "15/5/25, 02:30 ಅಪರಾಹ್ನ")
        }

        @Test("my_MM")
        func myMM() {
            #expect(sut(.dateTime(locale: .myMM)) == "၁၅/၅/၂၅ ၁၄:၃၀")
        }

        @Test("am_ET")
        func amET() {
            #expect(sut(.dateTime(locale: .amET)) == "15/05/2025 2:30 ከሰዓት")
        }

        @Test("or_IN")
        func orIN() {
            #expect(sut(.dateTime(locale: .orIN)) == "5/15/25, 2:30 PM")
        }

        @Test("su_ID")
        func suID() {
            #expect(sut(.dateTime(locale: .suID)) == "15/5/25, 14.30")
        }

        @Test("ha_NG")
        func haNG() {
            #expect(sut(.dateTime(locale: .haNG)) == "15/5/25, 14:30")
        }

        @Test("yo_NG")
        func yoNG() {
            #expect(sut(.dateTime(locale: .yoNG)) == "15/5/2025, 14:30")
        }

        @Test("ne_NP")
        func neNP() {
            #expect(sut(.dateTime(locale: .neNP)) == "२५/५/१५, १४:३०")
        }

        @Test("si_LK")
        func siLK() {
            #expect(sut(.dateTime(locale: .siLK)) == "2025-05-15, 14.30")
        }

        @Test("ceb_PH")
        func cebPH() {
            #expect(sut(.dateTime(locale: .cebPH)) == "5/15/25, 2:30 PM")
        }

        @Test("sr_RS")
        func srRS() {
            #expect(sut(.dateTime(locale: .srRS)) == "15.5.25. 14:30")
        }

        @Test("hu_HU")
        func huHU() {
            #expect(sut(.dateTime(locale: .huHU)) == "2025. 05. 15. 14:30")
        }
    }
    
    @Suite(".iso8601")
    struct Iso8601Tests {
        private let sutProp = DateFormatter.iso8601
        
        @Test("formatOutput")
        func formatOutput() {
            #expect(sut(.iso8601) == "2025-05-15T17:30:00Z")
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
        private let sutProp = DateFormatter.logTimestamp
        
        @Test("formatOutput")
        func formatOutput() {
            #expect(sut(.logTimestamp) == "2025-05-15 14:30:00")
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
            let formatter = DateFormatter.custom(pattern, locale: Locale(identifier: "en_US_POSIX"))
            #expect(sut(formatter) == "May 2025")
        }
        
        @Test("usesProvidedLocale")
        func usesProvidedLocale() {
            let pattern = "MMM yyyy"
            let locale = Locale(identifier: "fr_FR")
            let formatter = DateFormatter.custom(pattern, locale: locale)
            #expect(formatter.locale.identifier == locale.identifier)
        }
        
        @Test("usesDefaultLocaleWhenNotProvided")
        func usesDefaultLocaleWhenNotProvided() {
            let pattern = "yyyy-MM-dd"
            let formatter = DateFormatter.custom(pattern)
            #expect(formatter.locale.identifier == Locale.current.identifier)
        }
        
        @Test("dateFormatIsSetCorrectly")
        func dateFormatIsSetCorrectly() {
            let pattern = "yyyy/MM/dd HH:mm"
            let formatter = DateFormatter.custom(pattern)
            #expect(formatter.dateFormat == pattern)
        }
    }
    
    private static func sut(_ f: DateFormatter) -> String {
        let date = Date(year: 2025, month: 5, day: 15, hour: 14, minute: 30)!
        return f.string(from: date)
    }
}
