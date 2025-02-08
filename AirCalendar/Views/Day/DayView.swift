import SwiftUI

public struct DayView: View {
    let dayItem: DayItem
    @StateObject private var audioManager = AudioManager.shared
    @State private var isPlaying = false
    
    public init(dayItem: DayItem) {
        self.dayItem = dayItem
    }
    
    // 为每个 Cell 随机分配一个声音
    private var randomSound: (key: String, name: String) {
        let sounds = Array(audioManager.natureSounds)
        let randomIndex = abs(dayItem.date.hashValue) % sounds.count
        let sound = sounds[randomIndex]
        return (key: sound.key, name: sound.value)
    }
    
    private var poetryQuote: PoetryQuote {
        PoetryManager.shared.randomQuote(for: dayItem.date)
    }
    
    private var dailyQuote: DailyQuote {
        DailyQuoteManager.shared.quoteForDate(dayItem.date)
    }
    
    private func toggleSound() {
        if audioManager.isPlaying && audioManager.currentSoundKey != randomSound.key {
            audioManager.stop()
        }
        audioManager.togglePlay(name: randomSound.key)
    }
    
    public var body: some View {
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
                    
                    // 替换原来的固定文案
                    VStack(alignment: .leading, spacing: 4) {
                        Text(dailyQuote.content)
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        if let author = poetryQuote.author {
                            HStack {
                                Spacer()
                                Text("—— \(author)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                if let title = poetryQuote.title {
                                    Text("《\(title)》")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, 20)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
                
                // 在底部文字下方添加音频控制区域
                Button(action: toggleSound) {
                    HStack {
                        Image(systemName: audioManager.isPlaying && audioManager.currentSoundKey == randomSound.key 
                              ? "speaker.wave.2.fill" 
                              : "speaker.wave.2")
                        Text(randomSound.name)
                    }
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
            .padding(.horizontal, 16)
            .frame(height: UIScreen.main.bounds.height)
            .onAppear {
                // 页面出现时，如果有其他音频在播放，先停止
                if audioManager.isPlaying && audioManager.currentSoundKey != randomSound.key {
                    audioManager.stop()
                }
                // 自动开始播放当前页面的音频
                if !audioManager.isPlaying {
                    audioManager.playSound(name: randomSound.key)
                }
            }
            .onDisappear {
                // 当视图消失时停止音频
                if audioManager.currentSoundKey == randomSound.key {
                    audioManager.stop()
                }
            }
        }
    }

