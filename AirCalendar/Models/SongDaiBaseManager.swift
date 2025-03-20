import Foundation

// MARK: - 基础模型
public struct SongDaiPoetry {
    public let title: String
    public let author: String
    public let content: String
    public let background: String
    
    public init(title: String, author: String, content: String, background: String) {
        self.title = title
        self.author = author
        self.content = content
        self.background = background
    }
}

public struct SongDaiActivity {
    public let name: String
    public let description: String
    public let details: [String]
    public let custom: String
    public let source: String
    public let poetry: SongDaiPoetry
    public let materials: [(String, String)]  // (材料名, 用量)
    public let steps: [String]  // 制作步骤
    
    public init(name: String, description: String, details: [String], 
               custom: String, source: String, poetry: SongDaiPoetry,
               materials: [(String, String)], steps: [String]) {
        self.name = name
        self.description = description
        self.details = details
        self.custom = custom
        self.source = source
        self.poetry = poetry
        self.materials = materials
        self.steps = steps
    }
}

public struct SongDaiArrangement {
    public let solarTerm: String
    public let activities: [SongDaiActivity]
    public let custom: String
    public let source: String
    
    public init(solarTerm: String, activities: [SongDaiActivity], custom: String, source: String) {
        self.solarTerm = solarTerm
        self.activities = activities
        self.custom = custom
        self.source = source
    }
}

// MARK: - 基础协议
public protocol SongDaiBaseManager {
    var calendar: [String: SongDaiArrangement] { get }
    func getArrangement(for solarTerm: String) -> SongDaiArrangement?
    func getInfos(_ date: Date) -> [SongDaiActivity]
}

// MARK: - 基础扩展
public extension SongDaiBaseManager {
    func getArrangement(for date: Date) -> SongDaiArrangement? {
        guard let solarTerm = CalendarManager.getNearestSolarTerm(for: date) else {
            return nil
        }
        return getArrangement(for: solarTerm)
    }
    
    func getInfos(_ date: Date) -> [SongDaiActivity] {
        guard let arrangement = getArrangement(for: date) else {
            return []
        }
        return arrangement.activities
    }
    
    func getArrangement(for solarTerm: String) -> SongDaiArrangement? {
        return calendar[solarTerm]
    }
}

// MARK: - 花道管理器
public class SongDaiFlowerManager: SongDaiBaseManager {
    public static let shared = SongDaiFlowerManager()
    private init() {}
    
    public let calendar: [String: SongDaiArrangement] = [
        "雨水": SongDaiArrangement(
            solarTerm: "雨水",
            activities: [
                SongDaiActivity(
                    name: "赏梅",
                    description: "文人雅士登临赏梅，品茗吟诗",
                    details: ["访梅林胜地", "品茗赏梅", "吟诗作画", "雅集聚会"],
                    custom: "《梦粱录》记载：'雨水时节，士人多往灵隐、天竺诸山赏梅。'",
                    source: "《梦粱录》",
                    poetry: SongDaiPoetry(
                        title: "踏莎行·雨水",
                        author: "秦观",
                        content: "雨水初晴，东风渐暖，淡淡梅花香暗度。小桃枝上春意闲，绿杨堤畔愁如许。",
                        background: "描写雨水时节梅花盛开的景象，展现了早春时节的生机与诗人的情思。"
                    ),
                    materials: [
                        ("梅花", "3-5枝"),
                        ("青瓷花器", "1个"),
                        ("清水", "适量"),
                        ("剪刀", "1把")
                    ],
                    steps: [
                        "选择带有花苞的梅枝，枝条完整无损",
                        "将梅枝斜切成45度角，有利于吸水",
                        "在花器中注入适量清水",
                        "将梅枝插入花器，调整位置和角度",
                        "放置在通风处，避免阳光直射"
                    ]
                )
            ],
            custom: "雨水赏梅",
            source: "《梦粱录》"
        ),
        "春分": SongDaiArrangement(
            solarTerm: "春分",
            activities: [
                SongDaiActivity(
                    name: "赏百花",
                    description: "观赏春日百花盛开",
                    details: ["赏牡丹", "观芍药", "看海棠", "品花茶"],
                    custom: "《东京梦华录》记载：'春分时节，百花齐放，士女游赏，不绝于途。'",
                    source: "《东京梦华录》",
                    poetry: SongDaiPoetry(
                        title: "春分日游苏州",
                        author: "范成大",
                        content: "春分天气好，花影满春塘。蝶翻红药径，莺啭百花香。",
                        background: "描写春分时节百花盛开的美景，展现了宋代园林赏花文化。"
                    ),
                    materials: [
                        ("青瓷花器", "2-3个"),
                        ("剪刀", "1把"),
                        ("清水", "适量"),
                        ("牡丹花", "3-5枝"),
                        ("芍药", "2-3枝"),
                        ("海棠花", "2-3枝"),
                        ("花茶", "适量")
                    ],
                    steps: [
                        "选择合适的青瓷花器，注入清水至八分满",
                        "修剪花枝，将茎部斜切成45度角",
                        "按照'高、中、低'三个层次插放花材",
                        "调整花材方向，使其自然舒展",
                        "将花器摆放在通风处，避免阳光直射",
                        "准备花茶，可选用茉莉花或玫瑰花茶",
                        "赏花时品茗，体会春日花香"
                    ]
                )
            ],
            custom: "春分赏百花",
            source: "《东京梦华录》"
        ),
        "惊蛰": SongDaiArrangement(
            solarTerm: "惊蛰",
            activities: [
                SongDaiActivity(
                    name: "赏桃花",
                    description: "观赏初春桃花盛开",
                    details: ["访桃林", "赏桃花", "品茗论道", "吟诗作画"],
                    custom: "《东京梦华录》记载：'惊蛰时节，桃花盛开，士人雅集赏花。'",
                    source: "《东京梦华录》",
                    poetry: SongDaiPoetry(
                        title: "惊蛰观桃",
                        author: "苏轼",
                        content: "惊蛰才过雨乍晴，桃花嫣然出墙东。春风一夜吹开处，粉面朱颜照晓红。",
                        background: "描写惊蛰时节桃花绽放的美景，展现了早春时节的生机。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "惊蛰赏桃花",
            source: "《东京梦华录》"
        )
    ]
    
    // 添加这个方法以符合协议
    public func getArrangement(for solarTerm: String) -> SongDaiArrangement? {
        return calendar[solarTerm]
    }
}

// MARK: - 茶道管理器
public class SongDaiTeaManager: SongDaiBaseManager {
    public static let shared = SongDaiTeaManager()
    private init() {}
    
    public let calendar: [String: SongDaiArrangement] = [
        "谷雨": SongDaiArrangement(
            solarTerm: "谷雨",
            activities: [
                SongDaiActivity(
                    name: "尝茶",
                    description: "品饮明前新茶",
                    details: ["采摘新茶", "品茗论道", "茶会雅集", "赠茶结缘"],
                    custom: "《武林旧事》记载：'谷雨前后，龙井诸山采茶盛时，士人多往品茗。'",
                    source: "《武林旧事》",
                    poetry: SongDaiPoetry(
                        title: "谷雨煎茶",
                        author: "苏轼",
                        content: "谷雨新芽嫩，晴窗细雨晞。小瓯春露滴，微火麝香飞。",
                        background: "描写谷雨时节品饮新茶的雅致情趣，展现了宋代茶文化的精妙。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "谷雨品茶",
            source: "《武林旧事》"
        ),
        "春分": SongDaiArrangement(
            solarTerm: "春分",
            activities: [
                SongDaiActivity(
                    name: "春茶品鉴",
                    description: "品尝春分时节的早春茶",
                    details: ["择茶品类", "观茶汤色", "闻茶香气", "品茶韵味"],
                    custom: "《茶录》记载：'春分前后，新茶初出，茶性清和，最宜品饮。'",
                    source: "《茶录》",
                    poetry: SongDaiPoetry(
                        title: "春分煎茶",
                        author: "黄庭坚",
                        content: "春分日永茶烟起，小院幽窗品茗时。新芽嫩叶知多少，细细春风度翠枝。",
                        background: "描写春分时节品饮新茶的雅致，体现了宋代茶文化的精妙。"
                    ),
                    materials: [
                        ("明前龙井", "50克"),
                        ("温润泉水", "500ml"),
                        ("青瓷茶具", "一套"),
                        ("茶巾", "2条"),
                        ("茶针", "1支"),
                        ("茶则", "1支"),
                        ("茶漏", "1个")
                    ],
                    steps: [
                        "备器：温润茶具，使用沸水冲洗",
                        "择茶：选用上等明前龙井，取适量备用",
                        "烧水：选用泉水，温度控制在85度左右",
                        "投茶：用茶则取茶叶置于茶杯中",
                        "冲泡：斜斟热水，水流如线",
                        "观色：注意茶汤色泽，应清澈明亮",
                        "品味：先闻香气，后小啜慢饮"
                    ]
                )
            ],
            custom: "春分品新茶",
            source: "《茶录》"
        ),
        "惊蛰": SongDaiArrangement(
            solarTerm: "惊蛰",
            activities: [
                SongDaiActivity(
                    name: "春芽茶会",
                    description: "品饮惊蛰时节第一批春茶",
                    details: ["选春芽", "煮山泉", "观茶汤", "品新茗"],
                    custom: "《茶经》记载：'惊蛰之后，茶芽初发，味最清新。'",
                    source: "《茶经》",
                    poetry: SongDaiPoetry(
                        title: "惊蛰品茶",
                        author: "陆游",
                        content: "惊蛰春雷动地来，茶芽嫩绿破土开。小炉新火温泉水，一盏清香胜百杯。",
                        background: "描写惊蛰时节品尝新茶的雅趣，体现了宋代茶文化的精致。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "惊蛰品春茶",
            source: "《茶经》"
        )
    ]
    
    public func getArrangement(for solarTerm: String) -> SongDaiArrangement? {
        return calendar[solarTerm]
    }
}

// MARK: - 香道管理器
public class SongDaiIncenseManager: SongDaiBaseManager {
    public static let shared = SongDaiIncenseManager()
    private init() {}
    
    public let calendar: [String: SongDaiArrangement] = [
        "立秋": SongDaiArrangement(
            solarTerm: "立秋",
            activities: [
                SongDaiActivity(
                    name: "焚香",
                    description: "焚香祈福，迎接秋季",
                    details: ["选香品香", "焚香祈福", "香道雅集", "香囊制作"],
                    custom: "《东京梦华录》记载：'立秋之日，士庶焚香祈福，以应时令。'",
                    source: "《东京梦华录》",
                    poetry: SongDaiPoetry(
                        title: "立秋焚香",
                        author: "苏轼",
                        content: "一炉香气透窗来，新秋风物正徘徊。檀香细细随风起，似有龙涎暗里催。",
                        background: "描写立秋时节焚香的雅致情趣，展现了宋代香道文化的精妙。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "立秋焚香",
            source: "《东京梦华录》"
        ),
        "春分": SongDaiArrangement(
            solarTerm: "春分",
            activities: [
                SongDaiActivity(
                    name: "百花香",
                    description: "焚烧春季百花香",
                    details: ["选百花香", "调香配方", "焚香品味", "制香囊"],
                    custom: "《香谱》记载：'春分时节，百花香最宜，可助养生。'",
                    source: "《香谱》",
                    poetry: SongDaiPoetry(
                        title: "春分焚香",
                        author: "苏轼",
                        content: "一炉百花香雾起，春分天气正融和。檀香细细随风度，似有花神暗里过。",
                        background: "描写春分时节焚香的意境，展现了宋代香道文化的精致。"
                    ),
                    materials: [
                        ("檀香", "5克"),
                        ("沉香", "3克"),
                        ("玫瑰花瓣", "10克"),
                        ("茉莉花", "5克"),
                        ("铜香炉", "1个"),
                        ("香筷", "1双"),
                        ("香道垫", "1块")
                    ],
                    steps: [
                        "清洁香炉，确保内部无杂质",
                        "将檀香和沉香混合研磨成细粉",
                        "加入干燥的玫瑰花瓣和茉莉花",
                        "用香筷将香料放入香炉中",
                        "点燃香炭，待其发白",
                        "将调制好的香料撒在香炭上",
                        "静坐品香，感受春日气息"
                    ]
                )
            ],
            custom: "春分焚百花香",
            source: "《香谱》"
        ),
        "惊蛰": SongDaiArrangement(
            solarTerm: "惊蛰",
            activities: [
                SongDaiActivity(
                    name: "春雷香",
                    description: "焚烧惊蛰特制香料",
                    details: ["选龙涎香", "配春草香", "焚香祈福", "制香囊"],
                    custom: "《香谱》记载：'惊蛰之时，宜焚龙涎香，应春雷之气。'",
                    source: "《香谱》",
                    poetry: SongDaiPoetry(
                        title: "惊蛰焚香",
                        author: "王安石",
                        content: "一炉香气破春寒，惊蛰雷声入梦残。龙涎细细随风起，唤醒沉眠百草欢。",
                        background: "描写惊蛰时节焚香的情景，暗合惊蛰雷动万物复苏的节气特点。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "惊蛰焚春香",
            source: "《香谱》"
        )
    ]
    
    public func getArrangement(for solarTerm: String) -> SongDaiArrangement? {
        return calendar[solarTerm]
    }
}

// MARK: - 时令饮食管理器
public class SongDaiFoodManager: SongDaiBaseManager {
    public static let shared = SongDaiFoodManager()
    private init() {}
    
    public let calendar: [String: SongDaiArrangement] = [
        "立冬": SongDaiArrangement(
            solarTerm: "立冬",
            activities: [
                SongDaiActivity(
                    name: "食补",
                    description: "食用温补食品",
                    details: ["煮羊肉", "炖鸡汤", "饮姜酒", "食火锅"],
                    custom: "《梦粱录》记载：'立冬之日，市肆皆售补羊，谓之冬羊。'",
                    source: "《梦粱录》",
                    poetry: SongDaiPoetry(
                        title: "立冬日饮",
                        author: "王安石",
                        content: "冬日暖阳天气好，围炉煮酒话桑麻。羊肉炖来香满室，不知身在雪中家。",
                        background: "描写立冬时节饮食取暖的生活场景，展现了宋代饮食文化的特色。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "立冬食补",
            source: "《梦粱录》"
        ),
        "春分": SongDaiArrangement(
            solarTerm: "春分",
            activities: [
                SongDaiActivity(
                    name: "春分时膳",
                    description: "享用春分时节应季食材",
                    details: ["食春笋", "尝青菜", "品春芽", "饮花茶"],
                    custom: "《东京梦华录》记载：'春分时节，市肆多售春笋青菜，以应时令。'",
                    source: "《东京梦华录》",
                    poetry: SongDaiPoetry(
                        title: "春分食笋",
                        author: "陆游",
                        content: "春分天气暖融融，新笋出林香满筒。细切春盘佐美酒，不知身在画图中。",
                        background: "描写春分时节品尝春笋的美味，展现了宋代饮食文化的雅致。"
                    ),
                    materials: [
                        ("春笋", "500克"),
                        ("青菜", "300克"),
                        ("春芽", "200克"),
                        ("花茶", "50克"),
                        ("料酒", "30ml"),
                        ("盐", "适量"),
                        ("姜丝", "20克")
                    ],
                    steps: [
                        "春笋去壳，切片焯水去苦",
                        "青菜洗净，切段备用",
                        "锅中加油，爆香姜丝",
                        "加入春笋翻炒，注入料酒",
                        "放入青菜和春芽快速翻炒",
                        "加盐调味，保持菜品清爽",
                        "装盘时注意摆盘美观"
                    ]
                )
            ],
            custom: "春分食时鲜",
            source: "《东京梦华录》"
        ),
        "惊蛰": SongDaiArrangement(
            solarTerm: "惊蛰",
            activities: [
                SongDaiActivity(
                    name: "尝春盘",
                    description: "品尝惊蛰时节应季食材",
                    details: ["食春笋", "尝野菜", "饮春酒", "食春盘"],
                    custom: "《东京梦华录》记载：'惊蛰时节，市肆多售春盘，以应节气。'",
                    source: "《东京梦华录》",
                    poetry: SongDaiPoetry(
                        title: "惊蛰尝春",
                        author: "苏轼",
                        content: "惊蛰才过春意浓，新笋初破嫩箨红。野菜盈盘春酒绿，不负东风入座中。",
                        background: "描写惊蛰时节品尝春季时令美食的情景，展现了宋代饮食文化。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "惊蛰食春盘",
            source: "《东京梦华录》"
        )
    ]
    
    public func getArrangement(for solarTerm: String) -> SongDaiArrangement? {
        return calendar[solarTerm]
    }
}

// MARK: - 出游管理器
public class SongDaiTravelManager: SongDaiBaseManager {
    public static let shared = SongDaiTravelManager()
    private init() {}
    
    public let calendar: [String: SongDaiArrangement] = [
        "清明": SongDaiArrangement(
            solarTerm: "清明",
            activities: [
                SongDaiActivity(
                    name: "游春",
                    description: "民间踏青游玩",
                    details: ["携酒游春", "插柳戴花", "放风筝", "野餐宴饮"],
                    custom: "《东京梦华录》记载：'清明时节，士女出游，插柳戴花，游赏春色。'",
                    source: "《东京梦华录》",
                    poetry: SongDaiPoetry(
                        title: "清明",
                        author: "杜牧",
                        content: "清明时节雨纷纷，路上行人欲断魂。借问酒家何处有，牧童遥指杏花村。",
                        background: "描写清明时节踏青游玩的场景，是最著名的清明诗词之一。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "清明游春",
            source: "《东京梦华录》"
        ),
        "春分": SongDaiArrangement(
            solarTerm: "春分",
            activities: [
                SongDaiActivity(
                    name: "春游",
                    description: "春分时节郊游踏青",
                    details: ["踏青赏春", "野餐雅集", "寻芳访胜", "吟诗作画"],
                    custom: "《武林旧事》记载：'春分日，士女出游，踏青寻芳，雅集赋诗。'",
                    source: "《武林旧事》",
                    poetry: SongDaiPoetry(
                        title: "春分即事",
                        author: "欧阳修",
                        content: "春分天气好，约伴踏青来。草色青如染，花枝红似裁。",
                        background: "描写春分时节踏青游春的美好景致，体现了宋代文人的生活情趣。"
                    ),
                    materials: [
                        ("茶具", "一套"),
                        ("点心", "若干"),
                        ("毯子", "1-2条"),
                        ("折扇", "1把"),
                        ("诗笺", "数张"),
                        ("毛笔", "1支"),
                        ("砚台", "1方")
                    ],
                    steps: [
                        "选择晴朗的春分日出游",
                        "准备茶具和点心，打包妥当",
                        "寻找适合的赏春地点",
                        "铺设毯子，摆放茶具",
                        "品茗赏景，吟诗作画",
                        "记录春日所见所感",
                        "收拾物品，保持环境整洁"
                    ]
                )
            ],
            custom: "春分踏青游春",
            source: "《武林旧事》"
        ),
        "惊蛰": SongDaiArrangement(
            solarTerm: "惊蛰",
            activities: [
                SongDaiActivity(
                    name: "探春",
                    description: "惊蛰时节探寻春意",
                    details: ["访春景", "寻野花", "听春雷", "赏新绿"],
                    custom: "《武林旧事》记载：'惊蛰之日，士女出游，探寻春色，以应节候。'",
                    source: "《武林旧事》",
                    poetry: SongDaiPoetry(
                        title: "惊蛰探春",
                        author: "范成大",
                        content: "惊蛰雷声唤醒春，东风吹绿遍城闉。踏青正好寻芳去，野径花开蝶已新。",
                        background: "描写惊蛰时节外出探春的雅趣，体现了宋代文人对自然的感知。"
                    ),
                    materials: [],
                    steps: []
                )
            ],
            custom: "惊蛰探春",
            source: "《武林旧事》"
        )
    ]
    
    public func getArrangement(for solarTerm: String) -> SongDaiArrangement? {
        return calendar[solarTerm]
    }
}
