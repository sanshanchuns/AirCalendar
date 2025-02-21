import SwiftUI

struct CachedAsyncImage: View {
    let url: String
    @State private var opacity: Double = 0
    
    var body: some View {
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.8)) {
                                opacity = 1.0
                            }
                        }
                case .failure(_):
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        )
                @unknown default:
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                }
            }
        }
}
