public class SongDaiFlowerArrangementManager {
    public static let shared = SongDaiFlowerArrangementManager()
    
    public struct FlowerArrangement {
        let solarTerm: String
        let arrangements: [Arrangement]
        let custom: String
        let poetry: [Poetry]
        let source: String
    }
    
    public struct Arrangement {
        let name: String
        let description: String
        let flowers: [String]
        let container: Container
        let style: Style
        let technique: Technique
        let meaning: String
    }
    
    public struct Container {
        let type: String
        let description: String
        let material: String
        let size: String  // 统一修改为小型规格
    }
    
    public struct Style {
        let name: String
        let characteristics: [String]
        let placement: String
        let balance: String
    }
    
    public struct Technique {
        let steps: [String]
        let tips: [String]
        let tools: [String]
        let maintenance: String
    }
    
    private let flowerArrangements: [String: FlowerArrangement] = [
        "立春": FlowerArrangement(
            solarTerm: "立春",
            arrangements: [
                Arrangement(
                    name: "迎春小品",  // 名称也相应调整
                    description: "小巧雅致的立春插花",
                    flowers: ["迎春花", "山茶", "水仙"], // 减少花材数量
                    container: Container(
                        type: "小巧花器",
                        description: "精致的小型花器",
                        material: "定窑白瓷",
                        size: "小型"  // 统一使用小型
                    ),
                    style: Style(
                        name: "小巧式",
                        characteristics: [
                            "小巧精致",
                            "疏朗雅致",
                            "简约大方",
                            "宜室宜家"
                        ],
                        placement: "案头式",  // 适合案头摆放
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小巧花材",
                            "适度修剪",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "花材要精选",
                            "枝条要短小",
                            "造型要简约",
                            "摆放要得当"
                        ],
                        tools: ["小花剪", "小花器", "小喷壶", "迷你固定器"],
                        maintenance: "少量补水，随时修剪"
                    ),
                    meaning: "春意盎然，雅致宜人"
                )
            ],
            custom: "立春插花，《花镜》载：'立春之日，以迎春花、水仙为主，寓意新岁吉祥。'",
            poetry: [
                Poetry(
                    title: "立春插花",
                    author: "苏轼",
                    content: "迎春花放早，水仙吐蕊新。\n一架春光里，满室暗香浮。",
                    background: "描写立春时节插花的雅趣"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "雨水": FlowerArrangement(
            solarTerm: "雨水",
            arrangements: [
                Arrangement(
                    name: "玉兰小雅",
                    description: "小巧雅致的雨水插花",
                    flowers: ["玉兰", "山茶"], // 减少至2种花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小瓷瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清雅式",
                        characteristics: [
                            "小巧玲珑",
                            "清新雅致",
                            "简约大方",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小巧枝条",
                            "适度修剪",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "玉兰选小枝",
                            "注意比例",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小花剪", "小花器", "小喷壶", "迷你固定器"],
                        maintenance: "少量补水，及时修剪"
                    ),
                    meaning: "春意盎然，雅致宜人"
                )
            ],
            custom: "雨水插花，《花谱》载：'一枝玉兰，满室春意。'",
            poetry: [
                Poetry(
                    title: "雨水花事",
                    author: "王安石",
                    content: "玉兰一枝春带雨，小楼幽致胜琼花。",
                    background: "描写雨水时节玉兰的清雅"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "惊蛰": FlowerArrangement(
            solarTerm: "惊蛰",
            arrangements: [
                Arrangement(
                    name: "桃花小品",
                    description: "小巧雅致的惊蛰插花",
                    flowers: ["桃花", "垂柳"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小花瓶",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "自然式",
                        characteristics: [
                            "小巧精致",
                            "春意盎然",
                            "简约自然",
                            "宜家摆放"
                        ],
                        placement: "窗台式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝桃花",
                            "修剪适长",
                            "轻柔插放",
                            "调整形态"
                        ],
                        tips: [
                            "桃枝要小巧",
                            "柳枝要轻盈",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶", "迷你固定器"],
                        maintenance: "每日少量补水，修剪枝条"
                    ),
                    meaning: "春意盎然，清新雅致"
                )
            ],
            custom: "惊蛰插花，《花谱》载：'一枝桃花，满室春色。'",
            poetry: [
                Poetry(
                    title: "惊蛰花事",
                    author: "苏轼",
                    content: "小楼一枝桃，春意正萧萧。",
                    background: "描写惊蛰时节桃花的清雅"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "春分": FlowerArrangement(
            solarTerm: "春分",
            arrangements: [
                Arrangement(
                    name: "春兰小品",
                    description: "小巧雅致的春分插花",
                    flowers: ["春兰", "迎春"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小花器",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清逸式",
                        characteristics: [
                            "小巧清雅",
                            "疏朗简约",
                            "清新自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小巧兰花",
                            "适度修剪",
                            "轻柔布置",
                            "调整造型"
                        ],
                        tips: [
                            "兰花要小巧",
                            "注意比例",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小花剪", "小花器", "小喷壶", "迷你固定器"],
                        maintenance: "少量补水，保持湿度"
                    ),
                    meaning: "春意盎然，清雅脱俗"
                )
            ],
            custom: "春分插花，《花谱》载：'一枝春兰，满室幽香。'",
            poetry: [
                Poetry(
                    title: "春分花事",
                    author: "王安石",
                    content: "春兰一枝香满室，小窗雅致胜蕙兰。",
                    background: "描写春分时节春兰的清雅"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "清明": FlowerArrangement(
            solarTerm: "清明",
            arrangements: [
                Arrangement(
                    name: "踏青小品",
                    description: "小巧雅致的清明插花",
                    flowers: ["野菊", "蒲公英"], // 减少至2种野花
                    container: Container(
                        type: "小巧花器",
                        description: "青瓷小花筒",
                        material: "龙泉窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "野趣式",
                        characteristics: [
                            "小巧自然",
                            "清新淡雅",
                            "野趣盎然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "自然随意"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小巧野花",
                            "适度修剪",
                            "随意插放",
                            "调整造型"
                        ],
                        tips: [
                            "野花要新鲜",
                            "高度要适中",
                            "造型要自然",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，及时更换"
                    ),
                    meaning: "清明时节，野趣盎然"
                )
            ],
            custom: "清明插花，《花谱》载：'一束野花，满室春意。'",
            poetry: [
                Poetry(
                    title: "清明花事",
                    author: "杨万里",
                    content: "野花小簇春满室，清明时节最相宜。",
                    background: "描写清明时节野花的清新自然"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "谷雨": FlowerArrangement(
            solarTerm: "谷雨",
            arrangements: [
                Arrangement(
                    name: "芍药小品",
                    description: "小巧雅致的谷雨插花",
                    flowers: ["芍药", "绣球"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小瓷盆",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "雅致式",
                        characteristics: [
                            "小巧精致",
                            "清新典雅",
                            "简约大方",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小巧花朵",
                            "修剪适长",
                            "轻柔插放",
                            "调整姿态"
                        ],
                        tips: [
                            "芍药选小朵",
                            "高度要适中",
                            "造型要简约",
                            "注意空间感"
                        ],
                        tools: ["小花剪", "小花器", "小喷壶", "迷你固定器"],
                        maintenance: "每日少量补水，避免阳光直射"
                    ),
                    meaning: "春雨绵绵，花开富贵"
                ),
                Arrangement(
                    name: "春雨小品",
                    description: "小巧雅致的谷雨插花",
                    flowers: ["绣球", "石竹"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小瓷盆",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清新式",
                        characteristics: [
                            "小巧玲珑",
                            "清新雅致",
                            "简约自然",
                            "宜家摆放"
                        ],
                        placement: "窗台式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小巧花材",
                            "修剪长度",
                            "轻柔布置",
                            "调整整体"
                        ],
                        tips: [
                            "绣球选小朵",
                            "注意比例",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶", "迷你固定器"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "春雨绵绵，清新雅致"
                )
            ],
            custom: "谷雨插花，《花谱》载：'一朵芍药，一朵绣球，自成天然。'",
            poetry: [
                Poetry(
                    title: "谷雨花事",
                    author: "苏轼",
                    content: "小楼芍药绣球开，春雨绵绵润物来。",
                    background: "描写谷雨时节花事的清新雅致"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "立夏": FlowerArrangement(
            solarTerm: "立夏",
            arrangements: [
                Arrangement(
                    name: "小荷清韵",
                    description: "小巧雅致的立夏插花",
                    flowers: ["小荷", "睡莲"], // 减少至2种水生花材
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小水盘",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "水景式",
                        characteristics: [
                            "小巧精致",
                            "清新雅致",
                            "水韵天成",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "准备浅水",
                            "选择小荷",
                            "轻柔布置",
                            "点缀睡莲"
                        ],
                        tips: [
                            "选择小荷叶",
                            "水深要浅",
                            "造型要简约",
                            "注意比例"
                        ],
                        tools: ["小剪刀", "小水盘", "小喷壶"],
                        maintenance: "每日少量换水，保持水质清洁"
                    ),
                    meaning: "小荷才露尖尖角"
                )
            ],
            custom: "立夏插花，《花镜》载：'一片小荷，已有清凉之意。'",
            poetry: [
                Poetry(
                    title: "立夏小荷",
                    author: "杨万里",
                    content: "小荷才露尖尖角，早有蜻蜓立上头。",
                    background: "描写立夏时节小荷的清新可爱"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "小满": FlowerArrangement(
            solarTerm: "小满",
            arrangements: [
                Arrangement(
                    name: "栀子小品",
                    description: "小巧雅致的小满插花",
                    flowers: ["栀子花", "茉莉"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "白瓷小花瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清香式",
                        characteristics: [
                            "小巧玲珑",
                            "清香怡人",
                            "简约雅致",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪适长",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "花枝要小巧",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持空气流通"
                    ),
                    meaning: "一室幽香，清雅宜人"
                )
            ],
            custom: "小满插花，《花谱》载：'一枝栀子，满室清香。'",
            poetry: [
                Poetry(
                    title: "小满花事",
                    author: "王安石",
                    content: "栀子一枝香满室，小窗雅致胜琼花。",
                    background: "描写小满时节栀子花的清香"
                )
            ],
            source: "《花谱》《宋代花事》"
        ),
        
        "芒种": FlowerArrangement(
            solarTerm: "芒种",
            arrangements: [
                Arrangement(
                    name: "石榴小品",
                    description: "小巧雅致的芒种插花",
                    flowers: ["石榴花", "小荷"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青瓷小花瓶",
                        material: "龙泉窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清新式",
                        characteristics: [
                            "小巧玲珑",
                            "清新典雅",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "石榴选小枝",
                            "荷叶要小巧",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，避免阳光直射"
                    ),
                    meaning: "夏日清新，雅致怡人"
                )
            ],
            custom: "芒种插花，《花谱》载：'一枝石榴，点染夏意。'",
            poetry: [
                Poetry(
                    title: "芒种花事",
                    author: "苏轼",
                    content: "小院石榴初绽放，一枝春色满窗明。",
                    background: "描写芒种时节石榴花的清新雅致"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "夏至": FlowerArrangement(
            solarTerm: "夏至",
            arrangements: [
                Arrangement(
                    name: "荷韵小品",
                    description: "小巧雅致的夏至插花",
                    flowers: ["荷花", "睡莲"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小水盘",
                        material: "官窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "水景式",
                        characteristics: [
                            "小巧精致",
                            "清新雅致",
                            "水韵天成",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小荷",
                            "准备浅水",
                            "轻柔布置",
                            "点缀睡莲"
                        ],
                        tips: [
                            "荷花要小巧",
                            "水深要浅",
                            "造型要简约",
                            "注意比例"
                        ],
                        tools: ["小剪刀", "小水盘", "小喷壶"],
                        maintenance: "每日少量换水，保持水质清洁"
                    ),
                    meaning: "小荷才露尖尖角，早有蜻蜓立上头"
                ),
                Arrangement(
                    name: "夏荷小品",
                    description: "小巧雅致的夏至水景",
                    flowers: ["荷花苞", "水葱"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "汝窑小水盘",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "写意式",
                        characteristics: [
                            "小巧玲珑",
                            "意境深远",
                            "简约清新",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择花苞",
                            "修剪长度",
                            "布置水景",
                            "点缀水葱"
                        ],
                        tips: [
                            "荷苞要小巧",
                            "水深要适中",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小水盘", "小喷壶"],
                        maintenance: "每日少量换水，保持清洁"
                    ),
                    meaning: "小荷清韵，夏日怡情"
                )
            ],
            custom: "夏至插花，《花镜》载：'一朵小荷，已有清凉之意。'",
            poetry: [
                Poetry(
                    title: "夏至荷花",
                    author: "杨万里",
                    content: "小荷才露尖尖角，早有蜻蜓立上头。\n小窗一品清如水，不著纤尘染素秋。",
                    background: "描写夏至时节小荷的清新可爱"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "小暑": FlowerArrangement(
            solarTerm: "小暑",
            arrangements: [
                Arrangement(
                    name: "凌霄小品",
                    description: "小巧雅致的小暑插花",
                    flowers: ["凌霄花", "木槿"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "开片纹小花瓶",
                        material: "哥窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清爽式",
                        characteristics: [
                            "小巧玲珑",
                            "清新爽朗",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "花枝要小巧",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "夏日清爽，雅致宜人"
                )
            ],
            custom: "小暑插花，《花谱》载：'一枝凌霄，已觉清凉。'",
            poetry: [
                Poetry(
                    title: "小暑花事",
                    author: "王安石",
                    content: "小窗凌霄一枝开，清风徐来暑气消。",
                    background: "描写小暑时节凌霄花的清爽"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "大暑": FlowerArrangement(
            solarTerm: "大暑",
            arrangements: [
                Arrangement(
                    name: "莲韵小品",
                    description: "小巧雅致的大暑插花",
                    flowers: ["小莲花", "水仙"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小水盘",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "水景式",
                        characteristics: [
                            "小巧精致",
                            "清凉雅致",
                            "简约大方",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小莲",
                            "准备浅水",
                            "轻柔布置",
                            "点缀水仙"
                        ],
                        tips: [
                            "莲花要小巧",
                            "水深要浅",
                            "造型要简约",
                            "注意比例"
                        ],
                        tools: ["小剪刀", "小水盘", "小喷壶"],
                        maintenance: "每日少量换水，保持水质清洁"
                    ),
                    meaning: "小荷才露尖尖角"
                ),
                Arrangement(
                    name: "紫薇小品",
                    description: "小巧雅致的大暑插花",
                    flowers: ["紫薇", "木槿"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "窑变釉小花瓶",
                        material: "钧窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清雅式",
                        characteristics: [
                            "小巧玲珑",
                            "清新雅致",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "紫薇选小枝",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "夏日清雅，紫气东来"
                )
            ],
            custom: "大暑插花，《花镜》载：'一朵小莲，一枝紫薇，皆可清心。'",
            poetry: [
                Poetry(
                    title: "大暑花事",
                    author: "苏轼",
                    content: "小窗紫薇伴莲开，一室清凉胜水来。",
                    background: "描写大暑时节花事的清凉意境"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "立秋": FlowerArrangement(
            solarTerm: "立秋",
            arrangements: [
                Arrangement(
                    name: "桂香小品",
                    description: "小巧雅致的立秋插花",
                    flowers: ["桂花", "山茶"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "白瓷小花瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清雅式",
                        characteristics: [
                            "小巧玲珑",
                            "清香淡雅",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "桂枝要小巧",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "一室清香，秋意盎然"
                )
            ],
            custom: "立秋插花，《花谱》载：'一枝桂花，满室清香。'",
            poetry: [
                Poetry(
                    title: "立秋花事",
                    author: "王安石",
                    content: "小窗桂子暗飘香，一夜清风送秋凉。",
                    background: "描写立秋时节桂花的清香"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "处暑": FlowerArrangement(
            solarTerm: "处暑",
            arrangements: [
                Arrangement(
                    name: "芙蓉小品",
                    description: "小巧雅致的处暑插花",
                    flowers: ["芙蓉", "木槿"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小花瓶",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清丽式",
                        characteristics: [
                            "小巧精致",
                            "清新典雅",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小朵",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "花朵要小巧",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，避免阳光直射"
                    ),
                    meaning: "秋容清丽，雅致宜人"
                )
            ],
            custom: "处暑插花，《花谱》载：'一朵芙蓉，便觉秋意。'",
            poetry: [
                Poetry(
                    title: "处暑花事",
                    author: "杨万里",
                    content: "小院芙蓉独自开，清风徐来秋意来。",
                    background: "描写处暑时节芙蓉的清丽"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "白露": FlowerArrangement(
            solarTerm: "白露",
            arrangements: [
                Arrangement(
                    name: "菊韵小品",
                    description: "小巧雅致的白露插花",
                    flowers: ["小菊", "桂花"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小花瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清逸式",
                        characteristics: [
                            "小巧玲珑",
                            "清香雅致",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小朵",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "菊花要小巧",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "清香淡雅，秋意盎然"
                )
            ],
            custom: "白露插花，《花谱》载：'一朵小菊，已觉秋意。'",
            poetry: [
                Poetry(
                    title: "白露花事",
                    author: "王安石",
                    content: "小窗菊蕊伴桂香，一夜清露洗秋凉。",
                    background: "描写白露时节菊花的清雅"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "秋分": FlowerArrangement(
            solarTerm: "秋分",
            arrangements: [
                Arrangement(
                    name: "黄菊小品",
                    description: "小巧雅致的秋分插花",
                    flowers: ["黄菊", "山茶"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "开片纹小花瓶",
                        material: "哥窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "雅致式",
                        characteristics: [
                            "小巧精致",
                            "清新典雅",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小朵",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "菊花要小巧",
                            "注意通风",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，避免阳光直射"
                    ),
                    meaning: "秋色宜人，菊韵飘香"
                ),
                Arrangement(
                    name: "秋意小品",
                    description: "小巧雅致的秋分插花",
                    flowers: ["白菊", "红枫"], // 减少花材，增添秋意
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小花瓶",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "写意式",
                        characteristics: [
                            "小巧玲珑",
                            "秋意盎然",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "枫叶要小巧",
                            "注意色彩",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "秋色缤纷，雅致宜人"
                )
            ],
            custom: "秋分插花，《花镜》载：'一朵小菊，一片红枫，秋意已浓。'",
            poetry: [
                Poetry(
                    title: "秋分花事",
                    author: "苏轼",
                    content: "小窗菊枫相映红，一夜秋风送爽来。",
                    background: "描写秋分时节菊花与红枫的清雅"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "寒露": FlowerArrangement(
            solarTerm: "寒露",
            arrangements: [
                Arrangement(
                    name: "寒菊小品",
                    description: "小巧雅致的寒露插花",
                    flowers: ["寒菊", "红枫"], // 减少花材，配以红枫
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小花瓶",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "傲霜式",
                        characteristics: [
                            "小巧玲珑",
                            "傲霜独立",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小朵",
                            "修剪长度",
                            "轻柔插放",
                            "点缀红枫"
                        ],
                        tips: [
                            "菊花要小巧",
                            "枫叶点缀",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "傲霜独立，秋意正浓"
                )
            ],
            custom: "寒露插花，《花谱》载：'一朵寒菊，一片红叶，秋意已深。'",
            poetry: [
                Poetry(
                    title: "寒露花事",
                    author: "王安石",
                    content: "小窗寒菊伴红枫，一夜霜华染素秋。",
                    background: "描写寒露时节寒菊的傲霜风骨"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "霜降": FlowerArrangement(
            solarTerm: "霜降",
            arrangements: [
                Arrangement(
                    name: "山茶小品",
                    description: "小巧雅致的霜降插花",
                    flowers: ["山茶", "腊梅"], // 减少花材，过渡到冬季
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小花瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清逸式",
                        characteristics: [
                            "小巧精致",
                            "清雅脱俗",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小朵",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "山茶要小巧",
                            "腊梅带蕾",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，避免阳光直射"
                    ),
                    meaning: "晚秋独秀，暗香浮动"
                ),
                Arrangement(
                    name: "寒香小品",
                    description: "小巧雅致的霜降插花",
                    flowers: ["腊梅", "水仙"], // 减少花材，为冬季做准备
                    container: Container(
                        type: "小巧花器",
                        description: "开片纹小花瓶",
                        material: "哥窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "素雅式",
                        characteristics: [
                            "小巧玲珑",
                            "暗香浮动",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "腊梅带蕾",
                            "水仙新鲜",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "暗香浮动，冬意渐浓"
                )
            ],
            custom: "霜降插花，《花镜》载：'一枝山茶，一朵腊梅，已觉冬意。'",
            poetry: [
                Poetry(
                    title: "霜降花事",
                    author: "苏轼",
                    content: "小窗山茶伴腊梅，一夜霜华天地开。",
                    background: "描写霜降时节花事的清雅意境"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "立冬": FlowerArrangement(
            solarTerm: "立冬",
            arrangements: [
                Arrangement(
                    name: "腊梅小品",
                    description: "小巧雅致的立冬插花",
                    flowers: ["腊梅", "水仙"], // 减少花材，冬季主角
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小花瓶",
                        material: "官窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清逸式",
                        characteristics: [
                            "小巧玲珑",
                            "暗香浮动",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "腊梅带蕾",
                            "水仙新鲜",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "暗香疏影，冬意盎然"
                )
            ],
            custom: "立冬插花，《花谱》载：'一枝腊梅，已觉冬意。'",
            poetry: [
                Poetry(
                    title: "立冬花事",
                    author: "王安石",
                    content: "小窗腊梅暗香来，一夜东风送暖回。",
                    background: "描写立冬时节腊梅的清雅"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "小雪": FlowerArrangement(
            solarTerm: "小雪",
            arrangements: [
                Arrangement(
                    name: "水仙小品",
                    description: "小巧雅致的小雪插花",
                    flowers: ["水仙", "腊梅"], // 减少花材
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小水仙盆",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "素雅式",
                        characteristics: [
                            "小巧精致",
                            "清香淡雅",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小球",
                            "修剪根部",
                            "轻柔放置",
                            "调整姿态"
                        ],
                        tips: [
                            "水仙要小巧",
                            "水位适中",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小水盆", "小喷壶"],
                        maintenance: "每日少量补水，避免阳光直射"
                    ),
                    meaning: "清香淡雅，暗香浮动"
                ),
                Arrangement(
                    name: "岁寒小品",
                    description: "小巧雅致的小雪插花",
                    flowers: ["松枝", "腊梅"], // 减少花材，突出岁寒三友
                    container: Container(
                        type: "小巧花器",
                        description: "开片纹小花瓶",
                        material: "哥窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "傲雪式",
                        characteristics: [
                            "小巧玲珑",
                            "傲雪凌寒",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "松枝要小巧",
                            "腊梅点缀",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "岁寒独立，傲雪凌霜"
                )
            ],
            custom: "小雪插花，《花镜》载：'一朵水仙，一枝腊梅，已觉清香。'",
            poetry: [
                Poetry(
                    title: "小雪花事",
                    author: "苏轼",
                    content: "小窗水仙伴腊梅，一夜清香雪未来。",
                    background: "描写小雪时节花事的清雅意境"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "大雪": FlowerArrangement(
            solarTerm: "大雪",
            arrangements: [
                Arrangement(
                    name: "岁寒小品",
                    description: "小巧雅致的大雪插花",
                    flowers: ["松竹梅", "水仙"], // 岁寒三友为主
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小花瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "傲雪式",
                        characteristics: [
                            "小巧玲珑",
                            "傲雪凌寒",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "枝条要小巧",
                            "注意层次",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "岁寒三友，傲雪凌霜"
                )
            ],
            custom: "大雪插花，《花谱》载：'一枝岁寒，已见坚贞。'",
            poetry: [
                Poetry(
                    title: "大雪花事",
                    author: "王安石",
                    content: "小窗岁寒三友开，一夜飞雪玉琼台。",
                    background: "描写大雪时节岁寒三友的坚贞"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "冬至": FlowerArrangement(
            solarTerm: "冬至",
            arrangements: [
                Arrangement(
                    name: "红梅小品",
                    description: "小巧雅致的冬至插花",
                    flowers: ["红梅", "水仙"], // 减少花材，突出红梅
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小花瓶",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "清雅式",
                        characteristics: [
                            "小巧精致",
                            "红白相映",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "梅枝要小巧",
                            "水仙配衬",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，避免暖气直吹"
                    ),
                    meaning: "红梅报春，暗香浮动"
                ),
                Arrangement(
                    name: "寒梅小品",
                    description: "小巧雅致的冬至插花",
                    flowers: ["白梅", "松枝"], // 减少花材，突出冬意
                    container: Container(
                        type: "小巧花器",
                        description: "开片纹小花瓶",
                        material: "哥窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "素雅式",
                        characteristics: [
                            "小巧玲珑",
                            "清素雅致",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "梅枝要小巧",
                            "松枝点缀",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "寒梅独立，暗香疏影"
                )
            ],
            custom: "冬至插花，《花镜》载：'一枝红梅，一朵水仙，已觉春意。'",
            poetry: [
                Poetry(
                    title: "冬至花事",
                    author: "苏轼",
                    content: "小窗红梅伴水仙，一夜东风送暖来。",
                    background: "描写冬至时节花事的清雅意境"
                )
            ],
            source: "《花镜》《宋代花事》"
        ),
        
        "小寒": FlowerArrangement(
            solarTerm: "小寒",
            arrangements: [
                Arrangement(
                    name: "寒梅小品",
                    description: "小巧雅致的小寒插花",
                    flowers: ["腊梅", "水仙"], // 减少花材，突出耐寒花卉
                    container: Container(
                        type: "小巧花器",
                        description: "青白釉小花瓶",
                        material: "定窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "傲寒式",
                        characteristics: [
                            "小巧玲珑",
                            "暗香浮动",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻巧平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "梅枝要小巧",
                            "水仙配衬",
                            "造型要简约",
                            "避免暖气"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持空气湿度"
                    ),
                    meaning: "暗香疏影，寒香独立"
                )
            ],
            custom: "小寒插花，《花谱》载：'一枝腊梅，已觉春近。'",
            poetry: [
                Poetry(
                    title: "小寒花事",
                    author: "王安石",
                    content: "小窗腊梅暗香来，一夜东风送春回。",
                    background: "描写小寒时节腊梅的清雅"
                )
            ],
            source: "《花谱》《宋代插花》"
        ),
        
        "大寒": FlowerArrangement(
            solarTerm: "大寒",
            arrangements: [
                Arrangement(
                    name: "寒香小品",
                    description: "小巧雅致的大寒插花",
                    flowers: ["水仙", "腊梅"], // 减少花材，为春节做准备
                    container: Container(
                        type: "小巧花器",
                        description: "天青釉小水仙盆",
                        material: "汝窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "素雅式",
                        characteristics: [
                            "小巧精致",
                            "清香淡雅",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "窗台式",
                        balance: "自然平衡"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小球",
                            "修剪根部",
                            "轻柔放置",
                            "调整姿态"
                        ],
                        tips: [
                            "水仙要小巧",
                            "水位适中",
                            "造型要简约",
                            "避免暖气"
                        ],
                        tools: ["小剪刀", "小水盆", "小喷壶"],
                        maintenance: "每日少量补水，保持水质清洁"
                    ),
                    meaning: "寒香暗度，春意渐浓"
                ),
                Arrangement(
                    name: "迎春小品",
                    description: "小巧雅致的大寒插花",
                    flowers: ["迎春花", "腊梅"], // 减少花材，暗示春意
                    container: Container(
                        type: "小巧花器",
                        description: "开片纹小花瓶",
                        material: "哥窑瓷器",
                        size: "小型"
                    ),
                    style: Style(
                        name: "新春式",
                        characteristics: [
                            "小巧玲珑",
                            "春意盎然",
                            "简约自然",
                            "宜室宜家"
                        ],
                        placement: "案头式",
                        balance: "轻盈自然"
                    ),
                    technique: Technique(
                        steps: [
                            "选择小枝",
                            "修剪长度",
                            "轻柔插放",
                            "调整造型"
                        ],
                        tips: [
                            "枝条要小巧",
                            "注意搭配",
                            "造型要简约",
                            "适合小空间"
                        ],
                        tools: ["小剪刀", "小花器", "小喷壶"],
                        maintenance: "每日少量补水，保持通风"
                    ),
                    meaning: "寒尽春来，暗香浮动"
                )
            ],
            custom: "大寒插花，《花镜》载：'一朵水仙，一枝迎春，已觉春临。'",
            poetry: [
                Poetry(
                    title: "大寒花事",
                    author: "苏轼",
                    content: "小窗水仙迎春开，一夜东风送暖来。",
                    background: "描写大寒时节花事的清雅意境"
                )
            ],
            source: "《花镜》《宋代花事》"
        )
    ]
} 