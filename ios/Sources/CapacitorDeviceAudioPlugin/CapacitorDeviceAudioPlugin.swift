import Foundation
import Capacitor
import AVFoundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorDeviceAudioPlugin)
public class CapacitorDeviceAudioPlugin: CAPPlugin, CAPBridgedPlugin {
  var audioPlayer: AVPlayer?

  @objc func playVoiceCallAudio(_ call: CAPPluginCall) {
    configureAudioSession(category: .playAndRecord)
    playAudio(call: call)
  }

  @objc func playRingAudio(_ call: CAPPluginCall) {
    configureAudioSession(category: .playback)
    playAudio(call: call)
  }

  private func configureAudioSession(category: AVAudioSession.Category) {
    let audioSession = AVAudioSession.sharedInstance()
    do {
      try audioSession.setCategory(category, mode: .default, options: [])
      try audioSession.setActive(true)
    } catch {
      print("Failed to configure audio session:", error)
    }
  }

  private func playAudio(call: CAPPluginCall) {
    guard let urlString = call.getString("url"), let url = URL(string: urlString) else {
      call.reject("Audio URL is required")
      return
    }

    audioPlayer = AVPlayer(url: url)
    audioPlayer?.play()
    call.resolve()
  }

  override public func load() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleInterruption),
      name: AVAudioSession.interruptionNotification,
      object: nil
    )
  }

  @objc private func handleInterruption(notification: Notification) {
    if let type = notification.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt, type == AVAudioSession.InterruptionType.began.rawValue {
        audioPlayer?.pause()
    }
  }
}
