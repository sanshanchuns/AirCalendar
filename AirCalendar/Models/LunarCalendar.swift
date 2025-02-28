import Foundation

public struct LunarCalendar {
    public static func getLunarDate(from date: Date) -> (month: Int, day: Int, monthStr: String, dayStr: String, isLeapMonth: Bool) {
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
    
    public static func getSolarTerm(for date: Date) -> String? {
        // 二十四节气对应的黄经度数（以春分点为起点的黄经度数）
        let solarTermDegrees: [(degree: Double, name: String)] = [
            (315, "立春"), (330, "雨水"),
            (345, "惊蛰"), (0, "春分"),
            (15, "清明"), (30, "谷雨"),
            (45, "立夏"), (60, "小满"),
            (75, "芒种"), (90, "夏至"),
            (105, "小暑"), (120, "大暑"),
            (135, "立秋"), (150, "处暑"),
            (165, "白露"), (180, "秋分"),
            (195, "寒露"), (210, "霜降"),
            (225, "立冬"), (240, "小雪"),
            (255, "大雪"), (270, "冬至"),
            (285, "小寒"), (300, "大寒")
        ]
        
        // 获取日期的儒略日
        func julianDay(from date: Date) -> Double {
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            guard let year = components.year,
                  let month = components.month,
                  let day = components.day else {
                return 0
            }
            
            var y = Double(year)
            var m = Double(month)
            let d = Double(day)
            
            if m <= 2 {
                y -= 1
                m += 12
            }
            
            let a = floor(y / 100)
            let b = 2 - a + floor(a / 4)
            
            return floor(365.25 * (y + 4716)) + floor(30.6001 * (m + 1)) + d + b - 1524.5
        }
        
        // 计算太阳黄经
        func sunLongitude(julianDay jd: Double) -> Double {
            let t = (jd - 2451545.0) / 36525  // 儒略世纪数
            let l0 = 280.46646 + 36000.76983 * t + 0.0003032 * t * t  // 太阳平黄经
            
            // 简化的太阳黄经计算（实际还需要考虑更多项）
            let omega = 125.04 - 1934.136 * t
            let lambda = l0 - 0.00569 - 0.00478 * sin(omega * .pi / 180)
            
            return lambda.truncatingRemainder(dividingBy: 360)
        }
        
        // 获取当前日期的太阳黄经
        let jd = julianDay(from: date)
        let sunLong = sunLongitude(julianDay: jd)
        
        // 检查是否是节气日期（允许0.5度的误差）
        for term in solarTermDegrees {
            let diff = abs(sunLong - term.degree)
            if diff < 0.5 || abs(diff - 360) < 0.5 {
                return term.name
            }
        }
        
        return nil
    }
    
    public static func getFestival(for date: Date) -> String? {
        let calendar = Calendar(identifier: .chinese)
        let components = calendar.dateComponents([.month, .day], from: date)
        
        // 农历节日对照表
        let lunarFestivals: [(month: Int, day: Int, name: String)] = [
            (1, 1, "春节"),
            (1, 15, "元宵节"),
            (2, 2, "龙抬头"),
            (5, 5, "端午节"),
            (7, 7, "七夕节"),
            (7, 15, "中元节"),
            (8, 15, "中秋节"),
            (9, 9, "重阳节"),
            (12, 8, "腊八节"),
            (12, 23, "小年"),
            (12, 30, "除夕")  // 需要特殊处理闰月和大小月的情况
        ]
        
        // 检查是否是农历节日
        if let month = components.month,
           let day = components.day,
           let festival = lunarFestivals.first(where: { $0.month == month && $0.day == day }) {
            return festival.name
        }
        
        // 检查是否是公历节日
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let gregorianComponents = gregorianCalendar.dateComponents([.month, .day], from: date)
        
        // 公历节日对照表
        let gregorianFestivals: [(month: Int, day: Int, name: String)] = [
            (1, 1, "元旦"),
            (2, 14, "情人节"),
            (3, 8, "妇女节"),
            (4, 1, "愚人节"),
            (5, 1, "劳动节"),
            (6, 1, "儿童节"),
            (10, 1, "国庆节"),
            (12, 25, "圣诞节")
        ]
        
        // 检查是否是公历节日
        if let month = gregorianComponents.month,
           let day = gregorianComponents.day,
           let festival = gregorianFestivals.first(where: { $0.month == month && $0.day == day }) {
            return festival.name
        }
        
        // 特殊处理母亲节（5月第二个星期日）
        if gregorianComponents.month == 5 {
            let weekOfMonth = gregorianCalendar.component(.weekOfMonth, from: date)
            let weekday = gregorianCalendar.component(.weekday, from: date)
            if weekOfMonth == 2 && weekday == 1 {  // 第二个星期日
                return "母亲节"
            }
        }
        
        // 特殊处理父亲节（6月第三个星期日）
        if gregorianComponents.month == 6 {
            let weekOfMonth = gregorianCalendar.component(.weekOfMonth, from: date)
            let weekday = gregorianCalendar.component(.weekday, from: date)
            if weekOfMonth == 3 && weekday == 1 {  // 第三个星期日
                return "父亲节"
            }
        }
        
        return nil
    }
    
    struct SolarTermPeriod {
        let phase: Int        // 1-3 表示初候、二候、三候
        let pantadName: String // 候的名称，如"草木萌动"
        let pantadDesc: String // 侯的描述，如""
    }
    
    static func getSolarTermPeriod(for date: Date) -> SolarTermPeriod? {
        // 获取前后节气
        let previousTerm = getPreviousSolarTerm(before: date)
        let nextTerm = getNextSolarTerm(after: date)
        
        guard let previousDate = previousTerm?.date,
              let nextDate = nextTerm?.date else { return nil }
        
        // 计算两个节气之间的总天数
        let totalDays = Calendar.current.dateComponents([.day], from: previousDate, to: nextDate).day ?? 0
        // 每候大约5天
        let phaseLength = totalDays / 3
        
        // 计算当前日期在哪一候
        let daysFromPrevious = Calendar.current.dateComponents([.day], from: previousDate, to: date).day ?? 0
        let phase = (daysFromPrevious / phaseLength) + 1
        
        // 获取对应候的描述
        let description = getPhaseDescription(term: previousTerm?.name ?? "", phase: phase)
        
        // 计算当前候的起止日期
        let phaseStart = Calendar.current.date(byAdding: .day, value: (phase - 1) * phaseLength, to: previousDate)!
        let phaseEnd = Calendar.current.date(byAdding: .day, value: phase * phaseLength, to: previousDate)!
        
        return SolarTermPeriod(
            phase: phase,
            description: description
        )
    }
    
    static func getPhaseDescription(term: String, phase: Int) -> String {
        // 这里需要添加一个完整的节气三候对照表
        let phaseDescriptions: [String: [String]] = [
            "雨水": ["獭祭鱼", "候雁北", "草木萌动"],
            "惊蛰": ["桃始华", "仓庚鸣", "鹰化为鸠"],
            // ... 添加其他节气的三候描述
        ]
        
        guard let descriptions = phaseDescriptions[term],
              phase >= 1 && phase <= 3 else {
            return ""
        }
        
        return descriptions[phase - 1]
    }
    
    static func getPreviousSolarTerm(before date: Date) -> (name: String, date: Date)? {
        let calendar = Calendar.current
        var currentDate = date
        
        // 最多往前查找31天
        for _ in 0..<31 {
            currentDate = calendar.date(byAdding: .day, value: -1, to: currentDate)!
            if let term = LunarCalendar.getSolarTerm(for: currentDate) {
                return (term, currentDate)
            }
        }
        return nil
    }
    
    static func getNextSolarTerm(after date: Date) -> (name: String, date: Date)? {
        let calendar = Calendar.current
        var currentDate = date
        
        // 最多往后查找31天
        for _ in 0..<31 {
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
            if let term = LunarCalendar.getSolarTerm(for: currentDate) {
                return (term, currentDate)
            }
        }
        return nil
    }
}
