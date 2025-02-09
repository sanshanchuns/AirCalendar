public class SongDaiSeasonalFoodManager {
    public static let shared = SongDaiSeasonalFoodManager()
    
    public struct SeasonalFood {
        let name: String
        let ingredients: [(name: String, amount: String)]
        let preparation: [String]  // 准备步骤
        let method: [String]      // 制作步骤
        let tips: String          // 制作要点
        let storage: String       // 储存方法
        let usage: String         // 食用方法
        let effect: String        // 功效
        let cultural: String      // 文化背景
        let story: Story         // 相关典故
        let poetry: Poetry?  // 添加诗词字段
    }
    
    public struct FoodArrangement {
        let solarTerm: String
        let foods: [SeasonalFood]
        let custom: String    // 节气习俗
        let source: String    // 典籍来源
    }
    
    private let seasonalFoodCalendar: [String: FoodArrangement] = [
        "立春": FoodArrangement(
            solarTerm: "立春",
            foods: [
                SeasonalFood(
                    name: "五辛盘",
                    ingredients: [
                        ("韭菜", "100克"),
                        ("葱白", "100克"),
                        ("蒜苗", "100克"),
                        ("芥菜", "100克"),
                        ("生姜", "50克"),
                        ("盐", "适量"),
                        ("醋", "适量")
                    ],
                    preparation: [
                        "韭菜洗净切段",
                        "葱白切段",
                        "蒜苗切段",
                        "芥菜切丝",
                        "生姜切丝"
                    ],
                    method: [
                        "1. 各类菜分别焯水",
                        "2. 沥干水分",
                        "3. 按五行方位摆盘",
                        "4. 调入盐醋",
                        "5. 最后撒上姜丝"
                    ],
                    tips: "焯水时间要短，保持脆嫩",
                    storage: "现做现吃",
                    usage: "立春日早餐或午餐",
                    effect: "温阳散寒，助春气生发",
                    cultural: "立春食五辛，为宋代重要习俗，象征迎春接福。",
                    story: Story(
                        title: "立春五辛",
                        content: "《东京梦华录》载：'立春日，市井皆售五辛盘，以应节气，取其辟邪驱寒。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城立春时节的饮食习俗"
                    ),
                    poetry: nil  // 添加 nil 值
                ),
                
                SeasonalFood(
                    name: "春饼",
                    ingredients: [
                        ("面粉", "300克"),
                        ("豆芽", "200克"),
                        ("韭菜", "100克"),
                        ("咸肉", "100克"),
                        ("盐", "适量"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "面粉过筛",
                        "豆芽洗净",
                        "韭菜切段",
                        "咸肉切丁"
                    ],
                    method: [
                        "1. 面粉加水和面",
                        "2. 擀成薄饼",
                        "3. 煎至两面金黄",
                        "4. 炒制豆芽韭菜咸肉馅",
                        "5. 包入饼中即可"
                    ],
                    tips: "面要和软，饼要擀薄",
                    storage: "当天食用为佳",
                    usage: "立春时节早餐或午餐",
                    effect: "温中健脾",
                    cultural: "立春食春饼，象征新春开始。",
                    story: Story(
                        title: "立春春饼",
                        content: "《宋东京考》载：'立春之日，民间争食春饼，取其新岁之意。'",
                        source: "《宋东京考》",
                        background: "记载宋代民间立春饮食习俗"
                    ), poetry:nil
                )
            ],
            custom: "立春食五辛春饼，《历时杂记》载：'立春之日，食五辛以辟邪，食春饼以迎新。'",
            source: "《东京梦华录》《宋东京考》《历时》"
        ),
        "雨水": FoodArrangement(
            solarTerm: "雨水",
            foods: [
                SeasonalFood(
                    name: "梅花粥",
                    ingredients: [
                        ("大米", "200克"),
                        ("腊梅", "30克"),
                        ("红糖", "50克"),
                        ("桂花", "20克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "大米淘洗",
                        "腊梅洗净",
                        "桂花备用"
                    ],
                    method: [
                        "1. 大米煮粥",
                        "2. 粥将熟时加入腊梅",
                        "3. 加入红糖调味",
                        "4. 撒上桂花",
                        "5. 焖2分钟即可"
                    ],
                    tips: "火候要小，粥要浓稠",
                    storage: "当天食用完",
                    usage: "雨水时节早餐",
                    effect: "温胃生津",
                    cultural: "雨水食梅，取'寒梅傲雪'之意。",
                    story: Story(
                        title: "雨水梅粥",
                        content: "《梦粱录》载：'雨水时节，茶肆多煮梅花粥，香甜可口，最解困乏。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的饮食习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "春卷",
                    ingredients: [
                        ("面粉", "200克"),
                        ("豆芽", "150克"),
                        ("韭黄", "100克"),
                        ("胡萝卜", "50克"),
                        ("五花肉", "100克"),
                        ("盐", "适量"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "面粉调面糊",
                        "豆芽洗净",
                        "韭黄切段",
                        "胡萝卜丝",
                        "五花肉切丁"
                    ],
                    method: [
                        "1. 煎薄饼",
                        "2. 炒制馅料",
                        "3. 包入饼中",
                        "4. 卷成筒状",
                        "5. 煎至金黄"
                    ],
                    tips: "面糊要薄，馅料要干",
                    storage: "当天食用为佳",
                    usage: "雨水时节午餐点心",
                    effect: "健脾开胃",
                    cultural: "雨水食春卷，象征春季万物生发。",
                    story: Story(
                        title: "雨水春卷",
                        content: "《宋会要辑稿》载：'雨水之日，市井多售春卷，以时蔬为馅，民争食之。'",
                        source: "《宋会要辑稿》",
                        background: "记载宋代民间饮食习俗"
                    ), poetry:nil
                )
            ],
            custom: "雨水食梅食春，《历时习俗》载：'雨水之时，食梅以解困，食春以助阳。'",
            source: "《梦粱录》《宋会要辑稿》《历时习俗》"
        ),
        "惊蛰": FoodArrangement(
            solarTerm: "惊蛰",
            foods: [
                SeasonalFood(
                    name: "姜糖饼",
                    ingredients: [
                        ("面粉", "300克"),
                        ("生姜汁", "30克"),
                        ("红糖", "100克"),
                        ("芝麻", "50克"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "面粉过筛",
                        "生姜榨汁",
                        "红糖化开",
                        "芝麻炒熟"
                    ],
                    method: [
                        "1. 面粉加入姜汁和红糖水",
                        "2. 揉成软面团",
                        "3. 分成小块",
                        "4. 擀成圆饼",
                        "5. 撒上芝麻",
                        "6. 平底锅小火煎至金黄"
                    ],
                    tips: "面团要柔软，火候要小",
                    storage: "密封保存，常温3天",
                    usage: "惊蛰时节早餐或点心",
                    effect: "温中散寒，助阳生发",
                    cultural: "惊蛰食姜，取'辟虫御寒'之意，为宋代习俗。",
                    story: Story(
                        title: "惊蛰姜饼",
                        content: "《武林旧事》载：'惊蛰日，市肆多售姜糖饼，取其温性，以御春寒。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安民间饮食习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "豆芽饭",
                    ingredients: [
                        ("大米", "300克"),
                        ("绿豆芽", "200克"),
                        ("咸肉", "50克"),
                        ("葱花", "20克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "大米淘洗",
                        "豆芽洗净",
                        "咸肉切丁",
                        "葱切碎"
                    ],
                    method: [
                        "1. 大米加水煮至半熟",
                        "2. 放入豆芽和咸肉",
                        "3. 继续煮至米熟",
                        "4. 加入盐调味",
                        "5. 撒上葱花"
                    ],
                    tips: "豆芽要新鲜，火候要适中",
                    storage: "当天食用完",
                    usage: "惊蛰时节午餐或晚餐",
                    effect: "健脾养胃，助阳生发",
                    cultural: "惊蛰食芽，象征万物萌发之意。",
                    story: Story(
                        title: "惊蛰豆芽",
                        content: "《宋东京考》载：'惊蛰时，民间以豆芽配饭，取其发生之意，助春阳生发。'",
                        source: "《宋东京考》",
                        background: "记载宋代平民饮食习俗"
                    ), poetry:nil
                )
            ],
            custom: "惊蛰食姜豆芽，《历时习俗》载：'惊蛰之日，食姜以御寒，食芽以助阳。'",
            source: "《武林旧事》《宋东京考》《历时习俗》"
        ),
        "春分": FoodArrangement(
            solarTerm: "春分",
            foods: [
                SeasonalFood(
                    name: "艾糍",
                    ingredients: [
                        ("糯米粉", "300克"),
                        ("艾草", "100克"),
                        ("红豆沙", "200克"),
                        ("白糖", "50克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "糯米粉过筛",
                        "艾草洗净焯水",
                        "红豆沙备用"
                    ],
                    method: [
                        "1. 艾草捣汁",
                        "2. 糯米粉加入艾草汁揉面",
                        "3. 分成小团",
                        "4. 按扁包入豆沙",
                        "5. 搓圆压扁",
                        "6. 蒸15分钟"
                    ],
                    tips: "面团要软糯，艾草要新鲜",
                    storage: "冷却后密封，常温2天",
                    usage: "春分时节早点或茶点",
                    effect: "明目清心，助阳生发",
                    cultural: "春分食艾，为宋代重要习俗，取明目清心之意。",
                    story: Story(
                        title: "春分艾糍",
                        content: "《东京梦华录》载：'春分日，市井皆售艾糍，翠色如玉，香甜可口。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城春分时节的特色小吃"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "春卷",
                    ingredients: [
                        ("面粉", "200克"),
                        ("豆芽", "150克"),
                        ("韭黄", "100克"),
                        ("胡萝卜", "50克"),
                        ("五花肉", "100克"),
                        ("盐", "适量"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "面粉调面糊",
                        "豆芽洗净",
                        "韭黄切段",
                        "胡萝卜丝",
                        "五花肉切丁"
                    ],
                    method: [
                        "1. 煎薄饼",
                        "2. 炒制馅料",
                        "3. 包入饼中",
                        "4. 卷成筒状",
                        "5. 煎至金黄"
                    ],
                    tips: "面糊要薄，馅料要干",
                    storage: "当天食用为佳",
                    usage: "雨水时节午餐点心",
                    effect: "健脾开胃",
                    cultural: "雨水食春卷，象征春季万物生发。",
                    story: Story(
                        title: "雨水春卷",
                        content: "《宋会要辑稿》载：'雨水之日，市井多售春卷，以时蔬为馅，民争食之。'",
                        source: "《宋会要辑稿》",
                        background: "记载宋代民间饮食习俗"
                    ), poetry:nil
                )
            ],
            custom: "雨水食梅食春，《历时习俗》载：'雨水之时，食梅以解困，食春以助阳。'",
            source: "《梦粱录》《宋会要辑稿》《历时习俗》"
        ),
        "清明": FoodArrangement(
            solarTerm: "清明",
            foods: [
                SeasonalFood(
                    name: "青团",
                    ingredients: [
                        ("糯米粉", "300克"),
                        ("艾草", "100克"),
                        ("红豆沙", "200克"),
                        ("蜂蜜", "30克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "糯米粉过筛",
                        "艾草洗净",
                        "红豆沙备用"
                    ],
                    method: [
                        "1. 艾草捣汁",
                        "2. 糯米粉加艾草汁揉面",
                        "3. 分成小团",
                        "4. 包入红豆沙",
                        "5. 搓圆压扁",
                        "6. 蒸15分钟",
                        "7. 刷蜂蜜"
                    ],
                    tips: "面团要软糯，艾草要新鲜",
                    storage: "密封保存，常温2天",
                    usage: "清明时节早点或茶点",
                    effect: "明目清心",
                    cultural: "清明食青团，为江南传统习俗，取清明祭祖之意。",
                    story: Story(
                        title: "清明青团",
                        content: "《武林旧事》载：'清明时节，市肆皆售青团，翠色如玉，祭祖佳品。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的清明习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "清明饭",
                    ingredients: [
                        ("糯米", "300克"),
                        ("香椿", "100克"),
                        ("咸肉", "100克"),
                        ("青菜", "100克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "糯米淘洗",
                        "香椿切碎",
                        "咸肉切丁",
                        "青菜切段"
                    ],
                    method: [
                        "1. 糯米浸泡2小时",
                        "2. 锅中加水煮沸",
                        "3. 放入糯米",
                        "4. 加入咸肉",
                        "5. 快熟时加入香椿青菜",
                        "6. 调味即可"
                    ],
                    tips: "火候要适中，香椿要新鲜",
                    storage: "当天食用完",
                    usage: "清明时节早餐或午餐",
                    effect: "健脾养胃",
                    cultural: "清明食香椿，为宋代传统，取食春之意。",
                    story: Story(
                        title: "清明饭",
                        content: "《东京梦华录》载：'清明时节，民间以糯米配香椿为饭，谓之清明饭，最是时鲜。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的清明饮食"
                    ), poetry:nil
                )
            ],
            custom: "清明食青团香椿，《历时集》载：'清明之日，食青团以祭祖，食香椿以尝春。'",
            source: "《武林旧事》《东京梦华录》《历时集》"
        ),
        "谷雨": FoodArrangement(
            solarTerm: "谷雨",
            foods: [
                SeasonalFood(
                    name: "谷雨茶饭",
                    ingredients: [
                        ("糯米", "300克"),
                        ("春茶", "30克"),
                        ("枸杞", "30克"),
                        ("桂花", "20克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "糯米淘洗",
                        "春茶泡开",
                        "枸杞洗净",
                        ("桂花备用")
                    ],
                    method: [
                        "1. 糯米用茶水浸泡",
                        "2. 放入锅中煮至半熟",
                        "3. 加入枸杞",
                        "4. 继续煮至米熟",
                        "5. 撒上桂花"
                    ],
                    tips: "茶水要浓，火候要适中",
                    storage: "当天食用完",
                    usage: "谷雨时节早餐",
                    effect: "清心明目",
                    cultural: "谷雨尝新茶，为宋代文人雅事。",
                    story: Story(
                        title: "谷雨茶饭",
                        content: "《梦粱录》载：'谷雨时节，茶肆多以新茶煮饭，香气袭人，最宜清晨。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的饮食习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "豆芽饼",
                    ingredients: [
                        ("面粉", "300克"),
                        ("绿豆芽", "200克"),
                        ("韭菜", "100克"),
                        ("鸡蛋", "2个"),
                        ("盐", "适量"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "面粉过筛",
                        ("豆芽洗净"),
                        ("韭菜切段"),
                        ("鸡蛋打散")
                    ],
                    method: [
                        "1. 面粉加水调面糊",
                        "2. 加入鸡蛋搅拌",
                        "3. 放入豆芽韭菜",
                        "4. 平底锅刷油",
                        "5. 摊成薄饼煎熟"
                    ],
                    tips: "面糊要薄，火候要适中",
                    storage: "当天食用为佳",
                    usage: "谷雨时节早餐或午餐",
                    effect: "健脾开胃",
                    cultural: "谷雨食芽，象征生机勃发。",
                    story: Story(
                        title: "谷雨饼",
                        content: "《宋东京考》载：'谷雨时节，市井多售豆芽饼，取其发生之意，最是时新。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的谷雨饮食"
                    ), poetry:nil
                )
            ],
            custom: "谷雨尝新茶食豆芽，《历时杂记》载：'谷雨之日，尝新茶以清心，食豆芽以助长。'",
            source: "《梦粱录》《宋东京考》《历时杂记》"
        ),
        "立夏": FoodArrangement(
            solarTerm: "立夏",
            foods: [
                SeasonalFood(
                    name: "立夏粥",
                    ingredients: [
                        ("粳米", "200克"),
                        ("绿豆", "50克"),
                        ("薄荷", "20克"),
                        ("冰糖", "30克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "粳米淘洗",
                        "绿豆洗净",
                        "薄荷洗净",
                        "冰糖备用"
                    ],
                    method: [
                        "1. 粳米绿豆同煮",
                        "2. 煮至绿豆开花",
                        "3. 加入冰糖",
                        "4. 最后加入薄荷",
                        "5. 焖2分钟即可"
                    ],
                    tips: "火候要小，粥要绵软",
                    storage: "当天食用完",
                    usage: "立夏时节早餐",
                    effect: "清热解暑",
                    cultural: "立夏食绿豆粥，为宋代避暑良方。",
                    story: Story(
                        title: "立夏粥",
                        content: "《东京梦华录》载：'立夏日，茶肆皆煮绿豆薄荷粥，清凉可口，消暑解热。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的夏季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "凉糕",
                    ingredients: [
                        ("糯米粉", "200克"),
                        ("藕粉", "100克"),
                        ("白糖", "50克"),
                        ("玫瑰", "20克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "糯米粉过筛",
                        "藕粉过筛",
                        "玫瑰泡开",
                        "准备模具"
                    ],
                    method: [
                        "1. 糯米粉藕粉混合",
                        "2. 加入玫瑰水调和",
                        "3. 加入白糖搅拌",
                        "4. 倒入模具",
                        "5. 蒸15分钟",
                        "6. 晾凉切块"
                    ],
                    tips: "水温要适中，蒸好要晾透",
                    storage: "冷藏可存2天",
                    usage: "立夏时节点心",
                    effect: "清热生津",
                    cultural: "立夏食凉糕，为宋代避暑甜点。",
                    story: Story(
                        title: "立夏糕",
                        content: "《武林旧事》载：'立夏时节，市肆多售凉糕，以藕粉为主，清甜爽口。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的夏季小吃"
                    ), poetry:nil
                )
            ],
            custom: "立夏避暑，《历时集》载：'立夏之日，食绿豆粥以消暑，食凉糕以生津。'",
            source: "《东京梦华录》《武林旧事》《历时集》"
        ),
        "小满": FoodArrangement(
            solarTerm: "小满",
            foods: [
                SeasonalFood(
                    name: "蜜饯枇杷",
                    ingredients: [
                        ("枇杷", "500克"),
                        ("冰糖", "200克"),
                        ("蜂蜜", "100克"),
                        ("盐", "少许"),
                        ("柠檬片", "2片")
                    ],
                    preparation: [
                        "枇杷去皮核",
                        "冰糖碾碎",
                        "柠檬片备用"
                    ],
                    method: [
                        "1. 枇杷略焯水",
                        "2. 加入冰糖腌制",
                        "3. 加入柠檬片",
                        "4. 密封浸泡三天",
                        "5. 最后加入蜂蜜调味"
                    ],
                    tips: "枇杷要新鲜，糖量要适中",
                    storage: "密封可存一月",
                    usage: "小满时节点心",
                    effect: "生津止渴，润肺止咳",
                    cultural: "小满食枇杷，为宋代养生良方。",
                    story: Story(
                        title: "小满枇杷",
                        content: "《本草纲目》载：'小满时枇杷最佳，蜜饯可存，止渴生津。'",
                        source: "《本草纲目》",
                        background: "记载宋代药膳制作方法"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "艾叶粽",
                    ingredients: [
                        ("糯米", "500克"),
                        ("艾叶", "100克"),
                        ("红豆", "200克"),
                        ("咸肉", "200克"),
                        ("粽叶", "30片")
                    ],
                    preparation: [
                        "糯米浸泡",
                        "艾叶洗净",
                        "红豆煮软",
                        "咸肉切丁"
                    ],
                    method: [
                        "1. 艾叶煮水",
                        "2. 糯米泡艾叶水",
                        "3. 粽叶泡软",
                        "4. 包入馅料",
                        "5. 扎紧蒸煮"
                    ],
                    tips: "粽叶要新鲜，绳子要扎紧",
                    storage: "冷藏三天",
                    usage: "小满时节主食",
                    effect: "健脾养胃",
                    cultural: "小满包粽，为端午节前的预备。",
                    story: Story(
                        title: "小满粽",
                        content: "《东京梦华录》载：'小满前后，市井已售艾粽，以应端阳。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的节令食俗"
                    ), poetry: nil
                ),
                SeasonalFood(
                    name: "时蔬饺",
                    ingredients: [
                        ("面粉", "300克"),
                        ("黄瓜", "200克"),
                        ("韭菜", "100克"),
                        ("香菇", "50克"),
                        ("咸菜", "50克"),
                        ("葱花", "20克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "面粉过筛",
                        "黄瓜切丁",
                        "韭菜切段",
                        "香菇切碎",
                        "咸菜剁碎",
                        "葱花备用"
                    ],
                    method: [
                        "1. 面粉加水和面",
                        "2. 馅料混合调味",
                        "3. 擀皮包馅",
                        "4. 捏出褶子",
                        "5. 上笼蒸10分钟"
                    ],
                    tips: "面要软硬适中，馅要清爽",
                    storage: "当天食用为佳",
                    usage: "小满时节午餐或晚餐",
                    effect: "清淡爽口",
                    cultural: "小满食饺，取'粽满'之意。",
                    story: Story(
                        title: "小满饺",
                        content: "《宋东京考》载：'小满之日，市井多售时蔬饺，以黄瓜韭菜为馅，取其清新之味。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的应季小吃"
                    ), poetry:nil
                )
            ],
            custom: "小满食枇杷艾粽，《岁时集》载：'小满之时，食枇杷以清热，食艾粽以祛湿。'",
            source: "《本草纲目》《东京梦华录》《岁时集》"
        ),
        
        "芒种": FoodArrangement(
            solarTerm: "芒种",
            foods: [
                SeasonalFood(
                    name: "新麦饼",
                    ingredients: [
                        ("新麦面", "500克"),
                        ("豆沙", "200克"),
                        ("芝麻", "50克"),
                        ("蜂蜜", "100克"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "新麦面过筛",
                        "豆沙备用",
                        "芝麻炒香"
                    ],
                    method: [
                        "1. 面粉加水和面",
                        "2. 揉成面团",
                        "3. 包入豆沙",
                        "4. 撒上芝麻",
                        "5. 煎至金黄"
                    ],
                    tips: "面要和软，火候要适中",
                    storage: "当天食用为佳",
                    usage: "芒种时节早点",
                    effect: "健脾和胃",
                    cultural: "芒种尝新，为宋代重要习俗。",
                    story: Story(
                        title: "芒种饼",
                        content: "《梦粱录》载：'芒种时新麦初熟，市肆竞制新麦饼，以献亲朋。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安的饮食习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "樱桃酒",
                    ingredients: [
                        ("樱桃", "500克"),
                        ("白酒", "1000ml"),
                        ("冰糖", "200克"),
                        ("桂花", "30克"),
                        ("山楂", "50克")
                    ],
                    preparation: [
                        "樱桃洗净",
                        "冰糖碾碎",
                        "桂花晾干",
                        "山楂切片"
                    ],
                    method: [
                        "1. 樱桃去核",
                        "2. 放入坛中",
                        "3. 加入白酒",
                        "4. 加入配料",
                        "5. 密封浸泡"
                    ],
                    tips: "坛要密封，避光存放",
                    storage: "可存半年",
                    usage: "芒种时节饮品",
                    effect: "活血养颜",
                    cultural: "芒种制酒，为宋代文人雅事。",
                    story: Story(
                        title: "芒种酒",
                        content: "《东京梦华录》载：'芒种时樱桃盛产，贵家皆以制酒，待客赏月。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的饮食文化"
                    ), poetry:nil
                )
            ],
            custom: "芒种尝新酿酒，《岁时杂记》载：'芒种之日，尝新麦以报岁，酿樱桃以待客。'",
            source: "《梦粱录》《东京梦华录》《岁时杂记》"
        ),
        "夏至": FoodArrangement(
            solarTerm: "夏至",
            foods: [
                SeasonalFood(
                    name: "荷叶粽",
                    ingredients: [
                        ("糯米", "500克"),
                        ("咸鸭蛋黄", "4个"),
                        ("腊肉", "200克"),
                        ("荷叶", "10片"),
                        ("粽叶", "20片"),
                        ("盐", "适量"),
                        ("绳子", "适量")
                    ],
                    preparation: [
                        "糯米浸泡4小时",
                        "咸蛋黄备用",
                        "腊肉切丁",
                        "荷叶洗净",
                        "粽叶泡软"
                    ],
                    method: [
                        "1. 糯米拌盐",
                        "2. 荷叶垫底包裹粽叶",
                        "3. 放入糯米腊肉蛋黄",
                        "4. 包成三角形",
                        "5. 扎紧蒸煮两小时"
                    ],
                    tips: "荷叶要新鲜，火候要足",
                    storage: "冷藏可存3天",
                    usage: "夏至时节主食",
                    effect: "清热解暑",
                    cultural: "夏至食荷，为宋代文人雅事，取其清净之意。",
                    story: Story(
                        title: "夏至荷粽",
                        content: "《东京梦华录》载：'夏至前后，市肆多售荷叶裹粽，香气四溢，消暑解腻。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的夏至饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "酸梅汤",
                    ingredients: [
                        ("乌梅", "100克"),
                        ("山楂", "50克"),
                        ("甘草", "10克"),
                        ("桂花", "20克"),
                        ("冰糖", "100克")
                    ],
                    preparation: [
                        "乌梅洗净",
                        "山楂切片",
                        "甘草洗净",
                        "桂花备用"
                    ],
                    method: [
                        "1. 乌梅山楂同煮",
                        "2. 加入甘草",
                        "3. 煮至汤色红褐",
                        "4. 加入冰糖",
                        "5. 撒上桂花"
                    ],
                    tips: "火候要适中，味道要酸甜",
                    storage: "冷藏可存5天",
                    usage: "夏至时节饮品",
                    effect: "生津止渴",
                    cultural: "夏至饮酸，为宋代避暑良方。",
                    story: Story(
                        title: "夏至汤",
                        content: "《梦粱录》载：'夏至时节，贵家皆煮酸梅汤解暑，香气四溢，沁人心脾。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的避暑饮品"
                    ), poetry:nil
                )
            ],
            custom: "夏至食荷饮酸，《岁时集》载：'夏至之日，食荷以清心，饮酸以生津。'",
            source: "《东京梦华录》《梦粱录》《岁时集》"
        ),
        
        "小暑": FoodArrangement(
            solarTerm: "小暑",
            foods: [
                SeasonalFood(
                    name: "莲子粥",
                    ingredients: [
                        ("莲子", "100克"),
                        ("粳米", "200克"),
                        ("红枣", "50克"),
                        ("冰糖", "30克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "莲子去芯",
                        "粳米淘洗",
                        "红枣去核",
                        "冰糖备用"
                    ],
                    method: [
                        "1. 莲子煮至绵软",
                        "2. 加入粳米同煮",
                        "3. 放入红枣",
                        "4. 加入冰糖",
                        "5. 文火熬至粘稠"
                    ],
                    tips: "莲子要新鲜，火候要小",
                    storage: "当天食用完",
                    usage: "小暑时节早餐",
                    effect: "清心安神",
                    cultural: "小暑食莲，为宋代养生之道。",
                    story: Story(
                        title: "小暑粥",
                        content: "《宋东京考》载：'小暑时节，茶肆多煮莲子粥，清香怡人，最解暑热。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的夏季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "薄荷凉面",
                    ingredients: [
                        ("面条", "300克"),
                        ("薄荷", "50克"),
                        ("黄瓜", "100克"),
                        ("豆芽", "100克"),
                        ("醋", "适量"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "面条煮好过凉",
                        "薄荷洗净切碎",
                        "黄瓜切丝",
                        "豆芽焯水"
                    ],
                    method: [
                        "1. 面条沥干水分",
                        "2. 加入薄荷黄瓜",
                        "3. 放入豆芽",
                        "4. 调入醋盐",
                        "5. 拌匀即可"
                    ],
                    tips: "面条要劲道，配料要新鲜",
                    storage: "现做现吃",
                    usage: "小暑时节午餐",
                    effect: "清热解暑",
                    cultural: "小暑食凉，为宋代避暑习俗。",
                    story: Story(
                        title: "小暑面",
                        content: "《武林旧事》载：'小暑时节，市井多售薄荷凉面，清爽可口，解暑良方。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的夏季饮食"
                    ), poetry:nil
                )
            ],
            custom: "小暑食莲食凉，《岁时杂记》载：'小暑之日，食莲以清心，食凉以解暑。'",
            source: "《宋东京考》《武林旧事》《岁时杂记》"
        ),
        
        "大暑": FoodArrangement(
            solarTerm: "大暑",
            foods: [
                SeasonalFood(
                    name: "荷叶茶",
                    ingredients: [
                        ("荷叶", "50克"),
                        ("菊花", "30克"),
                        ("绿豆", "50克"),
                        ("冰糖", "30克"),
                        ("薄荷", "20克")
                    ],
                    preparation: [
                        "荷叶洗净",
                        "菊花洗净",
                        "绿豆淘洗",
                        "薄荷备用"
                    ],
                    method: [
                        "1. 荷叶菊花同煮",
                        "2. 加入绿豆",
                        "3. 煮至绿豆开花",
                        "4. 加入冰糖",
                        "5. 最后加薄荷"
                    ],
                    tips: "火候要适中，茶汤要清亮",
                    storage: "当天饮用完",
                    usage: "大暑时节饮品",
                    effect: "清热降火",
                    cultural: "大暑饮荷，为宋代文人雅事。",
                    story: Story(
                        title: "大暑茶",
                        content: "《梦粱录》载：'大暑时节，贵家皆以荷叶煮茶，清香四溢，最解暑热。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的避暑饮品"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "冰糖雪梨",
                    ingredients: [
                        ("雪梨", "4个"),
                        ("冰糖", "100克"),
                        ("桂花", "20克"),
                        ("红枣", "50克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "雪梨去核",
                        "冰糖碾碎",
                        "桂花备用",
                        "红枣洗净"
                    ],
                    method: [
                        "1. 雪梨掏空心",
                        "2. 填入冰糖",
                        "3. 放入红枣",
                        "4. 隔水炖煮",
                        "5. 撒上桂花"
                    ],
                    tips: "火候要文火，梨要新鲜",
                    storage: "冷藏可存1天",
                    usage: "大暑时节点心",
                    effect: "润肺清热",
                    cultural: "大暑食梨，为宋代养生之道。",
                    story: Story(
                        title: "大暑梨",
                        content: "《宋东京考》载：'大暑时节，市肆多售冰糖炖梨，甘甜可口，最解暑热。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的夏季饮食"
                    ), poetry:nil
                )
            ],
            custom: "大暑避暑，《岁时集》载：'大暑之日，饮荷叶茶以清心，食冰梨以解暑。'",
            source: "《梦粱录》《宋东京考》《岁时集》"
        ),
        "立秋": FoodArrangement(
            solarTerm: "立秋",
            foods: [
                SeasonalFood(
                    name: "梨花酥",
                    ingredients: [
                        ("梨", "300克"),
                        ("糯米粉", "200克"),
                        ("白糖", "100克"),
                        ("桂花", "30克"),
                        ("油", "适量")
                    ],
                    preparation: [
                        "梨去皮切丁",
                        "糯米粉过筛",
                        "桂花备用"
                    ],
                    method: [
                        "1. 梨丁拌糖腌制",
                        "2. 糯米粉调面团",
                        "3. 包入梨馅",
                        "4. 搓圆压扁",
                        "5. 油炸至金黄"
                    ],
                    tips: "面团要软韧，油温要适中",
                    storage: "密封可存3天",
                    usage: "立秋时节点心",
                    effect: "润肺生津",
                    cultural: "立秋食梨，为宋代养生之道。",
                    story: Story(
                        title: "立秋酥",
                        content: "《东京梦华录》载：'立秋时节，市肆多售梨花酥，酥皮包梨，清甜可口。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的秋季点心"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "秋菊茶饭",
                    ingredients: [
                        ("粳米", "300克"),
                        ("菊花", "50克"),
                        ("枸杞", "30克"),
                        ("盐", "适量"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "粳米淘洗",
                        "菊花洗净",
                        "枸杞洗净"
                    ],
                    method: [
                        "1. 菊花煮水",
                        "2. 用菊花水煮饭",
                        "3. 米将熟时加枸杞",
                        "4. 加盐调味",
                        "5. 焖至米熟"
                    ],
                    tips: "菊花要新鲜，火候要适中",
                    storage: "当天食用完",
                    usage: "立秋时节早餐",
                    effect: "明目清心",
                    cultural: "立秋食菊，为宋代文人雅事。",
                    story: Story(
                        title: "秋菊饭",
                        content: "《梦粱录》载：'立秋后，贵家以菊花煮饭，清香怡人，最养心神。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的饮食习俗"
                    ), poetry:nil
                )
            ],
            custom: "立秋养生，《岁时集》载：'立秋之日，食梨以润燥，饮菊以明目。'",
            source: "《东京梦华录》《梦粱录》《岁时集》"
        ),
        
        "处暑": FoodArrangement(
            solarTerm: "处暑",
            foods: [
                SeasonalFood(
                    name: "莲藕汤",
                    ingredients: [
                        ("莲藕", "300克"),
                        ("排骨", "200克"),
                        ("红枣", "50克"),
                        ("生姜", "30克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "莲藕切片",
                        "排骨焯水",
                        "红枣洗净",
                        "生姜切片"
                    ],
                    method: [
                        "1. 排骨煮汤",
                        "2. 加入莲藕",
                        "3. 放入红枣",
                        "4. 加入生姜",
                        "5. 煮至汤浓"
                    ],
                    tips: "莲藕要新鲜，火候要足",
                    storage: "冷藏一天",
                    usage: "处暑时节汤品",
                    effect: "清热润燥",
                    cultural: "处暑食藕，为宋代养生传统。",
                    story: Story(
                        title: "处暑汤",
                        content: "《宋东京考》载：'处暑时节，市井多售藕汤，清甜爽口，最解暑热。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的饮食习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "桂花糕",
                    ingredients: [
                        ("糯米粉", "300克"),
                        ("桂花", "100克"),
                        ("白糖", "150克"),
                        ("蜂蜜", "50克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "糯米粉过筛",
                        "桂花洗净",
                        "白糖备用"
                    ],
                    method: [
                        "1. 糯米粉调面",
                        "2. 加入桂花",
                        "3. 蒸制成糕",
                        "4. 切成小块",
                        "5. 刷上蜂蜜"
                    ],
                    tips: "桂花要新鲜，蒸制要透",
                    storage: "密封可存2天",
                    usage: "处暑时节点心",
                    effect: "理气和中",
                    cultural: "处暑食桂，为宋代时令美食。",
                    story: Story(
                        title: "处暑糕",
                        content: "《武林旧事》载：'处暑时节，市肆皆售桂花糕，香甜可口，雅俗共赏。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的时令点心"
                    ), poetry:nil
                )
            ],
            custom: "处暑养生，《岁时杂记》载：'处暑之日，食藕以清热，食桂以理气。'",
            source: "《宋东京考》《武林旧事》《岁时杂记》"
        ),
        
        "白露": FoodArrangement(
            solarTerm: "白露",
            foods: [
                SeasonalFood(
                    name: "蟹粥",
                    ingredients: [
                        ("粳米", "200克"),
                        ("河蟹", "2只"),
                        ("姜丝", "30克"),
                        ("葱花", "20克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "粳米淘洗",
                        "河蟹洗净",
                        "生姜切丝",
                        "葱花切碎"
                    ],
                    method: [
                        "1. 河蟹清蒸",
                        "2. 取蟹肉蟹膏",
                        "3. 粳米煮粥",
                        "4. 加入蟹肉",
                        "5. 撒上姜葱"
                    ],
                    tips: "蟹要新鲜，火候要小",
                    storage: "当天食用完",
                    usage: "白露时节早餐",
                    effect: "滋阴养胃",
                    cultural: "白露食蟹，为宋代时令佳品。",
                    story: Story(
                        title: "白露蟹",
                        content: "《东京梦华录》载：'白露时节，市肆多售蟹粥，鲜美可口，最养脾胃。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的秋季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "栗子糕",
                    ingredients: [
                        ("栗子", "300克"),
                        ("糯米粉", "200克"),
                        ("红糖", "100克"),
                        ("桂花", "30克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "栗子去壳",
                        "糯米粉过筛",
                        "桂花备用"
                    ],
                    method: [
                        "1. 栗子蒸熟",
                        "2. 捣成栗泥",
                        "3. 混入糯米粉",
                        "4. 加入红糖",
                        "5. 蒸制成糕"
                    ],
                    tips: "栗子要新鲜，火候要足",
                    storage: "密封可存2天",
                    usage: "白露时节点心",
                    effect: "健脾养胃",
                    cultural: "白露食栗，为宋代养生之道。",
                    story: Story(
                        title: "白露糕",
                        content: "《梦粱录》载：'白露后，市肆多售栗糕，香甜软糯，最宜秋食。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的秋季点心"
                    ), poetry:nil
                )
            ],
            custom: "白露养生，《岁时集》载：'白露之日，食蟹以养胃，食栗以健脾。'",
            source: "《东京梦华录》《梦粱录》《岁时集》"
        ),
        "秋分": FoodArrangement(
            solarTerm: "秋分",
            foods: [
                SeasonalFood(
                    name: "桂花酒",
                    ingredients: [
                        ("桂花", "100克"),
                        ("黄酒", "1000ml"),
                        ("冰糖", "200克"),
                        ("龙眼干", "50克"),
                        ("枸杞", "30克")
                    ],
                    preparation: [
                        "桂花洗净",
                        "龙眼干洗净",
                        "枸杞洗净",
                        "冰糖碾碎"
                    ],
                    method: [
                        "1. 桂花晾干",
                        "2. 放入坛中",
                        "3. 加入黄酒",
                        "4. 放入配料",
                        "5. 密封浸泡"
                    ],
                    tips: "桂花要新鲜，密封要严实",
                    storage: "可存半年",
                    usage: "秋分时节饮品",
                    effect: "养心安神",
                    cultural: "秋分饮桂，为宋代文人雅事。",
                    story: Story(
                        title: "秋分酒",
                        content: "《梦粱录》载：'秋分时节，贵家皆以桂花酿酒，香气醉人，最宜月下。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的秋季饮品"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "芝麻饼",
                    ingredients: [
                        ("面粉", "300克"),
                        ("芝麻", "100克"),
                        ("猪油", "50克"),
                        ("白糖", "100克"),
                        ("桂花", "30克")
                    ],
                    preparation: [
                        "面粉过筛",
                        "芝麻炒香",
                        "猪油化开",
                        "桂花备用"
                    ],
                    method: [
                        "1. 面粉加油揉面",
                        "2. 加入白糖",
                        "3. 撒入芝麻",
                        "4. 擀成薄片",
                        "5. 烤至金黄"
                    ],
                    tips: "火候要适中，芝麻要炒香",
                    storage: "密封可存7天",
                    usage: "秋分时节点心",
                    effect: "补血养颜",
                    cultural: "秋分食芝，为宋代养生之道。",
                    story: Story(
                        title: "秋分饼",
                        content: "《东京梦华录》载：'秋分时节，市肆多售芝麻饼，香酥可口，老幼皆宜。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的秋季点心"
                    ), poetry:nil
                )
            ],
            custom: "秋分养生，《岁时集》载：'秋分之日，饮桂以养心，食芝以补血。'",
            source: "《梦粱录》《东京梦华录》《岁时集》"
        ),
        
        "寒露": FoodArrangement(
            solarTerm: "寒露",
            foods: [
                SeasonalFood(
                    name: "枣糕",
                    ingredients: [
                        ("红枣", "300克"),
                        ("糯米粉", "200克"),
                        ("红糖", "100克"),
                        ("桂花", "30克"),
                        ("清水", "适量")
                    ],
                    preparation: [
                        "红枣去核",
                        "糯米粉过筛",
                        "桂花备用"
                    ],
                    method: [
                        "1. 红枣煮烂",
                        "2. 捣成枣泥",
                        "3. 糯米粉调面",
                        "4. 包入枣泥",
                        "5. 蒸制成糕"
                    ],
                    tips: "红枣要新鲜，火候要足",
                    storage: "密封可存3天",
                    usage: "寒露时节点心",
                    effect: "补血养颜",
                    cultural: "寒露食枣，为宋代养生传统。",
                    story: Story(
                        title: "寒露糕",
                        content: "《武林旧事》载：'寒露时节，市肆多售枣糕，甜香可口，最养人。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的秋季点心"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "菊花酒",
                    ingredients: [
                        ("菊花", "100克"),
                        ("黄酒", "1000ml"),
                        ("冰糖", "200克"),
                        ("枸杞", "50克"),
                        ("红枣", "50克")
                    ],
                    preparation: [
                        "菊花洗净",
                        "枸杞洗净",
                        "红枣洗净",
                        "冰糖碾碎"
                    ],
                    method: [
                        "1. 菊花晾干",
                        "2. 放入坛中",
                        "3. 加入黄酒",
                        "4. 放入配料",
                        "5. 密封浸泡"
                    ],
                    tips: "菊花要新鲜，避光存放",
                    storage: "可存半年",
                    usage: "寒露时节饮品",
                    effect: "明目清心",
                    cultural: "寒露饮菊，为宋代文人雅事。",
                    story: Story(
                        title: "寒露酒",
                        content: "《梦粱录》载：'寒露后，贵家皆以菊花酿酒，清香怡人，最宜赏月。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的秋季饮品"
                    ), poetry:nil
                )
            ],
            custom: "寒露养生，《岁时集》载：'寒露之日，食枣以养血，饮菊以明目。'",
            source: "《武林旧事》《梦粱录》《岁时集》"
        ),
        
        "霜降": FoodArrangement(
            solarTerm: "霜降",
            foods: [
                SeasonalFood(
                    name: "栗子羹",
                    ingredients: [
                        ("栗子", "300克"),
                        ("糯米粉", "100克"),
                        ("红糖", "100克"),
                        ("桂圆", "50克"),
                        ("生姜", "30克")
                    ],
                    preparation: [
                        "栗子去壳",
                        "糯米粉过筛",
                        "桂圆去核",
                        "生姜切丝"
                    ],
                    method: [
                        "1. 栗子煮烂",
                        "2. 加入糯米粉",
                        "3. 放入桂圆",
                        "4. 加入红糖",
                        "5. 煮至浓稠"
                    ],
                    tips: "火候要小，要不断搅拌",
                    storage: "当天食用完",
                    usage: "霜降时节早餐",
                    effect: "温补养胃",
                    cultural: "霜降食栗，为宋代养生之道。",
                    story: Story(
                        title: "霜降羹",
                        content: "《东京梦华录》载：'霜降时节，市肆多售栗羹，温暖可口，最宜晨食。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的秋季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "姜糖饼",
                    ingredients: [
                        ("面粉", "300克"),
                        ("生姜汁", "50克"),
                        ("红糖", "150克"),
                        ("猪油", "100克"),
                        ("桂花", "30克")
                    ],
                    preparation: [
                        "面粉过筛",
                        "生姜榨汁",
                        "红糖化开",
                        "桂花备用"
                    ],
                    method: [
                        "1. 面粉加姜汁",
                        "2. 加入红糖",
                        "3. 揉成面团",
                        "4. 擀成饼片",
                        "5. 烤至金黄"
                    ],
                    tips: "姜汁要新鲜，火候要适中",
                    storage: "密封可存5天",
                    usage: "霜降时节点心",
                    effect: "温中散寒",
                    cultural: "霜降食姜，为宋代御寒良方。",
                    story: Story(
                        title: "霜降饼",
                        content: "《宋东京考》载：'霜降后，市井多售姜糖饼，温暖香甜，最御寒气。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的秋季点心"
                    ), poetry:nil
                )
            ],
            custom: "霜降养生，《岁时集》载：'霜降之日，食栗以养胃，食姜以御寒。'",
            source: "《东京梦华录》《宋东京考》《岁时集》"
        ),
        "立冬": FoodArrangement(
            solarTerm: "立冬",
            foods: [
                SeasonalFood(
                    name: "羊肉汤",
                    ingredients: [
                        ("羊肉", "500克"),
                        ("生姜", "50克"),
                        ("葱白", "100克"),
                        ("料酒", "50ml"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "羊肉切块",
                        "生姜切片",
                        "葱白切段"
                    ],
                    method: [
                        "1. 羊肉焯水",
                        "2. 加入生姜葱白",
                        "3. 放入料酒",
                        "4. 大火煮沸",
                        "5. 小火炖煮两小时"
                    ],
                    tips: "羊肉要新鲜，火候要足",
                    storage: "冷藏可存2天",
                    usage: "立冬时节暖身汤品",
                    effect: "温补养身",
                    cultural: "立冬食羊，为宋代进补传统。",
                    story: Story(
                        title: "立冬汤",
                        content: "《东京梦华录》载：'立冬日，市肆皆煮羊汤，香气四溢，暖人心脾。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的冬季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "萝卜饼",
                    ingredients: [
                        ("白萝卜", "500克"),
                        ("面粉", "300克"),
                        ("五花肉", "100克"),
                        ("葱花", "50克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "萝卜擦丝",
                        "面粉过筛",
                        "五花肉切末",
                        "葱花切碎"
                    ],
                    method: [
                        "1. 萝卜丝挤干水分",
                        "2. 混合所有材料",
                        "3. 调成面糊",
                        "4. 摊成小饼",
                        "5. 煎至两面金黄"
                    ],
                    tips: "萝卜要新鲜，面糊要适中",
                    storage: "当天食用为佳",
                    usage: "立冬时节早餐",
                    effect: "健脾消食",
                    cultural: "立冬食萝卜，为宋代养生之道。",
                    story: Story(
                        title: "立冬饼",
                        content: "《梦粱录》载：'立冬后，市井多售萝卜饼，温暖可口，最解寒气。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的冬季小食"
                    ), poetry:nil
                )
            ],
            custom: "立冬进补，《岁时集》载：'立冬之日，食羊以暖身，食萝卜以健胃。'",
            source: "《东京梦华录》《梦粱录》《岁时集》"
        ),
        
        "小雪": FoodArrangement(
            solarTerm: "小雪",
            foods: [
                SeasonalFood(
                    name: "姜撞奶",
                    ingredients: [
                        ("水牛奶", "500ml"),
                        ("生姜汁", "30ml"),
                        ("红糖", "50克"),
                        ("桂花", "20克"),
                        ("枸杞", "20克")
                    ],
                    preparation: [
                        "水牛奶煮沸",
                        "生姜榨汁",
                        "红糖备用",
                        "桂花洗净"
                    ],
                    method: [
                        "1. 牛奶煮至微沸",
                        "2. 加入生姜汁",
                        "3. 静置凝固",
                        "4. 撒上桂花",
                        "5. 点缀枸杞"
                    ],
                    tips: "牛奶温度要适中，姜汁要新鲜",
                    storage: "现做现食",
                    usage: "小雪时节早餐或点心",
                    effect: "温胃暖身",
                    cultural: "小雪饮姜，为宋代养生之道。",
                    story: Story(
                        title: "小雪奶",
                        content: "《武林旧事》载：'小雪时节，茶肆多以姜汁点奶，香浓可口，暖人心脾。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的冬季饮品"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "栗子糯米饭",
                    ingredients: [
                        ("糯米", "300克"),
                        ("栗子", "200克"),
                        ("红枣", "100克"),
                        ("桂圆", "50克"),
                        ("盐", "适量")
                    ],
                    preparation: [
                        "糯米浸泡",
                        "栗子去壳",
                        "红枣去核",
                        "桂圆去核"
                    ],
                    method: [
                        "1. 糯米淘洗",
                        "2. 加入栗子",
                        "3. 放入红枣桂圆",
                        "4. 加盐调味",
                        "5. 蒸至米熟"
                    ],
                    tips: "火候要足，栗子要新鲜",
                    storage: "当天食用完",
                    usage: "小雪时节主食",
                    effect: "补脾养胃",
                    cultural: "小雪食栗，为宋代养生传统。",
                    story: Story(
                        title: "小雪饭",
                        content: "《东京梦华录》载：'小雪后，贵家多食栗糯饭，温补养身，最宜冬日。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的冬季饮食"
                    ), poetry:nil
                )
            ],
            custom: "小雪养生，《岁时集》载：'小雪之日，饮姜以暖胃，食栗以养脾。'",
            source: "《武林旧事》《东京梦华录》《岁时集》"
        ),
        
        "大雪": FoodArrangement(
            solarTerm: "大雪",
            foods: [
                SeasonalFood(
                    name: "羊肉煲",
                    ingredients: [
                        ("羊肉", "500克"),
                        ("萝卜", "300克"),
                        ("生姜", "50克"),
                        ("料酒", "100ml"),
                        ("八角", "2个")
                    ],
                    preparation: [
                        "羊肉切块",
                        "萝卜切块",
                        "生姜切片"
                    ],
                    method: [
                        "1. 羊肉焯水",
                        "2. 加入料酒姜片",
                        "3. 放入八角",
                        "4. 加入萝卜",
                        "5. 炖煮两小时"
                    ],
                    tips: "火候要足，汤要浓郁",
                    storage: "冷藏可存2天",
                    usage: "大雪时节暖身菜",
                    effect: "温补御寒",
                    cultural: "大雪食羊，为宋代冬令进补。",
                    story: Story(
                        title: "大雪煲",
                        content: "《梦粱录》载：'大雪时节，市肆多售羊肉煲，暖身御寒，最解寒气。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的冬季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "桂圆汤",
                    ingredients: [
                        ("桂圆", "100克"),
                        ("红枣", "50克"),
                        ("枸杞", "30克"),
                        ("红糖", "50克"),
                        ("生姜", "30克")
                    ],
                    preparation: [
                        "桂圆去核",
                        "红枣去核",
                        "枸杞洗净",
                        "生姜切片"
                    ],
                    method: [
                        "1. 桂圆红枣同煮",
                        "2. 加入生姜",
                        "3. 放入枸杞",
                        "4. 加入红糖",
                        "5. 煮至汤浓"
                    ],
                    tips: "火候要适中，味道要甜适",
                    storage: "当天饮用完",
                    usage: "大雪时节饮品",
                    effect: "养血安神",
                    cultural: "大雪饮桂，为宋代养生之道。",
                    story: Story(
                        title: "大雪汤",
                        content: "《宋东京考》载：'大雪时节，茶肆多煮桂圆汤，甜香可口，暖人心脾。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的冬季饮品"
                    ), poetry:nil
                )
            ],
            custom: "大雪进补，《岁时集》载：'大雪之日，食羊以暖身，饮桂以养心。'",
            source: "《梦粱录》《宋东京考》《岁时集》"
        ),
        "冬至": FoodArrangement(
            solarTerm: "冬至",
            foods: [
                SeasonalFood(
                    name: "冬至圆子",
                    ingredients: [
                        ("糯米粉", "500克"),
                        ("芝麻馅", "300克"),
                        ("桂花", "30克"),
                        ("红糖", "100克"),
                        ("姜丝", "30克")
                    ],
                    preparation: [
                        "糯米粉调面",
                        "芝麻馅备用",
                        "桂花洗净",
                        "姜丝备用"
                    ],
                    method: [
                        "1. 揉面搓团",
                        "2. 包入芝麻馅",
                        "3. 煮至浮起",
                        "4. 加入桂花",
                        "5. 撒上姜丝"
                    ],
                    tips: "面要柔韧，馅要香甜",
                    storage: "现煮现食",
                    usage: "冬至时节主食",
                    effect: "暖身养胃",
                    cultural: "冬至食圆，为宋代重要习俗。",
                    story: Story(
                        title: "冬至圆",
                        content: "《武林旧事》载：'冬至日，市肆皆售圆子，取其团圆之意，以应节令。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的冬至习俗"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "赤豆粥",
                    ingredients: [
                        ("赤豆", "200克"),
                        ("糯米", "100克"),
                        ("红枣", "50克"),
                        ("桂圆", "50克"),
                        ("红糖", "50克")
                    ],
                    preparation: [
                        "赤豆浸泡",
                        "糯米淘洗",
                        "红枣去核",
                        "桂圆去核"
                    ],
                    method: [
                        "1. 赤豆煮至半熟",
                        "2. 加入糯米",
                        "3. 放入红枣桂圆",
                        "4. 文火熬煮",
                        "5. 最后加红糖"
                    ],
                    tips: "火候要小，粥要绵软",
                    storage: "当天食用完",
                    usage: "冬至时节早餐",
                    effect: "温补养身",
                    cultural: "冬至食赤豆，为宋代养生传统。",
                    story: Story(
                        title: "冬至粥",
                        content: "《梦粱录》载：'冬至日，贵家必备赤豆粥，滋补养身，以应时令。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的冬至饮食"
                    ), poetry:nil
                )
            ],
            custom: "冬至养生，《岁时集》载：'冬至之日，食圆以团圆，食豆以养生。'",
            source: "《武林旧事》《梦粱录》《岁时集》"
        ),
        
        "小寒": FoodArrangement(
            solarTerm: "小寒",
            foods: [
                SeasonalFood(
                    name: "当归鸭",
                    ingredients: [
                        ("鸭子", "1只"),
                        ("当归", "30克"),
                        ("生姜", "50克"),
                        ("料酒", "100ml"),
                        ("八角", "2个")
                    ],
                    preparation: [
                        "鸭子切块",
                        "当归洗净",
                        "生姜切片"
                    ],
                    method: [
                        "1. 鸭肉焯水",
                        "2. 加入当归姜片",
                        "3. 放入料酒八角",
                        "4. 大火煮沸",
                        "5. 小火炖两小时"
                    ],
                    tips: "火候要足，汤要浓郁",
                    storage: "冷藏可存2天",
                    usage: "小寒时节暖身菜",
                    effect: "养血暖身",
                    cultural: "小寒食鸭，为宋代养生之道。",
                    story: Story(
                        title: "小寒鸭",
                        content: "《宋东京考》载：'小寒时节，市肆多售当归鸭，暖身养血，最御寒气。'",
                        source: "《宋东京考》",
                        background: "记载宋代都城的冬季饮食"
                    ), poetry: nil
                ),
                
                SeasonalFood(
                    name: "姜汤圆",
                    ingredients: [
                        ("糯米粉", "300克"),
                        ("芝麻馅", "200克"),
                        ("生姜", "50克"),
                        ("红糖", "100克"),
                        ("桂花", "30克")
                    ],
                    preparation: [
                        "糯米粉调面",
                        "芝麻馅备用",
                        "生姜切丝",
                        "桂花备用"
                    ],
                    method: [
                        "1. 揉面搓团",
                        "2. 包入芝麻馅",
                        "3. 煮至浮起",
                        "4. 煮姜汤",
                        "5. 放入汤圆"
                    ],
                    tips: "面要柔韧，馅要香甜",
                    storage: "现煮现食",
                    usage: "小寒时节点心",
                    effect: "温中暖胃",
                    cultural: "小寒食圆，为宋代冬令美食。",
                    story: Story(
                        title: "小寒圆",
                        content: "《武林旧事》载：'小寒日，市肆多售姜汤圆，温暖甜香，最解寒气。'",
                        source: "《武林旧事》",
                        background: "记载南宋临安城的冬季点心"
                    ), poetry:nil
                )
            ],
            custom: "小寒进补，《岁时集》载：'小寒之日，食鸭以养血，食圆以暖胃。'",
            source: "《宋东京考》《武林旧事》《岁时集》"
        ),
        
        "大寒": FoodArrangement(
            solarTerm: "大寒",
            foods: [
                SeasonalFood(
                    name: "羊肉火锅",
                    ingredients: [
                        ("羊肉", "500克"),
                        ("豆腐", "300克"),
                        ("白菜", "300克"),
                        ("生姜", "50克"),
                        ("葱白", "100克")
                    ],
                    preparation: [
                        "羊肉切片",
                        "豆腐切块",
                        "白菜切段",
                        "生姜葱白切片"
                    ],
                    method: [
                        "1. 准备汤底",
                        "2. 加入姜葱",
                        "3. 煮沸汤料",
                        "4. 涮煮食材",
                        "5. 蘸料食用"
                    ],
                    tips: "汤要滚烫，肉要薄片",
                    storage: "现煮现食",
                    usage: "大寒时节暖身菜",
                    effect: "温补御寒",
                    cultural: "大寒食火锅，为宋代冬令美食。",
                    story: Story(
                        title: "大寒锅",
                        content: "《东京梦华录》载：'大寒时节，市肆多设火锅，暖身御寒，宾主尽欢。'",
                        source: "《东京梦华录》",
                        background: "记载宋代都城的冬季饮食"
                    ), poetry:nil
                ),
                
                SeasonalFood(
                    name: "姜枣茶",
                    ingredients: [
                        ("生姜", "100克"),
                        ("红枣", "100克"),
                        ("红糖", "50克"),
                        ("桂圆", "50克"),
                        ("枸杞", "30克")
                    ],
                    preparation: [
                        "生姜切片",
                        "红枣去核",
                        "桂圆去核",
                        "枸杞洗净"
                    ],
                    method: [
                        "1. 姜片煮水",
                        "2. 加入红枣",
                        "3. 放入桂圆",
                        "4. 加入枸杞",
                        "5. 最后加红糖"
                    ],
                    tips: "火候要足，味道要浓",
                    storage: "当天饮用完",
                    usage: "大寒时节饮品",
                    effect: "暖身驱寒",
                    cultural: "大寒饮姜，为宋代养生传统。",
                    story: Story(
                        title: "大寒茶",
                        content: "《梦粱录》载：'大寒时节，贵家皆饮姜枣茶，暖身御寒，最解寒气。'",
                        source: "《梦粱录》",
                        background: "记载南宋临安城的冬季饮品"
                    ), poetry:nil
                )
            ],
            custom: "大寒养生，《岁时集》载：'大寒之日，食羊以暖身，饮姜以御寒。'",
            source: "《东京梦华录》《梦粱录》《岁时集》"
        )
    ]
    
    public func getSeasonalFood(for solarTerm: String) -> FoodArrangement? {
        return seasonalFoodCalendar[solarTerm]
    }
}
