import SwiftUI
import Combine
import CommonCrypto

struct CachedAsyncImage<Content: View, Placeholder: View>: View {
    let url: URL?
    let content: (Image) -> Content
    let placeholder: () -> Placeholder
    @StateObject private var loader = ImageLoader()
    
    init(
        url: URL?,
        @ViewBuilder content: @escaping (Image) -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
    }
    
    var body: some View {
        Group {
            if let image = loader.image {
                content(Image(uiImage: image))
            } else {
                placeholder()
                    .onAppear {
                        loader.load(from: url)
                    }
            }
        }
        .onChange(of: url) { newUrl in
            loader.load(from: newUrl)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    private static let memoryCache = NSCache<NSString, UIImage>()
    private var currentUrl: URL?
    
    private let fileManager = FileManager.default
    private lazy var cacheDirectory: URL = {
        let paths = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent("ImageCache")
    }()
    
    init() {
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
    
    private func hashKey(for url: URL) -> String {
        url.absoluteString.data(using: .utf8)?.sha256() ?? url.lastPathComponent
    }
    
    private func cacheFileURL(for url: URL) -> URL {
        let fileName = hashKey(for: url)
        return cacheDirectory.appendingPathComponent(fileName).appendingPathExtension("cache")
    }
    
    func load(from url: URL?) {
        // 如果 URL 相同，不需要重新加载
        if url == currentUrl { return }
        
        // 取消之前的加载
        cancel()
        
        // 更新当前 URL
        currentUrl = url
        // 清除当前图片
        image = nil
        
        guard let url = url else { return }
        
        print("图片url", url)
        
        let key = hashKey(for: url) as NSString
        
        // 1. 检查内存缓存
        if let cachedImage = ImageLoader.memoryCache.object(forKey: key) {
            print("图片使用内存缓存 url: ", url)
            self.image = cachedImage
            return
        }
        
        // 2. 检查磁盘缓存
        let fileURL = cacheFileURL(for: url)
        if let data = try? Data(contentsOf: fileURL),
           let diskCachedImage = UIImage(data: data) {
            print("图片使用磁盘缓存 url: ", url)
            self.image = diskCachedImage
            ImageLoader.memoryCache.setObject(diskCachedImage, forKey: key)
            return
        }
        
        // 3. 从网络加载
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                guard let image = image else { return }
                print("已经下载完成 url:", url)
                
                ImageLoader.memoryCache.setObject(image, forKey: key)
                
                if let data = image.jpegData(compressionQuality: 0.8) {
                    try? data.write(to: fileURL)
                }
                
                self?.image = image
            }
    }
    
    func cancel() {
        cancellable?.cancel()
        cancellable = nil
        currentUrl = nil
    }
    
    // 清理过期缓存
    static func cleanOldCache(olderThan date: Date = Calendar.current.date(byAdding: .month, value: -1, to: Date())!) {
        let fileManager = FileManager.default
        guard let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first?
                .appendingPathComponent("ImageCache") else { return }
        
        do {
            let resourceKeys: [URLResourceKey] = [.creationDateKey]
            let files = try fileManager.contentsOfDirectory(at: cacheDirectory,
                                                          includingPropertiesForKeys: resourceKeys)
            
            for file in files {
                guard let resources = try? file.resourceValues(forKeys: Set(resourceKeys)),
                      let creationDate = resources.creationDate,
                      creationDate < date else { continue }
                
                try? fileManager.removeItem(at: file)
            }
        } catch {
            print("清理缓存失败: \(error)")
        }
    }
}

// 添加 SHA256 扩展
extension Data {
    func sha256() -> String {
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes { buffer in
            _ = CC_SHA256(buffer.baseAddress, CC_LONG(buffer.count), &hash)
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

struct AsyncLocalImage<Content: View, Placeholder: View>: View {
    private let name: String
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (Image) -> Content
    private let placeholder: () -> Placeholder
    
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
    }
    
    private func loadImage() {
        guard isLoading else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let image = UIImage(named: name) {
                DispatchQueue.main.async {
                    withTransaction(transaction) {
                        self.loadedImage = image
                        self.isLoading = false
                    }
                }
            }
        }
    }
}

// 便捷初始化方法
extension AsyncLocalImage {
    init(
        name: String,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction()
    ) where Content == Image, Placeholder == EmptyView {
        self.init(name: name, scale: scale, transaction: transaction) { image in
            image
        } placeholder: {
            EmptyView()
        }
    }
}