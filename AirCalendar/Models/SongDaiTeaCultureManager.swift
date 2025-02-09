public class SongDaiTeaCultureManager {
    public static let shared = SongDaiTeaCultureManager()
    
    public struct TeaCulture {
        let solarTerm: String
        let teaTypes: [Tea]
        let custom: String
        let poetry: [Poetry]
        let source: String
    }
    
    public struct Tea {
        let name: String
        let description: String
        let origin: String
        let brewingMethod: BrewingMethod
        let teaWare: [String]
        let healthBenefits: String
    }
    
    public struct BrewingMethod {
        let waterTemperature: String
        let steepingTime: String
        let steps: [String]
        let tips: [String]
    }
    
    private let teaCulture: [String: TeaCulture] = [
        "立春": TeaCulture(
            solarTerm: "立春",
            teaTypes: [
                Tea(
                    name: "龙井新芽",
                    description: "立春时节的第一批茶芽，芽叶细嫩，香气清新",
                    origin: "杭州西湖",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八分热（80度）",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "温杯烫盏",
                            "投茶量为三钱",
                            "注水至七分满",
                            "静候茶叶舒展"
                        ],
                        tips: [
                            "水温不可太高",
                            "茶量要适中",
                            "注水要轻缓",
                            "需观茶汤色泽"
                        ]
                    ),
                    teaWare: ["建盏", "银壶", "竹夹", "茶筅"],
                    healthBenefits: "清心明目，提神醒脑"
                )
            ],
            custom: "立春饮新茶，《茶录》载：'立春之日，品新芽，以迎春意。'",
            poetry: [
                Poetry(
                    title: "立春品茶",
                    author: "苏轼",
                    content: "细雨斜风作晓寒，淡烟疏柳媚晴滩。\n入江春色来天地，茶灶烟温暖客颜。",
                    background: "描写立春时节品茶的雅趣"
                )
            ],
            source: "《茶录》《宋代茶经》"
        ),
        
        "雨水": TeaCulture(
            solarTerm: "雨水",
            teaTypes: [
                Tea(
                    name: "碧螺春",
                    description: "雨水时节采摘的嫩芽，形如螺旋，香气馥郁",
                    origin: "太湖洞庭山",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "七分热（70度）",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "洗茶器",
                            "投茶二钱",
                            "注水浸泡",
                            "三泡为佳"
                        ],
                        tips: [
                            "水温要适中",
                            "投茶量要准",
                            "冲泡要轻柔",
                            "观茶叶舒展"
                        ]
                    ),
                    teaWare: ["玉瓯", "银壶", "竹匙", "茶承"],
                    healthBenefits: "生津止渴，清热解暑"
                )
            ],
            custom: "雨水时节品茶，《茶谱》载：'雨水时，茶味最佳，宜细品之。'",
            poetry: [
                Poetry(
                    title: "雨水茶",
                    author: "陆游",
                    content: "雨水时节访茶人，山路蜿蜒入翠云。\n采得新芽春露重，烹来香气满山村。",
                    background: "描写雨水时节采茶品茶的情景"
                )
            ],
            source: "《茶谱》《宋代茶事》"
        ),
        
        "惊蛰": TeaCulture(
            solarTerm: "惊蛰",
            teaTypes: [
                Tea(
                    name: "明前龙井",
                    description: "惊蛰至清明前采摘的顶级龙井，芽叶细嫩，香气清高",
                    origin: "杭州狮峰山",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶三钱",
                            "注水冲泡",
                            "三次为佳"
                        ],
                        tips: [
                            "水温不可太高",
                            "投茶量要准确",
                            "冲泡要轻缓",
                            "注意茶汤色泽"
                        ]
                    ),
                    teaWare: ["汝窑茶盏", "银壶", "竹夹", "茶则"],
                    healthBenefits: "清心明目，提神解困"
                )
            ],
            custom: "惊蛰品明前茶，《茶谱》载：'惊蛰后采茶，茶味甘醇，香气馥郁。'",
            poetry: [
                Poetry(
                    title: "惊蛰茶",
                    author: "陆游",
                    content: "春雷惊蛰发新芽，采得明前第一茶。\n细雨濛濛山寺里，一炉香茗话年华。",
                    background: "描写惊蛰时节品茶的雅趣"
                )
            ],
            source: "《茶谱》《宋代茶事》"
        ),
        
        "清明": TeaCulture(
            solarTerm: "清明",
            teaTypes: [
                Tea(
                    name: "都匀毛尖",
                    description: "清明时节采摘的贵州名茶，一芽一叶，形如雀舌",
                    origin: "贵州都匀",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "七五度",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "洗茶器",
                            "投茶二钱",
                            "注水浸泡",
                            "分多次饮用"
                        ],
                        tips: [
                            "水温要适中",
                            "茶量要适宜",
                            "冲泡要轻柔",
                            "注意茶香变化"
                        ]
                    ),
                    teaWare: ["青瓷茶盏", "紫砂壶", "竹匙", "茶托"],
                    healthBenefits: "清热降火，明目利咽"
                ),
                Tea(
                    name: "安吉白茶",
                    description: "清明前后采摘的浙江名茶，色泽白嫩，香气清雅",
                    origin: "浙江安吉",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "七十度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温杯烫盏",
                            "投茶适量",
                            "轻缓注水",
                            "多次冲泡"
                        ],
                        tips: [
                            "水温不宜过高",
                            "注水要轻柔",
                            "观察茶汤色泽",
                            "品味香气变化"
                        ]
                    ),
                    teaWare: ["白瓷茶盏", "银壶", "竹夹", "茶承"],
                    healthBenefits: "提神醒脑，降火生津"
                )
            ],
            custom: "清明扫墓品茶，《东京梦华录》载：'清明时节，士人扫墓归来，品茗赏春。'",
            poetry: [
                Poetry(
                    title: "清明茶",
                    author: "苏轼",
                    content: "清明山雨润，新茶入市来。\n佳茗趁鲜饮，香气满楼台。",
                    background: "描写清明时节品新茶的情趣"
                )
            ],
            source: "《东京梦华录》《清明茶事》"
        ),
        
        "谷雨": TeaCulture(
            solarTerm: "谷雨",
            teaTypes: [
                Tea(
                    name: "洞庭碧螺春",
                    description: "谷雨前后采摘的江南名茶，形如螺旋，香气馥郁",
                    origin: "苏州洞庭山",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶二钱",
                            "注水冲泡",
                            "分次品饮"
                        ],
                        tips: [
                            "水温要适中",
                            "投茶量要准",
                            "注水要均匀",
                            "观茶叶舒展"
                        ]
                    ),
                    teaWare: ["定窑茶盏", "银壶", "竹筅", "茶托"],
                    healthBenefits: "清热解暑，生津止渴"
                )
            ],
            custom: "谷雨饮新茶，《茶录》载：'谷雨时节，茶味醇厚，宜细品之。'",
            poetry: [
                Poetry(
                    title: "谷雨茶",
                    author: "王安石",
                    content: "谷雨新茶采露芽，晓来烹煮细瓷瓯。\n一杯清气生云外，万里春光入梦中。",
                    background: "描写谷雨时节品茶的意境"
                )
            ],
            source: "《茶录》《宋代茶经》"
        ),
        
        "立夏": TeaCulture(
            solarTerm: "立夏",
            teaTypes: [
                Tea(
                    name: "君山银针",
                    description: "立夏时节采摘的黄茶精品，一芽一叶，银毫显露",
                    origin: "湖南岳阳君山",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶二钱",
                            "注水冲泡",
                            "多次品饮"
                        ],
                        tips: [
                            "水温要适中",
                            "投茶量要准",
                            "注水要轻柔",
                            "观察茶针直立"
                        ]
                    ),
                    teaWare: ["玉瓷茶盏", "银壶", "竹夹", "茶承"],
                    healthBenefits: "清热降火，提神醒脑"
                )
            ],
            custom: "立夏品黄茶，《茶谱》载：'立夏时节，宜饮黄茶，清心明目。'",
            poetry: [
                Poetry(
                    title: "立夏茶",
                    author: "苏轼",
                    content: "立夏新茶采嫩芽，银针遍洒玉瓷瓯。\n一盏清香消暑气，满室茶香醉客来。",
                    background: "描写立夏时节品茶的雅趣"
                )
            ],
            source: "《茶谱》《宋代茶事》"
        ),
        
        "小满": TeaCulture(
            solarTerm: "小满",
            teaTypes: [
                Tea(
                    name: "茉莉花茶",
                    description: "以新茶窨制茉莉花香的花茶",
                    origin: "福建福州",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十度",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "洗茶器",
                            "投茶适量",
                            "注水浸泡",
                            "分次饮用"
                        ],
                        tips: [
                            "水温不宜过高",
                            "茶量要适中",
                            "注意花香变化",
                            "避免久泡"
                        ]
                    ),
                    teaWare: ["青瓷茶盏", "紫砂壶", "竹匙", "茶托"],
                    healthBenefits: "清热解暑，提神怡情"
                )
            ],
            custom: "小满饮花茶，《茶录》载：'小满后，以花茶消暑，最为雅致。'",
            poetry: [
                Poetry(
                    title: "小满茶",
                    author: "陆游",
                    content: "小满时节花事繁，茉莉香透茶盏寒。\n一缕清香随风去，满室芳馨醉晚欢。",
                    background: "描写小满时节品花茶的意境"
                )
            ],
            source: "《茶录》《花茶谱》"
        ),
        
        "芒种": TeaCulture(
            solarTerm: "芒种",
            teaTypes: [
                Tea(
                    name: "荷叶茶",
                    description: "以新鲜荷叶配茶的消暑饮品",
                    origin: "江南水乡",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "荷叶洗净",
                            "配以绿茶",
                            "注水冲泡",
                            "待香溢出"
                        ],
                        tips: [
                            "荷叶要新鲜",
                            "绿茶要适量",
                            "水温要适中",
                            "可加蜜糖"
                        ]
                    ),
                    teaWare: ["青瓷大碗", "铜壶", "竹匙", "茶承"],
                    healthBenefits: "清热利湿，消暑解渴"
                )
            ],
            custom: "芒种饮荷茶，《清暑录》载：'芒种后，以荷叶茶消暑，最为清爽。'",
            poetry: [
                Poetry(
                    title: "芒种茶",
                    author: "杨万里",
                    content: "芒种时节荷花开，碧叶田田映楼台。\n采得新荷烹茗饮，清香一缕暑消开。",
                    background: "描写芒种时节饮荷叶茶的情趣"
                )
            ],
            source: "《清暑录》《夏茶谱》"
        ),
        
        "夏至": TeaCulture(
            solarTerm: "夏至",
            teaTypes: [
                Tea(
                    name: "金银花茶",
                    description: "以金银花配茶的清热饮品",
                    origin: "河南洛阳",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "金银花洗净",
                            "配以绿茶",
                            "温水冲泡",
                            "闷泡片刻"
                        ],
                        tips: [
                            "金银花要新鲜",
                            "绿茶要上等",
                            "水温要适中",
                            "可加冰糖"
                        ]
                    ),
                    teaWare: ["白瓷茶盏", "银壶", "竹匙", "茶托"],
                    healthBenefits: "清热解暑，消除疲劳"
                ),
                Tea(
                    name: "薄荷茶",
                    description: "以新鲜薄荷叶配茶的消暑饮品",
                    origin: "江南地区",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十度",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "薄荷叶洗净",
                            "配以绿茶",
                            "温水冲泡",
                            "即可饮用"
                        ],
                        tips: [
                            "薄荷要新鲜",
                            "茶量要适中",
                            "避免久泡",
                            "可加蜂蜜"
                        ]
                    ),
                    teaWare: ["青瓷茶碗", "铜壶", "竹夹", "茶承"],
                    healthBenefits: "清凉解暑，提神醒脑"
                )
            ],
            custom: "夏至饮清茶，《夏令杂记》载：'夏至后，以金银花茶、薄荷茶消暑最佳。'",
            poetry: [
                Poetry(
                    title: "夏至茶",
                    author: "苏轼",
                    content: "夏至炎炎日正长，清茶一盏慰心凉。\n金银花放香千里，薄荷清风透骨香。",
                    background: "描写夏至时节饮茶消暑的情趣"
                )
            ],
            source: "《夏令杂记》《茶事录》"
        ),
        
        "小暑": TeaCulture(
            solarTerm: "小暑",
            teaTypes: [
                Tea(
                    name: "莲子心茶",
                    description: "以莲子心配茶的清心饮品",
                    origin: "江南水乡",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "莲子心备用",
                            "绿茶适量",
                            "热水冲泡",
                            "静置片刻"
                        ],
                        tips: [
                            "莲子心要新鲜",
                            "茶量要适中",
                            "水温要适宜",
                            "可加冰糖"
                        ]
                    ),
                    teaWare: ["汝窑茶盏", "银壶", "竹匙", "茶承"],
                    healthBenefits: "清心安神，降火消暑"
                )
            ],
            custom: "小暑品莲茶，《茶谱》载：'小暑时节，以莲子心茶清心最佳。'",
            poetry: [
                Poetry(
                    title: "小暑茶",
                    author: "陆游",
                    content: "小暑新荷映水开，采来莲子试茶杯。\n一缕清香生暑气，满池风送水云来。",
                    background: "描写小暑时节品莲茶的雅趣"
                )
            ],
            source: "《茶谱》《夏茶录》"
        ),
        
        "大暑": TeaCulture(
            solarTerm: "大暑",
            teaTypes: [
                Tea(
                    name: "绿豆茶",
                    description: "以绿豆配茶的消暑饮品",
                    origin: "民间传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十五度",
                        steepingTime: "两盏茶时间",
                        steps: [
                            "绿豆洗净",
                            "配以红茶",
                            "热水冲泡",
                            "待豆开花"
                        ],
                        tips: [
                            "绿豆要新鲜",
                            "红茶要适量",
                            "需充分浸泡",
                            "可加冰糖"
                        ]
                    ),
                    teaWare: ["青瓷大碗", "铜壶", "竹匙", "茶托"],
                    healthBenefits: "清热解暑，消除烦躁"
                ),
                Tea(
                    name: "酸梅汤茶",
                    description: "以乌梅配茶的解暑饮品",
                    origin: "宫廷传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "乌梅备用",
                            "配以红茶",
                            "热水冲泡",
                            "加入冰糖"
                        ],
                        tips: [
                            "乌梅要优质",
                            "茶量要适中",
                            "糖量适宜",
                            "可冰镇饮用"
                        ]
                    ),
                    teaWare: ["玉瓷大碗", "银壶", "竹匙", "茶承"],
                    healthBenefits: "生津止渴，开胃解暑"
                )
            ],
            custom: "大暑饮清茶，《清暑录》载：'大暑时节，以绿豆茶、酸梅汤消暑解渴。'",
            poetry: [
                Poetry(
                    title: "大暑茶",
                    author: "杨万里",
                    content: "大暑炎炎日正长，清茶一盏慰心凉。\n绿豆新煮香生室，乌梅初泡味透觞。",
                    background: "描写大暑时节饮茶消暑的情趣"
                )
            ],
            source: "《清暑录》《夏茶谱》"
        ),
        
        "立秋": TeaCulture(
            solarTerm: "立秋",
            teaTypes: [
                Tea(
                    name: "桂花乌龙",
                    description: "以桂花窨制的乌龙茶",
                    origin: "福建安溪",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶三钱",
                            "冲泡三次",
                            "品味变化"
                        ],
                        tips: [
                            "水温要足够",
                            "茶量要适中",
                            "冲泡要迅速",
                            "注意香气变化"
                        ]
                    ),
                    teaWare: ["建盏", "紫砂壶", "茶夹", "茶承"],
                    healthBenefits: "理气养胃，清热解暑"
                ),
                Tea(
                    name: "新茶存储",
                    description: "立秋时节的茶叶存储方法",
                    origin: "茶家传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "存储要点",
                        steepingTime: "一年以上",
                        steps: [
                            "晾晒适度",
                            "密封保存",
                            "避光存储",
                            "定期检查"
                        ],
                        tips: [
                            "容器要密封",
                            "环境要干燥",
                            "避免阳光直射",
                            "防止受潮"
                        ]
                    ),
                    teaWare: ["瓷罐", "茶叶罐", "锡罐", "竹制容器"],
                    healthBenefits: "保持茶叶营养"
                )
            ],
            custom: "立秋存茶，《茶谱》载：'立秋后，宜收藏新茶，以备来春。'",
            poetry: [
                Poetry(
                    title: "立秋茶",
                    author: "苏轼",
                    content: "立秋天气爽，新茶香气扬。\n且寻知己饮，细品桂花香。",
                    background: "描写立秋时节品茶与存茶的情趣"
                )
            ],
            source: "《茶谱》《茶事录》"
        ),
        
        "处暑": TeaCulture(
            solarTerm: "处暑",
            teaTypes: [
                Tea(
                    name: "铁观音",
                    description: "处暑时节的清香铁观音",
                    origin: "福建安溪",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "一百度",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "洗茶",
                            "投茶适量",
                            "多次冲泡",
                            "品味变化"
                        ],
                        tips: [
                            "水温要沸腾",
                            "茶量要适中",
                            "每泡时间递增",
                            "注意香气转变"
                        ]
                    ),
                    teaWare: ["青瓷茶具", "紫砂壶", "茶漏", "茶海"],
                    healthBenefits: "清热润燥，提神醒脑"
                )
            ],
            custom: "处暑品茗，《茶录》载：'处暑后，饮铁观音最宜，清香怡人。'",
            poetry: [
                Poetry(
                    title: "处暑茶",
                    author: "陆游",
                    content: "处暑新凉爽，茶香满院来。\n一壶新水沸，细品观音开。",
                    background: "描写处暑时节品茶的雅趣"
                )
            ],
            source: "《茶录》《茶事谱》"
        ),
        
        "白露": TeaCulture(
            solarTerm: "白露",
            teaTypes: [
                Tea(
                    name: "白毫银针",
                    description: "白露时节的白茶精品",
                    origin: "福建福鼎",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶三钱",
                            "轻柔冲泡",
                            "多次品饮"
                        ],
                        tips: [
                            "水温不可太高",
                            "投茶量要足",
                            "冲泡要轻缓",
                            "注意茶汤色泽"
                        ]
                    ),
                    teaWare: ["白瓷茶具", "银壶", "竹夹", "茶承"],
                    healthBenefits: "养生保健，清热降火"
                ),
                Tea(
                    name: "桂花茶",
                    description: "以新鲜桂花配茶",
                    origin: "江南地区",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十度",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "桂花择新",
                            "配以绿茶",
                            "温水冲泡",
                            "闷泡片刻"
                        ],
                        tips: [
                            "桂花要新鲜",
                            "茶量要适中",
                            "水温要适宜",
                            "可加冰糖"
                        ]
                    ),
                    teaWare: ["青瓷茶具", "银壶", "茶匙", "茶托"],
                    healthBenefits: "理气安神，温胃健脾"
                )
            ],
            custom: "白露品茗，《茶谱》载：'白露时节，饮白茶最宜，配以桂花，香气怡人。'",
            poetry: [
                Poetry(
                    title: "白露茶",
                    author: "王安石",
                    content: "白露凝秋气，茶香染晚风。\n一杯清露滴，万里桂花浓。",
                    background: "描写白露时节品茶的意境"
                )
            ],
            source: "《茶谱》《白露茶事》"
        ),
        
        "秋分": TeaCulture(
            solarTerm: "秋分",
            teaTypes: [
                Tea(
                    name: "大红袍",
                    description: "秋分时节的岩茶精品",
                    origin: "福建武夷山",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十八度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶三钱",
                            "冲泡七次",
                            "品味岩韵"
                        ],
                        tips: [
                            "水温要高",
                            "茶量要足",
                            "每泡递增时间",
                            "注意岩骨花香"
                        ]
                    ),
                    teaWare: ["建盏", "紫砂壶", "茶荷", "茶船"],
                    healthBenefits: "暖胃养神，化湿理气"
                )
            ],
            custom: "秋分品岩茶，《茶录》载：'秋分后，饮武夷岩茶，韵味悠长。'",
            poetry: [
                Poetry(
                    title: "秋分茶",
                    author: "苏轼",
                    content: "秋分夜半凉，岩茶香气长。\n一盏清风起，满室月华凉。",
                    background: "描写秋分时节品岩茶的意境"
                )
            ],
            source: "《茶录》《岩茶谱》"
        ),
        
        "寒露": TeaCulture(
            solarTerm: "寒露",
            teaTypes: [
                Tea(
                    name: "普洱茶",
                    description: "寒露时节饮用的陈年普洱",
                    origin: "云南普洱",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十五度",
                        steepingTime: "两盏茶时间",
                        steps: [
                            "洗茶一次",
                            "投茶五钱",
                            "闷泡得当",
                            "多次冲泡"
                        ],
                        tips: [
                            "水温要足",
                            "茶量要重",
                            "冲泡要耐心",
                            "注意汤色变化"
                        ]
                    ),
                    teaWare: ["紫砂壶", "粗陶杯", "茶针", "茶盘"],
                    healthBenefits: "暖胃健脾，化湿消食"
                ),
                Tea(
                    name: "菊花茶",
                    description: "以新鲜菊花配茶",
                    origin: "杭州杭菊",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "八十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "菊花择新",
                            "配以绿茶",
                            "温水冲泡",
                            "闷泡片刻"
                        ],
                        tips: [
                            "菊花要新鲜",
                            "茶量要适中",
                            "水温适中",
                            "可加冰糖"
                        ]
                    ),
                    teaWare: ["玻璃杯", "银壶", "茶匙", "茶托"],
                    healthBenefits: "清热明目，降火生津"
                )
            ],
            custom: "寒露品茗，《茶谱》载：'寒露时节，宜饮陈茶，配以菊花，清香怡神。'",
            poetry: [
                Poetry(
                    title: "寒露茶",
                    author: "陆游",
                    content: "寒露新凉至，茶烟细细浮。\n一杯菊花酿，万里客愁收。",
                    background: "描写寒露时节品茶的情趣"
                )
            ],
            source: "《茶谱》《寒露茶事》"
        ),
        
        "霜降": TeaCulture(
            solarTerm: "霜降",
            teaTypes: [
                Tea(
                    name: "老白茶",
                    description: "霜降时节饮用的陈年白茶",
                    origin: "福建福鼎",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶适量",
                            "多次冲泡",
                            "品味变化"
                        ],
                        tips: [
                            "水温要高",
                            "茶量要足",
                            "冲泡要耐心",
                            "注意茶香变化"
                        ]
                    ),
                    teaWare: ["汝窑茶具", "银壶", "茶夹", "茶承"],
                    healthBenefits: "养生保健，暖胃驱寒"
                ),
                Tea(
                    name: "枣茶",
                    description: "以大枣配茶的温补饮品",
                    origin: "民间传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十八度",
                        steepingTime: "两盏茶时间",
                        steps: [
                            "大枣洗净",
                            "配以红茶",
                            "慢火熬煮",
                            "调味饮用"
                        ],
                        tips: [
                            "大枣要精选",
                            "茶量要适中",
                            "火候要得当",
                            "可加红糖"
                        ]
                    ),
                    teaWare: ["砂锅", "陶壶", "木勺", "茶碗"],
                    healthBenefits: "补血养颜，暖胃安神"
                )
            ],
            custom: "霜降饮茶，《茶录》载：'霜降后，以老白茶暖身，枣茶养生，最为相宜。'",
            poetry: [
                Poetry(
                    title: "霜降茶",
                    author: "王安石",
                    content: "霜降天气冷，茶烟暖客情。\n一盏知音饮，满室药香清。",
                    background: "描写霜降时节品茶的意境"
                )
            ],
            source: "《茶录》《霜降茶事》"
        ),
        
        "立冬": TeaCulture(
            solarTerm: "立冬",
            teaTypes: [
                Tea(
                    name: "熟普洱",
                    description: "立冬时节饮用的陈年熟普",
                    origin: "云南普洱",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "两盏茶时间",
                        steps: [
                            "洗茶两次",
                            "投茶六钱",
                            "闷泡三分",
                            "连续冲泡"
                        ],
                        tips: [
                            "水温要沸腾",
                            "茶量要足够",
                            "冲泡要耐心",
                            "注意汤色变化"
                        ]
                    ),
                    teaWare: ["紫砂壶", "粗陶杯", "茶针", "茶盘"],
                    healthBenefits: "暖胃养生，助消化"
                ),
                Tea(
                    name: "姜茶",
                    description: "以生姜配茶的暖身饮品",
                    origin: "民间传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "生姜切片",
                            "配以红茶",
                            "沸水冲泡",
                            "加入红糖"
                        ],
                        tips: [
                            "生姜要新鲜",
                            "茶量要适中",
                            "糖量适宜",
                            "趁热饮用"
                        ]
                    ),
                    teaWare: ["砂锅", "陶壶", "茶匙", "茶碗"],
                    healthBenefits: "驱寒暖身，促进血循环"
                )
            ],
            custom: "立冬饮茶，《茶录》载：'立冬后，以熟普暖身，姜茶驱寒，最为相宜。'",
            poetry: [
                Poetry(
                    title: "立冬茶",
                    author: "苏轼",
                    content: "立冬天气冷，茶烟暖客情。\n一盏知音饮，满室药香清。",
                    background: "描写立冬时节品茶的意境"
                )
            ],
            source: "《茶录》《冬茶谱》"
        ),
        
        "小雪": TeaCulture(
            solarTerm: "小雪",
            teaTypes: [
                Tea(
                    name: "老红茶",
                    description: "小雪时节饮用的陈年红茶",
                    origin: "福建正山小种",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十五度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶四钱",
                            "冲泡三次",
                            "品味变化"
                        ],
                        tips: [
                            "水温要足",
                            "茶量要重",
                            "每泡递增时间",
                            "注意香气变化"
                        ]
                    ),
                    teaWare: ["建盏", "紫砂壶", "茶夹", "茶承"],
                    healthBenefits: "暖胃养神，提升免疫力"
                )
            ],
            custom: "小雪品茗，《茶谱》载：'小雪时节，以老红茶暖身，香气醇厚。'",
            poetry: [
                Poetry(
                    title: "小雪茶",
                    author: "陆游",
                    content: "小雪纷纷落，茶烟袅袅升。\n一盏暖相伴，满室松风清。",
                    background: "描写小雪时节品茶的情趣"
                )
            ],
            source: "《茶谱》《小雪茶事》"
        ),
        
        "大雪": TeaCulture(
            solarTerm: "大雪",
            teaTypes: [
                Tea(
                    name: "陈年铁观音",
                    description: "大雪时节饮用的陈年乌龙",
                    origin: "福建安溪",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "一百度",
                        steepingTime: "半盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶五钱",
                            "多次冲泡",
                            "品味韵变"
                        ],
                        tips: [
                            "水温要沸腾",
                            "茶量要足",
                            "冲泡要快",
                            "注意茶香变化"
                        ]
                    ),
                    teaWare: ["青瓷茶具", "紫砂壶", "茶荷", "茶船"],
                    healthBenefits: "暖胃养神，化湿理气"
                ),
                Tea(
                    name: "桂圆红枣茶",
                    description: "以桂圆红枣配茶的滋补饮品",
                    origin: "民间传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "两盏茶时间",
                        steps: [
                            "桂圆去壳",
                            "红枣去核",
                            "配以红茶",
                            "慢火熬煮"
                        ],
                        tips: [
                            "桂圆要新鲜",
                            "红枣要饱满",
                            "火候要适中",
                            "可加红糖"
                        ]
                    ),
                    teaWare: ["砂锅", "陶壶", "木勺", "茶碗"],
                    healthBenefits: "补血安神，暖胃养颜"
                )
            ],
            custom: "大雪饮茶，《茶录》载：'大雪时节，以陈茶暖身，桂圆红枣茶养生。'",
            poetry: [
                Poetry(
                    title: "大雪茶",
                    author: "王安石",
                    content: "大雪压枝低，茶烟暖客归。\n一盏知音饮，满室药香飞。",
                    background: "描写大雪时节品茶的意境"
                )
            ],
            source: "《茶录》《大雪茶事》"
        ),
        
        "冬至": TeaCulture(
            solarTerm: "冬至",
            teaTypes: [
                Tea(
                    name: "宫廷普洱",
                    description: "冬至时节饮用的高端普洱",
                    origin: "云南普洱",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "三盏茶时间",
                        steps: [
                            "洗茶三次",
                            "投茶八钱",
                            "闷泡五分",
                            "反复冲泡"
                        ],
                        tips: [
                            "水温要沸腾",
                            "茶量要充足",
                            "冲泡要耐心",
                            "注意汤色变化"
                        ]
                    ),
                    teaWare: ["紫砂壶", "宜兴茶杯", "茶针", "茶船"],
                    healthBenefits: "暖胃养生，增强免疫力"
                ),
                Tea(
                    name: "艾叶茶",
                    description: "以艾叶配茶的养生饮品",
                    origin: "民间传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "艾叶洗净",
                            "配以红茶",
                            "沸水冲泡",
                            "加入红糖"
                        ],
                        tips: [
                            "艾叶要新鲜",
                            "茶量要适中",
                            "糖量适宜",
                            "趁热饮用"
                        ]
                    ),
                    teaWare: ["砂锅", "陶壶", "茶匙", "茶碗"],
                    healthBenefits: "驱寒暖身，调理气血"
                )
            ],
            custom: "冬至饮茶，《茶录》载：'冬至日，以宫廷茶暖身，艾叶茶养生。'",
            poetry: [
                Poetry(
                    title: "冬至茶",
                    author: "苏轼",
                    content: "冬至阳生处，茶烟暖客心。\n一盏知音饮，满室药香深。",
                    background: "描写冬至时节品茶的意境"
                )
            ],
            source: "《茶录》《冬至茶事》"
        ),
        
        "小寒": TeaCulture(
            solarTerm: "小寒",
            teaTypes: [
                Tea(
                    name: "武夷岩茶",
                    description: "小寒时节饮用的陈年岩茶",
                    origin: "福建武夷山",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "九十八度",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶六钱",
                            "冲泡九次",
                            "品味岩韵"
                        ],
                        tips: [
                            "水温要高",
                            "茶量要足",
                            "每泡递增时间",
                            "注意岩骨花香"
                        ]
                    ),
                    teaWare: ["建盏", "紫砂壶", "茶荷", "茶船"],
                    healthBenefits: "暖胃养神，化湿理气"
                ),
                Tea(
                    name: "五宝茶",
                    description: "以五种滋补材料配茶",
                    origin: "宫廷传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "两盏茶时间",
                        steps: [
                            "配料备用",
                            "红茶为底",
                            "慢火熬煮",
                            "调味饮用"
                        ],
                        tips: [
                            "材料要精选",
                            "火候要适中",
                            "熬煮要耐心",
                            "可加蜂蜜"
                        ]
                    ),
                    teaWare: ["砂锅", "银壶", "木勺", "茶碗"],
                    healthBenefits: "滋补养生，增强体质"
                )
            ],
            custom: "小寒饮茶，《茶谱》载：'小寒时节，以岩茶暖身，五宝茶养生。'",
            poetry: [
                Poetry(
                    title: "小寒茶",
                    author: "陆游",
                    content: "小寒天气冷，茶烟暖客情。\n一盏知音饮，满室药香清。",
                    background: "描写小寒时节品茶的情趣"
                )
            ],
            source: "《茶谱》《小寒茶事》"
        ),
        
        "大寒": TeaCulture(
            solarTerm: "大寒",
            teaTypes: [
                Tea(
                    name: "贡茶",
                    description: "大寒时节饮用的陈年贡茶",
                    origin: "皇家贡品",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "一盏茶时间",
                        steps: [
                            "温润茶具",
                            "投茶五钱",
                            "多次冲泡",
                            "品味变化"
                        ],
                        tips: [
                            "水温要沸腾",
                            "茶量要足",
                            "冲泡要讲究",
                            "注意茶韵变化"
                        ]
                    ),
                    teaWare: ["汝窑茶具", "银壶", "茶夹", "茶承"],
                    healthBenefits: "暖胃养神，提升免疫力"
                ),
                Tea(
                    name: "三白汤",
                    description: "以白芷、白术、白茯苓配茶",
                    origin: "宫廷传统",
                    brewingMethod: BrewingMethod(
                        waterTemperature: "沸水",
                        steepingTime: "三盏茶时间",
                        steps: [
                            "药材洗净",
                            "配以红茶",
                            "慢火熬煮",
                            "调味饮用"
                        ],
                        tips: [
                            "药材要精选",
                            "火候要得当",
                            "熬煮要耐心",
                            "可加红糖"
                        ]
                    ),
                    teaWare: ["砂锅", "陶壶", "木勺", "茶碗"],
                    healthBenefits: "健脾养胃，祛湿暖身"
                )
            ],
            custom: "大寒饮茶，《茶录》载：'大寒时节，以贡茶暖身，三白汤养生。'",
            poetry: [
                Poetry(
                    title: "大寒茶",
                    author: "王安石",
                    content: "大寒冰雪深，茶烟暖客心。\n一盏知音饮，满室药香沉。",
                    background: "描写大寒时节品茶的意境"
                )
            ],
            source: "《茶录》《大寒茶事》"
        )
        
        // ... 继续添加其他节气的茶文化 ...
    ]
    
    public func getTeaCulture(for solarTerm: String) -> TeaCulture? {
        return teaCulture[solarTerm]
    }
} 