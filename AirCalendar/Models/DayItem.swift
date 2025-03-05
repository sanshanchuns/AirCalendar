import Foundation

public class DayItem: ObservableObject {
    public let date: Date
    public var day: Int {
        Calendar.current.component(.day, from: date)
    }
    
    @Published public var imageUrl: String = ""
    @Published private(set) var dailyContent: DailyContent = DailyContent()
    
    public struct DailyContent {
        var monthDay: String?
        var weekDay: String?
        var festival: String?
        var randomSound: String?
        var solarTerm: String?
        var periodRank: String?
        var periodOrdinal: String?
        var periodPhenomenon: String?
        var periodAnalysis: String?
        var periodStoryLine: String?
    }
    
    public init(date: Date) {
        self.date = date
        setupImageUrl(date)
        setupDailyContent()
    }
    
    private func setupImageUrl(_ :Date) {
        let seed = generateSeed()
        self.imageUrl = "https://picsum.photos/seed/\(seed)/400/300"
    }
    
    private func generateSeed() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    
    private func setupDailyContent() {
        let sound = AudioManager.shared.randomSound(date: date)
        let festival = CalendarManager.getFestival(for: date)
        let period = CalendarManager.getSolarTermPeriod(for: date)
        let monthDay = CalendarManager.getMonthDay(from: date)
        let weekDay = CalendarManager.getWeekday(from: date)
        
        dailyContent = DailyContent(
            monthDay: monthDay,
            weekDay: weekDay,
            festival: festival,
            randomSound: sound,
            solarTerm: period?.termName,
            periodRank: period?.rank,
            periodOrdinal: period?.ordinal,
            periodPhenomenon: period?.phenomenon,
            periodAnalysis: period?.analysis,
            periodStoryLine: period?.storyLine
        )
    }
} 
