import SwiftUI

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
        let calendar = Calendar.current
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
                     //刷新第一个Cell
                     collectionView.performBatchUpdates {
                         collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
                     }
                 }
             }
         }
      
        // MARK: - UICollectionViewDelegate
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            // 首次布局完成后，滚动到今天
            if !initialScrollDone && indexPath.item == initialIndex {
                initialScrollDone = true
                collectionView.setContentOffset(CGPoint(x: 0, y: collectionView.bounds.height+1), animated: false)
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
        let dayView = DayView(dayItem: DayItem(date: Date()))
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
                            audioManager.togglePlay(name: sound)
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: audioManager.isPlaying && audioManager.currentSound == sound
                                      ? "speaker.wave.2.fill"
                                      : "speaker.wave.2")
                                    .foregroundColor(.gray)
                                Text(sound)
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
            if audioManager.isPlaying && audioManager.currentSound != randomSound {
                audioManager.stop()
            }
            // 自动开始播放当前页面的音频
            if !audioManager.isPlaying {
                audioManager.playSound(name: randomSound)
            }
        }
        .onDisappear {
            // 当视图消失时停止音频
            if audioManager.currentSound == randomSound {
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

