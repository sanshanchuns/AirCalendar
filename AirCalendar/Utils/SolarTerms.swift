import Foundation

// 添加节气工具
struct SolarTerms {
    // 二十四节气
    static let terms = [
        "小寒", "大寒", "立春", "雨水", "惊蛰", "春分",
        "清明", "谷雨", "立夏", "小满", "芒种", "夏至",
        "小暑", "大暑", "立秋", "处暑", "白露", "秋分",
        "寒露", "霜降", "立冬", "小雪", "大雪", "冬至"
    ]
    
    // 2024年节气日期（实际应用中应该使用算法计算或API获取）
    static let solarTermDates2024: [(month: Int, day: Int, term: String)] = [
        (1, 6, "小寒"), (1, 20, "大寒"), (2, 4, "立春"),
        (2, 19, "雨水"), (3, 5, "惊蛰"), (3, 20, "春分"),
        (4, 4, "清明"), (4, 20, "谷雨"), (5, 5, "立夏"),
        (5, 21, "小满"), (6, 6, "芒种"), (6, 21, "夏至"),
        (7, 7, "小暑"), (7, 23, "大暑"), (8, 7, "立秋"),
        (8, 23, "处暑"), (9, 7, "白露"), (9, 23, "秋分"),
        (10, 8, "寒露"), (10, 23, "霜降"), (11, 7, "立冬"),
        (11, 22, "小雪"), (12, 7, "大雪"), (12, 22, "冬至")
    ]
    
    static func getTerm(for date: Date) -> String? {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        return solarTermDates2024.first { $0.month == month && $0.day == day }?.term
    }
}
