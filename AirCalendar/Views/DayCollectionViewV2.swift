//
//  DayCollectionViewV2.swift
//  AirCalendar
//
//  Created by leo on 2025/3/3.
//

import SwiftUI
import AVKit

struct DayCollectionView: UIViewRepresentable {
    @Binding var selectedDate: Date?
    @Binding var showingDetail: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(DayCollectionViewCell.self,
                              forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        
        context.coordinator.collectionView = collectionView
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {}
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        let parent: DayCollectionView
        var calendar = Calendar.current
        var loadedDates: [Date] = []
        var initialIndex: Int = 0
        var initialScrollDone = false
        weak var collectionView: UICollectionView?
        
        init(parent: DayCollectionView) {
            self.parent = parent
            let today = Date()
            let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
            self.loadedDates = [yesterday, today, tomorrow]
            super.init()
            
            // 打印所有可用字体名称
//            for family in UIFont.familyNames.sorted() {
//                print("Family: \(family)")
//                for name in UIFont.fontNames(forFamilyName: family) {
//                    print("   Font: \(name)")
//                }
//            }
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return loadedDates.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DayCollectionViewCell.reuseIdentifier,
                for: indexPath) as? DayCollectionViewCell else {
                fatalError("Unable to dequeue DayCollectionViewCell")
            }
            
            let date = loadedDates[indexPath.row]
            cell.configure(with: date, onTap: { [weak self] in
                // 确保在主线程更新 UI 状态
                DispatchQueue.main.async {
                    self?.parent.selectedDate = date
                    self?.parent.showingDetail = true
                }
            })
            
            return cell
        }
        
         // MARK: - UIScrollViewDelegate
         func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
             guard let collectionView = scrollView as? UICollectionView else { return }
             let page = Int(scrollView.contentOffset.y / scrollView.bounds.height)
            
             if page == loadedDates.count - 1 {
                 if let lastDate = loadedDates.last,
                    let nextDate = calendar.date(byAdding: .day, value: 1, to: lastDate) {
                     loadedDates.append(nextDate)
                     //刷新最后一个Cell
                     collectionView.performBatchUpdates {
                         collectionView.insertItems(at: [IndexPath(item: loadedDates.count - 1, section: 0)])
                     }
                 }
             } else if page == 0 {
                 if let firstDate = loadedDates.first,
                    let previousDate = calendar.date(byAdding: .day, value: -1, to: firstDate) {
                     loadedDates.insert(previousDate, at: 0)
                     UIView.performWithoutAnimation {
                         collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
                     }
                     collectionView.setContentOffset(CGPoint(x: 0, y: collectionView.bounds.height), animated: false)
                 }
             }
         }
      
        // MARK: - UICollectionViewDelegate
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            // 首次布局完成后，滚动到今天
            if !initialScrollDone && indexPath.item == initialIndex {
                initialScrollDone = true
                collectionView.setContentOffset(CGPoint(x: 0, y: UIScreen.main.bounds.size.height + 1), animated: false)
            }
        }
        
    }
}

class DayCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "DayCell"
    private var hostingController: UIHostingController<DayView>?
    private var dayItem: DayItem?
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTapGesture()
        setupHostingController()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTapGesture()
        setupHostingController()
    }
    
    private func setupHostingController() {
        let today = Date()
        let dayView = DayView(dayItem: DayItem(date: today))
        let hosting = UIHostingController(rootView: dayView)
        hostingController = hosting
        hosting.view.frame = contentView.bounds
        hosting.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(hosting.view)
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        onTap?()
    }
    
    func configure(with date: Date, onTap: @escaping () -> Void) {
        self.onTap = onTap
        
        // 如果 dayItem 已存在且日期相同，则不需要更新
        if let existingDayItem = dayItem, Calendar.current.isDate(existingDayItem.date, inSameDayAs: date) {
            return
        }
        
        // 只更新 dayItem 的内容
        let newDayItem = DayItem(date: date)
        self.dayItem = newDayItem
        
        // 更新 hostingController 的 rootView
        if let hostingController = hostingController {
            hostingController.rootView.updateDayItem(newDayItem)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 清理不再需要的数据
        onTap = nil
    }
}

public struct DayView: View {
    @ObservedObject var dayItem: DayItem
    @StateObject private var audioManager = AudioManager.shared
    
    public init(dayItem: DayItem) {
        self.dayItem = dayItem
    }
    
    // 为每个 Cell 随机分配一个声音
    private var randomSound: String {
        return audioManager.randomSound(date: dayItem.date)
    }
    
    private var poetryQuote: PoetryQuote {
        PoetryManager.shared.randomQuote(for: dayItem.date)
    }
    
    private func toggleSound() {
        if audioManager.isPlaying && audioManager.currentSound != randomSound {
            audioManager.stop()
        }
        audioManager.togglePlay(name: randomSound)
    }
    
    mutating func updateDayItem(_ newDayItem: DayItem) {
        self.dayItem = newDayItem
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                // 左侧大字
                HStack(alignment: .top) {
                    VStack {
                        if let stamp = dayItem.dailyContent.solarTerm {
                            Text(stamp.map { String($0) }.joined(separator: "\n"))
                                .font(.custom("SSCYZ-2021", size: 20, relativeTo: .body))
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 1)
                        }
                        if let periodRank = dayItem.dailyContent.periodRank {
                            Text(periodRank.map { String($0) }.joined(separator: "\n"))
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                    HStack(alignment: .bottom) {
                        if let periodPhenomenon =
                            dayItem.dailyContent.periodPhenomenon {
                            Text(periodPhenomenon.map { String($0) }.joined(separator: "\n"))
                                .font(.custom("CHAO-ShadowGBT-Flash", size: 90, relativeTo: .body))
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        if let periodOrdinal =
                            dayItem.dailyContent.periodOrdinal {
                            Text(periodOrdinal)
                                .font(.custom("SSCYZ-2021", size: 20))
                                .foregroundColor(.red)
                        }
                    }
                }
                Spacer()
                
                // 右侧日期信息
                VStack(alignment: .trailing, spacing: 4) {
                    Spacer()
                    Text(dayItem.dailyContent.monthDay!)
                        .font(.system(size: 16))
                        .bold()
                    Text(dayItem.dailyContent.weekDay!)
                        .font(.system(size: 14))
                    // 标记部分
                    if Calendar.current.isDateInToday(dayItem.date) {
                        TagView(text: "今天", color: .blue)
                    }
                    if let festival = dayItem.dailyContent.festival {
                        TagView(text: festival, color: .red)
                    }
                }
            }
            .padding(EdgeInsets(top: 80, leading: 40, bottom: 20, trailing: 40))
            
            // 底部文字部分
            HStack() {
                
                VStack(alignment: .leading, spacing: 10) {
                    if let desc = dayItem.dailyContent.periodAnalysis {
                        Text(desc)
                            .font(.system(size: 12))
                            .foregroundStyle(Color.gray)
                    }
                    if let quote = dayItem.dailyContent.periodStoryLine {
                        Text(quote)
                            .font(.system(size: 14))
                            .bold()
                    }
                    Spacer()
                }
//                .border(.black)
                .padding(.horizontal, 20)
                Spacer()
            }
            
            let screenWidth = UIScreen.main.bounds.width
//                let screenHeight = UIScreen.main.bounds.height
            
            if let number =
                dayItem.dailyContent.periodNumber {
                Image(number)
                    .resizable()  // 使图片可以调整大小
                    .scaledToFit()  // 保持宽高比例适应框架
                    .frame(width: screenWidth, height: screenWidth*111/269)
            }
            
            HStack {
                if let sound = dayItem.dailyContent.randomSound {
                    Button(action: {
                        audioManager.togglePlay(name: sound)
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: audioManager.isPlaying && audioManager.currentSound == sound
                                  ? "speaker.wave.2.fill"
                                  : "speaker.wave.2")
                                .foregroundColor(.gray)
                                .environmentObject(audioManager)
                            Text(sound)
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 0))
//                        .border(.black)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                await MainActor.run {
                    // 页面出现时，如果有其他音频在播放，先停止
                    if audioManager.isPlaying && audioManager.currentSound != randomSound {
                        audioManager.stop()
                    }
                }
                
                // 自动开始播放当前页面的音频
                await MainActor.run {
                    if !audioManager.isPlaying {
                        audioManager.playSound(name: randomSound)
                    }
                }
            }
        }
//        .onDisappear {
//            Task {
//                await MainActor.run {
//                    // 当视图消失时停止音频
//                    if audioManager.currentSound == randomSound {
//                        audioManager.stop()
//                    }
//                }
//            }
//        }
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
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(color.opacity(0.1))
            .cornerRadius(4)
    }
}


#Preview {
    DayView(dayItem: DayItem(date: Date()))
}
