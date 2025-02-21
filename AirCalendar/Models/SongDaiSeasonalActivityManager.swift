public class SongDaiSeasonalActivityManager: SongDaiBaseManager {
    public static let shared = SongDaiSeasonalActivityManager()
    
    private init() {}
    
    public struct ActivityArrangement {
        public let solarTerm: String
        public let activities: [Activity]
        public let custom: String
        public let source: String
        
        public init(solarTerm: String, activities: [Activity], custom: String, source: String) {
            self.solarTerm = solarTerm
            self.activities = activities
            self.custom = custom
            self.source = source
        }
    }
    
    public struct Activity {
        public let name: String
        public let description: String
        public let details: [String]
        public let custom: String
        public let source: String
        
        public init(name: String, description: String, details: [String], custom: String, source: String) {
            self.name = name
            self.description = description
            self.details = details
            self.custom = custom
            self.source = source
        }
    }
    
    public let calendar: [String: ActivityArrangement] = [
        "立春": ActivityArrangement(
            solarTerm: "立春",
            activities: [
                Activity(
                    name: "迎春",
                    description: "官府举行迎春仪式，民间悬挂春帖",
                    details: [
                        "皇城门外设立春亭",
                        "官员着朝服举行仪式",
                        "民间门上贴春帖",
                        "市集售卖春盘"
                    ],
                    custom: "《东京梦华录》记载：'立春日，京城诸门外建立春亭，百官着朝服行礼。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "打春",
                    description: "民间以青竹打春，祈求新年吉利",
                    details: [
                        "以青竹为春",
                        "敲打地面和墙角",
                        "祈求五谷丰登",
                        "祝愿家宅平安"
                    ],
                    custom: "《武林旧事》记载：'立春之日，民间以青竹打春，祈年祝福。'",
                    source: "《武林旧事》"
                )
            ],
            custom: "立春为岁首节气，宋人重之",
            source: "《东京梦华录》《武林旧事》"
        ),
        
        "雨水": ActivityArrangement(
            solarTerm: "雨水",
            activities: [
                Activity(
                    name: "赏梅",
                    description: "文人雅士登临赏梅，品茗吟诗",
                    details: [
                        "访梅林胜地",
                        "品茗赏梅",
                        "吟诗作画",
                        "雅集聚会"
                    ],
                    custom: "《梦粱录》记载：'雨水时节，士人多往灵隐、天竺诸山赏梅。'",
                    source: "《梦粱录》"
                ),
                Activity(
                    name: "尝新茶",
                    description: "品尝新采摘的明前茶",
                    details: [
                        "采摘新茶",
                        "品茗论茶",
                        "茶肆生意兴隆",
                        "文人雅集"
                    ],
                    custom: "《东京梦华录》记载：'雨水后，茶肆皆售新茶，文士品茗论道。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "雨水时节，宋人重赏梅品茶",
            source: "《梦粱录》《东京梦华录》"
        ),

        "惊蛰": ActivityArrangement(
            solarTerm: "惊蛰",
            activities: [
                Activity(
                    name: "祭白虎",
                    description: "官府和民间举行祭祀仪式，祈求平安",
                    details: [
                        "设坛祭祀",
                        "焚香祈福",
                        "斋戒沐浴",
                        "祈求消灾"
                    ],
                    custom: "《宋史》记载：'惊蛰日，京城设坛祭白虎，以避虫灾。'",
                    source: "《宋史》"
                ),
                Activity(
                    name: "尝笋",
                    description: "采摘春笋，品尝时鲜",
                    details: [
                        "采摘春笋",
                        "烹饪尝新",
                        "市集售笋",
                        "亲朋宴饮"
                    ],
                    custom: "《东坡志林》记载：'惊蛰时节，春笋初出，煮羹最佳。'",
                    source: "《东坡志林》"
                )
            ],
            custom: "惊蛰祭祀避虫，尝鲜祈年",
            source: "《宋史》《东坡志林》"
        ),

        "春分": ActivityArrangement(
            solarTerm: "春分",
            activities: [
                Activity(
                    name: "祭日",
                    description: "官府举行祭日大典",
                    details: [
                        "皇帝亲祭",
                        "百官朝贺",
                        "祈求丰年",
                        "颁布时令"
                    ],
                    custom: "《宋史》记载：'春分之日，天子亲祭于圜丘，以配天时。'",
                    source: "《宋史》"
                ),
                Activity(
                    name: "踏青",
                    description: "民间外出郊游赏春",
                    details: [
                        "携亲结伴",
                        "郊外踏青",
                        "赏花饮宴",
                        "采摘春菜"
                    ],
                    custom: "《东京梦华录》记载：'春分时节，士庶出城踏青，游赏春色。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "春分祭日祈年，踏青赏春",
            source: "《宋史》《东京梦华录》"
        ),

        "清明": ActivityArrangement(
            solarTerm: "清明",
            activities: [
                Activity(
                    name: "扫墓",
                    description: "朝廷百官和民间祭扫先祖",
                    details: [
                        "祭扫坟墓",
                        "供奉祭品",
                        "焚香祝告",
                        "修整墓地"
                    ],
                    custom: "《梦粱录》记载：'清明节，士庶扫墓，祭奠先人，市肆皆售纸钱祭品。'",
                    source: "《梦粱录》"
                ),
                Activity(
                    name: "游春",
                    description: "民间踏青游玩",
                    details: [
                        "携酒游春",
                        "插柳戴花",
                        "放风筝",
                        "野餐宴饮"
                    ],
                    custom: "《东京梦华录》记载：'清明时节，士女出游，插柳戴花，游赏春色。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "清明扫墓祭祖，游春踏青",
            source: "《梦粱录》《东京梦华录》"
        ),

        "谷雨": ActivityArrangement(
            solarTerm: "谷雨",
            activities: [
                Activity(
                    name: "尝茶",
                    description: "品饮明前新茶",
                    details: [
                        "采摘新茶",
                        "品茗论道",
                        "茶会雅集",
                        "赠茶结缘"
                    ],
                    custom: "《武林旧事》记载：'谷雨前后，龙井诸山采茶盛时，士人多往品茗。'",
                    source: "《武林旧事》"
                ),
                Activity(
                    name: "祈雨",
                    description: "官府和民间举行祈雨仪式",
                    details: [
                        "设坛祭祀",
                        "祈求及时雨",
                        "斋戒沐浴",
                        "祭祀龙神"
                    ],
                    custom: "《宋史》记载：'谷雨时节，旱则祈雨，官民同祭。'",
                    source: "《宋史》"
                )
            ],
            custom: "谷雨品茶祈雨，为农事之始",
            source: "《武林旧事》《宋史》"
        ),

        "立夏": ActivityArrangement(
            solarTerm: "立夏",
            activities: [
                Activity(
                    name: "称人",
                    description: "称量体重，以验一年之长养",
                    details: [
                        "称量体重",
                        "记录比较",
                        "饮食调养",
                        "互赠养生食品"
                    ],
                    custom: "《东京梦华录》记载：'立夏日，士庶皆称人，以验一岁之增损。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "避暑",
                    description: "开始夏季避暑生活",
                    details: [
                        "更换夏衣",
                        "设置避暑设施",
                        "饮用清凉茶",
                        "食用时令瓜果"
                    ],
                    custom: "《梦粱录》记载：'立夏之日，士庶易夏服，设簟幕，以避炎热。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "立夏称人避暑，开始夏令",
            source: "《东京梦华录》《梦粱录》"
        ),

        "小满": ActivityArrangement(
            solarTerm: "小满",
            activities: [
                Activity(
                    name: "尝瓜",
                    description: "品尝应季瓜果",
                    details: [
                        "采摘时鲜",
                        "品尝新瓜",
                        "市集售瓜",
                        "亲朋宴饮"
                    ],
                    custom: "《东京梦华录》记载：'小满时节，市肆皆售新瓜，士庶争尝。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "祈晴",
                    description: "农家祈求晴好天气",
                    details: [
                        "祭祀土地",
                        "祈求风调雨顺",
                        "焚香祝祷",
                        "斋戒礼佛"
                    ],
                    custom: "《宋史》记载：'小满之时，农家望晴，官府设坛祈祷。'",
                    source: "《宋史》"
                )
            ],
            custom: "小满尝瓜祈晴，关注农事",
            source: "《东京梦华录》《宋史》"
        ),

        "芒种": ActivityArrangement(
            solarTerm: "芒种",
            activities: [
                Activity(
                    name: "祭神农",
                    description: "祭祀神农氏，祈求农事顺遂",
                    details: [
                        "设坛祭祀",
                        "供奉五谷",
                        "祈求丰收",
                        "颁布农令"
                    ],
                    custom: "《宋史》记载：'芒种之日，祭神农氏，祈求年谷丰登。'",
                    source: "《宋史》"
                ),
                Activity(
                    name: "晒书",
                    description: "文人士大夫晒书防潮",
                    details: [
                        "检阅藏书",
                        "曝书除霉",
                        "修补书籍",
                        "整理书架"
                    ],
                    custom: "《梦粱录》记载：'芒种时节，士人多晒书，以避夏潮。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "芒种祭神农，晒书避潮湿",
            source: "《宋史》《梦粱录》"
        ),

        "夏至": ActivityArrangement(
            solarTerm: "夏至",
            activities: [
                Activity(
                    name: "祭天",
                    description: "朝廷举行祭天大典",
                    details: [
                        "皇帝亲祭",
                        "百官朝贺",
                        "颁布时令",
                        "赐宴群臣"
                    ],
                    custom: "《宋史》记载：'夏至日，天子亲祭于圜丘，报天之德。'",
                    source: "《宋史》"
                ),
                Activity(
                    name: "饮冰",
                    description: "贵族饮用冰水解暑",
                    details: [
                        "开冰库",
                        "赐群臣冰",
                        "制作冰饮",
                        "赠送亲朋"
                    ],
                    custom: "《东京梦华录》记载：'夏至之日，开冰库，贵家饮冰，以避炎热。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "夏至祭天饮冰，时令之大",
            source: "《宋史》《东京梦华录》"
        ),

        "小暑": ActivityArrangement(
            solarTerm: "小暑",
            activities: [
                Activity(
                    name: "避暑",
                    description: "士人雅集避暑",
                    details: [
                        "泛舟湖上",
                        "游览山寺",
                        "饮茶纳凉",
                        "吟诗作画"
                    ],
                    custom: "《武林旧事》记载：'小暑时节，士人多往西湖泛舟，登山避暑。'",
                    source: "《武林旧事》"
                ),
                Activity(
                    name: "食莲",
                    description: "品尝莲子莲藕",
                    details: [
                        "采摘莲蓬",
                        "烹制莲食",
                        "赏荷纳凉",
                        "宴饮赋诗"
                    ],
                    custom: "《梦粱录》记载：'小暑之时，市肆多售莲子藕，以清暑气。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "小暑避暑食莲，雅集纳凉",
            source: "《武林旧事》《梦粱录》"
        ),

        "大暑": ActivityArrangement(
            solarTerm: "大暑",
            activities: [
                Activity(
                    name: "饮茶",
                    description: "饮用清茶消暑",
                    details: [
                        "煎茶纳凉",
                        "茶肆避暑",
                        "品茗论道",
                        "赠茶结缘"
                    ],
                    custom: "《东京梦华录》记载：'大暑时节，茶肆甚盛，士庶皆往饮茶避暑。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "赏荷",
                    description: "观赏荷花纳凉",
                    details: [
                        "泛舟赏荷",
                        "品莲子羹",
                        "赋诗作画",
                        "雅集纳凉"
                    ],
                    custom: "《武林旧事》记载：'大暑之时，西湖荷花盛开，士人多往赏玩。'",
                    source: "《武林旧事》"
                )
            ],
            custom: "大暑饮茶赏荷，避暑纳凉",
            source: "《东京梦华录》《武林旧事》"
        ),

        "立秋": ActivityArrangement(
            solarTerm: "立秋",
            activities: [
                Activity(
                    name: "贴秋",
                    description: "张贴秋帖，迎接秋季",
                    details: [
                        "贴秋字",
                        "悬秋帖",
                        "更换衣物",
                        "饮食养生"
                    ],
                    custom: "《东京梦华录》记载：'立秋之日，士庶皆贴秋字，以应时令。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "啖秋",
                    description: "品尝时令瓜果",
                    details: [
                        "食瓜果",
                        "饮新酿",
                        "宴亲朋",
                        "赏新月"
                    ],
                    custom: "《梦粱录》记载：'立秋之日，市肆皆售新果，谓之啖秋。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "立秋贴秋啖秋，迎接新秋",
            source: "《东京梦华录》《梦粱录》"
        ),

        "处暑": ActivityArrangement(
            solarTerm: "处暑",
            activities: [
                Activity(
                    name: "尝新",
                    description: "品尝新米新果",
                    details: [
                        "尝新米",
                        "品新酒",
                        "食新果",
                        "祭神明"
                    ],
                    custom: "《梦粱录》记载：'处暑时节，农家新稻登场，士庶争尝新米。'",
                    source: "《梦粱录》"
                ),
                Activity(
                    name: "赏月",
                    description: "观赏明月，雅集聚会",
                    details: [
                        "赏月",
                        "饮酒",
                        "吟诗",
                        "品茗"
                    ],
                    custom: "《武林旧事》记载：'处暑后，夜凉如水，士人多登高赏月。'",
                    source: "《武林旧事》"
                )
            ],
            custom: "处暑尝新赏月，秋意渐浓",
            source: "《梦粱录》《武林旧事》"
        ),

        "白露": ActivityArrangement(
            solarTerm: "白露",
            activities: [
                Activity(
                    name: "赏桂",
                    description: "观赏桂花，品桂花酒",
                    details: [
                        "赏桂花",
                        "饮桂花酒",
                        "制桂花糕",
                        "雅集赋诗"
                    ],
                    custom: "《武林旧事》记载：'白露时节，桂花盛开，士人雅集赏桂。'",
                    source: "《武林旧事》"
                ),
                Activity(
                    name: "祭月",
                    description: "祭拜月神，祈求平安",
                    details: [
                        "设坛祭月",
                        "供奉月饼",
                        "焚香祈福",
                        "赏月纳凉"
                    ],
                    custom: "《东京梦华录》记载：'白露前后，民间设坛祭月，以求平安。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "白露赏桂祭月，秋意正浓",
            source: "《武林旧事》《东京梦华录》"
        ),

        "秋分": ActivityArrangement(
            solarTerm: "秋分",
            activities: [
                Activity(
                    name: "祭月",
                    description: "朝廷举行祭月大典",
                    details: [
                        "皇帝亲祭",
                        "百官朝贺",
                        "颁布时令",
                        "赐宴群臣"
                    ],
                    custom: "《宋史》记载：'秋分之日，天子亲祭太阴，报月之德。'",
                    source: "《宋史》"
                ),
                Activity(
                    name: "尝秋",
                    description: "品尝秋季时令食物",
                    details: [
                        "食新米",
                        "饮新酒",
                        "品蟹宴",
                        "赏菊花"
                    ],
                    custom: "《梦粱录》记载：'秋分时节，市肆皆售新米新酒，士庶争尝。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "秋分祭月尝秋，时令之重",
            source: "《宋史》《梦粱录》"
        ),

        "寒露": ActivityArrangement(
            solarTerm: "寒露",
            activities: [
                Activity(
                    name: "赏菊",
                    description: "观赏菊花，品菊花酒",
                    details: [
                        "赏菊",
                        "饮菊花酒",
                        "制菊花糕",
                        "雅集赋诗"
                    ],
                    custom: "《东京梦华录》记载：'寒露时节，菊花盛开，士人多往赏菊。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "晒秋",
                    description: "晒晾储存冬用物品",
                    details: [
                        "晒衣物",
                        "晒粮食",
                        "晒药材",
                        "储备过冬"
                    ],
                    custom: "《梦粱录》记载：'寒露之后，家家晒秋，以备冬用。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "寒露赏菊晒秋，准备过冬",
            source: "《东京梦华录》《梦粱录》"
        ),

        "霜降": ActivityArrangement(
            solarTerm: "霜降",
            activities: [
                Activity(
                    name: "赏枫",
                    description: "观赏红枫，雅集赋诗",
                    details: [
                        "登高望远",
                        "赏红枫",
                        "品茗论道",
                        "吟诗作画"
                    ],
                    custom: "《武林旧事》记载：'霜降时节，灵隐天竺诸山枫叶如丹，士人多往赏玩。'",
                    source: "《武林旧事》"
                ),
                Activity(
                    name: "进补",
                    description: "开始秋冬进补",
                    details: [
                        "食羊肉",
                        "饮姜汤",
                        "煮药膳",
                        "储备补品"
                    ],
                    custom: "《东京梦华录》记载：'霜降之后，市肆多售羊肉姜汤，以御寒气。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "霜降赏枫进补，准备入冬",
            source: "《武林旧事》《东京梦华录》"
        ),

        "立冬": ActivityArrangement(
            solarTerm: "立冬",
            activities: [
                Activity(
                    name: "贴冬",
                    description: "张贴冬帖，迎接冬季",
                    details: [
                        "贴冬字",
                        "更换冬衣",
                        "储备冬物",
                        "祭祀祈福"
                    ],
                    custom: "《东京梦华录》记载：'立冬之日，士庶皆贴冬字，以应时令。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "食补",
                    description: "食用温补食品",
                    details: [
                        "煮羊肉",
                        "炖鸡汤",
                        "饮姜酒",
                        "食火锅"
                    ],
                    custom: "《梦粱录》记载：'立冬之日，市肆皆售补羊，谓之冬羊。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "立冬贴冬食补，迎接新冬",
            source: "《东京梦华录》《梦粱录》"
        ),

        "小雪": ActivityArrangement(
            solarTerm: "小雪",
            activities: [
                Activity(
                    name: "酿酒",
                    description: "家家酿制冬酒",
                    details: [
                        "准备米曲",
                        "蒸煮米酒",
                        "封坛储存",
                        "分送亲朋"
                    ],
                    custom: "《梦粱录》记载：'小雪时节，家家酿酒，以备冬饮。'",
                    source: "《梦粱录》"
                ),
                Activity(
                    name: "赏雪",
                    description: "观赏初雪，雅集赋诗",
                    details: [
                        "观雪",
                        "煮茶",
                        "品酒",
                        "吟诗"
                    ],
                    custom: "《武林旧事》记载：'小雪若逢初雪，士人多相邀赏雪。'",
                    source: "《武林旧事》"
                )
            ],
            custom: "小雪酿酒赏雪，冬意渐浓",
            source: "《梦粱录》《武林旧事》"
        ),

        "大雪": ActivityArrangement(
            solarTerm: "大雪",
            activities: [
                Activity(
                    name: "煮茶",
                    description: "以雪水煮茶",
                    details: [
                        "收集雪水",
                        "煮雪水茶",
                        "品茗论道",
                        "雅集赋诗"
                    ],
                    custom: "《东京梦华录》记载：'大雪时节，士人多以雪水烹茶，谓之雪茶。'",
                    source: "《东京梦华录》"
                ),
                Activity(
                    name: "温酒",
                    description: "温酒御寒",
                    details: [
                        "温热美酒",
                        "煮羊肉",
                        "围炉夜话",
                        "宴饮取暖"
                    ],
                    custom: "《梦粱录》记载：'大雪之时，市肆多设暖炉，士庶温酒御寒。'",
                    source: "《梦粱录》"
                )
            ],
            custom: "大雪煮茶温酒，以御严寒",
            source: "《东京梦华录》《梦粱录》"
        ),

        "冬至": ActivityArrangement(
            solarTerm: "冬至",
            activities: [
                Activity(
                    name: "祭天",
                    description: "朝廷举行祭天大典",
                    details: [
                        "皇帝亲祭",
                        "百官朝贺",
                        "颁布时令",
                        "赐宴群臣"
                    ],
                    custom: "《宋史》记载：'冬至日，天子亲祭于圜丘，报天之德。'",
                    source: "《宋史》"
                ),
                Activity(
                    name: "食饺",
                    description: "食用饺子，祭祀祖先",
                    details: [
                        "包饺子",
                        "祭祀先祖",
                        "宴请亲朋",
                        "守岁团圆"
                    ],
                    custom: "《东京梦华录》记载：'冬至之日，家家食饺，祭祀祖先。'",
                    source: "《东京梦华录》"
                )
            ],
            custom: "冬至祭天食饺，时令之重",
            source: "《宋史》《东京梦华录》"
        ),

        "小寒": ActivityArrangement(
            solarTerm: "小寒",
            activities: [
                Activity(
                    name: "温补",
                    description: "食用温补食品",
                    details: [
                        "炖羊肉",
                        "煮姜汤",
                        "饮温酒",
                        "食火锅"
                    ],
                    custom: "《梦粱录》记载：'小寒之时，市肆多售温补之物，以御寒气。'",
                    source: "《梦粱录》"
                ),
                Activity(
                    name: "围炉",
                    description: "围炉取暖，夜话娱乐",
                    details: [
                        "设置暖炉",
                        "煮茶温酒",
                        "讲故事",
                        "下棋娱乐"
                    ],
                    custom: "《武林旧事》记载：'小寒时节，士人多相聚围炉，以消长夜。'",
                    source: "《武林旧事》"
                )
            ],
            custom: "小寒温补围炉，共度寒冬",
            source: "《梦粱录》《武林旧事》"
        )
    ]
    
    public func getArrangement(for solarTerm: String) -> ActivityArrangement? {
        return calendar[solarTerm]
    }
    
    public func getInfos(_ date: Date) -> [String] {
        guard let arrangement = getArrangement(for: date) else {
            return []
        }
        return arrangement.activities.flatMap { activity in
            [
                "活动：\(activity.name)",
                "描述：\(activity.description)",
                "细节：\(activity.details.joined(separator: "；"))",
                "习俗：\(activity.custom)"
            ]
        }
    }
}