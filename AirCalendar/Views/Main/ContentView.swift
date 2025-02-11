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

private struct LegacyView: View {
    @Binding var currentDate: Date
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(-365...365, id: \.self) { offset in
                            if let date = Calendar.current.date(byAdding: .day, value: offset, to: Date()) {
                                DayView(dayItem: DayItem(date: date))
                                    .frame(height: geometry.size.height)
                                    .id(date)
                                    .overlay(
                                        GeometryReader { proxy in
                                            Color.clear
                                                .preference(
                                                    key: OffsetPreferenceKey.self,
                                                    value: proxy.frame(in: .named("scroll")).minY
                                                )
                                        }
                                    )
                            }
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                    self.offset = offset
                    if !isDragging {
                        snapToPage(proxy: proxy, geometry: geometry)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { _ in
                            isDragging = true
                        }
                        .onEnded { value in
                            isDragging = false
                            let velocity = value.predictedEndLocation.y - value.location.y
                            snapToPage(proxy: proxy, geometry: geometry, velocity: velocity)
                        }
                )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func snapToPage(proxy: ScrollViewProxy, geometry: GeometryProxy, velocity: CGFloat = 0) {
        let pageHeight = geometry.size.height
        let currentPage = round(abs(offset) / pageHeight)
        var targetPage = currentPage
        
        // 处理快速滑动
        if abs(velocity) > 200 {
            targetPage += velocity > 0 ? -1 : 1
        }
        
        // 确保页面在有效范围内
        targetPage = max(0, min(targetPage, 730)) // 365*2
        
        // 计算目标日期
        if let targetDate = Calendar.current.date(byAdding: .day, 
                                                value: Int(targetPage) - 365, 
                                                to: Date()) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                proxy.scrollTo(targetDate, anchor: .top)
                currentDate = targetDate
            }
        }
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//#Preview {
//    ContentView()
//} 
