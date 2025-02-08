import Foundation

public struct PoetryQuote {
    public let content: String
    public let author: String?
    public let title: String?
    
    public init(content: String, author: String? = nil, title: String? = nil) {
        self.content = content
        self.author = author
        self.title = title
    }
}

public class PoetryManager {
    public static let shared = PoetryManager()
    
    private let quotes: [PoetryQuote] = [
        PoetryQuote(content: "等风来不如追风去，追逐的过程就是意义"),
        PoetryQuote(content: "人生如逆旅，我亦是行人", author: "苏轼"),
        PoetryQuote(content: "桃花坞里桃花庵，桃花庵下桃花仙", author: "唐寅", title: "桃花庵歌"),
        PoetryQuote(content: "采菊东篱下，悠然见南山", author: "陶渊明", title: "饮酒"),
        PoetryQuote(content: "会当凌绝顶，一览众山小", author: "杜甫", title: "望岳"),
        PoetryQuote(content: "长风破浪会有时，直挂云帆济沧海", author: "李白", title: "行路难"),
        PoetryQuote(content: "云想衣裳花想容，春风拂槛露华浓", author: "李白", title: "清平调"),
        PoetryQuote(content: "落霞与孤鹜齐飞，秋水共长天一色", author: "王勃", title: "滕王阁序"),
        PoetryQuote(content: "海内存知己，天涯若比邻", author: "王勃", title: "送杜少府之任蜀州"),
        PoetryQuote(content: "此时相望不相闻，愿逐月华流照君", author: "鱼玄机", title: "赠邻女"),
        PoetryQuote(content: "人有悲欢离合，月有阴晴圆缺", author: "苏轼", title: "水调歌头"),
        PoetryQuote(content: "莫听穿林打叶声，何妨吟啸且徐行", author: "王维", title: "竹里馆"),
        PoetryQuote(content: "若似月轮终皎洁，不辞冰雪为卿热", author: "纳兰性德", title: "蝶恋花"),
        PoetryQuote(content: "衣带渐宽终不悔，为伊消得人憔悴", author: "柳永", title: "凤栖梧"),
        PoetryQuote(content: "最是人间留不住，朱颜辞镜花辞树", author: "王国维", title: "蝶恋花"),
        PoetryQuote(content: "春风得意马蹄疾，一日看尽长安花", author: "孟郊", title: "登科后"),
        PoetryQuote(content: "休对故人思故国，且将新火试新茶", author: "苏轼", title: "望江南"),
        PoetryQuote(content: "此心安处是吾乡", author: "苏轼", title: "定风波"),
        PoetryQuote(content: "一蓑烟雨任平生", author: "苏轼", title: "定风波"),
        PoetryQuote(content: "醉后不知天在水，满船清梦压星河", author: "唐温如", title: "夜雨")
    ]
    
    public func randomQuote(for date: Date) -> PoetryQuote {
        let index = abs(Calendar.current.component(.day, from: date).hashValue) % quotes.count
        return quotes[index]
    }
} 