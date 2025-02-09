struct Poetry {
    let title: String
    let author: String
    let content: String
    let background: String
}

struct Story {
    let title: String
    let content: String
    let source: String
    let background: String
}

struct Incense {
    let name: String
    let ingredients: [(name: String, amount: String)]  // 添加具体用量
    let preparation: [String]  // 材料准备步骤
    let method: [String]  // 详细制作步骤
    let dryingMethod: String  // 晾干方法
    let storage: String   // 储存方法
    let usage: String
    let effect: String
    let poetry: Poetry?
}

struct IncenseArrangement {
    let solarTerm: String
    let incenses: [Incense]
    let custom: String
    let source: String
}

struct SeasonalFood {
    let name: String
    let ingredients: [(name: String, amount: String)]
    let preparation: [String]
    let method: [String]
    let tips: String
    let storage: String
    let usage: String
    let effect: String
    let cultural: String
    let story: Story
    let poetry: Poetry?
}

struct FoodArrangement {
    let solarTerm: String
    let foods: [SeasonalFood]
    let custom: String
    let source: String
} 
