//
//  ContentView.swift
//  AirCalendar
//
//  Created by leo on 2025/2/8.
//

import SwiftUI
import Combine
import AVFoundation

// 图片缓存管理器
class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}

// 图片加载器
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    private let key: String
    
    init(url: String) {
        self.key = url
        
        // 检查缓存
        if let cachedImage = ImageCache.shared.get(forKey: url) {
            self.image = cachedImage
            return
        }
        
        // 加载图片
        guard let imageURL = URL(string: url) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                if let image = image {
                    ImageCache.shared.set(image, forKey: url)
                }
                self?.image = image
            }
    }
}

// 优化后的图片视图组件
struct CachedAsyncImage: View {
    let url: String
    @State private var opacity: Double = 0
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.8)) {
                            opacity = 1.0
                        }
                    }
            case .failure(_):
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            @unknown default:
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
            }
        }
    }
}

// 农历日期工具
struct LunarCalendar {
    static func getLunarDate(from date: Date) -> (month: Int, day: Int, monthStr: String, dayStr: String, isLeapMonth: Bool) {
        let calendar = Calendar(identifier: .chinese)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let month = components.month ?? 1
        let day = components.day ?? 1
        let isLeapMonth = calendar.dateComponents([.yearForWeekOfYear], from: date).isLeapMonth ?? false
        
        // 农历月份
        let lunarMonths = [
            "正月", "二月", "三月", "四月", "五月", "六月",
            "七月", "八月", "九月", "十月", "冬月", "腊月"
        ]
        
        // 农历日期
        let lunarDays = [
            "初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
            "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
            "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"
        ]
        
        let monthStr = lunarMonths[month - 1]
        let dayStr = lunarDays[day - 1]
        
        return (month, day, monthStr, dayStr, isLeapMonth)
    }
    
    // 获取农历节日
    static func getLunarFestival(month: Int, day: Int) -> String? {
        let festivals: [(month: Int, day: Int, name: String)] = [
            (1, 1, "春节"),
            (1, 15, "元宵节"),
            (5, 5, "端午节"),
            (7, 7, "七夕节"),
            (8, 15, "中秋节"),
            (9, 9, "重阳节"),
            (12, 8, "腊八节"),
            // 可以添加更多农历节日
        ]
        
        return festivals.first { $0.month == month && $0.day == day }?.name
    }
    
    // 获取公历节日
    static func getSolarFestival(month: Int, day: Int) -> String? {
        let festivals: [String: (Int, Int)] = [
            "元旦": (1, 1),
            "情人节": (2, 14),
            "妇女节": (3, 8),
            "植树节": (3, 12),
            "劳动节": (5, 1),
            "儿童节": (6, 1),
            "国庆节": (10, 1),
            "圣诞节": (12, 25)
        ]
        
        return festivals.first(where: { $0.value == (month, day) })?.key
    }
}

// 添加节气工具
struct SolarTerms {
    // 二十四节气
    static let terms = [
        "小寒", "大寒", "立春", "雨水", "惊蛰", "春分",
        "清明", "谷雨", "立夏", "小满", "芒种", "夏至",
        "小暑", "大暑", "立秋", "处暑", "白露", "秋分",
        "寒露", "霜降", "立冬", "小雪", "大雪", "冬至"
    ]
    
    // 2024年节气日期（实际应用中应该使用算法计算或API获取）
    static let solarTermDates2024: [(month: Int, day: Int, term: String)] = [
        (1, 6, "小寒"), (1, 20, "大寒"), (2, 4, "立春"),
        (2, 19, "雨水"), (3, 5, "惊蛰"), (3, 20, "春分"),
        (4, 4, "清明"), (4, 20, "谷雨"), (5, 5, "立夏"),
        (5, 21, "小满"), (6, 6, "芒种"), (6, 21, "夏至"),
        (7, 7, "小暑"), (7, 23, "大暑"), (8, 7, "立秋"),
        (8, 23, "处暑"), (9, 7, "白露"), (9, 23, "秋分"),
        (10, 8, "寒露"), (10, 23, "霜降"), (11, 7, "立冬"),
        (11, 22, "小雪"), (12, 7, "大雪"), (12, 22, "冬至")
    ]
    
    static func getTerm(for date: Date) -> String? {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        return solarTermDates2024.first { $0.month == month && $0.day == day }?.term
    }
}

// 日期数据模型
struct DayItem: Identifiable {
    let id = UUID()
    let date: Date
    
    var day: Int {
        Calendar.current.component(.day, from: date)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: date)
    }
    
    var lunarDate: String {
        let lunar = LunarCalendar.getLunarDate(from: date)
        var result = "\(lunar.monthStr)\(lunar.dayStr)"
        if lunar.isLeapMonth {
            result = "闰" + result
        }
        return result
    }
    
    var festival: String? {
        let lunar = LunarCalendar.getLunarDate(from: date)
        
        // 先检查农历节日
        if let lunarFestival = LunarCalendar.getLunarFestival(month: lunar.month, day: lunar.day) {
            return lunarFestival
        }
        
        // 再检查公历节日
        return LunarCalendar.getSolarFestival(month: month, day: day)
    }
    
    var yearMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM"
        return formatter.string(from: date)
    }
    
    var weekday: String {
        let weekdays = ["日", "一", "二", "三", "四", "五", "六"]
        let component = Calendar.current.component(.weekday, from: date)
        return weekdays[component - 1]
    }
    
    var solarTerm: String? {
        SolarTerms.getTerm(for: date)
    }
}

// 音频播放管理器
class AudioManager: ObservableObject {
    static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?
    
    // 自然声音列表
    let natureSounds = [
        "rain": "下雨声",
        "wave": "海浪声",
        "wind": "微风声",
        "birds": "鸟鸣声",
        "creek": "溪流声",
        "forest": "森林声",
        "fire": "篝火声",
        "thunder": "雷声"
    ]
    
    func play(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3") else {
            print("找不到音频文件: \(sound)")
            return
        }
        
        do {
            audioPlayer?.stop()
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // 循环播放
            audioPlayer?.volume = 0.5
            audioPlayer?.play()
        } catch {
            print("播放失败: \(error.localizedDescription)")
        }
    }
    
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

struct ContentView: View {
    // 存储当前显示的日期
    @State private var currentDate = Date()
    // 用于跟踪滚动位置
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
    
    // 将日期转换为字符串ID
    private func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

// 单日视图组件
struct DayView: View {
    let dayItem: DayItem
    @StateObject private var audioManager = AudioManager.shared
    @State private var isPlaying = false
    
    // 为每个 Cell 随机分配一个声音
    private var randomSound: (key: String, name: String) {
        let sounds = Array(audioManager.natureSounds)
        let index = abs(dayItem.day.hashValue) % sounds.count
        return sounds[index]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 12) {
                // 日期头部区域
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top) {
                        // 日期数字
                        Text(String(format: "%02d", dayItem.day))
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.primary)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            // 农历日期和节日
                            HStack(spacing: 8) {
                                Text(dayItem.lunarDate)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                // 节日标记
                                if let festival = dayItem.festival {
                                    Text(festival)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.red)
                                                .shadow(color: .red.opacity(0.3), radius: 2, x: 0, y: 1)
                                        )
                                }
                                
                                // 节气标记
                                if let term = dayItem.solarTerm {
                                    Text(term)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.green)
                                                .shadow(color: .green.opacity(0.3), radius: 2, x: 0, y: 1)
                                        )
                                }
                            }
                            
                            // 公历年月和星期
                            HStack(spacing: 8) {
                                Text(dayItem.yearMonth)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text("星期\(dayItem.weekday)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            // 今天标记
                            if Calendar.current.isDateInToday(dayItem.date) {
                                Text("今天")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.blue.opacity(0.1))
                                            .shadow(color: .blue.opacity(0.1), radius: 2, x: 0, y: 1)
                                    )
                            }
                        }
                        .padding(.leading, 12)
                        
                        Spacer()
                    }
                }
                .padding(.top, 16)
                
                // 图片区域 - 修复语法错误
                GeometryReader { geometry in
                    CachedAsyncImage(url: "https://picsum.photos/400/300?random=\(dayItem.day)")
                        .frame(width: geometry.size.width, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                }
                .frame(height: 300)
                
                // 底部文字
                Text("等风来不如追风去，追逐的过程就是意义")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 16)
            }
            .padding(.horizontal, 20)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
            
            // 在底部文字下方添加音频控制区域
            HStack {
                Image(systemName: isPlaying ? "speaker.wave.2.fill" : "speaker.wave.2")
                    .foregroundColor(isPlaying ? .blue : .gray)
                
                Text(randomSound.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    if isPlaying {
                        audioManager.stop()
                    } else {
                        audioManager.play(sound: randomSound.key)
                    }
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.title2)
                        .foregroundColor(isPlaying ? .blue : .gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 16)
        .frame(height: UIScreen.main.bounds.height)
        .onDisappear {
            // 当 Cell 消失时停止播放
            if isPlaying {
                audioManager.stop()
                isPlaying = false
            }
        }
    }
}

#Preview {
    ContentView()
}
