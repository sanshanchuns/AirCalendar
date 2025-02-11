import Foundation

public class DayItem: ObservableObject {
    public let date: Date
    public var day: Int {
        Calendar.current.component(.day, from: date)
    }
    
    @Published public var imageUrl: String = ""
    @Published private(set) var dailyContent: DailyContent = DailyContent()
    
    public struct DailyContent {
        var festival: String?
        var solarTerm: String?
        var quote: String?
        var author: String?
        var title: String?
        var randomSound: String?
    }
    
    public init(date: Date) {
        self.date = date
        setupImageUrl()
        setupDailyContent()
    }
    
    private func setupDailyContent() {
        let poetry = PoetryManager.shared.randomQuote(for: date)
        let sound = AudioManager.shared.randomSound(date: date)
        dailyContent = DailyContent(
            festival: LunarCalendar.getFestival(for: date),
            solarTerm: LunarCalendar.getSolarTerm(for: date),
            quote: poetry.quote,
            author: poetry.author,
            title: poetry.title,
            randomSound: sound
        )
    }
    
    private func setupImageUrl() {
        // 先检查本地缓存
        if let localUrl = getLocalImageUrl(),
           FileManager.default.fileExists(atPath: localUrl.path) {
            imageUrl = localUrl.absoluteString
        } else {
            // 如果本地没有，使用远程 URL
            let seed = generateSeed()
            imageUrl = "https://picsum.photos/seed/\(seed)/400/300"
            // 开始下载并缓存
            downloadAndCacheImage()
        }
    }
    
    private func generateSeed() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    
    private func getLocalImageUrl() -> URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, 
                                                      in: .userDomainMask).first else {
            return nil
        }
        let fileName = "image_\(generateSeed()).jpg"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    private func downloadAndCacheImage() {
        guard let remoteUrl = URL(string: imageUrl),
              let localUrl = getLocalImageUrl() else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: remoteUrl)
                try data.write(to: localUrl)
                // 下载完成后更新 URL 为本地路径
                DispatchQueue.main.async {
                    self.imageUrl = localUrl.absoluteString
                }
            } catch {
                print("图片下载或保存失败: \(error)")
            }
        }
    }
    
    // 清理过期缓存
    public static func cleanOldCache() {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, 
                                                      in: .userDomainMask).first else { return }
        
        do {
            let files = try fileManager.contentsOfDirectory(at: documentsDirectory,
                                                          includingPropertiesForKeys: nil)
            let imageFiles = files.filter { $0.lastPathComponent.hasPrefix("image_") }
            
            // 可以根据需要设置清理规则，比如只保留最近一个月的图片
            let calendar = Calendar.current
            let oneMonthAgo = calendar.date(byAdding: .month, value: -1, to: Date())!
            
            for file in imageFiles {
                let fileName = file.lastPathComponent
                let dateString = fileName.replacingOccurrences(of: "image_", with: "")
                                      .replacingOccurrences(of: ".jpg", with: "")
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMdd"
                if let fileDate = formatter.date(from: dateString),
                   fileDate < oneMonthAgo {
                    try? fileManager.removeItem(at: file)
                }
            }
        } catch {
            print("清理缓存失败: \(error)")
        }
    }
    
    public var month: Int {
        Calendar.current.component(.month, from: date)
    }
    
    public var lunarDate: String {
        let lunar = LunarCalendar.getLunarDate(from: date)
        var result = "\(lunar.monthStr)\(lunar.dayStr)"
        if lunar.isLeapMonth {
            result = "闰" + result
        }
        return result
    }
    
    public var yearMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM"
        return formatter.string(from: date)
    }
    
    public var weekday: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        let weekdayNumber = Calendar.current.component(.weekday, from: date)
        let weekdaySymbols = ["日", "一", "二", "三", "四", "五", "六"]
        return "星期" + weekdaySymbols[weekdayNumber - 1]
    }
    
    public var festival: String? {
        let lunar = LunarCalendar.getLunarDate(from: date)
        
        if let lunarFestival = LunarCalendar.getLunarFestival(month: lunar.month, day: lunar.day) {
            return lunarFestival
        }
        
        return LunarCalendar.getSolarFestival(month: month, day: day)
    }
    
    public var solarTerm: String? {
        SolarTerms.getTerm(for: date)
    }
} 
