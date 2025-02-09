import AVFoundation

public class AudioManager: ObservableObject {
    public static let shared = AudioManager()
    
    private init() {}
    
    private var audioPlayer: AVAudioPlayer?
    
    @Published public var isPlaying: Bool = false
    @Published public var currentSound: String?
    
    public let natureSounds: [String: String] = [
        "rain": "细雨绵绵",
        "wave": "海浪轻拍",
        "forest": "林间鸟语",
        "creek": "溪水潺潺",
        "wind": "微风拂叶",
        "fire": "温暖篝火"
    ]
    
    public func randomSound(date: Date) -> (key: String, name: String) {
        let keys = Array(natureSounds.keys)
        let randomIndex = abs(date.hashValue) % keys.count
        let key = keys[randomIndex]
        return (key: key, name: natureSounds[key]!)
    }
    
    public func playSound(name: String) {
        if isPlaying && currentSound != name {
            stop()
        }
        currentSound = name
        isPlaying = true
        // 实际的音频播放逻辑
    }
    
    public func stop() {
        isPlaying = false
        currentSound = nil
        // 实际的音频停止逻辑
    }
    
    public func togglePlay(name: String) {
        if isPlaying && currentSound == name {
            stop()
        } else {
            playSound(name: name)
        }
    }
}
