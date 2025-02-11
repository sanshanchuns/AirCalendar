import SwiftUI

public struct DayView: View {
    @ObservedObject var dayItem: DayItem
    @StateObject private var audioManager = AudioManager.shared
    
    public init(dayItem: DayItem) {
        self.dayItem = dayItem
    }
    
    // 为每个 Cell 随机分配一个声音
    private var randomSound: String {
        return audioManager.randomSound(date: date)
    }
    
    private var poetryQuote: PoetryQuote {
        PoetryManager.shared.randomQuote(for: dayItem.date)
    }
    
    private func toggleSound() {
        if audioManager.isPlaying && audioManager.currentSoundName != randomSound.name {
            audioManager.stop()
        }
        audioManager.togglePlay(name: randomSound.key)
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Spacer()
                // 日期部分拆分为两个部分
                HStack {
                    // 左侧大数字
                    Text("\(String(format: "%02d", dayItem.day))")
                        .font(.system(size: 80, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    // 右侧日期信息
                    VStack(alignment: .trailing, spacing: 4) {
                        Text(dayItem.lunarDate)
                            .font(.system(size: 20, weight: .medium))
                        
                        HStack(spacing: 8) {
                            Text(dayItem.yearMonth)
                                .font(.system(size: 16))
                            Text(dayItem.weekday)
                                .font(.system(size: 16))
                        }
                        .foregroundColor(.gray)

                        // 标记部分
                        if Calendar.current.isDateInToday(dayItem.date) {
                            TagView(text: "今天", color: .blue)
                        }
                        if let festival = dayItem.dailyContent.festival {
                            TagView(text: festival, color: .red)
                        }
                        if let solarTerm = dayItem.dailyContent.solarTerm {
                            TagView(text: solarTerm, color: .green)
                        }
                    }
                    .padding(.trailing, 20)
                }
                // 图片部分
                CachedAsyncImage(url: dayItem.imageUrl)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                
                // 底部文字部分
                VStack(spacing: 4) {
                    if let quote = dayItem.dailyContent.quote,
                        let author = dayItem.dailyContent.author,
                        let title = dayItem.dailyContent.title {
                        VStack(spacing: 10) {
                            Text(quote)
                                .font(.system(size: 18))
                            
                            HStack {
                                Spacer()
                                Text("—— \(author)《\(title)》")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                    }
                    
                    if let sound = dayItem.dailyContent.randomSound {
                        Button(action: {
                            audioManager.togglePlay(name: sound.key)
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: audioManager.isPlaying && audioManager.currentSoundName == sound.name
                                      ? "speaker.wave.2.fill"
                                      : "speaker.wave.2")
                                    .foregroundColor(.gray)
                                Text(sound.name)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                                Spacer()
                            }
                            .padding(.top, 8)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)

                Spacer()
            }
            .frame(minHeight: UIScreen.main.bounds.height)
        }
        .onAppear {
            // 页面出现时，如果有其他音频在播放，先停止
            if audioManager.isPlaying && audioManager.currentSoundName != randomSound.name {
                audioManager.stop()
            }
            // 自动开始播放当前页面的音频
            if !audioManager.isPlaying {
                audioManager.playSound(name: randomSound.name)
            }
        }
        .onDisappear {
            // 当视图消失时停止音频
            if audioManager.currentSoundName == randomSound.name {
                audioManager.stop()
            }
        }
    }
}

// 标签视图组件
struct TagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .foregroundColor(color)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(color.opacity(0.1))
            .cornerRadius(4)
    }
}

