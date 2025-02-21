import Foundation

// ... existing code ... 

public extension SongDaiBaseManager {
    func getArrangement(for date: Date) -> ArrangementType? {
        // ... existing code ...
        guard let solarTerm = SolarTerms().getSolarTerm(for: date) else {
            return nil
        }
        // ... existing code ...
    }
} 