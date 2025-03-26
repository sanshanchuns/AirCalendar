import SwiftUI

struct AsyncLocalImage<Content: View, Placeholder: View>: View {
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (Image) -> Content
    private let placeholder: () -> Placeholder
    
    @State private var name: String
    @State private var loadedImage: UIImage?
    @State private var isLoading = true
    
    init(
        name: String,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (Image) -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.name = name
        self.scale = scale
        self.transaction = transaction
        self.content = content
        self.placeholder = placeholder
    }
    
    var body: some View {
        Group {
            if let loadedImage = loadedImage {
                content(Image(uiImage: loadedImage))
            } else {
                placeholder()
            }
        }
        .onAppear {
            loadImage()
        }
        .onChange(of: name) { newName in
            name = newName
            loadedImage = nil
            isLoading = true
            loadImage()
        }
    }
    
    private func loadImage() {
        guard isLoading else { return }
        
        let imageName = name.removingImageExtensions()
        
        // 先检查缓存
        if let cachedImage = ImageCache.shared.get(forKey: imageName) {
            DispatchQueue.main.async {
                self.loadedImage = cachedImage
                self.isLoading = false
            }
            return
        }
        
        // 在后台队列加载图片
        DispatchQueue.global(qos: .userInitiated).async {
            if let image = UIImage(named: imageName) {
                // 保存到缓存
                ImageCache.shared.set(image, forKey: imageName)
                
                // 主线程更新 UI
                DispatchQueue.main.async {
                    withTransaction(self.transaction) {
                        self.loadedImage = image
                        self.isLoading = false
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
}

// MARK: - ImageCache
class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        
        NotificationCenter.default.addObserver(
            forName: UIApplication.didReceiveMemoryWarningNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.clearCache()
        }
    }
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}

// MARK: - Convenience Extensions
private extension String {
    func removingImageExtensions() -> String {
        replacingOccurrences(of: ".gif", with: "")
            .replacingOccurrences(of: ".png", with: "")
            .replacingOccurrences(of: ".jpg", with: "")
            .replacingOccurrences(of: ".jpeg", with: "")
    }
}

// MARK: - Convenience Initializer
extension AsyncLocalImage where Content == Image, Placeholder == ProgressView<EmptyView, EmptyView> {
    init(
        name: String,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction()
    ) {
        self.init(
            name: name,
            scale: scale,
            transaction: transaction
        ) { image in
            image
        } placeholder: {
            ProgressView()
        }
    }
}
