import Foundation
public struct PoetryQuote {
    public let quote: String
    public let author: String
    public let title: String
    
    public init(quote: String, author: String, title: String) {
        self.quote = quote
        self.author = author
        self.title = title
    }
}

public enum Season {
    case spring, summer, autumn, winter
}

public class PoetryManager {
    public static let shared = PoetryManager()
    
    private init() {}
    
    public func randomQuote(for date: Date) -> PoetryQuote {
        let calendar = Calendar(identifier: .gregorian)
        let month = calendar.component(.month, from: date)
        
        let season: Season
        switch month {
        case 3...5: season = .spring
        case 6...8: season = .summer
        case 9...11: season = .autumn
        default: season = .winter
        }
        
        let solarTerm = CalendarManager.getSolarTerm(for: date)
        
        if let term = solarTerm {
            return getSolarTermPoetry(term) ?? getSeasonPoetry(season)
        } else {
            return getSeasonPoetry(season)
        }
    }
    
    // 节气诗句
    public func getSolarTermPoetry(_ term: String) -> PoetryQuote? {
        let solarTermPoetry: [String: PoetryQuote] = [
            // 春季
            "立春": PoetryQuote(quote: "律回岁晚冰霜少，春到人间草木知。", author: "白居易", title: "立春"),
            "雨水": PoetryQuote(quote: "春雨贵如油，新添种树州。", author: "韩愈", title: "春雨"),
            "惊蛰": PoetryQuote(quote: "惊蛰雷声动，春耕次第忙。", author: "范成大", title: "惊蛰"),
            "春分": PoetryQuote(quote: "春分日也天下暖，春分夜也日夜平。", author: "高适", title: "春分"),
            "清明": PoetryQuote(quote: "清明时节雨纷纷，路上行人欲断魂。", author: "杜牧", title: "清明"),
            "谷雨": PoetryQuote(quote: "谷雨前后江南北，千里莺啼二月天。", author: "戴复古", title: "谷雨"),
            
            // 夏季
            "立夏": PoetryQuote(quote: "天地风光正晓晴，立夏时节雨初晴。", author: "张存", title: "立夏"),
            "小满": PoetryQuote(quote: "小满江村才种稻，深田细雨碧泥肥。", author: "翁卷", title: "小满"),
            "芒种": PoetryQuote(quote: "芒种占天时，农人望雨迟。", author: "张师正", title: "芒种"),
            "夏至": PoetryQuote(quote: "夏至天时暑气深，绿阴深处懒开襟。", author: "张栻", title: "夏至"),
            "小暑": PoetryQuote(quote: "小暑才过气已炎，新蝉满树旧蝉残。", author: "赵师秀", title: "小暑"),
            "大暑": PoetryQuote(quote: "大暑流金炙地光，阴阴榆荫转清凉。", author: "王建", title: "大暑"),
            
            // 秋季
            "立秋": PoetryQuote(quote: "白露凄凄复凄凄，立秋时节雨绵绵。", author: "李涉", title: "立秋"),
            "处暑": PoetryQuote(quote: "处暑临门暑气收，新凉乍至酒新篘。", author: "僧皎然", title: "处暑"),
            "白露": PoetryQuote(quote: "白露凝珠滴草根，暗随秋雨晚来频。", author: "张孝祥", title: "白露"),
            "秋分": PoetryQuote(quote: "秋分天气爽，香稻正登场。", author: "释慧开", title: "秋分"),
            "寒露": PoetryQuote(quote: "寒露侵花冷不胜，北风吹雁远南征。", author: "王安石", title: "寒露"),
            "霜降": PoetryQuote(quote: "霜降江城树树黄，芦花应是白如霜。", author: "韦庄", title: "霜降"),
            
            // 冬季
            "立冬": PoetryQuote(quote: "立冬风雨暗，寒气入闾阎。", author: "高适", title: "立冬"),
            "小雪": PoetryQuote(quote: "小雪纷纷落广庭，轻寒漠漠到天明。", author: "刘克庄", title: "小雪"),
            "大雪": PoetryQuote(quote: "大雪压枝低，寒云暗不开。", author: "刘长卿", title: "大雪"),
            "冬至": PoetryQuote(quote: "冬至阳生春又来，春来便是岁华新。", author: "张继", title: "冬至"),
            "小寒": PoetryQuote(quote: "小寒时节雪纷纷，应是天公有意春。", author: "陆游", title: "小寒"),
            "大寒": PoetryQuote(quote: "大寒风雪夜，寥落宿寒枝。", author: "刘长卿", title: "大寒")
        ]
        return solarTermPoetry[term]
    }
    
    // 季节诗句
    public func getSeasonPoetry(_ season: Season) -> PoetryQuote {
        switch season {
        case .spring:
            let springPoetry = [
                PoetryQuote(quote: "春眠不觉晓，处处闻啼鸟。", author: "孟浩然", title: "春晓"),
                PoetryQuote(quote: "好雨知时节，当春乃发生。", author: "杜甫", title: "春夜喜雨"),
                PoetryQuote(quote: "春风又绿江南岸，明月何时照我还。", author: "王安石", title: "泊船瓜洲"),
                PoetryQuote(quote: "胜日寻芳泗水滨，无边光景一时新。", author: "朱熹", title: "春日"),
                PoetryQuote(quote: "随风潜入夜，润物细无声。", author: "杜甫", title: "春夜喜雨"),
                PoetryQuote(quote: "春江水暖鸭先知，春岸桃花两岸开。", author: "苏轼", title: "春日"),
                PoetryQuote(quote: "春色满园关不住，一枝红杏出墙来。", author: "叶绍翁", title: "游园不值")
            ]
            return springPoetry[Int.random(in: 0..<springPoetry.count)]
            
        case .summer:
            let summerPoetry = [
                PoetryQuote(quote: "小荷才露尖尖角，早有蜻蜓立上头。", author: "杨万里", title: "小池"),
                PoetryQuote(quote: "接天莲叶无穷碧，映日荷花别样红。", author: "杨万里", title: "晓出净慈寺送林子方"),
                PoetryQuote(quote: "毕竟西湖六月中，风光不与四时同。", author: "苏轼", title: "六月二十七日望湖楼醉书"),
                PoetryQuote(quote: "荷风送香气，竹露滴清响。", author: "孟浩然", title: "夏日南亭怀辛大"),
                PoetryQuote(quote: "夏日长长似秋日，月明才过夜还长。", author: "李商隐", title: "夏日"),
                PoetryQuote(quote: "乱花渐欲迷人眼，浅草才能没马蹄。", author: "白居易", title: "钱塘湖春行"),
                PoetryQuote(quote: "水光潋滟晴方好，山色空蒙雨亦奇。", author: "苏轼", title: "饮湖上初晴后雨")
            ]
            return summerPoetry[Int.random(in: 0..<summerPoetry.count)]
            
        case .autumn:
            let autumnPoetry = [
                PoetryQuote(quote: "停车坐爱枫林晚，霜叶红于二月花。", author: "杜牧", title: "山行"),
                PoetryQuote(quote: "独在异乡为异客，每逢佳节倍思亲。", author: "王维", title: "九月九日忆山东兄弟"),
                PoetryQuote(quote: "月落乌啼霜满天，江枫渔火对愁眠。", author: "张继", title: "枫桥夜泊"),
                PoetryQuote(quote: "自古逢秋悲寂寥，我言秋日胜春朝。", author: "刘禹锡", title: "秋词"),
                PoetryQuote(quote: "一年好景君须记，最是橙黄橘绿时。", author: "苏轼", title: "赠刘景文"),
                PoetryQuote(quote: "空山新雨后，天气晚来秋。", author: "王维", title: "山居秋暝"),
                PoetryQuote(quote: "秋水共长天一色，落霞与孤鹜齐飞。", author: "王勃", title: "滕王阁序")
            ]
            return autumnPoetry[Int.random(in: 0..<autumnPoetry.count)]
            
        case .winter:
            let winterPoetry = [
                PoetryQuote(quote: "北国风光，千里冰封，万里雪飘。", author: "毛泽东", title: "沁园春·雪"),
                PoetryQuote(quote: "忽如一夜春风来，千树万树梨花开。", author: "岑参", title: "白雪歌送武判官归京"),
                PoetryQuote(quote: "窗含西岭千秋雪，门泊东吴万里船。", author: "杜甫", title: "绝句"),
                PoetryQuote(quote: "日暮苍山远，天寒白屋贫。", author: "刘长卿", title: "逢雪宿芙蓉山主人"),
                PoetryQuote(quote: "梅须逊雪三分白，雪却输梅一段香。", author: "卢梅坡", title: "雪梅"),
                PoetryQuote(quote: "江山如画，一时多少豪杰。", author: "苏轼", title: "念奴娇·赤壁怀古"),
                PoetryQuote(quote: "墙角数枝梅，凌寒独自开。", author: "王安石", title: "梅花")
            ]
            return winterPoetry[Int.random(in: 0..<winterPoetry.count)]
        }
    }
} 
