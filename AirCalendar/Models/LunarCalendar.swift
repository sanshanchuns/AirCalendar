import Foundation

struct LunarCalendar {
    static func getLunarDate(from date: Date) -> (month: Int, day: Int, monthStr: String, dayStr: String, isLeapMonth: Bool) {
        let calendar = Calendar(identifier: .chinese)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let month = components.month ?? 1
        let day = components.day ?? 1
        let isLeapMonth = calendar.dateComponents([.yearForWeekOfYear], from: date).isLeapMonth ?? false
        
        // 农历月份
        let lunarMonths = [
            "正月", "二月", "三月", "四月", "五月", "六月",
            "七月", "八月", "九月", "十月", "冬月", "腊月"
        ]
        
        // 农历日期
        let lunarDays = [
            "初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
            "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
            "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"
        ]
        
        let monthStr = lunarMonths[month - 1]
        let dayStr = lunarDays[day - 1]
        
        return (month, day, monthStr, dayStr, isLeapMonth)
    }
    
    // 获取农历节日
    static func getLunarFestival(month: Int, day: Int) -> String? {
        let festivals: [(month: Int, day: Int, name: String)] = [
            (1, 1, "春节"),
            (1, 15, "元宵节"),
            (5, 5, "端午节"),
            (7, 7, "七夕节"),
            (8, 15, "中秋节"),
            (9, 9, "重阳节"),
            (12, 8, "腊八节"),
            // 可以添加更多农历节日
        ]
        
        return festivals.first { $0.month == month && $0.day == day }?.name
    }
    
    // 获取公历节日
    static func getSolarFestival(month: Int, day: Int) -> String? {
        let festivals: [String: (Int, Int)] = [
            "元旦": (1, 1),
            "情人节": (2, 14),
            "妇女节": (3, 8),
            "植树节": (3, 12),
            "劳动节": (5, 1),
            "儿童节": (6, 1),
            "国庆节": (10, 1),
            "圣诞节": (12, 25)
        ]
        
        return festivals.first(where: { $0.value == (month, day) })?.key
    }
}
