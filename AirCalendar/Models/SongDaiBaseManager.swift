import Foundation

// 创建一个基础协议，所有Manager都需要遵循
public protocol SongDaiBaseManager {
    associatedtype ArrangementType
    var calendar: [String: ArrangementType] { get }
    func getArrangement(for solarTerm: String) -> ArrangementType?
    func getInfos(_ date: Date) -> [String]
}

public extension SongDaiBaseManager {
    func getArrangement(for date: Date) -> ArrangementType? {
        guard let solarTerm = LunarCalendar.getSolarTerm(for: date) else {
            return nil
        }
        return getArrangement(for: solarTerm)
    }
}
