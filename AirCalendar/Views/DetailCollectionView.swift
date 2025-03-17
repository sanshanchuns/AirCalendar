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
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ThemeCell.reuseIdentifier,
                for: indexPath) as? ThemeCell else {
                fatalError("Unable to dequeue ThemeCell")
            }
            
            cell.configure(date: parent.date)
            
            return cell
        }
    }
}

class ThemeViewModel: ObservableObject {
    @Published var date: Date
    @Published var term: (String, Date)?
    
    init(date: Date) {
        self.date = date
        self.term = CalendarManager.getNearestSolarTerm(for: date)
    }
    
    func update(date: Date) {
        self.date = date
        self.term = CalendarManager.getNearestSolarTerm(for: date)
    }
}

class ThemeCell: UICollectionViewCell {
    static let reuseIdentifier = "ThemeCell"
    private var frontView: UIView?
    private var backView: UIView?
    private let viewModel = ThemeViewModel(date: Date())
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
        let backContentView = OperationView(date: viewModel.date)
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
    
    func configure(date: Date) {
        viewModel.update(date: date)
    }
}

struct ThemeContentView: View {
    @ObservedObject var viewModel: ThemeViewModel
    
    var body: some View {
        let width = UIScreen.main.bounds.width
//        let height = UIScreen.main.bounds.height
        
        VStack {
            if let term = viewModel.term {
                GIFImage(name: term.0 + ".gif", size: CGSize(width: width, height: width*768/1024))
            }
            
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

// 添加 GIFImage 视图组件
struct GIFImage: UIViewRepresentable {
    let name: String
    let size: CGSize
    
    init(name: String, size: CGSize) {
        self.name = name
        self.size = size
    }
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        // 加载 GIF 图片
        if let path = Bundle.main.path(forResource: name.replacingOccurrences(of: ".gif", with: ""), ofType: "gif"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
           let source = CGImageSourceCreateWithData(data as CFData, nil) {
            
            // 获取 GIF 帧数
            let count = CGImageSourceGetCount(source)
            var images: [UIImage] = []
            var totalDuration: TimeInterval = 0
            
            // 遍历所有帧并进行缩放
            for i in 0..<count {
                if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    // 创建缩放后的图片
                    let scale = UIScreen.main.scale
                    UIGraphicsBeginImageContextWithOptions(size, false, scale)
                    let context = UIGraphicsGetCurrentContext()
                    context?.interpolationQuality = .high
                    
                    // 修正图像方向
                    context?.translateBy(x: 0, y: size.height)
                    context?.scaleBy(x: 1.0, y: -1.0)
                    
                    let drawRect = CGRect(origin: .zero, size: size)
                    context?.draw(cgImage, in: drawRect)
                    
                    if let scaledImage = UIGraphicsGetImageFromCurrentImageContext() {
                        images.append(scaledImage)
                    }
                    UIGraphicsEndImageContext()
                    
                    // 获取当前帧的持续时间
                    if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                       let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
                       let delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
                        totalDuration += delayTime
                    }
                }
            }
            
            // 设置动画
            imageView.animationImages = images
            imageView.animationDuration = totalDuration
            imageView.animationRepeatCount = 0
            imageView.startAnimating()
        } else {
            // 如果加载 GIF 失败，尝试加载并缩放静态图片
            if let image = UIImage(named: name) {
                UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                imageView.image = scaledImage
            }
        }
        
        // 添加约束
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: size.width),
            imageView.heightAnchor.constraint(equalToConstant: size.height)
        ])
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        // 更新约束
        uiView.constraints.forEach { constraint in
            if constraint.firstAttribute == .width {
                constraint.constant = size.width
            }
            if constraint.firstAttribute == .height {
                constraint.constant = size.height
            }
        }
    }
}

#Preview {
//    OperationView(theme: .flower, date: Date())
    ThemeContentView(viewModel: ThemeViewModel(date: Date()))
}

