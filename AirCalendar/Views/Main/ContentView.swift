import SwiftUI

struct ContentView: View {
    @State private var currentDate = Date()
    @State private var scrollPosition: String?
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    // 使用相对日期范围：前7天到后7天
                    ForEach(-365...365, id: \.self) { offset in
                        if let date = Calendar.current.date(byAdding: .day, value: offset, to: Date()) {
                            DayView(dayItem: DayItem(date: date))
                                .frame(height: UIScreen.main.bounds.height)
                                .id(dateToString(date)) // 用于跟踪滚动位置
                        }
                    }
                }
            }
            .scrollPosition(id: $scrollPosition)
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .scrollContentBackground(.hidden)
            .contentMargins(0)
            .onAppear {
                // 初始定位到今天
                scrollPosition = dateToString(Date())
            }
        }
    
    private func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
} 
