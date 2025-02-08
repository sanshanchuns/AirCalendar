import AVFoundation

public class AudioManager: ObservableObject {
    public static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?
    
    @Published public var isPlaying = false
    @Published public var currentSoundKey: String?
    
    public let natureSounds: [String: String] = [
        "rain": "细雨绵绵",
        "wave": "海浪轻拍",
        "forest": "林间鸟语",
        "creek": "溪水潺潺",
        "wind": "微风拂叶",
        "fire": "温暖篝火"
    ]
    
    public func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("找不到音频文件: \(name)")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // 无限循环
            audioPlayer?.volume = 0.5
            audioPlayer?.play()
            isPlaying = true
            currentSoundKey = name
        } catch {
            print("播放音频失败: \(error.localizedDescription)")
        }
    }
    
    public func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
        currentSoundKey = nil
    }
    
    public func togglePlay(name: String) {
        if isPlaying && currentSoundKey == name {
            stop()
        } else {
            playSound(name: name)
        }
    }
}
