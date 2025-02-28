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
        
        // 获取日期的儒略日（考虑东八区时差）
        func julianDay(from date: Date) -> Double {
            // 转换到东八区时间
            let calendar = Calendar(identifier: .gregorian)
            let timeZone = TimeZone(secondsFromGMT: 8 * 3600)! // 东八区
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            guard let year = components.year,
                  let month = components.month,
                  let day = components.day,
                  let hour = components.hour,
                  let minute = components.minute,
                  let second = components.second else {
                return 0
            }
            
            var y = Double(year)
            var m = Double(month)
            // 加入时区偏移
            let d = Double(day) + (Double(hour) + 8.0 + Double(minute)/60.0 + Double(second)/3600.0)/24.0
            
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
            
            // 太阳平黄经
            let l0 = 280.46646 + 36000.76983 * t + 0.0003032 * t * t
            
            // 太阳中心差
            let m = 357.52911 + 35999.05029 * t - 0.0001537 * t * t
            
            // 地球轨道离心率
            let e = 0.016708634 - 0.000042037 * t - 0.0000001267 * t * t
            
            // 太阳方程
            let c = (1.914602 - 0.004817 * t - 0.000014 * t * t) * sin(m * .pi / 180)
                + (0.019993 - 0.000101 * t) * sin(2 * m * .pi / 180)
                + 0.000289 * sin(3 * m * .pi / 180)
            
            // 真黄经
            let lambda = l0 + c
            
            // 章动修正
            let omega = 125.04 - 1934.136 * t
            let lambda_true = lambda - 0.00569 - 0.00478 * sin(omega * .pi / 180)
            
            return lambda_true.truncatingRemainder(dividingBy: 360)
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
        let name: String // 候的名称，如"草木萌动"
        let desc: String // 侯的描述，如""
    }
    
    static func getSolarTermPeriod(for date: Date) -> SolarTermPeriod? {
        let calendar = Calendar.current
        
        // 使用已有的 getSolarTerm 函数查找当前日期的节气
        var currentDate = date
        var currentTerm: (name: String, date: Date)? = nil
        var nextTerm: (name: String, date: Date)? = nil
        
        // 向前查找最近的节气
        for _ in 0..<15 {  // 最多查找15天
            if let term = getSolarTerm(for: currentDate) {
                currentTerm = (term, currentDate)
                break
            }
            currentDate = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        }
        
        // 向后查找下一个节气
        currentDate = date
        for _ in 0..<15 {  // 最多查找15天
            if let term = getSolarTerm(for: currentDate) {
                if currentTerm == nil || currentDate > currentTerm!.date {
                    nextTerm = (term, currentDate)
                    break
                }
            }
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        guard let previousTerm = currentTerm,
              let nextTerm = nextTerm else { return nil }
        
        // 计算两个节气之间的总天数
        let totalDays = Calendar.current.dateComponents([.day], from: previousTerm.date, to: nextTerm.date).day ?? 0
        // 每候大约5天，但要考虑实际间隔
        let phaseLength = Double(totalDays) / 3.0
        
        // 计算当前日期在哪一候（加1是因为dateComponents计算差值不包含当天）
        let daysFromPrevious = (Calendar.current.dateComponents([.day], from: previousTerm.date, to: date).day ?? 0) + 1
        let phase = min(3, Int(ceil(Double(daysFromPrevious) / phaseLength)))
        
        // 获取对应候的描述
        let phaseDesc = getPhaseDescription(term: previousTerm.name, phase: phase)
        
        return SolarTermPeriod(
            phase: phase,
            name: phaseDesc.0,
            desc: phaseDesc.1
        )
    }
    
    static func getPhaseDescription(term: String, phase: Int) -> (String, String) {
        let phaseDescs: [String: [String: [String: String]]] = [
            // 春季
            "立春": [
                "初候": ["东风解冻": "立春时节，东风送暖，冰雪开始消融。春风拂过，万物开始苏醒"],
                "次候": ["蛰虫始振": "随着地气回暖，蛰伏的昆虫感知春天的气息，开始蠢蠢欲动"],
                "三候": ["鱼陟负冰": "河水表冰未全化，鱼群上浮时背脊顶开薄冰，形成锯齿状冰裂线"]
            ],
            "雨水": [
                "初候": ["獭祭鱼": "水獭捕获鱼后，会将鱼摆放整齐，像是在祭祀，实则是在挑选新鲜的鱼食用"],
                "次候": ["鸿雁来": "天气转暖，候鸟大雁从南方飞来，排成人字形，点缀在春天的天空中"],
                "三候": ["草木萌动": "春雨滋润大地，枯黄的草木开始吐出新芽，一片生机盎然"]
            ],
            "惊蛰": [
                "初候": ["桃始华": "最先绽放的桃花点缀枝头，粉嫩的花瓣迎着春风轻轻摇曳，预示着春天真正到来"],
                "次候": ["仓庚鸣": "黄鹂鸟婉转的鸣叫声在林间回荡，为春天增添了一抹动听的乐章"],
                "三候": ["鹰化为鸠": "春意渐浓，凶猛的鹰变得温顺，开始专注于培育幼鸟，不再四处捕食"]
            ],
            "春分": [
                "初候": ["玄鸟至": "燕子从南方飞回，在屋檐下筑巢，带来了春天的讯息"],
                "次候": ["雷乃发声": "春雷滚滚，惊醒了沉睡的大地，预示着万物生长的季节来临"],
                "三候": ["始电": "天空开始出现闪电，春雷与闪电交织，为大地带来生机"]
            ],
            "清明": [
                "初候": ["桐始华": "梧桐树的花朵绽放，随风飘落如雪，为春日增添一份诗意"],
                "次候": ["田鼠化为鴽": "田间的老鼠逐渐减少，布谷鸟的叫声开始在田野间此起彼伏"],
                "三候": ["虹始见": "春雨过后，七彩虹霓横跨天际，将春天装扮得绚丽多彩"]
            ],
            "谷雨": [
                "初候": ["萍始生": "春水温暖，浮萍开始在水面上漂浮生长，为水面增添了一层新绿"],
                "次候": ["鸣鸠拂其羽": "布谷鸟梳理羽毛，在田间来回飞翔，不停地提醒农人春耕时节已到"],
                "三候": ["戴胜降于桑": "戴胜鸟飞到桑树上，昂着美丽的羽冠，为春末增添一道靓丽的风景"]
            ],
            
            // 夏季
            "立夏": [
                "初候": ["蝼蝈鸣": "夏天来临，蟋蟀在草丛中奏响清脆的鸣叫声，为夏夜增添一份热闹"],
                "次候": ["蚯蚓出": "蚯蚓感受到夏天的温暖，纷纷钻出土壤，在雨后的泥土中活动"],
                "三候": ["王瓜生": "瓜类植物开始生长，嫩绿的瓜苗在田间地头悄然破土"]
            ],
            "小满": [
                "初候": ["苦菜秀": "田野间的苦菜长得茂盛，绿叶间点缀着黄色的小花"],
                "次候": ["靡草死": "春季的野草开始枯萎，为夏季新生的植物让路"],
                "三候": ["麦秋至": "麦子开始成熟，麦浪随风起伏，金黄的麦穗低垂着头"]
            ],
            "芒种": [
                "初候": ["螳螂生": "螳螂开始出现，静立在绿叶间，伺机捕食小虫"],
                "次候": ["鵙始鸣": "伯劳鸟开始鸣叫，它清脆的叫声在树林间回荡"],
                "三候": ["反舌无声": "百舌鸟停止鸣叫，把舞台让给夏季的其他鸟儿"]
            ],
            "夏至": [
                "初候": ["鹿角解": "雄鹿的旧角自然脱落，为新角的生长做准备"],
                "次候": ["蜩始鸣": "夏蝉开始鸣叫，它们的声音此起彼伏，奏响夏天的交响曲"],
                "三候": ["半夏生": "半夏草茁壮生长，为炎炎夏日增添一片绿意"]
            ],
            "小暑": [
                "初候": ["温风至": "和煦的暖风吹拂，带来丝丝暑意"],
                "次候": ["蟋蟀居壁": "蟋蟀躲在墙缝中，发出阵阵鸣叫声"],
                "三候": ["鹰始挚": "幼鹰开始学习飞翔，在天空中展翅翱翔"]
            ],
            "大暑": [
                "初候": ["腐草为萤": "潮湿的草木腐烂后，萤火虫开始出现，点点荧光照亮夏夜"],
                "次候": ["土润溽暑": "天气炎热潮湿，大地被暑气蒸腾得湿润异常"],
                "三候": ["大雨行时": "暑热积聚，常有大雨倾盆而下，为燥热的大地带来清凉"]
            ],
            
            // 秋季
            "立秋": [
                "初候": ["凉风至": "秋风送爽，暑气渐退，带来丝丝凉意"],
                "次候": ["白露降": "清晨时分，草叶上凝结着晶莹的白色露珠"],
                "三候": ["寒蝉鸣": "寒蝉发出凄切的鸣叫声，预示着秋天的来临"]
            ],
            "处暑": [
                "初候": ["鹰乃祭鸟": "鹰开始猎食小鸟，在空中盘旋寻找猎物"],
                "次候": ["天地始肃": "天高气爽，万物开始呈现肃穆的气象"],
                "三候": ["禾乃登": "稻谷成熟，农民开始收获，将金黄的稻穗收入仓廓"]
            ],
            "白露": [
                "初候": ["鸿雁来宾": "大雁列队南飞，像是远方来的宾客，为秋天增添一份生机"],
                "次候": ["玄鸟归": "燕子感知寒意渐浓，开始成群结队往南方迁徙"],
                "三候": ["群鸟养羞": "鸟儿们忙着储存食物，为即将到来的冬天做准备"]
            ],
            "秋分": [
                "初候": ["雷始收声": "雷声渐渐消失，天地间归于平静"],
                "次候": ["蛰虫坯户": "昆虫开始为冬眠做准备，在土中筑造洞穴"],
                "三候": ["水始涸": "小溪水流变小，一些浅水洼开始干涸"]
            ],
            "寒露": [
                "初候": ["鸿雁来": "又一批大雁从北方飞来，在寒露时节的天空中列队南飞"],
                "次候": ["雀入大水为蛤": "有些小鸟躲入水中越冬，古人认为它们会变成蛤蜊"],
                "三候": ["菊有黄花": "菊花盛开，金黄的花朵点缀秋色，散发淡淡幽香"]
            ],
            "霜降": [
                "初候": ["豺乃祭兽": "豺狼开始在野外活动觅食，为冬天储备食物"],
                "次候": ["草木黄落": "草木开始枯黄凋落，为冬天的到来做准备"],
                "三候": ["蛰虫咸俯": "各种昆虫陆续入土冬眠，等待来年春天"]
            ],
            
            // 冬季
            "立冬": [
                "初候": ["水始冰": "天气转寒，池塘、小溪的水面开始结冰"],
                "次候": ["地始冻": "土地开始冻结，寒气自下而上，大地渐渐坚硬"],
                "三候": ["雉入大水为蜃": "野鸡躲避严寒，古人认为它们会潜入水中变成蜃"]
            ],
            "小雪": [
                "初候": ["虹藏不见": "天气寒冷，不再有彩虹出现在天际"],
                "次候": ["天气上升地气下降": "寒气积聚，天地之气上下交换，云雾渐多"],
                "三候": ["闭塞而成冬": "天地闭塞，万物蛰伏，冬天正式形成"]
            ],
            "大雪": [
                "初候": ["鹖鴠不鸣": "鹖鴠鸟感知寒意，停止鸣叫"],
                "次候": ["虎始交": "老虎开始交配，为来年繁衍后代做准备"],
                "三候": ["荔挺出": "荔枝草在寒冷中顽强生长，抽出新芽"]
            ],
            "冬至": [
                "初候": ["蚯蚓结": "蚯蚓在地下结成团，互相取暖避寒"],
                "次候": ["麋角解": "麋鹿的鹿角开始脱落，等待来年重新长出"],
                "三候": ["水泉动": "地下水脉活动，使得一些泉水在寒冬中涌动"]
            ],
            "小寒": [
                "初候": ["雁北乡": "有些大雁开始向北方飞行，为春天的到来做准备"],
                "次候": ["鹊始巢": "喜鹊开始筑巢，为即将到来的繁殖季节做准备"],
                "三候": ["雉雊": "野鸡开始鸣叫，预示着新的一年生机即将开始"]
            ],
            "大寒": [
                "初候": ["鸡始乳": "母鸡开始孵化鸡蛋，虽天寒地冻，生命延续不止"],
                "次候": ["征鸟厉疾": "候鸟飞行速度加快，似乎在躲避严寒"],
                "三候": ["水泽腹坚": "江河湖泊冰层加厚，寒气达到顶峰"]
            ]
        ]
        
        // 获取对应节气的三候信息
        if let termPhases = phaseDescs[term],
           let phaseInfo = phase == 1 ? termPhases["初候"] :
                          phase == 2 ? termPhases["次候"] :
                          phase == 3 ? termPhases["三候"] : nil,
           let firstPhenomenon = phaseInfo.first {
            return (firstPhenomenon.key, firstPhenomenon.value)
        }
        
        return ("","")
    }
}
