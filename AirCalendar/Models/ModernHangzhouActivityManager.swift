class ModernHangzhouActivityManager {
    let seasonalActivityCalendar: [String: ModernActivityArrangement] = [
        "立春": ModernActivityArrangement(
            solarTerm: "立春",
            activities: [
                ModernActivity(
                    name: "灵隐寺迎春",
                    location: "灵隐寺",
                    address: "杭州市西湖区灵隐路1号",
                    description: "延续宋代迎春传统",
                    details: [
                        "参观灵隐寺新年祈福活动",
                        "品尝素斋",
                        "游览飞来峰造像",
                        "体验禅意文化"
                    ],
                    tips: [
                        "建议早上8点前到达避开人流",
                        "可以搭乘公交游5路、游2路到达",
                        "门票：30元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "宋代立春时节，灵隐寺是重要的祈福场所"
                ),
                ModernActivity(
                    name: "西湖春游",
                    location: "西湖景区",
                    address: "杭州市西湖区",
                    description: "体验宋代'打春'文化",
                    details: [
                        "漫步苏堤赏春",
                        "访断桥寻春",
                        "游览岳庙",
                        "品尝立春时节小吃"
                    ],
                    tips: [
                        "建议选择工作日游览",
                        "可以租借自行车环湖",
                        "免费景区",
                        "建议游览时间：半天到一天"
                    ],
                    historicalConnection: "西湖是宋代重要的踏春胜地"
                )
            ]
        ),
        
        "雨水": ModernActivityArrangement(
            solarTerm: "雨水",
            activities: [
                ModernActivity(
                    name: "龙井问茶",
                    location: "龙井村、九溪十八涧",
                    address: "杭州市西湖区龙井路",
                    description: "体验宋代品茶文化",
                    details: [
                        "参观龙井茶园",
                        "品尝明前龙井",
                        "走访九溪十八涧",
                        "体验制茶工艺"
                    ],
                    tips: [
                        "建议雨水后的晴天前往",
                        "可以乘坐27路公交到达",
                        "茶园免费参观",
                        "建议游览时间：3-4小时"
                    ],
                    historicalConnection: "雨水时节品新茶是宋代文人雅事"
                ),
                ModernActivity(
                    name: "西溪梅赏",
                    location: "西溪国家湿地公园",
                    address: "杭州市西湖区天目山路518号",
                    description: "延续宋人赏梅传统",
                    details: [
                        "游览梅林景区",
                        "体验湿地文化",
                        "观赏梅花",
                        "品尝梅花主题茶点"
                    ],
                    tips: [
                        "建议上午9点前到达",
                        "可乘坐地铁5号线或公交西溪湿地专线",
                        "门票：80元",
                        "建议游览时间：4-5小时"
                    ],
                    historicalConnection: "宋代文人多于雨水时节赏梅"
                )
            ]
        ),
        
        "惊蛰": ModernActivityArrangement(
            solarTerm: "惊蛰",
            activities: [
                ModernActivity(
                    name: "虎跑观泉",
                    location: "虎跑梦泉",
                    address: "杭州市上城区虎跑路39号",
                    description: "品味杭州名泉",
                    details: [
                        "参观虎跑泉",
                        "品尝泉水茶",
                        "游览虎跑寺",
                        "体验茶文化"
                    ],
                    tips: [
                        "建议上午9点前到达",
                        "可乘坐游2路、游4路到达",
                        "门票：15元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载虎跑泉为宋代杭州名泉"
                ),
                ModernActivity(
                    name: "吴山踏青",
                    location: "吴山景区",
                    address: "杭州市上城区中山中路272号",
                    description: "登高望春",
                    details: [
                        "登吴山城隍阁",
                        "俯瞰西湖全景",
                        "游览城隍庙",
                        "品尝传统小吃"
                    ],
                    tips: [
                        "建议避开周末",
                        "可乘坐地铁1号线定安路站步行可达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《梦粱录》记载吴山是宋代杭州重要的游览胜地"
                )
            ]
        ),
        
        "春分": ModernActivityArrangement(
            solarTerm: "春分",
            activities: [
                ModernActivity(
                    name: "西溪探春",
                    location: "西溪国家湿地公园",
                    address: "杭州市西湖区天目山路518号",
                    description: "体验湿地春色",
                    details: [
                        "游览湿地景观",
                        "观赏春季花卉",
                        "体验乌篷船",
                        "品尝江南点心"
                    ],
                    tips: [
                        "建议上午出发",
                        "可乘坐地铁5号线或公交西溪湿地专线",
                        "门票：80元",
                        "建议游览时间：4-5小时"
                    ],
                    historicalConnection: "《西湖志》记载西溪为宋代重要的踏青地"
                ),
                ModernActivity(
                    name: "太子湾赏花",
                    location: "太子湾公园",
                    address: "杭州市西湖区太子湾1号",
                    description: "观赏春季花展",
                    details: [
                        "观赏郁金香",
                        "游览湖滨景区",
                        "拍摄春景",
                        "漫步花港"
                    ],
                    tips: [
                        "建议工作日前往",
                        "可乘坐地铁1号线或公交游3路",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载湖滨一带是宋代赏春胜地"
                )
            ]
        ),
        
        "清明": ModernActivityArrangement(
            solarTerm: "清明",
            activities: [
                ModernActivity(
                    name: "龙井采茶",
                    location: "龙井村",
                    address: "杭州市西湖区龙井路",
                    description: "体验明前茶文化",
                    details: [
                        "参观茶园",
                        "体验采茶",
                        "学习炒茶",
                        "品尝明前龙井"
                    ],
                    tips: [
                        "建议提前预约体验活动",
                        "可乘坐27路公交到达",
                        "体验费用：约100-200元/人",
                        "建议游览时间：3-4小时"
                    ],
                    historicalConnection: "《武林旧事》记载清明时节采茶习俗"
                ),
                ModernActivity(
                    name: "满陇桂雨",
                    location: "满陇桂雨景区",
                    address: "杭州市西湖区满陇路",
                    description: "赏春踏青",
                    details: [
                        "漫步茶园",
                        "观赏春花",
                        "品茗赏景",
                        "体验茶文化"
                    ],
                    tips: [
                        "建议清晨前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载此地为宋代重要茶区"
                )
            ]
        ),
        
        "谷雨": ModernActivityArrangement(
            solarTerm: "谷雨",
            activities: [
                ModernActivity(
                    name: "九溪烟树",
                    location: "九溪十八涧",
                    address: "杭州市西湖区九溪路",
                    description: "探访诗画江南",
                    details: [
                        "徒步溪涧",
                        "观赏山泉",
                        "寻访古道",
                        "体验茶文化"
                    ],
                    tips: [
                        "建议雨后前往",
                        "可乘坐游览车或步行前往",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载九溪为宋代文人雅集之地"
                ),
                ModernActivity(
                    name: "六和塔游览",
                    location: "六和塔景区",
                    address: "杭州市西湖区六和路",
                    description: "登塔远眺钱塘",
                    details: [
                        "登塔观江",
                        "游览古刹",
                        "观赏江景",
                        "了解塔文化"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐地铁1号线或公交六和塔站",
                        "门票：20元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《武林旧事》记载六和塔为宋代重要地标"
                )
            ]
        ),
        
        "立夏": ModernActivityArrangement(
            solarTerm: "立夏",
            activities: [
                ModernActivity(
                    name: "曲院风荷",
                    location: "曲院风荷景区",
                    address: "杭州市西湖区北山街84号",
                    description: "观荷赏莲",
                    details: [
                        "赏荷花初放",
                        "游览曲院",
                        "品尝莲子羹",
                        "体验江南园林"
                    ],
                    tips: [
                        "建议上午9点前到达",
                        "可乘坐游5路公交到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载曲院为宋代赏荷胜地"
                ),
                ModernActivity(
                    name: "净慈寺游览",
                    location: "净慈寺",
                    address: "杭州市西湖区南山路56号",
                    description: "避暑纳凉",
                    details: [
                        "参观古刹",
                        "品尝素斋",
                        "聆听钟声",
                        "体验禅意生活"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐游2路到达",
                        "门票：10元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《梦粱录》记载净慈寺为宋代重要寺院"
                )
            ]
        ),
        
        "小满": ModernActivityArrangement(
            solarTerm: "小满",
            activities: [
                ModernActivity(
                    name: "三台云水",
                    location: "三台山",
                    address: "杭州市西湖区三台山路",
                    description: "避暑纳凉",
                    details: [
                        "登山远眺",
                        "观赏云海",
                        "品茗休憩",
                        "体验山居生活"
                    ],
                    tips: [
                        "建议清晨前往",
                        "可乘坐公交或步行上山",
                        "门票：免费",
                        "建议游览时间：3-4小时"
                    ],
                    historicalConnection: "《西湖志》记载三台为宋代避暑胜地"
                ),
                ModernActivity(
                    name: "玉泉探幽",
                    location: "玉泉景区",
                    address: "杭州市西湖区玉泉路",
                    description: "寻访古迹",
                    details: [
                        "游览玉泉",
                        "参观鱼乐园",
                        "品尝泉水茶",
                        "体验园林文化"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐公交游2路到达",
                        "门票：15元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载玉泉为宋代名泉"
                )
            ]
        ),
        
        "芒种": ModernActivityArrangement(
            solarTerm: "芒种",
            activities: [
                ModernActivity(
                    name: "柳浪闻莺",
                    location: "柳浪闻莺景区",
                    address: "杭州市西湖区南山路84号",
                    description: "赏荷避暑",
                    details: [
                        "漫步柳荫",
                        "观赏荷花",
                        "听莺赏景",
                        "品茗休憩"
                    ],
                    tips: [
                        "建议清晨或傍晚前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载此地为宋代赏荷胜地"
                ),
                ModernActivity(
                    name: "钱塘江观潮",
                    location: "六和塔景区",
                    address: "杭州市钱塘区六和路",
                    description: "观潮纳凉",
                    details: [
                        "登塔远眺",
                        "观赏江潮",
                        "体验水文化",
                        "了解潮汐文化"
                    ],
                    tips: [
                        "建议查询潮汐时间表",
                        "可乘坐地铁1号线或公交到达",
                        "门票：20元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载钱塘江观潮为宋代盛事"
                )
            ]
        ),
        
        "夏至": ModernActivityArrangement(
            solarTerm: "夏至",
            activities: [
                ModernActivity(
                    name: "岳庙祈福",
                    location: "岳王庙",
                    address: "杭州市西湖区清波街89号",
                    description: "纳凉祈福",
                    details: [
                        "参观岳庙",
                        "品尝忠义豆",
                        "了解历史文化",
                        "体验民俗活动"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐游2路到达",
                        "门票：25元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《梦粱录》记载岳庙为宋代重要祭祀场所"
                ),
                ModernActivity(
                    name: "西泠印社",
                    location: "西泠印社",
                    address: "杭州市西湖区南山路25号",
                    description: "文化纳凉",
                    details: [
                        "参观印社",
                        "了解篆刻艺术",
                        "欣赏园林",
                        "体验文人雅趣"
                    ],
                    tips: [
                        "建议上午参观",
                        "可乘坐游2路到达",
                        "门票：20元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《西湖志》记载此地为历代文人雅集之所"
                )
            ]
        ),
        
        "小暑": ModernActivityArrangement(
            solarTerm: "小暑",
            activities: [
                ModernActivity(
                    name: "白堤赏荷",
                    location: "白堤",
                    address: "杭州市西湖区白堤",
                    description: "荷花盛放时节",
                    details: [
                        "漫步白堤",
                        "观赏荷花",
                        "拍摄荷景",
                        "品尝藕粉"
                    ],
                    tips: [
                        "建议清晨或傍晚前往",
                        "可乘坐游1路到达",
                        "门票：免费",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《西湖志》记载白堤为宋代重要赏荷地点"
                ),
                ModernActivity(
                    name: "清凉寺纳凉",
                    location: "清凉寺",
                    address: "杭州市西湖区清凉寺路",
                    description: "避暑纳凉",
                    details: [
                        "参观古刹",
                        "赏竹纳凉",
                        "品茗休憩",
                        "体验禅意生活"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐公交游5路到达",
                        "门票：10元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《梦粱录》记载清凉寺为宋代避暑胜地"
                )
            ]
        ),
        
        "大暑": ModernActivityArrangement(
            solarTerm: "大暑",
            activities: [
                ModernActivity(
                    name: "西湖游船",
                    location: "西湖",
                    address: "杭州市西湖区",
                    description: "湖上纳凉",
                    details: [
                        "乘船游湖",
                        "观赏湖景",
                        "品茗赏月",
                        "体验水上生活"
                    ],
                    tips: [
                        "建议傍晚出行",
                        "可在湖边多个码头乘船",
                        "船票：45-80元不等",
                        "建议游览时间：1-1.5小时"
                    ],
                    historicalConnection: "《东京梦华录》记载宋人避暑多泛舟游湖"
                ),
                ModernActivity(
                    name: "山顶公园",
                    location: "宝石山",
                    address: "杭州市上城区宝石山",
                    description: "高处纳凉",
                    details: [
                        "登山避暑",
                        "俯瞰西湖",
                        "观赏夕阳",
                        "体验山居生活"
                    ],
                    tips: [
                        "建议傍晚前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载宝石山为宋代避暑胜地"
                )
            ]
        ),
        
        "立秋": ModernActivityArrangement(
            solarTerm: "立秋",
            activities: [
                ModernActivity(
                    name: "杨公堤赏桂",
                    location: "杨公堤",
                    address: "杭州市西湖区杨公堤",
                    description: "初秋赏桂",
                    details: [
                        "漫步杨公堤",
                        "闻桂花香",
                        "品桂花茶",
                        "体验江南秋色"
                    ],
                    tips: [
                        "建议清晨或傍晚前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载杨公堤为宋代赏桂胜地"
                ),
                ModernActivity(
                    name: "半山探幽",
                    location: "半山公园",
                    address: "杭州市西湖区半山路",
                    description: "避暑纳凉",
                    details: [
                        "登山远眺",
                        "观赏云海",
                        "品茗休憩",
                        "体验山居生活"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐公交194路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载半山为宋代避暑胜地"
                )
            ]
        ),
        
        "处暑": ModernActivityArrangement(
            solarTerm: "处暑",
            activities: [
                ModernActivity(
                    name: "孤山赏桂",
                    location: "孤山公园",
                    address: "杭州市西湖区北山街",
                    description: "赏桂观湖",
                    details: [
                        "登孤山",
                        "赏桂花",
                        "游览西泠印社",
                        "品尝桂花糕"
                    ],
                    tips: [
                        "建议早晨前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《梦粱录》记载孤山为宋代赏桂名所"
                ),
                ModernActivity(
                    name: "九曜山房",
                    location: "九曜山房",
                    address: "杭州市西湖区满觉陇路",
                    description: "品茗赏秋",
                    details: [
                        "品尝龙井茶",
                        "赏秋景",
                        "体验茶文化",
                        "漫步茶园"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐游2路到达",
                        "茶艺体验：100元起",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载此地为宋代重要产茶区"
                )
            ]
        ),
        
        "白露": ModernActivityArrangement(
            solarTerm: "白露",
            activities: [
                ModernActivity(
                    name: "桃源岭赏秋",
                    location: "桃源岭",
                    address: "杭州市西湖区桃源岭路",
                    description: "赏秋品桂",
                    details: [
                        "漫步桃源岭",
                        "观赏桂花",
                        "品尝桂花茶",
                        "体验秋日氛围"
                    ],
                    tips: [
                        "建议清晨前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载桃源岭为宋代赏秋胜地"
                ),
                ModernActivity(
                    name: "虎跑品茗",
                    location: "虎跑泉",
                    address: "杭州市上城区虎跑路39号",
                    description: "品茗赏秋",
                    details: [
                        "品尝泉水茶",
                        "参观虎跑寺",
                        "体验茶文化",
                        "赏秋景"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐游2路到达",
                        "门票：15元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《梦粱录》记载虎跑泉为宋代名泉"
                )
            ]
        ),
        
        "秋分": ModernActivityArrangement(
            solarTerm: "秋分",
            activities: [
                ModernActivity(
                    name: "满陇桂雨",
                    location: "满陇桂雨",
                    address: "杭州市西湖区满陇路",
                    description: "赏桂品秋",
                    details: [
                        "漫步桂花林",
                        "品尝桂花糕",
                        "体验茶文化",
                        "拍摄秋景"
                    ],
                    tips: [
                        "建议清晨或雨后前往",
                        "可乘坐游2路到达",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载满陇为宋代赏桂名所"
                ),
                ModernActivity(
                    name: "云栖竹径",
                    location: "云栖竹径",
                    address: "杭州市西湖区转塘街道",
                    description: "秋日禅意",
                    details: [
                        "漫步竹径",
                        "参观云栖寺",
                        "品尝素斋",
                        "体验禅意生活"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐游3路到达",
                        "门票：10元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载云栖为宋代重要禅寺"
                )
            ]
        ),
        
        "寒露": ModernActivityArrangement(
            solarTerm: "寒露",
            activities: [
                ModernActivity(
                    name: "北高峰赏枫",
                    location: "北高峰",
                    address: "杭州市西湖区北高峰",
                    description: "观枫赏秋",
                    details: [
                        "登山赏枫",
                        "俯瞰西湖",
                        "品茗休憩",
                        "拍摄秋景"
                    ],
                    tips: [
                        "建议清晨前往",
                        "可乘坐索道上山",
                        "索道票：30元",
                        "建议游览时间：3-4小时"
                    ],
                    historicalConnection: "《西湖志》记载北高峰为宋代赏秋胜地"
                ),
                ModernActivity(
                    name: "灵隐赏秋",
                    location: "灵隐景区",
                    address: "杭州市西湖区灵隐路1号",
                    description: "禅意秋色",
                    details: [
                        "游览飞来峰",
                        "参观灵隐寺",
                        "品尝素斋",
                        "赏秋景"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐游1路、游2路到达",
                        "门票：30元",
                        "建议游览时间：3-4小时"
                    ],
                    historicalConnection: "《梦粱录》记载灵隐为宋代重要寺院"
                )
            ]
        ),
        
        "霜降": ModernActivityArrangement(
            solarTerm: "霜降",
            activities: [
                ModernActivity(
                    name: "九溪烟树",
                    location: "九溪十八涧",
                    address: "杭州市西湖区九溪路",
                    description: "深秋溪景",
                    details: [
                        "漫步溪涧",
                        "观赏红叶",
                        "品茗休憩",
                        "拍摄秋景"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐游览车或步行",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《西湖志》记载九溪为宋代赏秋胜地"
                ),
                ModernActivity(
                    name: "三台阁观枫",
                    location: "三台阁",
                    address: "杭州市西湖区三台山路",
                    description: "赏枫观湖",
                    details: [
                        "登阁远眺",
                        "观赏红枫",
                        "品茗赏景",
                        "体验山居生活"
                    ],
                    tips: [
                        "建议清晨前往",
                        "可步行或乘坐出租车",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载三台为宋代文人雅集之地"
                )
            ]
        ),
        
        "立冬": ModernActivityArrangement(
            solarTerm: "立冬",
            activities: [
                ModernActivity(
                    name: "胡庆余堂",
                    location: "胡庆余堂中医馆",
                    address: "杭州市上城区河坊街85号",
                    description: "养生文化体验",
                    details: [
                        "参观古药房",
                        "了解中医文化",
                        "品尝养生茶",
                        "购买养生药材"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐地铁1号线或公交车",
                        "门票：10元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《武林旧事》记载宋代杭州药铺文化"
                ),
                ModernActivity(
                    name: "河坊街",
                    location: "河坊街",
                    address: "杭州市上城区河坊街",
                    description: "品尝冬令美食",
                    details: [
                        "品尝杭帮菜",
                        "购买特色小吃",
                        "体验老字号",
                        "了解民俗文化"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐地铁1号线定安路站",
                        "消费：自理",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《梦粱录》记载宋代杭州街市文化"
                )
            ]
        ),
        
        "小雪": ModernActivityArrangement(
            solarTerm: "小雪",
            activities: [
                ModernActivity(
                    name: "西湖雪景",
                    location: "断桥残雪",
                    address: "杭州市西湖区北山街",
                    description: "赏雪观景",
                    details: [
                        "断桥观雪",
                        "拍摄雪景",
                        "品尝热茶",
                        "体验冬日西湖"
                    ],
                    tips: [
                        "建议雪后即去",
                        "可乘坐游1路到达",
                        "门票：免费",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《西湖志》记载断桥为宋代赏雪胜地"
                ),
                ModernActivity(
                    name: "汤庄",
                    location: "龙井汤庄",
                    address: "杭州市西湖区龙井路",
                    description: "温泉养生",
                    details: [
                        "泡汤养生",
                        "品茗休憩",
                        "赏雪景",
                        "体验冬日生活"
                    ],
                    tips: [
                        "建议提前预约",
                        "可乘坐27路公交到达",
                        "温泉票：198元起",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载宋代冬季汤浴文化"
                )
            ]
        ),
        
        "大雪": ModernActivityArrangement(
            solarTerm: "大雪",
            activities: [
                ModernActivity(
                    name: "雷峰塔",
                    location: "雷峰塔",
                    address: "杭州市西湖区南山路15号",
                    description: "赏雪观景",
                    details: [
                        "登塔远眺",
                        "观赏雪景",
                        "了解历史文化",
                        "拍摄西湖雪景"
                    ],
                    tips: [
                        "建议雪后晴天前往",
                        "可乘坐游1路、游2路到达",
                        "门票：40元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《西湖志》记载雷峰塔为宋代重要地标"
                ),
                ModernActivity(
                    name: "知味观",
                    location: "知味观总店",
                    address: "杭州市上城区解放路123号",
                    description: "品尝冬季美食",
                    details: [
                        "品尝杭帮菜",
                        "尝试冬季时令菜",
                        "体验老字号文化",
                        "了解饮食习俗"
                    ],
                    tips: [
                        "建议提前预约",
                        "可乘坐地铁1号线到达",
                        "人均消费：100元起",
                        "建议用餐时间：1-2小时"
                    ],
                    historicalConnection: "《梦粱录》记载宋代杭州冬季饮食"
                )
            ]
        ),
        
        "冬至": ModernActivityArrangement(
            solarTerm: "冬至",
            activities: [
                ModernActivity(
                    name: "岳庙祭祀",
                    location: "岳王庙",
                    address: "杭州市西湖区清波街89号",
                    description: "传统文化体验",
                    details: [
                        "参观岳庙",
                        "品尝冬至汤圆",
                        "了解历史文化",
                        "体验传统习俗"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐游2路到达",
                        "门票：25元",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《武林旧事》记载宋代冬至祭祀习俗"
                ),
                ModernActivity(
                    name: "南宋御街",
                    location: "南宋御街",
                    address: "杭州市上城区中山中路",
                    description: "体验传统文化",
                    details: [
                        "漫步古街",
                        "品尝传统小吃",
                        "参观历史遗迹",
                        "了解宋代文化"
                    ],
                    tips: [
                        "建议下午前往",
                        "可乘坐地铁1号线凤起路站",
                        "门票：免费",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《梦粱录》记载南宋都城御街文化"
                )
            ]
        ),
        
        "小寒": ModernActivityArrangement(
            solarTerm: "小寒",
            activities: [
                ModernActivity(
                    name: "西溪湿地",
                    location: "西溪国家湿地公园",
                    address: "杭州市西湖区天目山路518号",
                    description: "观赏冬季湿地",
                    details: [
                        "乘坐乌篷船",
                        "观赏冬季芦苇",
                        "品尝农家菜",
                        "体验湿地生态"
                    ],
                    tips: [
                        "建议上午前往",
                        "可乘坐地铁5号线或公交西溪湿地专线",
                        "门票：80元",
                        "建议游览时间：4-5小时"
                    ],
                    historicalConnection: "《西湖志》记载西溪为宋代重要渔猎之地"
                ),
                ModernActivity(
                    name: "杭州佛学院",
                    location: "虎跑佛学院",
                    address: "杭州市上城区虎跑路",
                    description: "禅修体验",
                    details: [
                        "听讲佛法",
                        "品茶静修",
                        "抄经体验",
                        "体验禅意生活"
                    ],
                    tips: [
                        "需提前预约",
                        "可乘坐游2路到达",
                        "禅修体验：免费",
                        "建议体验时间：2-3小时"
                    ],
                    historicalConnection: "《梦粱录》记载宋代寺院冬季修行"
                )
            ]
        ),
        
        "大寒": ModernActivityArrangement(
            solarTerm: "大寒",
            activities: [
                ModernActivity(
                    name: "灵隐祈福",
                    location: "灵隐寺",
                    address: "杭州市西湖区灵隐路1号",
                    description: "新年祈福",
                    details: [
                        "新年祈福",
                        "品尝素斋",
                        "听钟声",
                        "体验佛教文化"
                    ],
                    tips: [
                        "建议避开节假日",
                        "可乘坐游1路、游2路到达",
                        "门票：30元",
                        "建议游览时间：2-3小时"
                    ],
                    historicalConnection: "《武林旧事》记载宋代岁末祈福习俗"
                ),
                ModernActivity(
                    name: "武林广场",
                    location: "武林广场",
                    address: "杭州市下城区武林广场",
                    description: "迎新活动",
                    details: [
                        "观赏灯饰",
                        "参与文化活动",
                        "品尝小吃",
                        "体验城市文化"
                    ],
                    tips: [
                        "建议傍晚前往",
                        "可乘坐地铁1号线或公交车",
                        "门票：免费",
                        "建议游览时间：1-2小时"
                    ],
                    historicalConnection: "《梦粱录》记载宋代岁末年初民俗活动"
                )
            ]
        )
    ]
}