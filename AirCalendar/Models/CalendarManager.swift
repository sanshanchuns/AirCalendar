import Foundation

public struct CalendarManager {
    
    public static func getMonth(from date:Date) -> Int {
        return Calendar.current.component(.month, from: date)
    }
    
    public static func getLunarDateString(from date:Date) -> String {
        let lunar = CalendarManager.getLunarDate(from: date)
        var result = "\(lunar.monthStr)\(lunar.dayStr)"
        if lunar.isLeapMonth {
            result = "闰" + result
        }
        return result
    }
    
    public static func getMonthDay(from date:Date) -> String {
        let formatter = DateFormatter()
//        formatter.timeZone = TimeZone(identifier: "Asia/Shanghai") // 东八区的标准时区标识符
        formatter.dateFormat = "MM.dd"
        let monthDay = formatter.string(from: date)
        return monthDay
    }
    
    public static func getWeekday(from date:Date) -> String {
        let formatter = DateFormatter()
//        formatter.timeZone = TimeZone(identifier: "Asia/Shanghai") // 东八区的标准时区标识符
        formatter.locale = Locale(identifier: "zh_CN")
        let weekdayNumber = Calendar.current.component(.weekday, from: date)
        let weekdaySymbols = ["日", "一", "二", "三", "四", "五", "六"]
        return "星期" + weekdaySymbols[weekdayNumber - 1]
    }
    
    public static func getTodayInUTC8() -> Date {
        let utcDate = Date() // UTC 时间（设备当前时间）
        let timeInterval = TimeInterval(TimeZone(identifier: "Asia/Shanghai")!.secondsFromGMT())
        return utcDate.addingTimeInterval(timeInterval) // 转换为东八区的UTC时间
    }
    
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

    private static let houList = [
        // 立春
        "东风解冻", "蛰虫始振", "鱼陟负冰",
        // 雨水
        "獭祭鱼", "鸿雁来", "草木萌动",
        // 惊蛰
        "桃始华", "仓庚鸣", "鹰化为鸠",
        // 春分
        "玄鸟至", "雷乃发声", "始电",
        // 清明
        "桐始华", "田鼠化为鴽", "虹始见",
        // 谷雨
        "萍始生", "鸣鸠拂其羽", "戴胜降于桑",
        // 立夏
        "蝼蝈鸣", "蚯蚸出", "王瓜生",
        // 小满
        "苦菜秀", "靡草死", "麦秋至",
        // 芒种
        "螳螂生", "鵙始鸣", "反舌无声",
        // 夏至
        "鹿角解", "蜩始鸣", "半夏生",
        // 小暑
        "温风至", "蟋蟀居壁", "鹰始挚",
        // 大暑
        "腐草为萤", "土润溽暑", "大雨时行",
        // 立秋
        "凉风至", "白露降", "寒蝉鸣",
        // 处暑
        "鹰乃祭鸟", "天地始肃", "禾乃登",
        // 白露
        "鸿雁来宾", "玄鸟归", "群鸟养羞",
        // 秋分
        "雷始收声", "蛰虫坯户", "水始涸",
        // 寒露
        "鸿雁来宾", "雀入大水为蛤", "菊有黄花",
        // 霜降
        "豺乃祭兽", "草木黄落", "蛰虫咸俯",
        // 立冬
        "水始冰", "地始冻", "雉入大水为蜃",
        // 小雪
        "虹藏不见", "天气上升地气下降", "闭塞而成冬",
        // 大雪
        "鹖鴠不鸣", "虎始交", "荔挺出",
        // 冬至
        "蚯蚸结", "麋角解", "水泉动",
        // 小寒
        "雁北乡", "鹊始巢", "雉雊",
        // 大寒
        "鸡始乳", "征鸟厉疾", "水泽腹坚"
    ]
    
    // 2025年二十四节气的日期对照表
    private static let solarTerms2025: [(month: Int, day: Int, name: String)] = [
        (1, 5, "小寒"), (1, 20, "大寒"),
        (2, 3, "立春"), (2, 18, "雨水"),
        (3, 5, "惊蛰"), (3, 20, "春分"),
        (4, 5, "清明"), (4, 20, "谷雨"),
        (5, 5, "立夏"), (5, 21, "小满"),
        (6, 5, "芒种"), (6, 21, "夏至"),
        (7, 7, "小暑"), (7, 22, "大暑"),
        (8, 7, "立秋"), (8, 23, "处暑"),
        (9, 7, "白露"), (9, 23, "秋分"),
        (10, 8, "寒露"), (10, 23, "霜降"),
        (11, 7, "立冬"), (11, 22, "小雪"),
        (12, 7, "大雪"), (12, 21, "冬至")
    ]
    
    public static func getSolarTerm(for date: Date) -> String? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day], from: date)
        
        guard let month = components.month,
              let day = components.day else {
            return nil
        }
        
        // 查找对应的节气
        return solarTerms2025.first { $0.month == month && $0.day == day }?.name
    }
    
    // public static func getSolarTerm(for date: Date) -> String? {
    //     // 二十四节气对应的黄经度数（以春分点为起点的黄经度数）
    //     let solarTermDegrees: [(degree: Double, name: String)] = [
    //         (315, "立春"), (330, "雨水"),
    //         (345, "惊蛰"), (0, "春分"),
    //         (15, "清明"), (30, "谷雨"),
    //         (45, "立夏"), (60, "小满"),
    //         (75, "芒种"), (90, "夏至"),
    //         (105, "小暑"), (120, "大暑"),
    //         (135, "立秋"), (150, "处暑"),
    //         (165, "白露"), (180, "秋分"),
    //         (195, "寒露"), (210, "霜降"),
    //         (225, "立冬"), (240, "小雪"),
    //         (255, "大雪"), (270, "冬至"),
    //         (285, "小寒"), (300, "大寒")
    //     ]
        
    //     // 获取日期的儒略日（考虑东八区时差）
    //     func julianDay(from date: Date) -> Double {
    //         // 转换到东八区时间
    //         let calendar = Calendar(identifier: .gregorian)
    //         let timeZone = TimeZone(secondsFromGMT: 8 * 3600)! // 东八区
    //         let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
    //         guard let year = components.year,
    //               let month = components.month,
    //               let day = components.day,
    //               let hour = components.hour,
    //               let minute = components.minute,
    //               let second = components.second else {
    //             return 0
    //         }
            
    //         var y = Double(year)
    //         var m = Double(month)
    //         // 加入时区偏移
    //         let d = Double(day) + (Double(hour) + 8.0 + Double(minute)/60.0 + Double(second)/3600.0)/24.0
            
    //         if m <= 2 {
    //             y -= 1
    //             m += 12
    //         }
            
    //         let a = floor(y / 100)
    //         let b = 2 - a + floor(a / 4)
            
    //         return floor(365.25 * (y + 4716)) + floor(30.6001 * (m + 1)) + d + b - 1524.5
    //     }
        
    //     // 计算太阳黄经
    //     func sunLongitude(julianDay jd: Double) -> Double {
    //         let t = (jd - 2451545.0) / 36525  // 儒略世纪数
            
    //         // 太阳平黄经
    //         let l0 = 280.46646 + 36000.76983 * t + 0.0003032 * t * t
            
    //         // 太阳中心差
    //         let m = 357.52911 + 35999.05029 * t - 0.0001537 * t * t
            
    //         // 地球轨道离心率
    //         let e = 0.016708634 - 0.000042037 * t - 0.0000001267 * t * t
            
    //         // 太阳方程
    //         let c = (1.914602 - 0.004817 * t - 0.000014 * t * t) * sin(m * .pi / 180)
    //             + (0.019993 - 0.000101 * t) * sin(2 * m * .pi / 180)
    //             + 0.000289 * sin(3 * m * .pi / 180)
            
    //         // 真黄经
    //         let lambda = l0 + c
            
    //         // 章动修正
    //         let omega = 125.04 - 1934.136 * t
    //         let lambda_true = lambda - 0.00569 - 0.00478 * sin(omega * .pi / 180)
            
    //         return lambda_true.truncatingRemainder(dividingBy: 360)
    //     }
        
    //     // 获取当前日期的太阳黄经
    //     let jd = julianDay(from: date)
    //     let sunLong = sunLongitude(julianDay: jd)
        
    //     // 检查是否是节气日期（允许0.5度的误差）
    //     for term in solarTermDegrees {
    //         let diff = abs(sunLong - term.degree)
    //         if diff < 0.5 || abs(diff - 360) < 0.5 {
    //             return term.name
    //         }
    //     }
        
    //     return nil
    // }
    
    //获取节日
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
    
    public struct SolarTermPeriod {
        let termName: String    // 节气名，如"雨水"
        let rank: String      // 三候名，如"初候"
        let phenomenon: String  // 候象名，如"獭祭鱼"
        let analysis: String    // 解析
        let storyLine: String // 5句故事线中的一句
    }
    
    static func getSolarTermPeriod(for date: Date) -> SolarTermPeriod? {
        let calendar = Calendar.current
        
        // 向前查找最近的节气
        var currentDate = date
        var currentTerm: (name: String, date: Date)? = nil
//        var nextTerm: (name: String, date: Date)? = nil
        
        // 向前查找最近的节气
        for _ in 0..<15 {
            if let term = getSolarTerm(for: currentDate) {
                currentTerm = (term, currentDate)
                break
            }
            currentDate = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        }
        
        // 向后查找下一个节气
//        currentDate = date
//        for _ in 0..<15 {
//            if let term = getSolarTerm(for: currentDate) {
//                if currentTerm == nil || currentDate > currentTerm!.date {
//                    nextTerm = (term, currentDate)
//                    break
//                }
//            }
//            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
//        }
        
        let previousTerm = currentTerm
//        guard let previousTerm = currentTerm,
//              let nextTerm = nextTerm else { return nil }
        
        // 计算在哪一候
        let daysFromPrevious = (Calendar.current.dateComponents([.day], from: previousTerm!.date, to: date).day ?? 0) + 1
        let phase = min(3, ((daysFromPrevious - 1) / 5) + 1)
        
        // 计算在当前候的第几天
        let dayIndex = ((daysFromPrevious - 1) % 5)
        
        // 获取三候名称
        let rankNames = ["初候", "次候", "末侯"]
        let rank = rankNames[phase - 1]
        
        // 获取详细信息
        if let phaseInfo = getPhaseDescription(term: previousTerm!.name, phase: phase) {
            return SolarTermPeriod(
                termName: previousTerm!.name,
                rank: rank,
                phenomenon: phaseInfo.phenomenon,
                analysis: phaseInfo.analysis,
                storyLine: phaseInfo.storyLines[dayIndex]
            )
        }
        
        return nil
    }
    
    static func getPhaseDescription(term: String, phase: Int) -> (phenomenon: String, analysis: String, storyLines: [String])? {
        let phaseDescs: [String: [String: [String: Any]]] = [
            "立春": [
                "初候": ["东风解冻": [
                    "解析": "春风吹拂黄河流域，冰封大地融裂成块，裂缝中升起湿润水汽。《礼记》曰：天地解而雷雨作，雷雨作而百果草木皆甲坼",
                    "故事线": [
                        "东风拂面来，冰雪渐消融",
                        "暖气浮青冢，寒冰化春泉",
                        "解冻山河动，万物复苏时",
                        "地脉传温意，冻土化春泥",
                        "一夜东风至，千里冰消时"
                    ]
                ]],
                "次候": ["蛰虫始振": [
                    "解析": "洞穴中冬眠的蛇虫感受到地温回升，触角微颤但未出穴，甲骨文「辰」字即为此态",
                    "故事线": [
                        "地暖虫初醒，春风唤万灵",
                        "蛰虫闻气动，蠢蠢欲出巢",
                        "地脉传温意，蛰虫知节来",
                        "春泥藏微动，万物共苏醒",
                        "天机启蛰户，春色入虫窝"
                    ]
                ]],
                "末侯": ["鱼陟负冰": [
                    "解析": "河水表冰未全化，鱼群上浮时背脊顶开薄冰，形成锯齿状冰裂线",
                    "故事线": [
                        "冰消鱼渐动，春水暖鳞翔",
                        "负冰寻暖处，游鱼贴水浮",
                        "春江水渐暖，鱼戏白波间",
                        "冰层裂纹起，鱼影掠春光",
                        "水暖鱼知节，浮游贴冰层"
                    ]
                ]]
            ],
            "雨水": [
                "初候": ["獭祭鱼": [
                    "解析": "水獭捕鱼排列岸边的古老误会（实为进食前清洗猎物），古人视为开春吉兆",
                    "故事线": [
                        "晓江獭伏岸，鱼列如祭陈",
                        "水寒鳞尚美，择鲜供晨餐",
                        "冰消鱼渐活，春意暗中传",
                        "獭爪分鱼肉，江畔留腥痕",
                        "渔人知时至，撒网趁春温"
                    ]
                ]],
                "次候": ["鸿雁来": [
                    "解析": "迁徙大雁以'人'字队形掠过正在消融的黄河冰面，鸣声经冰原反射形成特殊混响",
                    "故事线": [
                        "云端雁字归，春风引翅轻",
                        "北望故巢远，南去雪消融",
                        "行行天际过，点点破晴空",
                        "一声春讯至，唤醒万物生",
                        "候鸟知时节，迁徙应春风"
                    ]
                ]],
                "末侯": ["草木萌动": [
                    "解析": "榆树韧皮部筛管开始输送去年储存的糖分，地衣假根分泌溶岩酸瓦解冻土",
                    "故事线": [
                        "子：远雷惊地脉，冻石隙生腥",
                        "丑：柔雨撬老根，蓁芽钻裂甲",
                        "寅：蜗涎蚀朽木，虫兽掣暗旗",
                        "卯：草衔绿发刃，四野沸阳息",
                        "辰：南风领万鞘，划破春分线"
                    ]
                ]]
            ],
            "惊蛰": [
                "初候": ["桃始华": [
                    "解析": "乍暖还寒时节，桃花最先绽放，粉红的花瓣点缀枝头，预示着春天的全面到来",
                    "故事线": [
                        "子：一夜东风暖，桃枝绽露华",
                        "丑：春色先染树，粉红点翠芽",
                        "寅：蜂蝶寻香至，晨露映朝霞",
                        "卯：花开惊季节，春意满枝牙",
                        "辰：东君唤万物，桃始报春华"
                    ]
                ]],
                "次候": ["仓庚鸣": [
                    "解析": "黄鹂鸟婉转啼鸣，为春日增添一抹动听的乐章，百鸟和鸣，春意盎然",
                    "故事线": [
                        "子：金衣织晓雾，婉转啼枝头",
                        "丑：翠羽映朝阳，清音破春寂",
                        "寅：百鸟随歌起，万木听曲生",
                        "卯：黄鹂弄清影，春色满林梢",
                        "仓庚知节序，啼醒百花开"
                    ]
                ]],
                "末侯": ["鹰化为鸠": [
                    "解析": "鹰的习性变得温和，如同鸽子一般，象征万物趋于和顺，春意正浓",
                    "故事线": [
                        "子：猛禽敛锐气，和风化戾气",
                        "丑：春晴鹰逐云，似鸠栖暖枝",
                        "寅：万物皆向善，四时得其宜",
                        "卯：凶戾随冬去，温柔伴春归",
                        "辰：天机藏玄妙，物性应时移"
                    ]
                ]]
            ],
            "春分": [
                "初候": ["玄鸟至": [
                    "解析": "燕子从南方飞来，预示着温暖的春天已经到来",
                    "故事线": [
                        "子：玄鸟衔泥至，春风引翅归",
                        "丑：旧巢添新土，双燕筑新居",
                        "寅：檐前呢喃语，春意满庭院",
                        "卯：晓看飞掠过，暮闻归巢鸣",
                        "辰：人间春已暖，燕子报新晴"
                    ]
                ]],
                "次候": ["雷乃发声": [
                    "解析": "春雷隆隆，唤醒了蛰伏的万物，预示着新一年农耕季节的开始",
                    "故事线": [
                        "子：春雷初响动，惊醒万物生",
                        "丑：云端雷鼓震，大地春声起",
                        "寅：电闪惊冬梦，雷鸣唤春归",
                        "卯：雨后新芽嫩，雷声助发芽",
                        "辰：天公施号令，万物各归位"
                    ]
                ]],
                "末候": ["始电": [
                    "解析": "春季第一道闪电划破天际，雷雨交加，滋润大地",
                    "故事线": [
                        "子：电光破暗夜，春雨润万物",
                        "丑：紫电劈云开，甘霖洒大地",
                        "寅：闪耀照春林，雷雨助农时",
                        "卯：电光春气动，万物竞生机",
                        "辰：天地齐发力，春耕正当时"
                    ]
                ]]
            ],
            "清明": [
                "初候": ["桐始华": [
                    "解析": "梧桐树开始开花，春意盎然",
                    "故事线": [
                        "子：桐花初绽放，春色满枝头",
                        "丑：嫩叶承朝露，新花沐晨风",
                        "寅：花开知节至，春深染绿阴",
                        "卯：桐影摇清晓，花香伴春来",
                        "辰：一树春光好，万物竞芳华"
                    ]
                ]],
                "次候": ["田鼠化为鴽": [
                    "解析": "春温转暖，田鼠藏匿，鹌鹑开始出现",
                    "故事线": [
                        "子：田鼠潜深处，鴽鸟出新春",
                        "丑：物候随时迁，春深意渐浓",
                        "寅：阡陌生新绿，禾苗吐嫩芽",
                        "卯：春耕农事忙，万物竞生长",
                        "辰：时节催新变，春光暖四方"
                    ]
                ]],
                "末候": ["虹始见": [
                    "解析": "春雨过后，天空开始出现彩虹，景色绚丽",
                    "故事线": [
                        "子：雨后虹光现，七彩挂天边",
                        "丑：春晴云渐散，彩桥跨碧空",
                        "寅：虹桥连天地，春色满人间",
                        "卯：雨过天更碧，虹霓映春光",
                        "辰：自然呈瑞象，万物展新颜"
                    ]
                ]]
            ],
            "谷雨": [
                "初候": ["萍始生": [
                    "解析": "水塘中浮萍开始生长，显示水温回暖",
                    "故事线": [
                        "子：春池浮萍绿，点点水面生",
                        "丑：微风拂水面，浮萍舞春波",
                        "寅：雨润新萍长，春深水更温",
                        "卯：一池春水暖，万绿竞相生",
                        "辰：水暖知时节，浮萍报春来"
                    ]
                ]],
                "次候": ["呜鸠拂其羽": [
                    "解析": "布谷鸟梳理羽毛，准备繁衍后代",
                    "故事线": [
                        "子：呜鸠理羽翎，春深催农事",
                        "丑：林间闻鸟语，春意正浓时",
                        "寅：拂羽知时至，鸣声报农忙",
                        "卯：春风送暖意，万物竞芳华",
                        "辰：布谷声声催，春耕莫迟疑"
                    ]
                ]],
                "末候": ["戴胜降于桑": [
                    "解析": "戴胜鸟飞到桑树上，预示着夏天即将来临",
                    "故事线": [
                        "子：戴胜栖桑树，春深近夏时",
                        "丑：桑林新绿茂，彩羽舞春风",
                        "寅：鸟语传春信，农家知节期",
                        "卯：春深农事忙，桑叶正当时",
                        "辰：时节催人进，春耕莫迟疑"
                    ]
                ]]
            ]
            // ... 继续添加其他节气的三候
        ]
        
        // 获取对应节气的末侯信息
        if let termPhases = phaseDescs[term],
           let phaseInfo = phase == 1 ? termPhases["初候"] :
                          phase == 2 ? termPhases["次候"] :
                          phase == 3 ? termPhases["末侯"] : nil,
           let firstPhenomenon = phaseInfo.first,
           let details = firstPhenomenon.value as? [String: Any],
           let analysis = details["解析"] as? String,
           let storyLines = details["故事线"] as? [String] {
            
            return (
                phenomenon: firstPhenomenon.key,
                analysis: analysis,
                storyLines: storyLines
            )
        }
        
        return nil
    }
}
