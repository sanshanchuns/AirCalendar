import AVFoundation
import MediaPlayer
import SwiftUI

public class AudioManager: NSObject, ObservableObject {
    public static let shared = AudioManager()
    
    private override init() {
        super.init()
        setupAudioSession()
        setupRemoteCommandCenter()
    }
    
    private var audioPlayer: AVAudioPlayer?
    private var audioSession: AVAudioSession?
    private let queue = DispatchQueue(label: "com.aircalendar.audio", qos: .userInitiated)
    
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
        // 这里实现你的随机音频选择逻辑
        return ""
    }
    
    public func playSound(name: String) {
        // 避免重复播放相同音频
        guard currentSound != name || !isPlaying else { return }
        
        queue.async { [weak self] in
            guard let self = self else { return }
            
            // 停止当前播放
            if self.isPlaying {
                self.audioPlayer?.stop()
            }
            
            // 加载并播放新音频
            if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
                do {
                    let url = URL(fileURLWithPath: path)
                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                    self.audioPlayer?.prepareToPlay()
                    
                    DispatchQueue.main.async {
                        self.currentSound = name
                        self.isPlaying = true
                    }
                    
                    self.audioPlayer?.play()
                } catch {
                    print("Error playing sound: \(error)")
                    DispatchQueue.main.async {
                        self.isPlaying = false
                        self.currentSound = nil
                    }
                }
            }
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
        queue.async { [weak self] in
            self?.audioPlayer?.stop()
            DispatchQueue.main.async {
                self?.isPlaying = false
                self?.currentSound = nil
            }
        }
        
        // 清除锁屏和控制中心的信息
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
    }
    
    public func togglePlay(name: String) {
        queue.async { [weak self] in
            guard let self = self else { return }
            
            if self.isPlaying && self.currentSound == name {
                self.stop()
            } else {
                self.playSound(name: name)
            }
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
