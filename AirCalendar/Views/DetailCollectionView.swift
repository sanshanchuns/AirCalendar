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
        case .flower: return "1"
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
            .navigationTitle("Detail")
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
        collectionView.backgroundColor = .systemBackground
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

class ThemeCell: UICollectionViewCell {
    static let reuseIdentifier = "ThemeCell"
    private var hostingController: UIHostingController<ThemeContentView>?
    
    func configure(theme: SongDaiTheme, date: Date) {
        if let hostingController = hostingController {
            hostingController.rootView = ThemeContentView(theme: theme, date: date)
        } else {
            let contentView = ThemeContentView(theme: theme, date: date)
            let hosting = UIHostingController(rootView: contentView)
            hostingController = hosting
            
            hosting.view.frame = self.contentView.bounds
            hosting.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.contentView.addSubview(hosting.view)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 保留 hostingController，只更新内容
    }
}

struct ThemeContentView: View {
    let theme: SongDaiTheme
    let date: Date
    
    var body: some View {
        VStack {
            Spacer()
            Text(theme.title)
                .font(.largeTitle)
                .padding()
//            ScrollView {
//                VStack(alignment: .leading, spacing: 16) {
//                   switch theme {
//                   case .flower:
//                       Text("插花")
//                       .padding()
//                       .frame(maxWidth: .infinity, alignment: .leading)
//                       .background(Color.red)
//
//                   case .incense:
//                       Text("香道").padding()
//                   case .activity:
//                       Text("出游").padding()
//                   case .food:
//                       Text("小食").padding()
//                   case .tea:
//                       Text("茶道").padding()
//                   }
//                }
//            }
//            .background(Color.blue)
            Spacer()
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

// 日期格式化器
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()


#Preview {
    DetailCollectionView(date: Date(), isPresented: .constant(true))
}
