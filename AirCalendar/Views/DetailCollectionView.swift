import SwiftUI

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
//            .ignoresSafeArea()
            .navigationTitle("节气")
//           .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
         appearance.shadowColor = .clear
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        
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
        layout.scrollDirection = .horizontal
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
        
        let term = CalendarManager.getNearestSolarTerm(for: date)
        if let backgroundImage = UIImage(named: term ?? "") {
            // 创建背景图片视图
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.frame = UIScreen.main.bounds
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.clipsToBounds = true
            backgroundImageView.alpha = 0.5
            
            // 将背景图片视图插入到 collectionView 的底层
            collectionView.backgroundView = backgroundImageView
        }

        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {}
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        let parent: ThemeCollectionView
        
        // 添加管理器实例
        private let flowerManager = SongDaiFlowerManager.shared
        private let teaManager = SongDaiTeaManager.shared
        private let incenseManager = SongDaiIncenseManager.shared
        private let foodManager = SongDaiFoodManager.shared
        private let travelManager = SongDaiTravelManager.shared
        
        init(parent: ThemeCollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch section {
            case 0:
                return flowerManager.getInfos(parent.date).count
            case 1:
                return teaManager.getInfos(parent.date).count
            case 2:
                return incenseManager.getInfos(parent.date).count
            case 3:
                return foodManager.getInfos(parent.date).count
            case 4:
                return travelManager.getInfos(parent.date).count
            default:
                return 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCell.reuseIdentifier, for: indexPath) as! ThemeCell
            
            var infos: [SongDaiActivity] = []
            
            switch indexPath.section {
            case 0:
                infos = flowerManager.getInfos(parent.date)
            case 1:
                infos = teaManager.getInfos(parent.date)
            case 2:
                infos = incenseManager.getInfos(parent.date)
            case 3:
                infos = foodManager.getInfos(parent.date)
            case 4:
                infos = travelManager.getInfos(parent.date)
            default:
                break
            }
            
            if !infos.isEmpty {
                let info = infos[indexPath.item]
                cell.configure(with: info, date: parent.date)
            }
            
            return cell
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 5  // 五道
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.bounds.width - 32  // 左右各留16点边距
            return CGSize(width: width, height: 120)  // 根据内容调整高度
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
    }
}

class ThemeViewModel: ObservableObject {
    @Published var date: Date
    @Published var activityInfo: ActivityInfo = ActivityInfo()
    
    struct ActivityInfo {
        var name: String = ""
        var description: String = ""
        var details: String = ""
        var custom: String = ""
        var poetry: String = ""
        var author: String = ""
        var materials: [(String, String)] = []
        var steps: [String] = []
    }
    
    init() {
        self.date = Date()
    }
    
    func updateActivity(_ info: SongDaiActivity, _ date: Date) {
        self.date = date
        self.activityInfo = ActivityInfo(
            name: info.name,
            description: info.description,
            details: info.details.joined(separator: "；"),
            custom: info.custom,
            poetry: info.poetry.content,
            author: info.poetry.author,
            materials: info.materials,
            steps: info.steps
        )
    }
}

class ThemeCell: UICollectionViewCell {
    static let reuseIdentifier = "ThemeCell"
    private var frontView: UIView?
    private var backView: UIView?
    private let viewModel = ThemeViewModel()
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
        let backContentView = OperationView(viewModel: viewModel)
        let backHosting = UIHostingController(rootView: backContentView)
        backHosting.view.frame = contentView.bounds
        backHosting.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backHosting.view.backgroundColor = .clear
        backView = backHosting.view
        
        // 添加视图
//        contentView.backgroundColor = .yellow // 设置背景色
        contentView.addSubview(frontView!)
        contentView.addSubview(backView!)
        backView?.isHidden = true
//        contentView.layer.borderColor = Color.black.cgColor
//        contentView.layer.borderWidth = 10
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
    
    func configure(with info: SongDaiActivity, date: Date) {
        // 更新 viewModel 中的数据
        DispatchQueue.main.async {
            self.viewModel.updateActivity(info, date)
        }
    }
}

struct ThemeContentView: View {
    @ObservedObject var viewModel: ThemeViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 节气标题
                HStack {
                    Text(viewModel.activityInfo.name.map { String($0) }.joined(separator: "\n"))
                        .font(.custom("CHAO-ShadowGBT-Flash", size: 90, relativeTo: .body))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 100)
                
                // 活动名称
                HStack {
                    Text(viewModel.activityInfo.name)
                        .font(.custom("CHAO-ShadowGBT-Flash", size: 90, relativeTo: .body))
                        .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity)
                
                
                // 活动描述
                Text(viewModel.activityInfo.description)
                    .font(.system(size: 18))
                    .padding(.top, 10)
                    .padding(.horizontal, 16)
                
                // 活动细节
                Text(viewModel.activityInfo.details)
                    .font(.system(size: 16))
                    .padding(.top, 5)
                    .padding(.horizontal, 16)
                
                // 习俗
                Text(viewModel.activityInfo.custom)
                    .font(.system(size: 16))
                    .padding(.top, 5)
                    .padding(.horizontal, 16)
                
                // 诗词部分
                VStack(alignment: .leading, spacing: 10) {
                    Text("诗词赏析")
                        .font(.headline)
                    Text("作者：\(viewModel.activityInfo.author)")
                        .font(.subheadline)
                    Text(viewModel.activityInfo.poetry)
                        .font(.system(size: 16))
                        .italic()
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
                
                Spacer(minLength: 16)
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
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
    @ObservedObject var viewModel: ThemeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // 材料部分
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("所需材料")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach(viewModel.activityInfo.materials, id: \.0) { material in
                    HStack {
                        Text(material.0)  // 材料名
                            .font(.system(size: 16))
                        Spacer()
                        Text(material.1)  // 用量
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            
            // 制作步骤
            VStack(alignment: .leading, spacing: 10) {
                Text("制作步骤")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach(Array(viewModel.activityInfo.steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .font(.system(size: 16))
                            .frame(width: 25, alignment: .leading)
                        Text(step)
                            .font(.system(size: 16))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            
            
            Spacer()
        }
    }
}

struct DetailCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 当前日期的预览
            NavigationView {
                DetailCollectionView(
                    date: Date(),
                    isPresented: .constant(true)
                )
            }
            .previewDisplayName("Current Date")
            
            // 特定节气日期的预览
            NavigationView {
                DetailCollectionView(
                    date: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 4))!, // 立春
                    isPresented: .constant(true)
                )
            }
            .previewDisplayName("立春")
        }
    }
}

