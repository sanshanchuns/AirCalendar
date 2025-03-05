import AVFoundation
import MediaPlayer

public class AudioManager: NSObject, ObservableObject {
    public static let shared = AudioManager()
    
    private override init() {
        super.init()
        setupAudioSession()
        setupRemoteCommandCenter()
    }
    
    private var audioPlayer: AVAudioPlayer?
    private var audioSession: AVAudioSession?
    
    @Published public var isPlaying = false
    @Published public var currentSound: String?
    
    public let natureSounds: [String] = [
        "细雨绵绵",
        "海浪轻拍",
        "林间鸟语",
        "溪水潺潺",
        "微风拂叶",
        "温暖篝火",
        "夜晚虫鸣",
        "山涧流水"
    ]
    
    private func setupAudioSession() {
        do {
            audioSession = AVAudioSession.sharedInstance()
            try audioSession?.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try audioSession?.setActive(true)
        } catch {
            print("设置音频会话失败: \(error.localizedDescription)")
        }
    }
    
    private func setupRemoteCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.playCommand.addTarget { [weak self] _ in
            if let currentSound = self?.currentSound {
                self?.playSound(name: currentSound)
                return .success
            }
            return .commandFailed
        }
        
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.stop()
            return .success
        }
    }
    
    public func randomSound(date: Date) -> String {
        return "欧洲夏天"
//        let randomIndex = abs(date.hashValue) % natureSounds.count
//        return natureSounds[randomIndex]
    }
    
    public func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("找不到音频文件: \(name)")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.numberOfLoops = -1 // 无限循环
            audioPlayer?.volume = 0.5
            audioPlayer?.prepareToPlay() // 预加载音频
            audioPlayer?.play()
            isPlaying = true
            currentSound = name
            
            // 设置锁屏和控制中心的信息
            setupNowPlaying(name: name)
            
        } catch {
            isPlaying = false
            currentSound = nil
            print("播放音频失败: \(error.localizedDescription)")
        }
    }
    
    private func setupNowPlaying(name: String) {
        var nowPlayingInfo = [String: Any]()
        
        nowPlayingInfo[MPMediaItemPropertyTitle] = name
        nowPlayingInfo[MPMediaItemPropertyArtist] = "AirCalendar"
        
        // 如果有封面图片，可以添加
        if let image = UIImage(named: "AppIcon") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { _ in
                return image
            }
        }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    public func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
        currentSound = nil
        
        // 清除锁屏和控制中心的信息
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
    }
    
    public func togglePlay(name: String) {
        if isPlaying && currentSound == name {
            stop()
        } else {
            playSound(name: name)
        }
    }
}

// MARK: - AVAudioPlayerDelegate
extension AudioManager: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            // 播放完成后自动重新开始播放
            player.play()
        }
    }
    
    public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("音频解码错误: \(error?.localizedDescription ?? "unknown error")")
        stop()
    }
}
