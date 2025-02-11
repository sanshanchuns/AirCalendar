import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date? = nil
    @State private var showingDetail = false
    
    var body: some View {
        NavigationStack {
            LazyDateView()
                .ignoresSafeArea()
                .navigationDestination(isPresented: $showingDetail) {
                    if let date = selectedDate {
                        DetailView(date: date, isPresented: $showingDetail)
                    }
                }
        }
    }
}

// 自定义 Cell
class DayCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "DayCell"
    private var hostingController: UIHostingController<DayView>?
    
    // 配置方法
    func configure(with date: Date) {
        // 如果 hostingController 已存在，只更新内容
        if let hostingController = hostingController {
            hostingController.rootView = DayView(dayItem: DayItem(date: date))
        } else {
            // 首次创建 hostingController
            let dayView = DayView(dayItem: DayItem(date: date))
            let hosting = UIHostingController(rootView: dayView)
            
            hostingController = hosting
            
            hosting.view.frame = contentView.bounds
            hosting.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            contentView.addSubview(hosting.view)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 保留 hostingController，只更新内容
    }
}

struct LazyDateView: UIViewRepresentable {
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
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(DayCollectionViewCell.self, 
                              forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        
        context.coordinator.collectionView = collectionView
        return collectionView
    }
    
    func updateUIView(_ collectionView: UICollectionView, context: Context) {
        // 更新逻辑
    }
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        let parent: LazyDateView
        let calendar = Calendar.current
        var loadedDates: [Date] = []
        var visibleDateRange: ClosedRange<Date>
        var initialIndex: Int = 0
        var initialScrollDone = false
        var initialLoadNextDone = false
        weak var collectionView: UICollectionView?
        
        // 用于跟踪预加载的日期
        private var prefetchedDates: Set<Date> = []
        
        init(parent: LazyDateView) {
            self.parent = parent
            
            let today = Date()
            let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
            
            self.loadedDates = [yesterday, today, tomorrow]
            self.visibleDateRange = yesterday...tomorrow
            
            super.init()
        }
        
        // MARK: - UICollectionViewDataSource
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
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
            print("date: \(date)")
            cell.configure(with: date)
            
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

// 详情页视图
struct DetailView: View {
    let date: Date
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            // 详情页内容
            Text("详情页: \(dateFormatter.string(from: date))")
                .font(.title)
            
            // 其他详情内容
            
            // 返回按钮
            Button("返回") {
                isPresented = false
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true) // 隐藏默认返回按钮
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    isPresented = false
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("返回")
                    }
                }
            }
        }
    }
}

// 日期格式化器
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}() 
