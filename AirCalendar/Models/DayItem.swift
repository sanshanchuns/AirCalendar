import Foundation

public struct DayItem: Identifiable {
    public let id = UUID()
    public let date: Date
    
    public init(date: Date) {
        self.date = date
    }
    
    public var day: Int {
        Calendar.current.component(.day, from: date)
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
        let weekdays = ["日", "一", "二", "三", "四", "五", "六"]
        let component = Calendar.current.component(.weekday, from: date)
        return weekdays[component - 1]
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
