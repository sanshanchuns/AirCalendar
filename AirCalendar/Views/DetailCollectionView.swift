import SwiftUI

// 主题枚举
enum SongDaiTheme: Int, CaseIterable {
    case flower = 0
    case incense
    case activity
    case food
    case tea
    
    var title: String {
        switch self {
        case .flower: return "物件名称"
        case .incense: return "2"
        case .activity: return "3"
        case .food: return "4"
        case .tea: return "5"
        }
    }
}

// 详情页视图
struct DetailCollectionView: View {
    @Environment(\.presentationMode) var presentationMode
    let date: Date
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    
    init(date: Date, isPresented: Binding<Bool>) {
        self.date = date
        self._isPresented = isPresented
       setupNavigationBarAppearance()
    }
    
    var body: some View {
        ThemeCollectionView(date: date)
            .ignoresSafeArea()
//            .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
         appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct ThemeCollectionView: UIViewRepresentable {
    let date: Date
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        // 设置横向滚动布局
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .yellow
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
//        collectionView.contentInset = .zero
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(ThemeCell.self, forCellWithReuseIdentifier: ThemeCell.reuseIdentifier)
        
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {}
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        let parent: ThemeCollectionView
        
        init(parent: ThemeCollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return SongDaiTheme.allCases.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ThemeCell.reuseIdentifier,
                for: indexPath) as? ThemeCell else {
                fatalError("Unable to dequeue ThemeCell")
            }
            
            let theme = SongDaiTheme(rawValue: indexPath.item)!
            cell.configure(theme: theme, date: parent.date)
            
            return cell
        }
    }
}

class ThemeViewModel: ObservableObject {
    @Published var theme: SongDaiTheme
    @Published var date: Date
    
    init(theme: SongDaiTheme, date: Date) {
        self.theme = theme
        self.date = date
    }
    
    func update(theme: SongDaiTheme, date: Date) {
        self.theme = theme
        self.date = date
    }
}

class ThemeCell: UICollectionViewCell {
    static let reuseIdentifier = "ThemeCell"
    private var frontView: UIView?
    private var backView: UIView?
    private let viewModel = ThemeViewModel(theme: .flower, date: Date())
    private var isShowingFront = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupTapGesture()
    }
    
    private func setupViews() {
        // 设置前视图（ThemeContentView）
        let frontContentView = ThemeContentView(viewModel: viewModel)
        let frontHosting = UIHostingController(rootView: frontContentView)
        frontHosting.view.frame = contentView.bounds
        frontHosting.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        frontHosting.view.backgroundColor = .clear
        frontView = frontHosting.view
        
        // 设置后视图（OperationView）
        let backContentView = OperationView(theme: viewModel.theme, date: viewModel.date)
        let backHosting = UIHostingController(rootView: backContentView)
        backHosting.view.frame = contentView.bounds
        backHosting.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backHosting.view.backgroundColor = .clear
        backView = backHosting.view
        
        // 添加视图
//         contentView.backgroundColor = .yellow // 设置背景色
        contentView.addSubview(frontView!)
        contentView.addSubview(backView!)
        backView?.isHidden = true
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        guard let frontView = frontView, let backView = backView else { return }
        
        let duration: TimeInterval = 0.5
        
        // 设置翻转动画
        if isShowingFront {
            UIView.transition(from: frontView,
                            to: backView,
                            duration: duration,
                            options: [.transitionFlipFromRight, .showHideTransitionViews],
                            completion: nil)
        } else {
            UIView.transition(from: backView,
                            to: frontView,
                            duration: duration,
                            options: [.transitionFlipFromLeft, .showHideTransitionViews],
                            completion: nil)
        }
        
        isShowingFront.toggle()
    }
    
    func configure(theme: SongDaiTheme, date: Date) {
        viewModel.update(theme: theme, date: date)
    }
}

struct ThemeContentView: View {
    @ObservedObject var viewModel: ThemeViewModel
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack {
    //            Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .padding(20)
                    VStack {
                        Text("惊蛰时节，春笋初出，煮羹最佳。")
                            .font(.largeTitle)
                            .padding(28)
                        Text("采摘春笋, 烹饪尝新, 市集售笋, 亲朋宴饮")
                        Image("尝笋")
                    }
                    
                }
                Spacer()
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .padding()
                        Text("心流音乐")
                    }
                    
                    Spacer()
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

// 新增 OperationView
struct OperationView: View {
    let theme: SongDaiTheme
    let date: Date
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.yellow)
                .cornerRadius(10)
            HStack {
                Text("古法")
                    .padding(20)
                Spacer()
            }
            HStack {
                Text("元素")
                    .padding(20)
                Spacer()
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .padding()
                Text("新鲜竹笋")
                    .padding(20)
                Spacer()
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .padding()
                Text("新鲜竹笋2")
                    .padding(20)
                Spacer()
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    OperationView(theme: .flower, date: Date())
//    ThemeContentView(viewModel: ThemeViewModel(theme: .flower, date: Date()))
}
