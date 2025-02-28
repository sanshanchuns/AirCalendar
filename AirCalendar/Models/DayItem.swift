import Foundation

public class DayItem: ObservableObject {
    public let date: Date
    public var day: Int {
        Calendar.current.component(.day, from: date)
    }
    
    @Published public var imageUrl: String = ""
    @Published private(set) var dailyContent: DailyContent = DailyContent()
    
    public struct DailyContent {
        var festival: String?
        var solarTerm: String?
        var quote: String?
        var author: String?
        var title: String?
        var randomSound: String?
        var pentadName: String? // 七十二候名称
        var pentadDesc: String? // 七十二候描述
    }
    
    public init(date: Date) {
        self.date = date
        setupImageUrl(date)
        setupDailyContent()
    }
    
    private func setupImageUrl(_ :Date) {
        let seed = generateSeed()
        self.imageUrl = "https://picsum.photos/seed/\(seed)/400/300"
    }
    
    private func generateSeed() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    
    private func setupDailyContent() {
        let poetry = PoetryManager.shared.randomQuote(for: date)
        let sound = AudioManager.shared.randomSound(date: date)
        let period = LunarCalendar.getSolarTermPeriod(for: date)
        
        dailyContent = DailyContent(
            festival: LunarCalendar.getFestival(for: date),
            solarTerm: LunarCalendar.getSolarTerm(for: date),
            quote: poetry.quote,
            author: poetry.author,
            title: poetry.title,
            randomSound: sound,
            pentadName: period?.term,
            pentadDesc: period?.description
        )
    }
    
    public var month: Int {
        Calendar.current.component(.month, from: date)
    }
    
    public var lunarDate: String {
        let lunar = LunarCalendar.getLunarDate(from: date)
        var result = "\(lunar.monthStr)\(lunar.dayStr)"
        if lunar.isLeapMonth {
            result = "闰" + result
        }
        return result
    }
    
    public var yearMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM"
        return formatter.string(from: date)
    }
    
    public var weekday: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        let weekdayNumber = Calendar.current.component(.weekday, from: date)
        let weekdaySymbols = ["日", "一", "二", "三", "四", "五", "六"]
        return "星期" + weekdaySymbols[weekdayNumber - 1]
    }
    
    public var festival: String? {
        let lunar = LunarCalendar.getLunarDate(from: date)
        
        if let lunarFestival = LunarCalendar.getLunarFestival(month: lunar.month, day: lunar.day) {
            return lunarFestival
        }
        
        return LunarCalendar.getSolarFestival(month: month, day: day)
    }
    
    public var solarTerm: String? {
        SolarTerms.getTerm(for: date)
    }
} 
