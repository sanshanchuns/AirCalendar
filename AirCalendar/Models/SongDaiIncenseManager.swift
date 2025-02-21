public class SongDaiIncenseManager: SongDaiBaseManager {
    public static let shared = SongDaiIncenseManager()
    
    private init() {}
    
    public struct IncenseArrangement {
        public let solarTerm: String
        public let incenses: [Incense]
        public let custom: String
        public let source: String
        
        public init(solarTerm: String, incenses: [Incense], custom: String, source: String) {
            self.solarTerm = solarTerm
            self.incenses = incenses
            self.custom = custom
            self.source = source
        }
    }
    
    public struct Incense {
        public let name: String
        public let ingredients: [(String, String)]
        public let preparation: [String]
        public let method: [String]
        public let dryingMethod: String
        public let storage: String
        public let usage: String
        public let effect: String
        public let poetry: Poetry?
        
        public init(name: String, ingredients: [(String, String)], preparation: [String], 
                   method: [String], dryingMethod: String, storage: String, usage: String, 
                   effect: String, poetry: Poetry?) {
            self.name = name
            self.ingredients = ingredients
            self.preparation = preparation
            self.method = method
            self.dryingMethod = dryingMethod
            self.storage = storage
            self.usage = usage
            self.effect = effect
            self.poetry = poetry
        }
    }
    
    public struct Poetry {
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
    
    public let calendar: [String: IncenseArrangement] = [
        "立春": IncenseArrangement(
            solarTerm: "立春",
            incenses: [
                Incense(
                    name: "迎春香",
                    ingredients: [
                        ("檀香粉", "3钱"),
                        ("梅花", "2钱"),
                        ("龙脑", "1分"),
                        ("蜂蜜", "适量"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        "梅花需晾干研磨",
                        "龙脑需碾碎",
                        "蜂蜜调至稀薄",
                        "准备温水"
                    ],
                    method: [
                        "1. 将檀香粉置于洁净瓷碗中",
                        "2. 加入研磨好的梅花粉",
                        "3. 轻轻拌匀两种粉末",
                        "4. 加入碾碎的龙脑",
                        "5. 滴入适量蜂蜜",
                        "6. 加入温水调和成团",
                        "7. 揉搓成米粒大小的香丸",
                        "8. 每丸重约1分"
                    ],
                    dryingMethod: "阴凉处晾干3-5日，避免阳光直射",
                    storage: "瓷器密封保存，置于阴凉干燥处",
                    usage: "晨起焚香，取1-2丸，置于小巧香炉，以迎新春",
                    effect: "香气清雅，似有梅香暗度，可醒神提气",
                    poetry: Poetry(
                        title: "立春焚香",
                        author: "苏轼",
                        content: "一炉春香透窗来，东风送暖春意回。",
                        background: "描写立春时节焚香的雅致"
                    )
                )
            ],
            custom: "立春制香，《香谱》载：'以檀为主，配以梅香，可感春意。量宜适中，香气自然。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "雨水": IncenseArrangement(
            solarTerm: "雨水",
            incenses: [
                Incense(
                    name: "春雨香",
                    ingredients: [
                        ("沉香粉", "3钱"),
                        ("玉兰花瓣", "2钱"),
                        ("丁香", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        "玉兰花瓣需晾干研磨",
                        "丁香需碾碎",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于洁净瓷碗中",
                        "2. 加入研磨好的玉兰粉",
                        "3. 轻轻拌匀两种粉末",
                        "4. 加入碾碎的丁香",
                        "5. 缓缓加入温水调和",
                        "6. 揉搓成薄饼状",
                        "7. 用小刀划成方寸大小",
                        "8. 每饼重约2分"
                    ],
                    dryingMethod: "阴凉处晾干5-7日，避免阳光直射",
                    storage: "瓷器密封保存，置于阴凉干燥处",
                    usage: "雨天焚香，取1饼，置于小巧香炉，以助室内清新",
                    effect: "香气清润，似有花雨飘零，可静心凝神",
                    poetry: Poetry(
                        title: "雨水焚香",
                        author: "王安石",
                        content: "一缕香烟透雨来，满室春意正徘徊。",
                        background: "描写雨水时节焚香的意境"
                    )
                )
            ],
            custom: "雨水制香，《香谱》载：'以沉为主，配以花香，可助湿气。贵在清雅，不宜过浓。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "惊蛰": IncenseArrangement(
            solarTerm: "惊蛰",
            incenses: [
                Incense(
                    name: "龙涎香",
                    ingredients: [
                        ("龙涎香", "2钱"),
                        ("檀香粉", "2钱"),
                        ("白芷", "1分"),
                        ("蜂蜜", "适量"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "龙涎香需细碾",
                        "檀香粉需过细筛",
                        "白芷需研磨成粉",
                        "蜂蜜调至稀薄",
                        "准备温水"
                    ],
                    method: [
                        "1. 将龙涎香粉置于洁净瓷碗中",
                        "2. 加入檀香粉轻轻拌匀",
                        "3. 撒入白芷粉调和",
                        "4. 滴入适量蜂蜜",
                        "5. 加入温水揉制成团",
                        "6. 搓成豆粒大小的香丸",
                        "7. 每丸重约1分半",
                        "8. 用竹签轻轻穿透做记号"
                    ],
                    dryingMethod: "阴凉处晾干7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "惊蛰日焚香，取2-3丸，置于青瓷香炉",
                    effect: "香气清远，似有龙吟之声，可助春雷惊蛰",
                    poetry: Poetry(
                        title: "惊蛰焚香",
                        author: "晁补之",
                        content: "一炉龙涎透窗来，春雷初动万物开。",
                        background: "描写惊蛰时节焚香的意境"
                    )
                )
            ],
            custom: "惊蛰制香，《香谱》载：'以龙涎为主，配以檀香，可应春雷。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "春分": IncenseArrangement(
            solarTerm: "春分",
            incenses: [
                Incense(
                    name: "百花香",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("兰花", "2钱"),
                        ("龙脑", "1分"),
                        ("丁香", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        "兰花需晾干研磨",
                        "龙脑需碾碎",
                        "丁香需研磨成粉",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入兰花粉轻轻研磨",
                        "3. 撒入龙脑粉调和",
                        "4. 最后加入丁香粉",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成梅花形状",
                        "7. 每朵重约2分",
                        "8. 以竹签刻画花纹"
                    ],
                    dryingMethod: "阴凉处晾干5日，需经常翻面",
                    storage: "瓷器密封保存，避免阳光直射",
                    usage: "春分日焚香，取1朵，置于紫砂香炉",
                    effect: "香气清雅，似有百花争艳之意",
                    poetry: Poetry(
                        title: "春分焚香",
                        author: "李清照",
                        content: "一炉香雾透窗纱，百花香气满庭华。",
                        background: "描写春分时节焚香的雅致"
                    )
                )
            ],
            custom: "春分制香，《香谱》载：'取百花之精，制成香饼，最宜春分。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "清明": IncenseArrangement(
            solarTerm: "清明",
            incenses: [
                Incense(
                    name: "清明香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("柳絮", "1钱"),
                        ("杏花", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        "柳絮需晾干研磨",
                        "杏花需晾干碾碎",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将檀香粉置于玉石臼中",
                        "2. 加入柳絮粉轻轻研磨",
                        "3. 撒入杏花粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成柳叶形状",
                        "7. 每片重约2分",
                        "8. 以竹签刻画叶脉纹路"
                    ],
                    dryingMethod: "阴凉处晾干4-5日，需注意通风",
                    storage: "瓷罐密封保存，置于阴凉干燥处",
                    usage: "清明日焚香，取1-2片，置于青瓷香炉",
                    effect: "香气清淡，似有春雨润物之意",
                    poetry: Poetry(
                        title: "清明焚香",
                        author: "苏轼",
                        content: "一炉香雾细如丝，清明时节雨纷纷。",
                        background: "描写清明时节焚香的意境"
                    )
                )
            ],
            custom: "清明制香，《香谱》载：'以檀为主，配以春物，最得清明之意。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "谷雨": IncenseArrangement(
            solarTerm: "谷雨",
            incenses: [
                Incense(
                    name: "谷雨香",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("牡丹花", "2钱"),
                        ("丁香", "1分"),
                        ("龙脑", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        ("牡丹花需晾干研磨",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将沉香粉置于瓷碗中",
                        "2. 加入牡丹花粉轻轻拌匀",
                        "3. 撒入丁香粉调和",
                        "4. 加入龙脑粉",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成牡丹花瓣形状",
                        "8. 每片重约2分"
                    ],
                    dryingMethod: "阴凉处晾干6-7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "谷雨时节焚香，取2片，置于紫砂香炉",
                    effect: "香气浓郁清雅，似有花雨绵绵之意",
                    poetry: Poetry(
                        title: "谷雨焚香",
                        author: "王安石",
                        content: "一炉香气透帘来，花雨绵绵润物哉。",
                        background: "描写谷雨时节焚香的意境"
                    )
                )
            ],
            custom: "谷雨制香，《香谱》载：'以沉为主，配以牡丹，最应时令。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "立夏": IncenseArrangement(
            solarTerm: "立夏",
            incenses: [
                Incense(
                    name: "荷香",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("荷花", "2钱"),
                        ("茉莉花", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        "荷花需晾干研磨",
                        "茉莉花需晾干碾碎",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入荷花粉轻轻研磨",
                        "3. 撒入茉莉粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成荷叶形状",
                        "7. 每片重约2分",
                        "8. 以竹签刻画叶脉纹路"
                    ],
                    dryingMethod: "阴凉处晾干5-6日，需经常翻面",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "立夏日焚香，取1片，置于青瓷香炉",
                    effect: "香气清凉，似有荷风拂面之意",
                    poetry: Poetry(
                        title: "立夏焚香",
                        author: "苏轼",
                        content: "一炉香气出尘来，小荷才露尖尖角。",
                        background: "描写立夏时节焚香的清凉意境"
                    )
                )
            ],
            custom: "立夏制香，《香谱》载：'以沉为主，配以荷香，可助清凉。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "小满": IncenseArrangement(
            solarTerm: "小满",
            incenses: [
                Incense(
                    name: "栀子香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("栀子花", "2钱"),
                        ("茉莉花", "1钱"),
                        ("丁香", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        ("栀子花需晾干研磨",
                        "茉莉花需晾干碾碎",
                        "丁香需研磨成粉",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入栀子粉轻轻拌匀",
                        "3. 撒入茉莉粉调和",
                        "4. 加入丁香粉",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成栀子花形状",
                        "8. 每朵重约2分"
                    ],
                    dryingMethod: "阴凉处晾干6-7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "小满时节焚香，取1朵，置于紫砂香炉",
                    effect: "香气清幽持久，似有栀子花开之意",
                    poetry: Poetry(
                        title: "小满焚香",
                        author: "王安石",
                        content: "一炉香气满窗来，栀子花开几枝白。",
                        background: "描写小满时节焚香的清雅意境"
                    )
                )
            ],
            custom: "小满制香，《香谱》载：'以檀为主，配以栀子，最清最雅。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "芒种": IncenseArrangement(
            solarTerm: "芒种",
            incenses: [
                Incense(
                    name: "荷叶香",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("荷叶", "2钱"),
                        ("石菖蒲", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        "荷叶需晾干研磨",
                        ("石菖蒲需研磨成粉",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入荷叶粉轻轻研磨",
                        "3. 撒入石菖蒲粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成荷叶形状",
                        "7. 每片重约2分",
                        "8. 以竹签刻画叶脉纹路"
                    ],
                    dryingMethod: "阴凉处晾干5-6日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "芒种日焚香，取1片，置于青瓷香炉",
                    effect: "香气清凉持久，助清暑醒神",
                    poetry: Poetry(
                        title: "芒种焚香",
                        author: "苏轼",
                        content: "一炉香气透帘来，满室清凉胜水洗。",
                        background: "描写芒种时节焚香的清凉意境"
                    )
                )
            ],
            custom: "芒种制香，《香谱》载：'以沉为主，配以荷叶，最能清暑。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "夏至": IncenseArrangement(
            solarTerm: "夏至",
            incenses: [
                Incense(
                    name: "莲心香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("莲心", "1钱"),
                        ("菖蒲", "1钱"),
                        ("丁香", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        ("莲心需晾干研磨",
                        "菖蒲需研磨成粉",
                        "丁香需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入莲心粉轻轻拌匀",
                        "3. 撒入菖蒲粉调和",
                        "4. 加入丁香粉",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成莲子形状",
                        "8. 每粒重约1分"
                    ],
                    dryingMethod: "阴凉处晾干7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "夏至时节焚香，取2-3粒，置于紫砂香炉",
                    effect: "香气清远悠长，助清心静气",
                    poetry: Poetry(
                        title: "夏至焚香",
                        author: "王安石",
                        content: "一炉香气出尘来，莲心清净胜花开。",
                        background: "描写夏至时节焚香的清净意境"
                    )
                )
            ],
            custom: "夏至制香，《香谱》载：'以檀为主，配以莲心，最清最净。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "小暑": IncenseArrangement(
            solarTerm: "小暑",
            incenses: [
                Incense(
                    name: "荷香清暑",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("荷花蕊", "1钱"),
                        ("金银花", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        ("荷花蕊需晾干研磨",
                        "金银花需晾干碾碎",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入荷花蕊粉轻轻研磨",
                        "3. 撒入金银花粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成莲蓬形状",
                        "7. 每颗重约1分",
                        "8. 以竹签点缀纹路"
                    ],
                    dryingMethod: "阴凉处晾干4-5日，需经常翻面",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "小暑日焚香，取2-3颗，置于青瓷香炉",
                    effect: "香气清冽，助消暑清心",
                    poetry: Poetry(
                        title: "小暑焚香",
                        author: "苏轼",
                        content: "一炉香气透窗来，满室清凉胜水洗。",
                        background: "描写小暑时节焚香的清凉意境"
                    )
                )
            ],
            custom: "小暑制香，《香谱》载：'以沉为主，配以荷蕊，最能消暑。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "大暑": IncenseArrangement(
            solarTerm: "大暑",
            incenses: [
                Incense(
                    name: "避暑香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("莲子心", "1钱"),
                        ("石菖蒲", "1钱"),
                        ("丁香", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        ("莲子心需晾干研磨",
                        "石菖蒲需研磨成粉",
                        "丁香需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入莲子心粉轻轻拌匀",
                        "3. 撒入石菖蒲粉调和",
                        "4. 加入丁香粉",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成莲子形状",
                        "8. 每粒重约1分"
                    ],
                    dryingMethod: "阴凉处晾干7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "大暑时节焚香，取2-3粒，置于紫砂香炉",
                    effect: "香气清远持久，最能消暑静心",
                    poetry: Poetry(
                        title: "大暑焚香",
                        author: "王安石",
                        content: "一炉香气满室来，莲心清净暑气开。",
                        background: "描写大暑时节焚香的清凉意境"
                    )
                )
            ],
            custom: "大暑制香，《香谱》载：'以檀为主，配以莲心，最能避暑。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "立秋": IncenseArrangement(
            solarTerm: "立秋",
            incenses: [
                Incense(
                    name: "桂香清秋",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("桂花", "2钱"),
                        ("白芷", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        ("桂花需晾干研磨",
                        "白芷需研磨成粉",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入桂花粉轻轻研磨",
                        "3. 撒入白芷粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成桂花形状",
                        "7. 每朵重约1分",
                        "8. 以竹签点缀花纹"
                    ],
                    dryingMethod: "阴凉处晾干5-6日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "立秋日焚香，取2-3朵，置于青瓷香炉",
                    effect: "香气清幽，助迎秋气",
                    poetry: Poetry(
                        title: "立秋焚香",
                        author: "苏轼",
                        content: "一炉香气桂枝秋，清露如珠月满楼。",
                        background: "描写立秋时节焚香的清雅意境"
                    )
                )
            ],
            custom: "立秋制香，《香谱》载：'以沉为主，配以桂花，最能迎秋。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "处暑": IncenseArrangement(
            solarTerm: "处暑",
            incenses: [
                Incense(
                    name: "秋韵香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("桂花", "1钱"),
                        ("菊花", "1钱"),
                        ("丁香", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        ("桂花需晾干研磨",
                        "菊花需研磨成粉",
                        "丁香需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入桂花粉轻轻拌匀",
                        "3. 撒入菊花粉调和",
                        "4. 加入丁香粉",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成菊花形状",
                        "8. 每朵重约2分"
                    ],
                    dryingMethod: "阴凉处晾干7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "处暑时节焚香，取1朵，置于紫砂香炉",
                    effect: "香气清远持久，助养秋气",
                    poetry: Poetry(
                        title: "处暑焚香",
                        author: "王安石",
                        content: "一炉香气桂菊开，处暑新凉夜未央。",
                        background: "描写处暑时节焚香的清雅意境"
                    )
                )
            ],
            custom: "处暑制香，《香谱》载：'以檀为主，配以桂菊，最能养秋。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "白露": IncenseArrangement(
            solarTerm: "白露",
            incenses: [
                Incense(
                    name: "菊香清秋",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("菊花", "2钱"),
                        ("桂花", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        ("菊花需晾干研磨",
                        "桂花需晾干碾碎",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入菊花粉轻轻研磨",
                        "3. 撒入桂花粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成菊花形状",
                        "7. 每朵重约2分",
                        "8. 以竹签点缀花瓣纹路"
                    ],
                    dryingMethod: "阴凉处晾干5-6日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "白露日焚香，取1朵，置于青瓷香炉",
                    effect: "香气清幽，助养心神",
                    poetry: Poetry(
                        title: "白露焚香",
                        author: "苏轼",
                        content: "一炉香气菊花秋，白露清晨湿绿苔。",
                        background: "描写白露时节焚香的清雅意境"
                    )
                )
            ],
            custom: "白露制香，《香谱》载：'以沉为主，配以菊花，最能养秋。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "秋分": IncenseArrangement(
            solarTerm: "秋分",
            incenses: [
                Incense(
                    name: "桂菊香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("桂花", "2钱"),
                        ("菊花", "1钱"),
                        ("丁香", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        ("桂花需晾干研磨",
                        "菊花需研磨成粉",
                        "丁香需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入桂花粉轻轻拌匀",
                        "3. 撒入菊花粉调和",
                        "4. 加入丁香粉",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成桂花形状",
                        "8. 每朵重约1分"
                    ],
                    dryingMethod: "阴凉处晾干7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "秋分时节焚香，取2-3朵，置于紫砂香炉",
                    effect: "香气清远持久，助养秋气",
                    poetry: Poetry(
                        title: "秋分焚香",
                        author: "王安石",
                        content: "一炉香气桂菊开，秋分夜半月轮来。",
                        background: "描写秋分时节焚香的清雅意境"
                    )
                )
            ],
            custom: "秋分制香，《香谱》载：'以檀为主，配以桂菊，最能养神。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "寒露": IncenseArrangement(
            solarTerm: "寒露",
            incenses: [
                Incense(
                    name: "菊香暖秋",
                    ingredients: [
                        ("沉香粉", "2钱"),
                        ("寒菊", "2钱"),
                        ("桂花", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        ("寒菊需晾干研磨",
                        "桂花需晾干碾碎",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入寒菊粉轻轻研磨",
                        "3. 撒入桂花粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成菊花形状",
                        "7. 每朵重约2分",
                        "8. 以竹签点缀花瓣纹路"
                    ],
                    dryingMethod: "阴凉处晾干6-7日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "寒露日焚香，取1朵，置于青瓷香炉",
                    effect: "香气清冽，助养心神",
                    poetry: Poetry(
                        title: "寒露焚香",
                        author: "苏轼",
                        content: "一炉香气寒菊开，露凝清晨玉阶白。",
                        background: "描写寒露时节焚香的清雅意境"
                    )
                )
            ],
            custom: "寒露制香，《香谱》载：'以沉为主，配以寒菊，最能养神。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "霜降": IncenseArrangement(
            solarTerm: "霜降",
            incenses: [
                Incense(
                    name: "暖香",
                    ingredients: [
                        ("檀香粉", "2钱"),
                        ("桂花", "2钱"),
                        ("丁香", "1钱"),
                        ("龙脑", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        "檀香粉需过细筛",
                        ("桂花需晾干研磨",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入桂花粉轻轻拌匀",
                        "3. 撒入丁香粉调和",
                        "4. 加入龙脑",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成桂花形状",
                        "8. 每朵重约1分"
                    ],
                    dryingMethod: "阴凉处晾干7日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "霜降时节焚香，取2-3朵，置于紫砂香炉",
                    effect: "香气温暖持久，助养秋气",
                    poetry: Poetry(
                        title: "霜降焚香",
                        author: "王安石",
                        content: "一炉香气暖意来，霜降庭前桂子开。",
                        background: "描写霜降时节焚香的温暖意境"
                    )
                )
            ],
            custom: "霜降制香，《香谱》载：'以檀为主，配以桂香，最能暖神。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "立冬": IncenseArrangement(
            solarTerm: "立冬",
            incenses: [
                Incense(
                    name: "暖冬香",
                    ingredients: [
                        ("沉香粉", "3钱"),
                        ("丁香", "1钱"),
                        ("肉桂", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "沉香粉需过细筛",
                        ("丁香需研磨成粉",
                        "肉桂需研磨成粉",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入丁香粉轻轻研磨",
                        "3. 撒入肉桂粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成梅花形状",
                        "7. 每朵重约2分",
                        "8. 以竹签点缀花瓣纹路"
                    ],
                    dryingMethod: "阴凉处晾干7日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "立冬日焚香，取1朵，置于青瓷香炉",
                    effect: "香气温暖持久，助养冬气",
                    poetry: Poetry(
                        title: "立冬焚香",
                        author: "苏轼",
                        content: "一炉香气暖意浓，立冬时节雪初融。",
                        background: "描写立冬时节焚香的温暖意境"
                    )
                )
            ],
            custom: "立冬制香，《香谱》载：'以沉为主，配以温香，最能暖身。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "小雪": IncenseArrangement(
            solarTerm: "小雪",
            incenses: [
                Incense(
                    name: "暖阳香",
                    ingredients: [
                        ("檀香粉", "3钱"),
                        ("肉桂", "2钱"),
                        ("丁香", "1钱"),
                        ("龙脑", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        ("檀香粉需过细筛",
                        "肉桂需研磨成粉",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入肉桂粉轻轻拌匀",
                        "3. 撒入丁香粉调和",
                        "4. 加入龙脑",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成梅花形状",
                        "8. 每朵重约2分"
                    ],
                    dryingMethod: "阴凉处晾干8日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "小雪时节焚香，取1-2朵，置于紫砂香炉",
                    effect: "香气温暖持久，助养阳气",
                    poetry: Poetry(
                        title: "小雪焚香",
                        author: "王安石",
                        content: "一炉香气暖意来，小雪纷纷不须猜。",
                        background: "描写小雪时节焚香的温暖意境"
                    )
                )
            ],
            custom: "小雪制香，《香谱》载：'以檀为主，配以温香，最能养阳。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "大雪": IncenseArrangement(
            solarTerm: "大雪",
            incenses: [
                Incense(
                    name: "暖阳御寒香",
                    ingredients: [
                        ("沉香粉", "3钱"),
                        ("肉桂", "2钱"),
                        ("丁香", "1钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        ("沉香粉需过细筛",
                        "肉桂需研磨成粉",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入肉桂粉轻轻研磨",
                        "3. 撒入丁香粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成梅花形状",
                        "7. 每朵重约2分",
                        "8. 以竹签点缀雪瓣纹路"
                    ],
                    dryingMethod: "阴凉处晾干8日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "大雪日焚香，取1朵，置于青瓷香炉",
                    effect: "香气温暖持久，助御寒气",
                    poetry: Poetry(
                        title: "大雪焚香",
                        author: "苏轼",
                        content: "一炉香气暖意浓，大雪纷纷暗香来。",
                        background: "描写大雪时节焚香的温暖意境"
                    )
                )
            ],
            custom: "大雪制香，《香谱》载：'以沉为主，配以温香，最能御寒。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "冬至": IncenseArrangement(
            solarTerm: "冬至",
            incenses: [
                Incense(
                    name: "冬至暖香",
                    ingredients: [
                        ("檀香粉", "3钱"),
                        ("肉桂", "2钱"),
                        ("丁香", "1钱"),
                        ("龙脑", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        ("沉香粉需过细筛",
                        "肉桂需研磨成粉",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入肉桂粉轻轻拌匀",
                        "3. 撒入丁香粉调和",
                        "4. 加入龙脑",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成梅花形状",
                        "8. 每朵重约2分"
                    ],
                    dryingMethod: "阴凉处晾干9日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "冬至时节焚香，取1-2朵，置于紫砂香炉",
                    effect: "香气温暖持久，助养阳气",
                    poetry: Poetry(
                        title: "冬至焚香",
                        author: "王安石",
                        content: "一炉香气暖意来，冬至阳生春可期。",
                        background: "描写冬至时节焚香的温暖意境"
                    )
                )
            ],
            custom: "冬至制香，《香谱》载：'以檀为主，配以温香，最能养阳。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "小寒": IncenseArrangement(
            solarTerm: "小寒",
            incenses: [
                Incense(
                    name: "暖梅香",
                    ingredients: [
                        ("沉香粉", "3钱"),
                        ("肉桂", "2钱"),
                        ("丁香", "2钱"),
                        ("龙脑", "1分"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        ("沉香粉需过细筛",
                        "肉桂需研磨成粉",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "准备温水"
                    ],
                    method: [
                        "1. 将沉香粉置于玉石臼中",
                        "2. 加入肉桂粉轻轻研磨",
                        "3. 撒入丁香粉调和",
                        "4. 最后加入龙脑",
                        "5. 缓缓加入温水揉制",
                        "6. 搓成梅花形状",
                        "7. 每朵重约2分",
                        "8. 以竹签点缀梅瓣纹路"
                    ],
                    dryingMethod: "阴凉处晾干9日，需保持通风",
                    storage: "瓷罐密封保存，避免受潮",
                    usage: "小寒日焚香，取1朵，置于青瓷香炉",
                    effect: "香气温暖持久，助御严寒",
                    poetry: Poetry(
                        title: "小寒焚香",
                        author: "苏轼",
                        content: "一炉香气暖意浓，小寒梅蕊暗香来。",
                        background: "描写小寒时节焚香的温暖意境"
                    )
                )
            ],
            custom: "小寒制香，《香谱》载：'以沉为主，配以温香，最能御寒。'",
            source: "《香谱》《宋代香事》"
        ),
        
        "大寒": IncenseArrangement(
            solarTerm: "大寒",
            incenses: [
                Incense(
                    name: "御寒香",
                    ingredients: [
                        ("檀香粉", "3钱"),
                        ("肉桂", "2钱"),
                        ("丁香", "2钱"),
                        ("龙脑", "1分"),
                        ("蜂蜜", "适量")
                    ],
                    preparation: [
                        ("沉香粉需过细筛",
                        "肉桂需研磨成粉",
                        "丁香需研磨成粉",
                        "龙脑需细碾",
                        "蜂蜜调至稀薄"
                    ],
                    method: [
                        "1. 将檀香粉置于瓷碗中",
                        "2. 加入肉桂粉轻轻拌匀",
                        "3. 撒入丁香粉调和",
                        "4. 加入龙脑",
                        "5. 滴入适量蜂蜜",
                        "6. 揉制成团",
                        "7. 搓成梅花形状",
                        "8. 每朵重约2分"
                    ],
                    dryingMethod: "阴凉处晾干10日，避免阳光直射",
                    storage: "紫砂罐密封保存，置于阴凉干燥处",
                    usage: "大寒时节焚香，取1-2朵，置于紫砂香炉",
                    effect: "香气温暖持久，助养阳气",
                    poetry: Poetry(
                        title: "大寒焚香",
                        author: "王安石",
                        content: "一炉香气暖意来，大寒时节春可期。",
                        background: "描写大寒时节焚香的温暖意境"
                    )
                )
            ],
            custom: "大寒制香，《香谱》载：'以檀为主，配以温香，最能养阳。'",
            source: "《香谱》《宋代香事》"
        )
    ]
    
    public func getArrangement(for solarTerm: String) -> IncenseArrangement? {
        return calendar[solarTerm]
    }
    
    public func getInfos(_ date: Date) -> [String] {
        guard let arrangement = getArrangement(for: date) else {
            return []
        }
        return arrangement.incenses.flatMap { incense in
            [
                "名称：\(incense.name)",
                "效果：\(incense.effect)",
                "用法：\(incense.usage)",
                "存储：\(incense.storage)",
                "制作方法：\(incense.method.joined(separator: "；"))"
            ]
        }
    }
} 
